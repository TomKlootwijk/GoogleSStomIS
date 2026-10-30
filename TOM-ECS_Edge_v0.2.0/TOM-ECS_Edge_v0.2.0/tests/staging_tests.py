"""Boundary tests for HF inventory and staging, using local fake responses."""
import importlib.util
import json
from pathlib import Path
from types import SimpleNamespace
import tempfile
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location("hf_catalog", Path(__file__).parents[1] / "tools/hf_catalog.py")
hf = importlib.util.module_from_spec(spec)
spec.loader.exec_module(hf)

def entry(name="owner/model", files=("model.gguf",)):
    return SimpleNamespace(id=name, sha="a" * 40, private=False,
                           siblings=[SimpleNamespace(rfilename=f) for f in files])

class InventoryTests(unittest.TestCase):
    def test_exact_namespace_required(self):
        for bad in ("", "https://huggingface.co/owner", "../owner", "a/b", " owner "):
            with self.assertRaises(ValueError): hf.checked_namespace(bad)

    def test_data_is_not_a_model(self):
        d = hf.item_dict(entry(files=("records.parquet",)), "dataset")
        self.assertEqual(d["routing"], "dataset-retrieval-or-training-input")
        self.assertEqual(d["activation"], "not_loaded")

    def test_metadata_does_not_claim_compatibility(self):
        result = hf.item_dict(entry(), "model")
        self.assertIn("needs-architecture-memory-and-license-check", result["routing"])

    def test_scope_mismatch_rejected(self):
        api = SimpleNamespace(list_models=lambda **k: iter([entry("other/model")]), list_datasets=lambda **k: iter([]))
        with patch.object(hf, "api_client", return_value=api):
            with self.assertRaises(RuntimeError): hf.inventory(["owner"], 10)

    def test_limit_is_reported(self):
        api = SimpleNamespace(list_models=lambda **k: iter([entry(), entry("owner/two")]), list_datasets=lambda **k: iter([]))
        with patch.object(hf, "api_client", return_value=api):
            result = hf.inventory(["owner"], 1)
        self.assertEqual(len(result["entries"]), 1)
        self.assertFalse(result["inventory_complete_within_visible_scope"])
        self.assertFalse(result["weights_downloaded"])

    def test_no_unknown_or_overbudget_download(self):
        for size in (None, 2 * 1024 * 1024):
            candidate = SimpleNamespace(rfilename="model.gguf", size=size)
            api = SimpleNamespace(repo_info=lambda *a, **k: SimpleNamespace(siblings=[candidate], sha="a"*40))
            args = SimpleNamespace(repo="owner/model", revision="a"*40, filename="model.gguf",
                                   repo_type="model", budget_mib=1, destination="unused")
            with patch.object(hf, "api_client", return_value=api):
                with self.assertRaises(RuntimeError): hf.stage(args)

    def test_receipt_never_overwrites_repository_data(self):
        data = b'{"fixture": true}'
        candidate = SimpleNamespace(rfilename="stage-receipt.json", size=len(data), lfs=None)
        api = SimpleNamespace(repo_info=lambda *a, **k: SimpleNamespace(siblings=[candidate], sha="a"*40))
        def download(**kw):
            path = Path(kw["local_dir"]) / kw["filename"]
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(data)
            return str(path)
        with tempfile.TemporaryDirectory() as directory:
            args = SimpleNamespace(repo="owner/model", revision="a"*40, filename="stage-receipt.json",
                                   repo_type="model", budget_mib=1, destination=directory)
            with patch.object(hf, "api_client", return_value=api), patch.dict("sys.modules", {"huggingface_hub": SimpleNamespace(hf_hub_download=download)}):
                result = hf.stage(args)
            self.assertEqual(Path(result["path"]).read_bytes(), data)
            self.assertEqual(len(list(Path(directory).glob(".receipts/**/*.json"))), 1)

if __name__ == "__main__": unittest.main()
