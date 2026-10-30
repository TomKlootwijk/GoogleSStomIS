;; New exact MaktubIII ideal mathematical profile: computational data via frozen bit LUTs.
;; Source equations/ordering unchanged; control/index/address transport explicitly native.
(module
  (memory (export "memory") 1 1)
  (func $fail
    (param $code i32)
    (if (call $wl_eqz (i32.load (i32.const 0))) (then (i32.store (i32.const 0) (local.get $code)))))
  (func $abs
    (param $a i64)
    (result i64)
    (if
      (result i64)
      (call $wl64_lt_s (local.get $a) (i64.const 0))
      (then (call $wl64_sub (i64.const 0) (local.get $a)))
      (else (local.get $a))))
  (func $gcd
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (if (call $dv_gcd (i32.const 64)) (then (unreachable)))
    (i64.load (i32.const 60016)))
  (func $valid
    (param $p i32)
    (result i32)
    (local $i i32)
    (local $a i64)
    (local $g i64)
    (local.set $g (call $wl_extend_s (i32.load offset=16 (local.get $p))))
    (if
      (call $wl_or
        (call $wl64_le_s (local.get $g) (i64.const 0))
        (call $wl64_gt_s (local.get $g) (i64.const 1048576)))
      (then (return (i32.const 0))))
    (block $done
      (loop $again
        (br_if $done (call $wl_ge_u (local.get $i) (i32.const 4)))
        (local.set $a
          (call $abs
            (call $wl_extend_s (i32.load (i32.add (local.get $p) (i32.shl (local.get $i) (i32.const 2)))))))
        (if (call $wl64_gt_s (local.get $a) (i64.const 1048576)) (then (return (i32.const 0))))
        (local.set $g (call $gcd (local.get $g) (local.get $a)))
        (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
        (br $again)))
    (call $wl64_eq (local.get $g) (i64.const 1)))
  (func $pack
    (param $p i32)
    (param $a i64)
    (param $b i64)
    (param $c i64)
    (param $d i64)
    (param $q i64)
    (local $g i64)
    (if (i32.load (i32.const 0)) (then (return)))
    (if (call $wl64_le_s (local.get $q) (i64.const 0)) (then (call $fail (i32.const 1)) (return)))
    (local.set $g (call $gcd (local.get $q) (call $abs (local.get $a))))
    (local.set $g (call $gcd (local.get $g) (call $abs (local.get $b))))
    (local.set $g (call $gcd (local.get $g) (call $abs (local.get $c))))
    (local.set $g (call $gcd (local.get $g) (call $abs (local.get $d))))
    (local.set $a (call $wl64_div_s (local.get $a) (local.get $g)))
    (local.set $b (call $wl64_div_s (local.get $b) (local.get $g)))
    (local.set $c (call $wl64_div_s (local.get $c) (local.get $g)))
    (local.set $d (call $wl64_div_s (local.get $d) (local.get $g)))
    (local.set $q (call $wl64_div_u (local.get $q) (local.get $g)))
    (if
      (call $wl_or
        (call $wl_or
          (call $wl64_gt_s (call $abs (local.get $a)) (i64.const 1048576))
          (call $wl64_gt_s (call $abs (local.get $b)) (i64.const 1048576)))
        (call $wl_or
          (call $wl_or
            (call $wl64_gt_s (call $abs (local.get $c)) (i64.const 1048576))
            (call $wl64_gt_s (call $abs (local.get $d)) (i64.const 1048576)))
          (call $wl64_gt_s (local.get $q) (i64.const 1048576))))
      (then (call $fail (i32.const 2)) (return)))
    (i32.store (local.get $p) (call $wl_wrap (local.get $a)))
    (i32.store offset=4 (local.get $p) (call $wl_wrap (local.get $b)))
    (i32.store offset=8 (local.get $p) (call $wl_wrap (local.get $c)))
    (i32.store offset=12 (local.get $p) (call $wl_wrap (local.get $d)))
    (i32.store offset=16 (local.get $p) (call $wl_wrap (local.get $q))))
  (func $literal
    (param $p i32)
    (param $a i32)
    (param $b i32)
    (param $c i32)
    (param $d i32)
    (param $q i32)
    (call $pack
      (local.get $p)
      (call $wl_extend_s (local.get $a))
      (call $wl_extend_s (local.get $b))
      (call $wl_extend_s (local.get $c))
      (call $wl_extend_s (local.get $d))
      (call $wl_extend_u (local.get $q))))
  (func $zero
    (param $p i32)
    (memory.fill (local.get $p) (i32.const 0) (i32.const 20))
    (i32.store offset=16 (local.get $p) (i32.const 1)))
  (func $zeros
    (param $p i32)
    (param $n i32)
    (local $i i32)
    (block $done
      (loop $again
        (br_if $done (call $wl_ge_u (local.get $i) (local.get $n)))
        (call $zero (call $wl_add (local.get $p) (call $wl_mul (local.get $i) (i32.const 20))))
        (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
        (br $again))))
  (func $check
    (param $p i32)
    (param $n i32)
    (param $kind i32)
    (local $i i32)
    (local $x i32)
    (block $done
      (loop $again
        (br_if $done (call $wl_ge_u (local.get $i) (local.get $n)))
        (local.set $x (call $wl_add (local.get $p) (call $wl_mul (local.get $i) (i32.const 20))))
        (if (call $wl_eqz (call $valid (local.get $x))) (then (call $fail (i32.const 1)) (return)))
        (if
          (call $wl_and
            (call $wl_ne (local.get $kind) (i32.const 0))
            (call $wl_ne
              (call $wl_or (i32.load offset=8 (local.get $x)) (i32.load offset=12 (local.get $x)))
              (i32.const 0)))
          (then (call $fail (i32.const 4)) (return)))
        (if
          (call $wl_and
            (call $wl_eq (local.get $kind) (i32.const 2))
            (call $wl_ne (i32.load offset=4 (local.get $x)) (i32.const 0)))
          (then (call $fail (i32.const 4)) (return)))
        (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
        (br $again))))
  (func $add
    (param $out i32)
    (param $p i32)
    (param $r i32)
    (param $subtract i32)
    (local $q i64)
    (local $s i64)
    (local $sign i64)
    (local.set $q (call $wl_extend_u (i32.load offset=16 (local.get $p))))
    (local.set $s (call $wl_extend_u (i32.load offset=16 (local.get $r))))
    (local.set $sign (if (result i64) (local.get $subtract) (then (i64.const -1)) (else (i64.const 1))))
    (call $pack
      (local.get $out)
      (call $wl64_add
        (call $wl64_mul (call $wl_extend_s (i32.load (local.get $p))) (local.get $s))
        (call $wl64_mul
          (call $wl64_mul (call $wl_extend_s (i32.load (local.get $r))) (local.get $q))
          (local.get $sign)))
      (call $wl64_add
        (call $wl64_mul (call $wl_extend_s (i32.load offset=4 (local.get $p))) (local.get $s))
        (call $wl64_mul
          (call $wl64_mul (call $wl_extend_s (i32.load offset=4 (local.get $r))) (local.get $q))
          (local.get $sign)))
      (call $wl64_add
        (call $wl64_mul (call $wl_extend_s (i32.load offset=8 (local.get $p))) (local.get $s))
        (call $wl64_mul
          (call $wl64_mul (call $wl_extend_s (i32.load offset=8 (local.get $r))) (local.get $q))
          (local.get $sign)))
      (call $wl64_add
        (call $wl64_mul (call $wl_extend_s (i32.load offset=12 (local.get $p))) (local.get $s))
        (call $wl64_mul
          (call $wl64_mul (call $wl_extend_s (i32.load offset=12 (local.get $r))) (local.get $q))
          (local.get $sign)))
      (call $wl64_mul (local.get $q) (local.get $s))))
  (func $mul
    (param $out i32)
    (param $p i32)
    (param $r i32)
    (local $a i64)
    (local $b i64)
    (local $c i64)
    (local $d i64)
    (local $q i64)
    (local $e i64)
    (local $f i64)
    (local $g i64)
    (local $h i64)
    (local $s i64)
    (local.set $a (call $wl_extend_s (i32.load (local.get $p))))
    (local.set $b (call $wl_extend_s (i32.load offset=4 (local.get $p))))
    (local.set $c (call $wl_extend_s (i32.load offset=8 (local.get $p))))
    (local.set $d (call $wl_extend_s (i32.load offset=12 (local.get $p))))
    (local.set $q (call $wl_extend_u (i32.load offset=16 (local.get $p))))
    (local.set $e (call $wl_extend_s (i32.load (local.get $r))))
    (local.set $f (call $wl_extend_s (i32.load offset=4 (local.get $r))))
    (local.set $g (call $wl_extend_s (i32.load offset=8 (local.get $r))))
    (local.set $h (call $wl_extend_s (i32.load offset=12 (local.get $r))))
    (local.set $s (call $wl_extend_u (i32.load offset=16 (local.get $r))))
    (call $pack
      (local.get $out)
      (call $wl64_sub
        (call $wl64_add
          (call $wl64_mul (local.get $a) (local.get $e))
          (call $wl64_mul (i64.const 2) (call $wl64_mul (local.get $b) (local.get $f))))
        (call $wl64_add
          (call $wl64_mul (local.get $c) (local.get $g))
          (call $wl64_mul (i64.const 2) (call $wl64_mul (local.get $d) (local.get $h)))))
      (call $wl64_sub
        (call $wl64_add
          (call $wl64_mul (local.get $a) (local.get $f))
          (call $wl64_mul (local.get $b) (local.get $e)))
        (call $wl64_add
          (call $wl64_mul (local.get $c) (local.get $h))
          (call $wl64_mul (local.get $d) (local.get $g))))
      (call $wl64_add
        (call $wl64_add
          (call $wl64_mul (local.get $a) (local.get $g))
          (call $wl64_mul (i64.const 2) (call $wl64_mul (local.get $b) (local.get $h))))
        (call $wl64_add
          (call $wl64_mul (local.get $c) (local.get $e))
          (call $wl64_mul (i64.const 2) (call $wl64_mul (local.get $d) (local.get $f)))))
      (call $wl64_add
        (call $wl64_add
          (call $wl64_mul (local.get $a) (local.get $h))
          (call $wl64_mul (local.get $b) (local.get $g)))
        (call $wl64_add
          (call $wl64_mul (local.get $c) (local.get $f))
          (call $wl64_mul (local.get $d) (local.get $e))))
      (call $wl64_mul (local.get $q) (local.get $s))))
  (func $twiddle
    (param $out i32)
    (param $k i32)
    (param $inverse i32)
    (local $a i32)
    (local $b i32)
    (local $c i32)
    (local $d i32)
    (local $q i32)
    (local.set $q (i32.const 1))
    (if (call $wl_eq (local.get $k) (i32.const 0)) (then (local.set $a (i32.const 1))))
    (if
      (call $wl_eq (local.get $k) (i32.const 1))
      (then (local.set $b (i32.const 1)) (local.set $d (i32.const -1)) (local.set $q (i32.const 2))))
    (if (call $wl_eq (local.get $k) (i32.const 2)) (then (local.set $c (i32.const -1))))
    (if
      (call $wl_eq (local.get $k) (i32.const 3))
      (then (local.set $b (i32.const -1)) (local.set $d (i32.const -1)) (local.set $q (i32.const 2))))
    (if (call $wl_eq (local.get $k) (i32.const 4)) (then (local.set $a (i32.const -1))))
    (if
      (call $wl_eq (local.get $k) (i32.const 5))
      (then (local.set $b (i32.const -1)) (local.set $d (i32.const 1)) (local.set $q (i32.const 2))))
    (if (call $wl_eq (local.get $k) (i32.const 6)) (then (local.set $c (i32.const 1))))
    (if
      (call $wl_eq (local.get $k) (i32.const 7))
      (then (local.set $b (i32.const 1)) (local.set $d (i32.const 1)) (local.set $q (i32.const 2))))
    (if
      (local.get $inverse)
      (then
        (local.set $c (call $wl_sub (i32.const 0) (local.get $c)))
        (local.set $d (call $wl_sub (i32.const 0) (local.get $d)))))
    (call $literal
      (local.get $out)
      (local.get $a)
      (local.get $b)
      (local.get $c)
      (local.get $d)
      (local.get $q)))
  (func $dft
    (param $input i32)
    (param $output i32)
    (param $n i32)
    (param $inverse i32)
    (param $stride i32)
    (local $k i32)
    (local $j i32)
    (local $p i32)
    (local $t i32)
    (block $done
      (loop $outer
        (br_if $done (call $wl_ge_u (local.get $k) (local.get $n)))
        (local.set $p (call $wl_add (local.get $output) (call $wl_mul (local.get $k) (i32.const 20))))
        (call $zero (local.get $p))
        (local.set $j (i32.const 0))
        (block $sum_done
          (loop $sum
            (br_if $sum_done (call $wl_ge_u (local.get $j) (local.get $n)))
            (local.set $t
              (call $wl_mul
                (call $wl_rem_u (call $wl_mul (local.get $j) (local.get $k)) (local.get $n))
                (call $wl_div_u (i32.const 8) (local.get $n))))
            (call $twiddle (i32.const 12608) (local.get $t) (local.get $inverse))
            (call $mul
              (i32.const 12628)
              (call $wl_add (local.get $input) (call $wl_mul (local.get $j) (local.get $stride)))
              (i32.const 12608))
            (call $add (local.get $p) (local.get $p) (i32.const 12628) (i32.const 0))
            (local.set $j (call $wl_add (local.get $j) (i32.const 1)))
            (br $sum)))
        (if
          (local.get $inverse)
          (then
            (call $literal
              (i32.const 12648)
              (i32.const 1)
              (i32.const 0)
              (i32.const 0)
              (i32.const 0)
              (local.get $n))
            (call $mul (local.get $p) (local.get $p) (i32.const 12648))))
        (local.set $k (call $wl_add (local.get $k) (i32.const 1)))
        (br $outer))))
  (func $fft
    (param $input i32)
    (param $even i32)
    (param $odd i32)
    (param $output i32)
    (param $n i32)
    (local $m i32)
    (local $k i32)
    (local.set $m (call $wl_shr_u (local.get $n) (i32.const 1)))
    (call $dft (local.get $input) (local.get $even) (local.get $m) (i32.const 0) (i32.const 40))
    (call $dft
      (call $wl_add (local.get $input) (i32.const 20))
      (local.get $odd)
      (local.get $m)
      (i32.const 0)
      (i32.const 40))
    (block $done
      (loop $again
        (br_if $done (call $wl_ge_u (local.get $k) (local.get $m)))
        (call $twiddle
          (i32.const 12608)
          (call $wl_mul (local.get $k) (call $wl_div_u (i32.const 8) (local.get $n)))
          (i32.const 0))
        (call $mul
          (i32.const 12628)
          (call $wl_add (local.get $odd) (call $wl_mul (local.get $k) (i32.const 20)))
          (i32.const 12608))
        (call $add
          (call $wl_add (local.get $output) (call $wl_mul (local.get $k) (i32.const 20)))
          (call $wl_add (local.get $even) (call $wl_mul (local.get $k) (i32.const 20)))
          (i32.const 12628)
          (i32.const 0))
        (call $add
          (call $wl_add
            (local.get $output)
            (call $wl_mul (call $wl_add (local.get $k) (local.get $m)) (i32.const 20)))
          (call $wl_add (local.get $even) (call $wl_mul (local.get $k) (i32.const 20)))
          (i32.const 12628)
          (i32.const 1))
        (local.set $k (call $wl_add (local.get $k) (i32.const 1)))
        (br $again))))
  (func $unbutterfly
    (param $input i32)
    (param $even i32)
    (param $odd i32)
    (param $n i32)
    (local $k i32)
    (local $m i32)
    (local.set $m (call $wl_shr_u (local.get $n) (i32.const 1)))
    (call $literal (i32.const 12648) (i32.const 1) (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 2))
    (block $done
      (loop $again
        (br_if $done (call $wl_ge_u (local.get $k) (local.get $m)))
        (call $mul
          (i32.const 12288)
          (call $wl_add (local.get $input) (call $wl_mul (local.get $k) (i32.const 20)))
          (i32.const 12648))
        (call $mul
          (i32.const 12308)
          (call $wl_add
            (local.get $input)
            (call $wl_mul (call $wl_add (local.get $k) (local.get $m)) (i32.const 20)))
          (i32.const 12648))
        (call $add
          (call $wl_add (local.get $even) (call $wl_mul (local.get $k) (i32.const 20)))
          (i32.const 12288)
          (i32.const 12308)
          (i32.const 0))
        (call $add (i32.const 12328) (i32.const 12288) (i32.const 12308) (i32.const 1))
        (call $twiddle
          (i32.const 12608)
          (call $wl_mul (local.get $k) (call $wl_div_u (i32.const 8) (local.get $n)))
          (i32.const 1))
        (call $mul
          (call $wl_add (local.get $odd) (call $wl_mul (local.get $k) (i32.const 20)))
          (i32.const 12328)
          (i32.const 12608))
        (local.set $k (call $wl_add (local.get $k) (i32.const 1)))
        (br $again))))
  (func $begin
    (result i32)
    (i32.store (i32.const 0) (i32.const 0))
    (if
      (call $wl64_eq (i64.load (i32.const 16)) (i64.const -1))
      (then (call $fail (i32.const 5)) (return (i32.const 0))))
    (call $zeros (i32.const 8192) (i32.const 8))
    (call $zeros (i32.const 8448) (i32.const 8))
    (call $zeros (i32.const 8704) (i32.const 8))
    (i32.const 1))
  (func $publish
    (param $mode i32)
    (param $n i32)
    (result i32)
    (if (i32.load (i32.const 0)) (then (return (i32.load (i32.const 0)))))
    (memory.copy (i32.const 4096) (i32.const 8192) (i32.const 160))
    (memory.copy (i32.const 4352) (i32.const 8448) (i32.const 160))
    (memory.copy (i32.const 4608) (i32.const 8704) (i32.const 160))
    (i32.store (i32.const 4) (local.get $mode))
    (i32.store (i32.const 8) (local.get $n))
    (i64.store (i32.const 16) (call $wl64_add (i64.load (i32.const 16)) (i64.const 1)))
    (i32.const 0))
  (func $power_length
    (param $n i32)
    (result i32)
    (call $wl_or
      (call $wl_or (call $wl_eq (local.get $n) (i32.const 1)) (call $wl_eq (local.get $n) (i32.const 2)))
      (call $wl_or (call $wl_eq (local.get $n) (i32.const 4)) (call $wl_eq (local.get $n) (i32.const 8)))))
  (func $isqrt
    (param $n i64)
    (result i64)
    (local $lo i64)
    (local $hi i64)
    (local $mid i64)
    (local.set $hi (i64.const 1024))
    (block $done
      (loop $again
        (br_if $done (call $wl64_ge_u (local.get $lo) (local.get $hi)))
        (local.set $mid
          (call $wl64_div_u
            (call $wl64_add (call $wl64_add (local.get $lo) (local.get $hi)) (i64.const 1))
            (i64.const 2)))
        (if
          (call $wl64_le_u (call $wl64_mul (local.get $mid) (local.get $mid)) (local.get $n))
          (then (local.set $lo (local.get $mid)))
          (else (local.set $hi (call $wl64_sub (local.get $mid) (i64.const 1)))))
        (br $again)))
    (local.get $lo))
  (func $circle
    (param $out i32)
    (param $x i32)
    (param $y i32)
    (param $radius i32)
    (param $cx i32)
    (param $cy i32)
    (local $p i64)
    (local $q i64)
    (local $pr i64)
    (local $qr i64)
    (local $r i64)
    (local $found i32)
    (if
      (call $wl_le_s (i32.load (local.get $radius)) (i32.const 0))
      (then (call $fail (i32.const 4)) (return)))
    (call $add (i32.const 18432) (local.get $x) (local.get $cx) (i32.const 1))
    (call $add (i32.const 18452) (local.get $y) (local.get $cy) (i32.const 1))
    (call $mul (i32.const 18472) (i32.const 18432) (i32.const 18432))
    (call $mul (i32.const 18492) (i32.const 18452) (i32.const 18452))
    (call $add (i32.const 18512) (i32.const 18472) (i32.const 18492) (i32.const 0))
    (if (i32.load (i32.const 0)) (then (return)))
    (local.set $p (call $wl_extend_u (i32.load (i32.const 18512))))
    (local.set $q (call $wl_extend_u (i32.load (i32.const 18528))))
    (local.set $pr (call $isqrt (local.get $p)))
    (local.set $qr (call $isqrt (local.get $q)))
    (if
      (call $wl_and
        (call $wl64_eq (call $wl64_mul (local.get $pr) (local.get $pr)) (local.get $p))
        (call $wl64_eq (call $wl64_mul (local.get $qr) (local.get $qr)) (local.get $q)))
      (then
        (call $pack
          (i32.const 18532)
          (local.get $pr)
          (i64.const 0)
          (i64.const 0)
          (i64.const 0)
          (local.get $qr))
        (local.set $found (i32.const 1))))
    (if
      (call $wl_and
        (call $wl_eqz (local.get $found))
        (call $wl_and
          (call $wl64_eqz (call $wl64_rem_u (local.get $p) (i64.const 2)))
          (call $wl64_eq (call $wl64_mul (local.get $qr) (local.get $qr)) (local.get $q))))
      (then
        (local.set $r (call $isqrt (call $wl64_div_u (local.get $p) (i64.const 2))))
        (if
          (call $wl64_eq
            (call $wl64_mul (i64.const 2) (call $wl64_mul (local.get $r) (local.get $r)))
            (local.get $p))
          (then
            (call $pack
              (i32.const 18532)
              (i64.const 0)
              (local.get $r)
              (i64.const 0)
              (i64.const 0)
              (local.get $qr))
            (local.set $found (i32.const 1))))))
    (if
      (call $wl_and
        (call $wl_eqz (local.get $found))
        (call $wl_and
          (call $wl64_eqz (call $wl64_rem_u (local.get $q) (i64.const 2)))
          (call $wl64_eq (call $wl64_mul (local.get $pr) (local.get $pr)) (local.get $p))))
      (then
        (local.set $r (call $isqrt (call $wl64_div_u (local.get $q) (i64.const 2))))
        (if
          (call $wl64_eq
            (call $wl64_mul (i64.const 2) (call $wl64_mul (local.get $r) (local.get $r)))
            (local.get $q))
          (then
            (call $pack
              (i32.const 18532)
              (i64.const 0)
              (local.get $pr)
              (i64.const 0)
              (i64.const 0)
              (call $wl64_mul (i64.const 2) (local.get $r)))
            (local.set $found (i32.const 1))))))
    (if (call $wl_eqz (local.get $found)) (then (call $fail (i32.const 8)) (return)))
    (call $add (local.get $out) (i32.const 18532) (local.get $radius) (i32.const 1)))
  (func $apply
    (export "apply")
    (param $mode i32)
    (param $n i32)
    (result i32)
    (local $i i32)
    (local $p i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 9))))
    (if (call $wl_eqz (call $begin)) (then (return (i32.load (i32.const 0)))))
    (if
      (call $wl_or
        (call $wl_lt_u (local.get $mode) (i32.const 1))
        (call $wl_gt_u (local.get $mode) (i32.const 10)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (call $wl_or (call $wl_eqz (local.get $n)) (call $wl_gt_u (local.get $n) (i32.const 8)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (call $wl_and (call $wl_eq (local.get $mode) (i32.const 1)) (call $wl_ne (local.get $n) (i32.const 2)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (call $wl_and
        (call $wl_and
          (call $wl_ge_u (local.get $mode) (i32.const 3))
          (call $wl_le_u (local.get $mode) (i32.const 7)))
        (call $wl_eqz (call $power_length (local.get $n))))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (call $wl_and
        (call $wl_and
          (call $wl_ge_u (local.get $mode) (i32.const 5))
          (call $wl_le_u (local.get $mode) (i32.const 7)))
        (call $wl_eq (local.get $n) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (call $wl_and
        (call $wl_ge_u (local.get $mode) (i32.const 9))
        (call $wl_ne (local.get $n) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (call $wl_le_u (local.get $mode) (i32.const 7))
      (then (call $check (i32.const 1024) (local.get $n) (i32.const 0))))
    (if
      (call $wl_eq (local.get $mode) (i32.const 2))
      (then
        (call $check (i32.const 1280) (local.get $n) (i32.const 0))
        (call $check (i32.const 1536) (local.get $n) (i32.const 0))))
    (if (i32.load (i32.const 0)) (then (return (i32.load (i32.const 0)))))
    (if
      (call $wl_eq (local.get $mode) (i32.const 1))
      (then
        (call $literal
          (i32.const 12648)
          (i32.const 0)
          (i32.const 1)
          (i32.const 0)
          (i32.const 0)
          (i32.const 2))
        (call $mul (i32.const 12288) (i32.const 1024) (i32.const 12648))
        (call $mul (i32.const 12308) (i32.const 1044) (i32.const 12648))
        (call $add (i32.const 8192) (i32.const 12288) (i32.const 12308) (i32.const 0))
        (call $add (i32.const 8212) (i32.const 12288) (i32.const 12308) (i32.const 1))))
    (if
      (call $wl_eq (local.get $mode) (i32.const 2))
      (then
        (block $done
          (loop $again
            (br_if $done (call $wl_ge_u (local.get $i) (local.get $n)))
            (local.set $p (call $wl_mul (local.get $i) (i32.const 20)))
            (call $mul
              (call $wl_add (i32.const 8192) (local.get $p))
              (call $wl_add (i32.const 1024) (local.get $p))
              (call $wl_add (i32.const 1280) (local.get $p)))
            (call $mul
              (call $wl_add (i32.const 8448) (local.get $p))
              (call $wl_add (i32.const 8192) (local.get $p))
              (call $wl_add (i32.const 1536) (local.get $p)))
            (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
            (br $again)))))
    (if
      (call $wl_or
        (call $wl_eq (local.get $mode) (i32.const 3))
        (call $wl_eq (local.get $mode) (i32.const 4)))
      (then
        (call $dft
          (i32.const 1024)
          (i32.const 8192)
          (local.get $n)
          (call $wl_eq (local.get $mode) (i32.const 4))
          (i32.const 20))))
    (if
      (call $wl_eq (local.get $mode) (i32.const 5))
      (then (call $fft (i32.const 1024) (i32.const 8192) (i32.const 8448) (i32.const 8704) (local.get $n))))
    (if
      (call $wl_eq (local.get $mode) (i32.const 6))
      (then (call $unbutterfly (i32.const 1024) (i32.const 8192) (i32.const 8448) (local.get $n))))
    (if
      (call $wl_eq (local.get $mode) (i32.const 7))
      (then
        (call $fft (i32.const 1024) (i32.const 16384) (i32.const 16640) (i32.const 8192) (local.get $n))
        (call $unbutterfly (i32.const 8192) (i32.const 16896) (i32.const 17152) (local.get $n))
        (call $dft
          (i32.const 16896)
          (i32.const 17408)
          (call $wl_shr_u (local.get $n) (i32.const 1))
          (i32.const 1)
          (i32.const 20))
        (call $dft
          (i32.const 17152)
          (i32.const 17664)
          (call $wl_shr_u (local.get $n) (i32.const 1))
          (i32.const 1)
          (i32.const 20))
        (local.set $i (i32.const 0))
        (block $done
          (loop $again
            (br_if $done (call $wl_ge_u (local.get $i) (call $wl_shr_u (local.get $n) (i32.const 1))))
            (local.set $p (call $wl_mul (local.get $i) (i32.const 20)))
            (memory.copy
              (i32.add (i32.const 8448) (i32.shl (local.get $p) (i32.const 1)))
              (i32.add (i32.const 17408) (local.get $p))
              (i32.const 20))
            (memory.copy
              (i32.add (i32.const 8468) (i32.shl (local.get $p) (i32.const 1)))
              (i32.add (i32.const 17664) (local.get $p))
              (i32.const 20))
            (memory.copy
              (i32.add (i32.const 8704) (local.get $p))
              (i32.add (i32.const 16384) (local.get $p))
              (i32.const 20))
            (memory.copy
              (i32.add
                (i32.const 8704)
                (i32.add (local.get $p) (i32.mul (i32.shr_u (local.get $n) (i32.const 1)) (i32.const 20))))
              (i32.add (i32.const 16640) (local.get $p))
              (i32.const 20))
            (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
            (br $again)))))
    (if
      (call $wl_eq (local.get $mode) (i32.const 8))
      (then
        (call $check (i32.const 1024) (local.get $n) (i32.const 1))
        (call $check (i32.const 1280) (local.get $n) (i32.const 1))
        (call $check (i32.const 1792) (i32.const 2) (i32.const 2))
        (if (call $wl_le_s (i32.load (i32.const 1792)) (i32.const 0)) (then (call $fail (i32.const 4))))
        (call $mul (i32.const 12348) (i32.const 1792) (i32.const 1792))
        (local.set $i (i32.const 0))
        (block $done
          (loop $again
            (br_if $done (call $wl_ge_u (local.get $i) (local.get $n)))
            (local.set $p (call $wl_mul (local.get $i) (i32.const 20)))
            (call $mul
              (call $wl_add (i32.const 8192) (local.get $p))
              (call $wl_add (i32.const 1024) (local.get $p))
              (i32.const 1792))
            (call $mul (i32.const 12288) (call $wl_add (i32.const 1280) (local.get $p)) (i32.const 12348))
            (call $mul (i32.const 12308) (call $wl_add (i32.const 1024) (local.get $p)) (i32.const 1812))
            (call $add
              (call $wl_add (i32.const 8448) (local.get $p))
              (i32.const 12288)
              (i32.const 12308)
              (i32.const 0))
            (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
            (br $again)))))
    (if
      (call $wl_ge_u (local.get $mode) (i32.const 9))
      (then
        (call $check
          (i32.const 1792)
          (select (i32.const 8) (i32.const 5) (call $wl_eq (local.get $mode) (i32.const 10)))
          (i32.const 2))
        (if (i32.load (i32.const 0)) (then (return (i32.load (i32.const 0)))))
        (call $circle
          (i32.const 8192)
          (i32.const 1792)
          (i32.const 1812)
          (i32.const 1832)
          (i32.const 1852)
          (i32.const 1872))
        (if
          (call $wl_eq (local.get $mode) (i32.const 10))
          (then
            (call $circle
              (i32.const 8448)
              (i32.const 1792)
              (i32.const 1812)
              (i32.const 1892)
              (i32.const 1912)
              (i32.const 1932))
            (call $mul (i32.const 8704) (i32.const 8192) (i32.const 8448))))))
    (call $publish (local.get $mode) (local.get $n)))
  (func $state_valid
    (export "state_valid")
    (result i32)
    (local $i i32)
    (local $p i32)
    (call $guard_data)
    (block $done
      (loop $again
        (br_if $done (call $wl_ge_u (local.get $i) (i32.const 5)))
        (local.set $p (call $wl_add (i32.const 272) (call $wl_mul (local.get $i) (i32.const 20))))
        (if (call $wl_eqz (call $valid (local.get $p))) (then (return (i32.const 0))))
        (if
          (call $wl_or
            (i32.load offset=4 (local.get $p))
            (call $wl_or (i32.load offset=8 (local.get $p)) (i32.load offset=12 (local.get $p))))
          (then (return (i32.const 0))))
        (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
        (br $again)))
    (call $wl_and
      (call $wl_and
        (call $wl_ge_s (i32.load (i32.const 272)) (i32.const 0))
        (call $wl_le_u (i32.load (i32.const 372)) (i32.const 1)))
      (call $wl_and
        (call $wl_ge_s (i32.load (i32.const 292)) (i32.const 0))
        (call $wl_le_s (i32.load (i32.const 292)) (i32.load (i32.const 308))))))
  (func
    (export "paired_step")
    (param $rewrite i32)
    (result i32)
    (local $code i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 9))))
    (if (call $wl_eqz (call $begin)) (then (return (i32.load (i32.const 0)))))
    (if
      (call $wl_gt_u (local.get $rewrite) (i32.const 3))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if (call $wl_eqz (call $state_valid)) (then (call $fail (i32.const 7)) (return (i32.const 7))))
    (if
      (call $wl_or
        (call $wl64_eq (i64.load (i32.const 256)) (i64.const -1))
        (call $wl64_eq (i64.load (i32.const 264)) (i64.const -1)))
      (then (call $fail (i32.const 5)) (return (i32.const 5))))
    (call $check (i32.const 1024) (i32.const 2) (i32.const 2))
    (call $check (i32.const 1792) (i32.const 1) (i32.const 2))
    (if
      (call $wl_and (local.get $rewrite) (i32.const 1))
      (then
        (call $check (i32.const 1812) (i32.const 1) (i32.const 2))
        (if
          (call $wl_or
            (call $wl_lt_s (i32.load (i32.const 1812)) (i32.const 0))
            (call $wl_gt_s (i32.load (i32.const 1812)) (i32.load (i32.const 1828))))
          (then (call $fail (i32.const 7))))))
    (if
      (call $wl_and (local.get $rewrite) (i32.const 2))
      (then (call $check (i32.const 1832) (i32.const 2) (i32.const 2))))
    (if (i32.load (i32.const 0)) (then (return (i32.load (i32.const 0)))))
    (if
      (call $wl_or
        (call $wl_le_s (i32.load (i32.const 1792)) (i32.const 0))
        (call $wl64_le_s
          (call $wl64_mul
            (call $wl_extend_s (i32.load (i32.const 1792)))
            (call $wl_extend_u (i32.load (i32.const 288))))
          (call $wl64_mul
            (call $wl_extend_s (i32.load (i32.const 272)))
            (call $wl_extend_u (i32.load (i32.const 1808))))))
      (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (call $literal (i32.const 12648) (i32.const 1) (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 1))
    (call $add (i32.const 12288) (i32.const 12648) (i32.const 292) (i32.const 1))
    (call $mul (i32.const 8192) (i32.const 1024) (i32.const 12288))
    (call $mul (i32.const 8212) (i32.const 1044) (i32.const 292))
    (call $mul (i32.const 8448) (i32.const 8192) (i32.const 312))
    (call $mul (i32.const 8468) (i32.const 8212) (i32.const 332))
    (call $add (i32.const 8704) (i32.const 8448) (i32.const 8468) (i32.const 0))
    (if (i32.load (i32.const 0)) (then (return (i32.load (i32.const 0)))))
    (memory.copy (i32.const 512) (i32.const 256) (i32.const 128))
    (i64.store (i32.const 512) (call $wl64_add (i64.load (i32.const 256)) (i64.const 1)))
    (i64.store (i32.const 520) (call $wl64_add (i64.load (i32.const 264)) (i64.const 1)))
    (memory.copy (i32.const 528) (i32.const 1792) (i32.const 20))
    (if
      (call $wl_and (local.get $rewrite) (i32.const 1))
      (then (memory.copy (i32.const 548) (i32.const 1812) (i32.const 20))))
    (if
      (call $wl_and (local.get $rewrite) (i32.const 2))
      (then (memory.copy (i32.const 568) (i32.const 1832) (i32.const 40))))
    (memory.copy (i32.const 608) (i32.const 8704) (i32.const 20))
    (i32.store (i32.const 628) (i32.const 1))
    (local.set $code (call $publish (i32.const 11) (i32.const 2)))
    (if
      (call $wl_eqz (local.get $code))
      (then
        (memory.copy (i32.const 768) (i32.const 256) (i32.const 128))
        (memory.copy (i32.const 256) (i32.const 512) (i32.const 128))))
    (local.get $code))
  (func $reset
    (export "reset")
    (call $guard_data)
    (memory.fill (i32.const 0) (i32.const 0) (i32.const 60000))
    (memory.fill (i32.const 61024) (i32.const 0) (i32.const 4512))
    (memory.fill (i32.const 60000) (i32.const 0) (i32.const 128))
    (memory.fill (i32.const 60140) (i32.const 0) (i32.const 884))
    (call $zeros (i32.const 1024) (i32.const 8))
    (call $zeros (i32.const 1280) (i32.const 8))
    (call $zeros (i32.const 1536) (i32.const 8))
    (call $zeros (i32.const 1792) (i32.const 8))
    (call $zeros (i32.const 4096) (i32.const 8))
    (call $zeros (i32.const 4352) (i32.const 8))
    (call $zeros (i32.const 4608) (i32.const 8))
    (call $zeros (i32.const 272) (i32.const 5))
    (call $literal (i32.const 292) (i32.const 1) (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 2))
    (call $literal (i32.const 312) (i32.const 1) (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 1))
    (call $literal (i32.const 332) (i32.const 3) (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 4)))
  (func
    (export "next_event_T")
    (result i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 9))))
    (i32.store (i32.const 0) (i32.const 0))
    (call $check (i32.const 1792) (i32.const 1) (i32.const 2))
    (if (i32.load (i32.const 0)) (then (return (i32.load (i32.const 0)))))
    (if
      (call $wl_le_s (i32.load (i32.const 1792)) (i32.const 0))
      (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (call $literal (i32.const 12648) (i32.const 1) (i32.const 0) (i32.const 0) (i32.const 0) (i32.const 1))
    (call $add (i32.const 12368) (i32.const 1792) (i32.const 12648) (i32.const 0))
    (if
      (call $wl_eqz (i32.load (i32.const 0)))
      (then (memory.copy (i32.const 1792) (i32.const 12368) (i32.const 20))))
    (i32.load (i32.const 0)))
  (func
    (export "record_valid")
    (param $slot i32)
    (result i32)
    (call $guard_data)
    (if (call $wl_ge_u (local.get $slot) (i32.const 8)) (then (return (i32.const 0))))
    (call $valid (call $wl_add (i32.const 1024) (call $wl_mul (local.get $slot) (i32.const 20)))))
  (func
    (export "search")
    (param $key i32)
    (result i32)
    (local $lo i32)
    (local $hi i32)
    (local $mid i32)
    (local $n i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 9))))
    (if (call $wl_eqz (call $begin)) (then (return (i32.load (i32.const 0)))))
    (if
      (call $wl_gt_u (local.get $key) (i32.const 24))
      (then (call $fail (i32.const 4)) (return (i32.const 4))))
    (memory.fill (i32.const 64) (i32.const 0) (i32.const 24))
    (local.set $hi (i32.const 24))
    (block $done
      (loop $again
        (local.set $mid (call $wl_shr_u (call $wl_add (local.get $lo) (local.get $hi)) (i32.const 1)))
        (i32.store (i32.add (i32.const 64) (i32.shl (local.get $n) (i32.const 2))) (local.get $mid))
        (local.set $n (call $wl_add (local.get $n) (i32.const 1)))
        (br_if $done (call $wl_eq (local.get $mid) (local.get $key)))
        (if
          (call $wl_lt_u (local.get $key) (local.get $mid))
          (then (local.set $hi (call $wl_sub (local.get $mid) (i32.const 1))))
          (else (local.set $lo (call $wl_add (local.get $mid) (i32.const 1)))))
        (br $again)))
    (i32.store (i32.const 84) (local.get $n))
    (i32.store (i32.const 4) (i32.const 12))
    (i32.store (i32.const 8) (local.get $n))
    (i64.store (i32.const 16) (call $wl64_add (i64.load (i32.const 16)) (i64.const 1)))
    (i32.const 0))
  (func
    (export "input_offset")
    (param $bank i32)
    (result i32)
    (call $guard_data)
    (if
      (result i32)
      (call $wl_lt_u (local.get $bank) (i32.const 3))
      (then (call $wl_add (i32.const 1024) (call $wl_mul (local.get $bank) (i32.const 256))))
      (else (i32.const -1))))
  (func
    (export "output_offset")
    (param $bank i32)
    (result i32)
    (call $guard_data)
    (if
      (result i32)
      (call $wl_lt_u (local.get $bank) (i32.const 3))
      (then (call $wl_add (i32.const 4096) (call $wl_mul (local.get $bank) (i32.const 256))))
      (else (i32.const -1))))
  (func (export "params_offset") (result i32) (call $guard_data) (i32.const 1792))
  (func (export "state_offset") (result i32) (call $guard_data) (i32.const 256))
  (func (export "applied_state_offset") (result i32) (call $guard_data) (i32.const 768))
  (func (export "abi_version") (result i32) (call $guard_data) (i32.const 1))
  (func (export "coefficient_bound") (result i32) (call $guard_data) (i32.const 1048576))
  (func $bl_code_valid
    (result i32)
    (local $bad i32)
    (local.set $bad (i32.ne (i32.load (i32.add (i32.const 60000) (i32.const 136))) (i32.const 0x424c4131)))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 60000) (i32.const 128))) (i32.const 6))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 60000) (i32.const 129))) (i32.const 8))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 60000) (i32.const 130))) (i32.const 14))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 60000) (i32.const 131))) (i32.const 1))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 60000) (i32.const 132))) (i32.const 150))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 60000) (i32.const 133))) (i32.const 232))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 60000) (i32.const 134))) (i32.const 2))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 60000) (i32.const 135))) (i32.const 9))))
    (i32.eqz (local.get $bad)))
  (func $bl_lut
    (param $table i32)
    (param $address i32)
    (result i32)
    (i32.and
      (i32.shr_u
        (i32.load8_u (i32.add (i32.const 60000) (i32.add (i32.const 128) (local.get $table))))
        (local.get $address))
      (i32.const 1)))
  (func $bl_address2
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.or (i32.shl (local.get $a) (i32.const 1)) (local.get $b)))
  (func $bl_address3
    (param $a i32)
    (param $b i32)
    (param $c i32)
    (result i32)
    (i32.or
      (i32.shl (local.get $a) (i32.const 2))
      (i32.or (i32.shl (local.get $b) (i32.const 1)) (local.get $c))))
  (func $bl_get_bit
    (param $base i32)
    (param $i i32)
    (result i32)
    (i32.and
      (i32.shr_u
        (i32.load8_u
          (i32.add (i32.const 60000) (i32.add (local.get $base) (i32.shr_u (local.get $i) (i32.const 3)))))
        (i32.and (local.get $i) (i32.const 7)))
      (i32.const 1)))
  (func $bl_emit_bit
    (param $base i32)
    (param $i i32)
    (param $table i32)
    (param $address i32)
    (local $bit i32)
    (local $byte i32)
    (local $shift i32)
    (local $mask i32)
    (local.set $bit (call $bl_lut (local.get $table) (local.get $address)))
    (local.set $byte (i32.add (local.get $base) (i32.shr_u (local.get $i) (i32.const 3))))
    (local.set $shift (i32.and (local.get $i) (i32.const 7)))
    (local.set $mask (i32.shl (i32.const 1) (local.get $shift)))
    (i32.store8
      (i32.add (i32.const 60000) (local.get $byte))
      (i32.or
        (i32.and
          (i32.load8_u (i32.add (i32.const 60000) (local.get $byte)))
          (i32.sub (i32.const 255) (local.get $mask)))
        (i32.shl (local.get $bit) (local.get $shift)))))
  (func $bl_valid
    (param $n i32)
    (result i32)
    (local $i i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 1))))
    (if
      (i32.or (i32.lt_u (local.get $n) (i32.const 1)) (i32.gt_u (local.get $n) (i32.const 64)))
      (then (return (i32.const 2))))
    (local.set $i (local.get $n))
    (block $done
      (loop $padding
        (br_if $done (i32.ge_u (local.get $i) (i32.const 64)))
        (if
          (i32.or
            (call $bl_get_bit (i32.const 0) (local.get $i))
            (call $bl_get_bit (i32.const 8) (local.get $i)))
          (then (return (i32.const 3))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $padding)))
    (i32.const 0))
  (func $bl_clear
    (memory.fill (i32.add (i32.const 60000) (i32.const 16)) (i32.const 0) (i32.const 16))
    (memory.fill (i32.add (i32.const 60000) (i32.const 64)) (i32.const 0) (i32.const 8)))
  (func $bl_arithmetic
    (param $n i32)
    (param $mode i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local $a i32)
    (local $b i32)
    (local $carry i32)
    (local $address i32)
    (local.set $status (call $bl_valid (local.get $n)))
    (if (local.get $status) (then (return (local.get $status))))
    (call $bl_clear)
    (if (local.get $mode) (then (local.set $carry (i32.const 1))))
    (block $done
      (loop $ripple
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $a (call $bl_get_bit (i32.const 0) (local.get $i)))
        (local.set $b (call $bl_get_bit (i32.const 8) (local.get $i)))
        (if
          (i32.eq (local.get $mode) (i32.const 1))
          (then (local.set $b (call $bl_lut (i32.const 3) (local.get $b)))))
        (if
          (i32.eq (local.get $mode) (i32.const 2))
          (then (local.set $b (call $bl_lut (i32.const 3) (local.get $a))) (local.set $a (i32.const 0))))
        (local.set $address (call $bl_address3 (local.get $a) (local.get $b) (local.get $carry)))
        (call $bl_emit_bit (i32.const 16) (local.get $i) (i32.const 4) (local.get $address))
        (local.set $carry (call $bl_lut (i32.const 5) (local.get $address)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $ripple)))
    (call $bl_emit_bit (i32.const 24) (i32.const 0) (i32.const 6) (local.get $carry))
    (i32.store8 (i32.add (i32.const 60000) (i32.const 25)) (i32.const 1))
    (i32.const 0))
  (func $bl_add (param $n i32) (result i32) (call $bl_arithmetic (local.get $n) (i32.const 0)))
  (func $bl_sub (param $n i32) (result i32) (call $bl_arithmetic (local.get $n) (i32.const 1)))
  (func $bl_neg (param $n i32) (result i32) (call $bl_arithmetic (local.get $n) (i32.const 2)))
  (func $bl_logical
    (param $n i32)
    (param $table i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local.set $status (call $bl_valid (local.get $n)))
    (if (local.get $status) (then (return (local.get $status))))
    (call $bl_clear)
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (call $bl_emit_bit
          (i32.const 16)
          (local.get $i)
          (local.get $table)
          (call $bl_address2
            (call $bl_get_bit (i32.const 0) (local.get $i))
            (call $bl_get_bit (i32.const 8) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (i32.const 0))
  (func $bl_and (param $n i32) (result i32) (call $bl_logical (local.get $n) (i32.const 1)))
  (func $bl_or (param $n i32) (result i32) (call $bl_logical (local.get $n) (i32.const 2)))
  (func $bl_xor (param $n i32) (result i32) (call $bl_logical (local.get $n) (i32.const 0)))
  (func $bl_mul
    (param $n i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local $j i32)
    (local $partial i32)
    (local $carry i32)
    (local $address i32)
    (local.set $status (call $bl_valid (local.get $n)))
    (if (local.get $status) (then (return (local.get $status))))
    (call $bl_clear)
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_u (local.get $j) (local.get $n)))
        (local.set $i (i32.const 0))
        (local.set $carry (i32.const 0))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_u (local.get $i) (local.get $n)))
            (local.set $partial (i32.const 0))
            (if
              (i32.ge_u (local.get $i) (local.get $j))
              (then
                (local.set $partial
                  (call $bl_lut
                    (i32.const 1)
                    (call $bl_address2
                      (call $bl_get_bit (i32.const 0) (i32.sub (local.get $i) (local.get $j)))
                      (call $bl_get_bit (i32.const 8) (local.get $j)))))))
            (local.set $address
              (call $bl_address3
                (call $bl_get_bit (i32.const 64) (local.get $i))
                (local.get $partial)
                (local.get $carry)))
            (call $bl_emit_bit (i32.const 64) (local.get $i) (i32.const 4) (local.get $address))
            (local.set $carry (call $bl_lut (i32.const 5) (local.get $address)))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $inner)))
        (local.set $j (i32.add (local.get $j) (i32.const 1)))
        (br $outer)))
    (local.set $i (i32.const 0))
    (block $copy_done
      (loop $copy
        (br_if $copy_done (i32.ge_u (local.get $i) (local.get $n)))
        (call $bl_emit_bit
          (i32.const 16)
          (local.get $i)
          (i32.const 6)
          (call $bl_get_bit (i32.const 64) (local.get $i)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $copy)))
    (i32.const 0))
  (func $bl_rotl
    (param $n i32)
    (param $count i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local $source i32)
    (local $r i32)
    (local.set $status (call $bl_valid (local.get $n)))
    (if (local.get $status) (then (return (local.get $status))))
    (call $bl_clear)
    (local.set $r (i32.rem_u (local.get $count) (local.get $n)))
    (block $done
      (loop $rotate
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $source
          (i32.rem_u (i32.sub (i32.add (local.get $i) (local.get $n)) (local.get $r)) (local.get $n)))
        (call $bl_emit_bit
          (i32.const 16)
          (local.get $i)
          (i32.const 6)
          (call $bl_get_bit (i32.const 0) (local.get $source)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $rotate)))
    (i32.const 0))
  (func $bl_shift
    (param $n i32)
    (param $count i32)
    (param $mode i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local $source i32)
    (local $r i32)
    (local $bit i32)
    (local.set $status (call $bl_valid (local.get $n)))
    (if (local.get $status) (then (return (local.get $status))))
    (call $bl_clear)
    (local.set $r (i32.rem_u (local.get $count) (local.get $n)))
    (block $done
      (loop $shift_loop
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $bit (i32.const 0))
        (if
          (i32.eqz (local.get $mode))
          (then
            (if
              (i32.ge_u (local.get $i) (local.get $r))
              (then (local.set $bit (call $bl_get_bit (i32.const 0) (i32.sub (local.get $i) (local.get $r)))))))
          (else
            (local.set $source (i32.add (local.get $i) (local.get $r)))
            (if
              (i32.lt_u (local.get $source) (local.get $n))
              (then (local.set $bit (call $bl_get_bit (i32.const 0) (local.get $source))))
              (else
                (if
                  (i32.eq (local.get $mode) (i32.const 2))
                  (then
                    (local.set $bit (call $bl_get_bit (i32.const 0) (i32.sub (local.get $n) (i32.const 1))))))))))
        (call $bl_emit_bit (i32.const 16) (local.get $i) (i32.const 6) (local.get $bit))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $shift_loop)))
    (i32.const 0))
  (func $bl_shl
    (param $n i32)
    (param $count i32)
    (result i32)
    (call $bl_shift (local.get $n) (local.get $count) (i32.const 0)))
  (func $bl_shr_u
    (param $n i32)
    (param $count i32)
    (result i32)
    (call $bl_shift (local.get $n) (local.get $count) (i32.const 1)))
  (func $bl_shr_s
    (param $n i32)
    (param $count i32)
    (result i32)
    (call $bl_shift (local.get $n) (local.get $count) (i32.const 2)))
  (func $bl_compare
    (param $n i32)
    (param $mode i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local $a i32)
    (local $b i32)
    (local $equal i32)
    (local $less i32)
    (local $different i32)
    (local $sign i32)
    (local $result i32)
    (local.set $status (call $bl_valid (local.get $n)))
    (if (local.get $status) (then (return (local.get $status))))
    (call $bl_clear)
    (local.set $equal (i32.const 1))
    (local.set $i (local.get $n))
    (block $done
      (loop $cmp
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $a (call $bl_get_bit (i32.const 0) (local.get $i)))
        (local.set $b (call $bl_get_bit (i32.const 8) (local.get $i)))
        (local.set $different
          (call $bl_lut
            (i32.const 1)
            (call $bl_address2 (call $bl_lut (i32.const 3) (local.get $a)) (local.get $b))))
        (local.set $less
          (call $bl_lut
            (i32.const 2)
            (call $bl_address2
              (local.get $less)
              (call $bl_lut (i32.const 1) (call $bl_address2 (local.get $equal) (local.get $different))))))
        (local.set $equal
          (call $bl_lut
            (i32.const 1)
            (call $bl_address2
              (local.get $equal)
              (call $bl_lut (i32.const 7) (call $bl_address2 (local.get $a) (local.get $b))))))
        (br $cmp)))
    (local.set $result (local.get $less))
    (if
      (i32.eq (local.get $mode) (i32.const 1))
      (then
        (local.set $a (call $bl_get_bit (i32.const 0) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $b (call $bl_get_bit (i32.const 8) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $sign (call $bl_lut (i32.const 0) (call $bl_address2 (local.get $a) (local.get $b))))
        (local.set $result
          (call $bl_lut
            (i32.const 2)
            (call $bl_address2
              (call $bl_lut (i32.const 1) (call $bl_address2 (local.get $sign) (local.get $a)))
              (call $bl_lut
                (i32.const 1)
                (call $bl_address2 (call $bl_lut (i32.const 3) (local.get $sign)) (local.get $less))))))))
    (if (i32.eq (local.get $mode) (i32.const 2)) (then (local.set $result (local.get $equal))))
    (call $bl_emit_bit (i32.const 16) (i32.const 0) (i32.const 6) (local.get $result))
    (i32.const 0))
  (func $bl_ltu (param $n i32) (result i32) (call $bl_compare (local.get $n) (i32.const 0)))
  (func $bl_lts (param $n i32) (result i32) (call $bl_compare (local.get $n) (i32.const 1)))
  (func $bl_eq (param $n i32) (result i32) (call $bl_compare (local.get $n) (i32.const 2)))
  (func $bl_tomk_mix32
    (result i32)
    (local $status i32)
    (local.set $status (call $bl_valid (i32.const 32)))
    (if (local.get $status) (then (return (local.get $status))))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 80))
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.const 8))
    (drop (call $bl_shift (i32.const 32) (i32.const 16) (i32.const 1)))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 8))
      (i32.add (i32.const 60000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.add (i32.const 60000) (i32.const 80))
      (i32.const 8))
    (drop (call $bl_xor (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.add (i32.const 60000) (i32.const 16))
      (i32.const 8))
    (i32.store (i32.add (i32.const 60000) (i32.const 8)) (i32.const 0x7feb352d))
    (i32.store (i32.add (i32.const 60000) (i32.const 12)) (i32.const 0))
    (drop (call $bl_mul (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.add (i32.const 60000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 80))
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.const 8))
    (drop (call $bl_shift (i32.const 32) (i32.const 15) (i32.const 1)))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 8))
      (i32.add (i32.const 60000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.add (i32.const 60000) (i32.const 80))
      (i32.const 8))
    (drop (call $bl_xor (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.add (i32.const 60000) (i32.const 16))
      (i32.const 8))
    (i32.store (i32.add (i32.const 60000) (i32.const 8)) (i32.const 0x846ca68b))
    (i32.store (i32.add (i32.const 60000) (i32.const 12)) (i32.const 0))
    (drop (call $bl_mul (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.add (i32.const 60000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 80))
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.const 8))
    (drop (call $bl_shift (i32.const 32) (i32.const 16) (i32.const 1)))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 8))
      (i32.add (i32.const 60000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.add (i32.const 60000) (i32.const 80))
      (i32.const 8))
    (drop (call $bl_xor (i32.const 32)))
    (i32.const 0))
  (func $bl_add32 (result i32) (call $bl_add (i32.const 32)))
  (func $bl_add64 (result i32) (call $bl_add (i32.const 64)))
  (func $bl_sub32 (result i32) (call $bl_sub (i32.const 32)))
  (func $bl_sub64 (result i32) (call $bl_sub (i32.const 64)))
  (func $bl_neg32 (result i32) (call $bl_neg (i32.const 32)))
  (func $bl_neg64 (result i32) (call $bl_neg (i32.const 64)))
  (func $bl_mul32 (result i32) (call $bl_mul (i32.const 32)))
  (func $bl_mul64 (result i32) (call $bl_mul (i32.const 64)))
  (func $bl_init
    (memory.fill (i32.add (i32.const 60000) (i32.const 0)) (i32.const 0) (i32.const 1024))
    (i32.store8 (i32.add (i32.const 60000) (i32.const 128)) (i32.const 6))
    (i32.store8 (i32.add (i32.const 60000) (i32.const 129)) (i32.const 8))
    (i32.store8 (i32.add (i32.const 60000) (i32.const 130)) (i32.const 14))
    (i32.store8 (i32.add (i32.const 60000) (i32.const 131)) (i32.const 1))
    (i32.store8 (i32.add (i32.const 60000) (i32.const 132)) (i32.const 150))
    (i32.store8 (i32.add (i32.const 60000) (i32.const 133)) (i32.const 232))
    (i32.store8 (i32.add (i32.const 60000) (i32.const 134)) (i32.const 2))
    (i32.store8 (i32.add (i32.const 60000) (i32.const 135)) (i32.const 9))
    (i32.store (i32.add (i32.const 60000) (i32.const 136)) (i32.const 0x424c4131)))
  (func $dv_word_zero
    (param $p i32)
    (param $n i32)
    (result i32)
    (local $i i32)
    (local $any i32)
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $any
          (call $bl_lut
            (i32.const 2)
            (call $bl_address2 (local.get $any) (call $bl_get_bit (local.get $p) (local.get $i)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (call $bl_lut (i32.const 3) (local.get $any)))
  (func $dv_word_min
    (param $p i32)
    (param $n i32)
    (result i32)
    (local $i i32)
    (local $any i32)
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $any
          (call $bl_lut
            (i32.const 2)
            (call $bl_address2 (local.get $any) (call $bl_get_bit (local.get $p) (local.get $i)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (call $bl_lut
      (i32.const 1)
      (call $bl_address2
        (call $bl_lut (i32.const 3) (local.get $any))
        (call $bl_get_bit (local.get $p) (i32.sub (local.get $n) (i32.const 1))))))
  (func $dv_word_ones
    (param $p i32)
    (param $n i32)
    (result i32)
    (local $i i32)
    (local $all i32)
    (local.set $all (i32.const 1))
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $all
          (call $bl_lut
            (i32.const 1)
            (call $bl_address2 (local.get $all) (call $bl_get_bit (local.get $p) (local.get $i)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (local.get $all))
  (func $dv_emit_word
    (param $dst i32)
    (param $src i32)
    (param $n i32)
    (local $i i32)
    (memory.fill (i32.add (i32.const 60000) (local.get $dst)) (i32.const 0) (i32.const 8))
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (call $bl_emit_bit
          (local.get $dst)
          (local.get $i)
          (i32.const 6)
          (call $bl_get_bit (local.get $src) (local.get $i)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again))))
  (func $dv_neg_word
    (param $p i32)
    (param $n i32)
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.add (i32.const 60000) (local.get $p))
      (i32.const 8))
    (memory.fill (i32.add (i32.const 60000) (i32.const 8)) (i32.const 0) (i32.const 8))
    (drop (call $bl_neg (local.get $n)))
    (memory.copy
      (i32.add (i32.const 60000) (local.get $p))
      (i32.add (i32.const 60000) (i32.const 16))
      (i32.const 8)))
  (func $dv_remainder_digit
    (param $n i32)
    (param $b i32)
    (param $bit i32)
    (result i32)
    (local $j i32)
    (local $high i32)
    (local $qbit i32)
    (local $incoming i32)
    (local.set $high (call $bl_get_bit (i32.const 536) (i32.sub (local.get $n) (i32.const 1))))
    (memory.fill (i32.add (i32.const 60000) (i32.const 544)) (i32.const 0) (i32.const 8))
    (block $done
      (loop $shift
        (br_if $done (i32.ge_u (local.get $j) (local.get $n)))
        (local.set $incoming
          (if
            (result i32)
            (i32.eqz (local.get $j))
            (then (local.get $bit))
            (else (call $bl_get_bit (i32.const 536) (i32.sub (local.get $j) (i32.const 1))))))
        (call $bl_emit_bit (i32.const 544) (local.get $j) (i32.const 6) (local.get $incoming))
        (local.set $j (i32.add (local.get $j) (i32.const 1)))
        (br $shift)))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.add (i32.const 60000) (i32.const 544))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 8))
      (i32.add (i32.const 60000) (local.get $b))
      (i32.const 8))
    (drop (call $bl_sub (local.get $n)))
    (local.set $qbit
      (call $bl_lut
        (i32.const 2)
        (call $bl_address2 (local.get $high) (call $bl_get_bit (i32.const 24) (i32.const 0)))))
    (if
      (local.get $qbit)
      (then
        (memory.copy
          (i32.add (i32.const 60000) (i32.const 536))
          (i32.add (i32.const 60000) (i32.const 16))
          (i32.const 8)))
      (else
        (memory.copy
          (i32.add (i32.const 60000) (i32.const 536))
          (i32.add (i32.const 60000) (i32.const 544))
          (i32.const 8))))
    (local.get $qbit))
  (func $dv_unsigned_core
    (param $n i32)
    (param $a i32)
    (param $b i32)
    (local $i i32)
    (local $qbit i32)
    (memory.fill (i32.add (i32.const 60000) (i32.const 528)) (i32.const 0) (i32.const 24))
    (local.set $i (local.get $n))
    (block $done
      (loop $digits
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $qbit
          (call $dv_remainder_digit
            (local.get $n)
            (local.get $b)
            (call $bl_get_bit (local.get $a) (local.get $i))))
        (call $bl_emit_bit (i32.const 528) (local.get $i) (i32.const 6) (local.get $qbit))
        (br $digits))))
  (func $dv_publish
    (param $n i32)
    (param $select_rem i32)
    (param $qvalid i32)
    (call $dv_emit_word (i32.const 256) (i32.const 528) (local.get $n))
    (call $dv_emit_word (i32.const 264) (i32.const 536) (local.get $n))
    (memory.fill (i32.add (i32.const 60000) (i32.const 280)) (i32.const 0) (i32.const 8))
    (call $bl_emit_bit (i32.const 280) (i32.const 0) (i32.const 6) (local.get $qvalid))
    (call $dv_emit_word
      (i32.const 16)
      (if (result i32) (local.get $select_rem) (then (i32.const 264)) (else (i32.const 256)))
      (local.get $n))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.add (i32.const 60000) (i32.const 512))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 8))
      (i32.add (i32.const 60000) (i32.const 520))
      (i32.const 8)))
  (func $dv_divide
    (param $n i32)
    (param $mode i32)
    (result i32)
    (local $status i32)
    (local $sa i32)
    (local $sb i32)
    (local $overflow i32)
    (local $qvalid i32)
    (local.set $status (call $bl_valid (local.get $n)))
    (if (local.get $status) (then (return (local.get $status))))
    (if (call $dv_word_zero (i32.const 8) (local.get $n)) (then (return (i32.const 4))))
    (if
      (i32.ge_u (local.get $mode) (i32.const 2))
      (then
        (local.set $overflow
          (call $bl_lut
            (i32.const 1)
            (call $bl_address2
              (call $dv_word_min (i32.const 0) (local.get $n))
              (call $dv_word_ones (i32.const 8) (local.get $n)))))
        (if
          (i32.and (i32.eq (local.get $mode) (i32.const 2)) (local.get $overflow))
          (then (return (i32.const 5))))))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 512))
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.const 16))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 552))
      (i32.add (i32.const 60000) (i32.const 512))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 560))
      (i32.add (i32.const 60000) (i32.const 520))
      (i32.const 8))
    (if
      (i32.ge_u (local.get $mode) (i32.const 2))
      (then
        (local.set $sa (call $bl_get_bit (i32.const 512) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $sb (call $bl_get_bit (i32.const 520) (i32.sub (local.get $n) (i32.const 1))))
        (if (local.get $sa) (then (call $dv_neg_word (i32.const 552) (local.get $n))))
        (if (local.get $sb) (then (call $dv_neg_word (i32.const 560) (local.get $n))))))
    (call $dv_unsigned_core (local.get $n) (i32.const 552) (i32.const 560))
    (if
      (i32.ge_u (local.get $mode) (i32.const 2))
      (then
        (if
          (call $bl_lut (i32.const 0) (call $bl_address2 (local.get $sa) (local.get $sb)))
          (then (call $dv_neg_word (i32.const 528) (local.get $n))))
        (if (local.get $sa) (then (call $dv_neg_word (i32.const 536) (local.get $n))))))
    (local.set $qvalid (call $bl_lut (i32.const 3) (local.get $overflow)))
    (if
      (local.get $overflow)
      (then (memory.fill (i32.add (i32.const 60000) (i32.const 528)) (i32.const 0) (i32.const 8))))
    (call $dv_publish (local.get $n) (i32.and (local.get $mode) (i32.const 1)) (local.get $qvalid))
    (i32.const 0))
  (func $dv_gcd
    (param $n i32)
    (result i32)
    (local $status i32)
    (local.set $status (call $bl_valid (local.get $n)))
    (if (local.get $status) (then (return (local.get $status))))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 512))
      (i32.add (i32.const 60000) (i32.const 0))
      (i32.const 16))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 568))
      (i32.add (i32.const 60000) (i32.const 512))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 576))
      (i32.add (i32.const 60000) (i32.const 520))
      (i32.const 8))
    (block $done
      (loop $euclid
        (br_if $done (call $dv_word_zero (i32.const 576) (local.get $n)))
        (call $dv_unsigned_core (local.get $n) (i32.const 568) (i32.const 576))
        (memory.copy
          (i32.add (i32.const 60000) (i32.const 568))
          (i32.add (i32.const 60000) (i32.const 576))
          (i32.const 8))
        (memory.copy
          (i32.add (i32.const 60000) (i32.const 576))
          (i32.add (i32.const 60000) (i32.const 536))
          (i32.const 8))
        (br $euclid)))
    (memory.copy
      (i32.add (i32.const 60000) (i32.const 528))
      (i32.add (i32.const 60000) (i32.const 568))
      (i32.const 8))
    (memory.fill (i32.add (i32.const 60000) (i32.const 536)) (i32.const 0) (i32.const 8))
    (call $dv_publish (local.get $n) (i32.const 0) (i32.const 1))
    (i32.const 0))
  (func $dv_udiv (param $n i32) (result i32) (call $dv_divide (local.get $n) (i32.const 0)))
  (func $dv_urem (param $n i32) (result i32) (call $dv_divide (local.get $n) (i32.const 1)))
  (func $dv_sdiv (param $n i32) (result i32) (call $dv_divide (local.get $n) (i32.const 2)))
  (func $dv_srem (param $n i32) (result i32) (call $dv_divide (local.get $n) (i32.const 3)))
  (func $wl_add
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_add (i32.const 32)))
    (i32.load (i32.const 60016)))
  (func $wl_sub
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_sub (i32.const 32)))
    (i32.load (i32.const 60016)))
  (func $wl_mul
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_mul (i32.const 32)))
    (i32.load (i32.const 60016)))
  (func $wl_and
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_and (i32.const 32)))
    (i32.load (i32.const 60016)))
  (func $wl_or
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_or (i32.const 32)))
    (i32.load (i32.const 60016)))
  (func $wl_xor
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_xor (i32.const 32)))
    (i32.load (i32.const 60016)))
  (func $wl_shl
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (i32.const 0))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_shl (i32.const 32) (local.get $b)))
    (i32.load (i32.const 60016)))
  (func $wl_shr_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (i32.const 0))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_shr_u (i32.const 32) (local.get $b)))
    (i32.load (i32.const 60016)))
  (func $wl_shr_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (i32.const 0))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_shr_s (i32.const 32) (local.get $b)))
    (i32.load (i32.const 60016)))
  (func $wl_rotl
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (i32.const 0))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_rotl (i32.const 32) (local.get $b)))
    (i32.load (i32.const 60016)))
  (func $wl_equal
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_eq (i32.const 32)))
    (i32.load (i32.const 60016)))
  (func $wl_less_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_ltu (i32.const 32)))
    (i32.load (i32.const 60016)))
  (func $wl_less_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (drop (call $bl_lts (i32.const 32)))
    (i32.load (i32.const 60016)))
  (func $wl_eq (param $a i32) (param $b i32) (result i32) (call $wl_equal (local.get $a) (local.get $b)))
  (func $wl_ne
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $wl_xor (call $wl_equal (local.get $a) (local.get $b)) (i32.const 1)))
  (func $wl_lt_u (param $a i32) (param $b i32) (result i32) (call $wl_less_u (local.get $a) (local.get $b)))
  (func $wl_lt_s (param $a i32) (param $b i32) (result i32) (call $wl_less_s (local.get $a) (local.get $b)))
  (func $wl_gt_u (param $a i32) (param $b i32) (result i32) (call $wl_less_u (local.get $b) (local.get $a)))
  (func $wl_gt_s (param $a i32) (param $b i32) (result i32) (call $wl_less_s (local.get $b) (local.get $a)))
  (func $wl_le_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $wl_xor (call $wl_less_u (local.get $b) (local.get $a)) (i32.const 1)))
  (func $wl_le_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $wl_xor (call $wl_less_s (local.get $b) (local.get $a)) (i32.const 1)))
  (func $wl_ge_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $wl_xor (call $wl_less_u (local.get $a) (local.get $b)) (i32.const 1)))
  (func $wl_ge_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $wl_xor (call $wl_less_s (local.get $a) (local.get $b)) (i32.const 1)))
  (func $wl_eqz (param $a i32) (result i32) (call $wl_equal (local.get $a) (i32.const 0)))
  (func $wl_div_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (if (call $dv_udiv (i32.const 32)) (then (unreachable)))
    (i32.load (i32.const 60016)))
  (func $wl_div_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (if (call $dv_sdiv (i32.const 32)) (then (unreachable)))
    (i32.load (i32.const 60016)))
  (func $wl_rem_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (if (call $dv_urem (i32.const 32)) (then (unreachable)))
    (i32.load (i32.const 60016)))
  (func $wl_rem_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (if (call $dv_srem (i32.const 32)) (then (unreachable)))
    (i32.load (i32.const 60016)))
  (func $wl64_add
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (drop (call $bl_add (i32.const 64)))
    (i64.load (i32.const 60016)))
  (func $wl64_sub
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (drop (call $bl_sub (i32.const 64)))
    (i64.load (i32.const 60016)))
  (func $wl64_mul
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (drop (call $bl_mul (i32.const 64)))
    (i64.load (i32.const 60016)))
  (func $wl64_and
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (drop (call $bl_and (i32.const 64)))
    (i64.load (i32.const 60016)))
  (func $wl64_or
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (drop (call $bl_or (i32.const 64)))
    (i64.load (i32.const 60016)))
  (func $wl64_xor
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (drop (call $bl_xor (i32.const 64)))
    (i64.load (i32.const 60016)))
  (func $wl64_shl
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (i64.const 0))
    (i64.store (i32.const 60192) (local.get $b))
    (drop (call $bl_shl (i32.const 64) (i32.load (i32.const 60192))))
    (i64.load (i32.const 60016)))
  (func $wl64_shr_u
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (i64.const 0))
    (i64.store (i32.const 60192) (local.get $b))
    (drop (call $bl_shr_u (i32.const 64) (i32.load (i32.const 60192))))
    (i64.load (i32.const 60016)))
  (func $wl64_shr_s
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (i64.const 0))
    (i64.store (i32.const 60192) (local.get $b))
    (drop (call $bl_shr_s (i32.const 64) (i32.load (i32.const 60192))))
    (i64.load (i32.const 60016)))
  (func $wl64_rotl
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (i64.const 0))
    (i64.store (i32.const 60192) (local.get $b))
    (drop (call $bl_rotl (i32.const 64) (i32.load (i32.const 60192))))
    (i64.load (i32.const 60016)))
  (func $wl64_equal
    (param $a i64)
    (param $b i64)
    (result i32)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (drop (call $bl_eq (i32.const 64)))
    (i32.load (i32.const 60016)))
  (func $wl64_less_u
    (param $a i64)
    (param $b i64)
    (result i32)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (drop (call $bl_ltu (i32.const 64)))
    (i32.load (i32.const 60016)))
  (func $wl64_less_s
    (param $a i64)
    (param $b i64)
    (result i32)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (drop (call $bl_lts (i32.const 64)))
    (i32.load (i32.const 60016)))
  (func $wl64_eq (param $a i64) (param $b i64) (result i32) (call $wl64_equal (local.get $a) (local.get $b)))
  (func $wl64_ne
    (param $a i64)
    (param $b i64)
    (result i32)
    (call $wl_xor (call $wl64_equal (local.get $a) (local.get $b)) (i32.const 1)))
  (func $wl64_lt_u
    (param $a i64)
    (param $b i64)
    (result i32)
    (call $wl64_less_u (local.get $a) (local.get $b)))
  (func $wl64_lt_s
    (param $a i64)
    (param $b i64)
    (result i32)
    (call $wl64_less_s (local.get $a) (local.get $b)))
  (func $wl64_gt_u
    (param $a i64)
    (param $b i64)
    (result i32)
    (call $wl64_less_u (local.get $b) (local.get $a)))
  (func $wl64_gt_s
    (param $a i64)
    (param $b i64)
    (result i32)
    (call $wl64_less_s (local.get $b) (local.get $a)))
  (func $wl64_le_u
    (param $a i64)
    (param $b i64)
    (result i32)
    (call $wl_xor (call $wl64_less_u (local.get $b) (local.get $a)) (i32.const 1)))
  (func $wl64_le_s
    (param $a i64)
    (param $b i64)
    (result i32)
    (call $wl_xor (call $wl64_less_s (local.get $b) (local.get $a)) (i32.const 1)))
  (func $wl64_ge_u
    (param $a i64)
    (param $b i64)
    (result i32)
    (call $wl_xor (call $wl64_less_u (local.get $a) (local.get $b)) (i32.const 1)))
  (func $wl64_ge_s
    (param $a i64)
    (param $b i64)
    (result i32)
    (call $wl_xor (call $wl64_less_s (local.get $a) (local.get $b)) (i32.const 1)))
  (func $wl64_eqz (param $a i64) (result i32) (call $wl64_equal (local.get $a) (i64.const 0)))
  (func $wl64_div_u
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (if (call $dv_udiv (i32.const 64)) (then (unreachable)))
    (i64.load (i32.const 60016)))
  (func $wl64_div_s
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (if (call $dv_sdiv (i32.const 64)) (then (unreachable)))
    (i64.load (i32.const 60016)))
  (func $wl64_rem_u
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (if (call $dv_urem (i32.const 64)) (then (unreachable)))
    (i64.load (i32.const 60016)))
  (func $wl64_rem_s
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 60000) (local.get $a))
    (i64.store (i32.const 60008) (local.get $b))
    (if (call $dv_srem (i32.const 64)) (then (unreachable)))
    (i64.load (i32.const 60016)))
  (func $guard_data (if (i32.eqz (call $bl_code_valid)) (then (unreachable))))
  (func $wl_extend_s
    (param $a i32)
    (result i64)
    (local $high i32)
    (local.set $high (call $wl_sub (i32.const 0) (i32.shr_u (local.get $a) (i32.const 31))))
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (local.get $high))
    (i64.load (i32.const 60000)))
  (func $wl_extend_u
    (param $a i32)
    (result i64)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i64.load (i32.const 60000)))
  (func $wl_wrap
    (param $a i64)
    (result i32)
    (i64.store (i32.const 60000) (local.get $a))
    (i32.load (i32.const 60000)))
  (func $bootstrap (call $bl_init) (call $reset))
  (start $bootstrap)
  (func (export "lut_code_valid") (result i32) (call $bl_code_valid))
  (func (export "lut_workspace_offset") (result i32) (i32.const 60000)))
