# Primary references

Consulted 30 October 2026. The supplied documents are identified in
`assets/lognet/provenance.json` and `assets/documents/source_cards.json`.

| Subject | Primary source |
|---|---|
| POCO hardware | https://www.po.co/global/product/poco-x7-pro/specs/ |
| Android sensors | https://developer.android.com/develop/sensors-and-location/sensors/sensors_overview |
| GNSS measurements | https://developer.android.com/develop/sensors-and-location/sensors/gnss |
| RAW camera capability | https://developer.android.com/reference/android/hardware/camera2/CameraMetadata |
| App sandbox | https://source.android.com/docs/security/app-sandbox |
| Thermal signals | https://developer.android.com/reference/android/os/PowerManager |
| Network capabilities | https://developer.android.com/develop/connectivity/network-ops/reading-network-state |
| Native executable restrictions | https://developer.android.com/about/versions/10/behavior-changes-10 |
| Dynamic code loading | https://developer.android.com/privacy-and-security/risks/dynamic-code-loading |
| Full compiler/JIT architecture | https://llvm.org/docs/ORCv2.html |
| Vulkan memory | https://docs.vulkan.org/spec/latest/chapters/memory.html |
| llama.cpp Android | https://github.com/ggml-org/llama.cpp/blob/master/docs/android.md |
| llama.cpp pinned API | https://github.com/ggml-org/llama.cpp/blob/e216f4ec8753e7317314e1ee01861b0230e583aa/include/llama.h |
| Hugging Face inventory | https://huggingface.co/docs/huggingface_hub/en/package_reference/hf_api |
| Hub download API | https://huggingface.co/docs/huggingface_hub/en/package_reference/file_download |
| Hub API discovery | https://huggingface.co/docs/hub/api |
| AHN3 dataset | https://developers.google.com/earth-engine/datasets/catalog/AHN_AHN3 |
| Earth Engine authentication | https://developers.google.com/earth-engine/guides/auth |
| NOAA Kp explanation | https://www.spaceweather.gov/products/planetary-k-index |
| NOAA spacecraft solar wind | https://www.spaceweather.gov/products/solar-wind |
| NOAA replacement feed | https://services.swpc.noaa.gov/json/rtsw/rtsw_wind_1m.json |
| NOAA 2026 endpoint changes | https://www.weather.gov/media/notification/pdf_2026/scn26-21_Data_Format_Changes_Impacting_SWPC_Products.pdf |
| NOAA JSON endpoint | https://services.swpc.noaa.gov/json/planetary_k_index_1m.json |
| AGP/Gradle/JDK compatibility | https://developer.android.com/build/releases/agp-8-7-0-release-notes |
| Public inference test fixture | https://huggingface.co/ggml-org/tiny-llamas/blob/def3e2dd70df35ecbf6403ea347de4c5977220c1/stories260K.gguf |

The public test fixture is used solely to check integration; it is not identified
as one of the user's models and is not included in the delivery. Upstream code,
models and user-supplied datasets retain their own licences and provenance.
