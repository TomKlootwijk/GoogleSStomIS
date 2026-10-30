;; Source-data-complete bit-LUT lowering of original finite TOMK.
;; Native control/index/address/packing remains explicit, not a whole one-bitCPU proof.
(module
  (memory (export "memory") 8 8)
  (func $get
    (param $i i32)
    (result i32)
    (i32.load (i32.add (i32.const 320) (i32.shl (local.get $i) (i32.const 2)))))
  (func $set
    (param $i i32)
    (param $v i32)
    (i32.store (i32.add (i32.const 320) (i32.shl (local.get $i) (i32.const 2))) (local.get $v)))
  (func $result (param $v i32) (result i32) (i32.store (i32.const 4) (local.get $v)) (local.get $v))
  (func $mix
    (param $x i32)
    (result i32)
    (memory.fill (i32.const 220000) (i32.const 0) (i32.const 16))
    (i32.store (i32.const 220000) (local.get $x))
    (drop (call $bl_tomk_mix32))
    (i32.load (i32.const 220016)))
  (func $hi
    (export "key_hi")
    (param $rho i32)
    (param $theta i32)
    (param $tick i32)
    (param $phi i32)
    (result i32)
    (call $guard_data)
    (call $wl_or
      (call $wl_shl (call $wl_and (local.get $rho) (i32.const 1048575)) (i32.const 12))
      (call $wl_shr_u (call $wl_and (local.get $theta) (i32.const 262143)) (i32.const 6))))
  (func $lo
    (export "key_lo")
    (param $rho i32)
    (param $theta i32)
    (param $tick i32)
    (param $phi i32)
    (result i32)
    (call $guard_data)
    (call $wl_or
      (call $wl_or
        (call $wl_shl (call $wl_and (local.get $theta) (i32.const 63)) (i32.const 26))
        (call $wl_shl (call $wl_and (local.get $tick) (i32.const 16383)) (i32.const 12)))
      (call $wl_and (local.get $phi) (i32.const 4095))))
  (func $less
    (param $ah i32)
    (param $al i32)
    (param $bh i32)
    (param $bl i32)
    (result i32)
    (call $wl_or
      (call $wl_lt_u (local.get $ah) (local.get $bh))
      (call $wl_and
        (call $wl_eq (local.get $ah) (local.get $bh))
        (call $wl_lt_u (local.get $al) (local.get $bl)))))
  (func $abs64
    (param $x i64)
    (result i64)
    (if
      (result i64)
      (call $wl64_lt_s (local.get $x) (i64.const 0))
      (then (call $wl64_sub (i64.const 0) (local.get $x)))
      (else (local.get $x))))
  (func $max64
    (param $a i64)
    (param $b i64)
    (result i64)
    (if
      (result i64)
      (call $wl64_gt_s (local.get $a) (local.get $b))
      (then (local.get $a))
      (else (local.get $b))))
  (func $delta
    (param $x i32)
    (param $center i32)
    (param $mask i32)
    (param $half i32)
    (result i32)
    (local $d i32)
    (local.set $d (call $wl_and (call $wl_sub (local.get $x) (local.get $center)) (local.get $mask)))
    (if
      (result i32)
      (call $wl_ge_u (local.get $d) (local.get $half))
      (then (call $wl_sub (local.get $d) (call $wl_add (local.get $mask) (i32.const 1))))
      (else (local.get $d))))
  (func $normalize
    (call $set (i32.const 1) (call $wl_and (call $get (i32.const 1)) (i32.const 262143)))
    (call $set (i32.const 2) (call $wl_and (call $get (i32.const 2)) (i32.const 16383)))
    (call $set (i32.const 3) (call $wl_and (call $get (i32.const 3)) (i32.const 4095)))
    (call $set (i32.const 8) (call $wl_and (call $get (i32.const 8)) (i32.const 1)))
    (call $set (i32.const 10) (call $wl_and (call $get (i32.const 10)) (i32.const 1))))
  (func $validate
    (param $base i32)
    (param $length i32)
    (result i32)
    (local $count i32)
    (local $i i32)
    (local $p i32)
    (local $ph i32)
    (local $pl i32)
    (local $h i32)
    (local $l i32)
    (if (i32.gt_u (local.get $length) (i32.const 196736)) (then (return (i32.const 4))))
    (if (i32.lt_u (local.get $length) (i32.const 128)) (then (return (i32.const 3))))
    (if
      (i32.or
        (i32.ne (i32.load (local.get $base)) (i32.const 0x414d4f54))
        (i32.ne (i32.load offset=4 (local.get $base)) (i32.const 0x00314947)))
      (then (return (i32.const 3))))
    (if (i32.ne (i32.load offset=8 (local.get $base)) (i32.const 0x00010000)) (then (return (i32.const 3))))
    (if
      (i32.or
        (i32.ne (i32.load offset=32 (local.get $base)) (i32.const 48))
        (i32.ne (i32.load offset=36 (local.get $base)) (i32.const 64)))
      (then (return (i32.const 3))))
    (local.set $count (i32.load offset=16 (local.get $base)))
    (if (i32.eqz (local.get $count)) (then (return (i32.const 3))))
    (if (i32.gt_u (local.get $count) (i32.const 4096)) (then (return (i32.const 4))))
    (if
      (i32.ne (local.get $length) (i32.add (i32.const 128) (i32.mul (local.get $count) (i32.const 48))))
      (then (return (i32.const 3))))
    (if (i32.ge_u (i32.load offset=20 (local.get $base)) (local.get $count)) (then (return (i32.const 3))))
    (local.set $i (i32.const 0))
    (block $reserved_done
      (loop $reserved
        (br_if $reserved_done (i32.ge_u (local.get $i) (i32.const 6)))
        (if
          (i32.load
            (i32.add (local.get $base) (i32.add (i32.const 40) (i32.shl (local.get $i) (i32.const 2)))))
          (then (return (i32.const 3))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $reserved)))
    (local.set $i (i32.const 0))
    (block $cells_done
      (loop $cells
        (br_if $cells_done (i32.ge_u (local.get $i) (local.get $count)))
        (local.set $p
          (i32.add (local.get $base) (i32.add (i32.const 128) (i32.mul (local.get $i) (i32.const 48)))))
        (local.set $h (i32.load (local.get $p)))
        (local.set $l (i32.load offset=4 (local.get $p)))
        (if
          (i32.and
            (i32.ne (local.get $i) (i32.const 0))
            (i32.eqz (call $less (local.get $ph) (local.get $pl) (local.get $h) (local.get $l))))
          (then (return (i32.const 3))))
        (if (i32.gt_u (i32.load offset=8 (local.get $p)) (i32.const 15)) (then (return (i32.const 3))))
        (if
          (i32.or
            (i32.ge_u (i32.load offset=32 (local.get $p)) (local.get $count))
            (i32.ge_u (i32.load offset=36 (local.get $p)) (local.get $count)))
          (then (return (i32.const 3))))
        (local.set $ph (local.get $h))
        (local.set $pl (local.get $l))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $cells)))
    (i32.const 0))
  (func $find
    (param $h i32)
    (param $l i32)
    (result i32)
    (local $left i32)
    (local $right i32)
    (local $mid i32)
    (local $p i32)
    (local.set $right (i32.load (i32.const 262160)))
    (block $done
      (loop $search
        (br_if $done (i32.ge_u (local.get $left) (local.get $right)))
        (local.set $mid (i32.shr_u (i32.add (local.get $left) (local.get $right)) (i32.const 1)))
        (local.set $p (i32.add (i32.const 262272) (i32.mul (local.get $mid) (i32.const 48))))
        (if
          (call $less
            (i32.load (local.get $p))
            (i32.load offset=4 (local.get $p))
            (local.get $h)
            (local.get $l))
          (then (local.set $left (i32.add (local.get $mid) (i32.const 1))))
          (else (local.set $right (local.get $mid))))
        (br $search)))
    (if
      (i32.lt_u (local.get $left) (i32.load (i32.const 262160)))
      (then
        (local.set $p (i32.add (i32.const 262272) (i32.mul (local.get $left) (i32.const 48))))
        (if
          (call $wl_and
            (call $wl_eq (i32.load (local.get $p)) (local.get $h))
            (call $wl_eq (i32.load offset=4 (local.get $p)) (local.get $l)))
          (then (return (local.get $left))))))
    (i32.const -1))
  (func $reset
    (export "reset")
    (result i32)
    (local $v i32)
    (if (i32.eqz (i32.load (i32.const 0))) (then (return (call $result (i32.const 2)))))
    (if (i32.eqz (call $bl_code_valid)) (then (return (call $result (i32.const 9)))))
    (local.set $v (call $validate (i32.const 262144) (i32.load (i32.const 0))))
    (if (local.get $v) (then (return (call $result (i32.const 7)))))
    (memory.copy (i32.const 256) (i32.const 262208) (i32.const 64))
    (i32.store (i32.const 300) (i32.load (i32.const 262164)))
    (memory.fill (i32.const 8) (i32.const 0) (i32.const 56))
    (memory.copy (i32.const 320) (i32.const 256) (i32.const 64))
    (call $result (i32.const 0)))
  (func
    (export "load")
    (param $length i32)
    (result i32)
    (local $v i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (call $result (i32.const 9)))))
    (local.set $v (call $validate (i32.const 4096) (local.get $length)))
    (if (local.get $v) (then (return (call $result (local.get $v)))))
    (memory.copy (i32.const 262144) (i32.const 4096) (local.get $length))
    (i32.store (i32.const 0) (local.get $length))
    (call $reset))
  (func $step
    (export "step")
    (result i32)
    (local $v i32)
    (local $index i32)
    (local $p i32)
    (local $op i32)
    (local $flags i32)
    (local $a0 i32)
    (local $a1 i32)
    (local $a2 i32)
    (local $a3 i32)
    (local $next0 i32)
    (local $next1 i32)
    (local $payload i32)
    (local $aux i32)
    (local $kh i32)
    (local $kl i32)
    (local $bit i32)
    (local $x i32)
    (local $shift i32)
    (local $raw i64)
    (local $wraps i64)
    (local $r i64)
    (local $angular i64)
    (if (i32.eqz (i32.load (i32.const 0))) (then (return (call $result (i32.const 2)))))
    (if (i32.and (i32.load (i32.const 316)) (i32.const 1)) (then (return (call $result (i32.const 1)))))
    (if (i32.eqz (call $bl_code_valid)) (then (return (call $result (i32.const 9)))))
    (local.set $v (call $validate (i32.const 262144) (i32.load (i32.const 0))))
    (if (local.get $v) (then (return (call $result (i32.const 7)))))
    (local.set $index (i32.load (i32.const 300)))
    (if
      (call $wl_ge_u (local.get $index) (i32.load (i32.const 262160)))
      (then (return (call $result (i32.const 5)))))
    (local.set $p (call $wl_add (i32.const 262272) (call $wl_mul (local.get $index) (i32.const 48))))
    (local.set $op (i32.load offset=8 (local.get $p)))
    (local.set $flags (i32.load offset=12 (local.get $p)))
    (local.set $a0 (i32.load offset=16 (local.get $p)))
    (local.set $a1 (i32.load offset=20 (local.get $p)))
    (local.set $a2 (i32.load offset=24 (local.get $p)))
    (local.set $a3 (i32.load offset=28 (local.get $p)))
    (local.set $next0 (i32.load offset=32 (local.get $p)))
    (local.set $next1 (i32.load offset=36 (local.get $p)))
    (local.set $payload (i32.load offset=40 (local.get $p)))
    (local.set $aux (i32.load offset=44 (local.get $p)))
    (if
      (call $wl_and
        (call $wl_eq (local.get $op) (i32.const 10))
        (call $wl_or
          (call $wl_lt_s (local.get $a0) (i32.const 0))
          (call $wl_ge_s (local.get $a0) (i32.const 64))))
      (then (return (call $result (i32.const 6)))))
    (memory.copy (i32.const 320) (i32.const 256) (i32.const 64))
    (local.set $kh
      (call $hi
        (call $get (i32.const 0))
        (call $get (i32.const 1))
        (call $get (i32.const 2))
        (call $get (i32.const 3))))
    (local.set $kl
      (call $lo
        (call $get (i32.const 0))
        (call $get (i32.const 1))
        (call $get (i32.const 2))
        (call $get (i32.const 3))))
    (if
      (call $wl_eq (local.get $op) (i32.const 1))
      (then (call $set (call $wl_and (local.get $flags) (i32.const 15)) (local.get $a0))))
    (if
      (call $wl_eq (local.get $op) (i32.const 2))
      (then
        (local.set $x
          (call $mix
            (call $wl_xor
              (call $wl_xor
                (call $wl_xor
                  (call $wl_xor (i32.load (i32.const 262168)) (local.get $kh))
                  (call $wl_rotl (local.get $kl) (i32.const 13)))
                (call $get (i32.const 2)))
              (local.get $aux))))
        (local.set $bit (call $wl_and (call $wl_popcnt (local.get $x)) (i32.const 1)))
        (call $set (i32.const 10) (local.get $bit))
        (local.set $x (call $wl_and (local.get $flags) (i32.const 15)))
        (call $set
          (local.get $x)
          (call $wl_add
            (call $get (local.get $x))
            (if
              (result i32)
              (local.get $bit)
              (then (local.get $a0))
              (else (call $wl_sub (i32.const 0) (local.get $a0))))))))
    (if
      (call $wl_eq (local.get $op) (i32.const 3))
      (then
        (call $set (i32.const 4) (call $wl_add (call $get (i32.const 4)) (local.get $a0)))
        (call $set (i32.const 5) (call $wl_add (call $get (i32.const 5)) (local.get $a1)))
        (call $set (i32.const 6) (call $wl_add (call $get (i32.const 6)) (local.get $a2)))
        (call $set (i32.const 7) (call $wl_add (call $get (i32.const 7)) (local.get $a3)))
        (call $set (i32.const 0) (call $wl_add (call $get (i32.const 0)) (call $get (i32.const 4))))
        (call $set (i32.const 1) (call $wl_add (call $get (i32.const 1)) (call $get (i32.const 5))))
        (call $set (i32.const 2) (call $wl_add (call $get (i32.const 2)) (call $get (i32.const 6))))
        (call $set (i32.const 3) (call $wl_add (call $get (i32.const 3)) (call $get (i32.const 7))))))
    (if
      (call $wl_eq (local.get $op) (i32.const 4))
      (then
        (local.set $raw
          (call $wl64_add (call $wl_extend_s (call $get (i32.const 3))) (call $wl_extend_s (local.get $a0))))
        (local.set $wraps (call $wl64_shr_s (local.get $raw) (i64.const 12)))
        (call $set (i32.const 3) (call $wl_wrap (call $wl64_and (local.get $raw) (i64.const 4095))))
        (if
          (call $wl_and
            (call $wl_and (call $wl_wrap (local.get $wraps)) (i32.const 1))
            (call $wl_ne (call $wl_and (local.get $flags) (i32.const 16)) (i32.const 0)))
          (then (call $set (i32.const 8) (call $wl_xor (call $get (i32.const 8)) (i32.const 1)))))
        (call $set
          (i32.const 15)
          (if
            (result i32)
            (call $wl64_ne (local.get $wraps) (i64.const 0))
            (then (call $wl_or (call $get (i32.const 15)) (i32.const 128)))
            (else (call $wl_and (call $get (i32.const 15)) (i32.const -129)))))
        (call $set
          (i32.const 10)
          (if
            (result i32)
            (call $wl_and (local.get $flags) (i32.const 32))
            (then (call $wl_and (call $wl_shr_u (call $get (i32.const 3)) (i32.const 11)) (i32.const 1)))
            (else (call $wl_and (call $wl_wrap (local.get $wraps)) (i32.const 1)))))))
    (if
      (call $wl_eq (local.get $op) (i32.const 5))
      (then
        (local.set $raw
          (call $wl64_add (call $wl_extend_s (call $get (i32.const 2))) (call $wl_extend_s (local.get $a0))))
        (local.set $wraps (call $wl64_shr_s (local.get $raw) (i64.const 14)))
        (call $set (i32.const 2) (call $wl_wrap (call $wl64_and (local.get $raw) (i64.const 16383))))
        (call $set (i32.const 10) (call $wl_and (call $wl_wrap (local.get $wraps)) (i32.const 1)))
        (if
          (call $wl64_ne (local.get $wraps) (i64.const 0))
          (then
            (call $set
              (i32.const 12)
              (call $mix
                (call $wl_xor
                  (call $wl_xor (call $get (i32.const 12)) (call $wl_wrap (local.get $wraps)))
                  (local.get $aux))))))))
    (if
      (call $wl_eq (local.get $op) (i32.const 6))
      (then
        (call $set (i32.const 14) (i32.const 0))
        (call $set (i32.const 15) (call $wl_or (call $get (i32.const 15)) (i32.const 2)))
        (call $set (i32.const 10) (i32.const 1))))
    (if
      (call $wl_eq (local.get $op) (i32.const 7))
      (then
        (local.set $x (call $wl_and (call $get (i32.const 0)) (i32.const 1048575)))
        (local.set $r
          (call $max64
            (call $wl64_sub (call $wl_extend_s (local.get $a0)) (call $wl_extend_u (local.get $x)))
            (call $wl64_sub (call $wl_extend_u (local.get $x)) (call $wl_extend_s (local.get $a1)))))
        (local.set $angular
          (call $wl64_sub
            (call $abs64
              (call $wl_extend_s
                (call $delta
                  (call $wl_and (call $get (i32.const 1)) (i32.const 262143))
                  (call $wl_and (local.get $a2) (i32.const 262143))
                  (i32.const 262143)
                  (i32.const 131072))))
            (call $abs64 (call $wl_extend_s (local.get $a3)))))
        (call $set (i32.const 14) (call $wl_wrap (call $max64 (local.get $r) (local.get $angular))))
        (local.set $bit (call $wl_le_s (call $get (i32.const 14)) (i32.const 0)))
        (call $set (i32.const 10) (local.get $bit))
        (call $set
          (i32.const 15)
          (if
            (result i32)
            (local.get $bit)
            (then (call $wl_or (call $get (i32.const 15)) (i32.const 16)))
            (else (call $wl_and (call $get (i32.const 15)) (i32.const -17)))))))
    (if
      (call $wl_eq (local.get $op) (i32.const 8))
      (then
        (local.set $r
          (call $wl64_sub
            (call $abs64
              (call $wl64_sub
                (call $wl_extend_u (call $wl_and (call $get (i32.const 0)) (i32.const 1048575)))
                (call $wl_extend_s (local.get $a0))))
            (call $abs64 (call $wl_extend_s (local.get $a1)))))
        (if
          (call $wl_ge_s (local.get $a3) (i32.const 0))
          (then
            (local.set $angular
              (call $wl64_sub
                (call $abs64
                  (call $wl_extend_s
                    (call $delta
                      (call $wl_and (call $get (i32.const 3)) (i32.const 4095))
                      (call $wl_and (local.get $a2) (i32.const 4095))
                      (i32.const 4095)
                      (i32.const 2048))))
                (call $abs64 (call $wl_extend_s (local.get $a3)))))
            (local.set $r (call $max64 (local.get $r) (local.get $angular)))))
        (call $set (i32.const 14) (call $wl_wrap (local.get $r)))
        (local.set $bit (call $wl_le_s (call $get (i32.const 14)) (i32.const 0)))
        (call $set (i32.const 10) (local.get $bit))
        (call $set
          (i32.const 15)
          (if
            (result i32)
            (local.get $bit)
            (then (call $wl_or (call $get (i32.const 15)) (i32.const 32)))
            (else (call $wl_and (call $get (i32.const 15)) (i32.const -33)))))))
    (if
      (call $wl_eq (local.get $op) (i32.const 9))
      (then
        (local.set $bit
          (call $wl_and (call $wl_shr_s (call $get (i32.const 0)) (i32.const 20)) (i32.const 1)))
        (call $set (i32.const 0) (call $wl_and (call $get (i32.const 0)) (i32.const 1048575)))
        (if
          (local.get $bit)
          (then
            (call $set
              (i32.const 1)
              (if
                (result i32)
                (call $wl_and (local.get $flags) (i32.const 1))
                (then (call $wl_add (call $get (i32.const 1)) (i32.const 131072)))
                (else (call $wl_sub (i32.const 131072) (call $get (i32.const 1))))))
            (call $set (i32.const 3) (call $wl_sub (i32.const 0) (call $get (i32.const 3))))
            (call $set (i32.const 8) (call $wl_xor (call $get (i32.const 8)) (i32.const 1)))
            (if
              (call $wl_and (local.get $flags) (i32.const 2))
              (then (call $set (i32.const 9) (call $wl_xor (call $get (i32.const 9)) (i32.const 1)))))
            (call $set (i32.const 15) (call $wl_or (call $get (i32.const 15)) (i32.const 4))))
          (else (call $set (i32.const 15) (call $wl_and (call $get (i32.const 15)) (i32.const -5)))))
        (call $set (i32.const 10) (local.get $bit))
        (call $normalize)))
    (if
      (call $wl_eq (local.get $op) (i32.const 10))
      (then
        (call $set
          (i32.const 10)
          (call $wl_and
            (if
              (result i32)
              (call $wl_lt_u (local.get $a0) (i32.const 32))
              (then (call $wl_shr_u (local.get $kl) (local.get $a0)))
              (else (call $wl_shr_u (local.get $kh) (call $wl_sub (local.get $a0) (i32.const 32)))))
            (i32.const 1)))))
    (if
      (call $wl_and
        (call $wl_eq (local.get $op) (i32.const 11))
        (call $wl_and (call $get (i32.const 10)) (i32.const 1)))
      (then
        (call $set (i32.const 0) (call $wl_add (call $get (i32.const 0)) (local.get $a0)))
        (call $set (i32.const 1) (call $wl_add (call $get (i32.const 1)) (local.get $a1)))
        (call $set (i32.const 2) (call $wl_add (call $get (i32.const 2)) (local.get $a2)))
        (call $set (i32.const 3) (call $wl_add (call $get (i32.const 3)) (local.get $a3)))
        (if
          (call $wl_and (local.get $flags) (i32.const 1))
          (then (call $set (i32.const 8) (call $wl_xor (call $get (i32.const 8)) (i32.const 1)))))
        (if
          (call $wl_and (local.get $flags) (i32.const 2))
          (then (call $set (i32.const 9) (call $wl_xor (call $get (i32.const 9)) (i32.const 1)))))
        (call $normalize)))
    (if
      (call $wl_eq (local.get $op) (i32.const 12))
      (then
        (local.set $shift
          (if
            (result i32)
            (call $wl_lt_s (local.get $a1) (i32.const 0))
            (then (i32.const 0))
            (else
              (if
                (result i32)
                (call $wl_gt_s (local.get $a1) (i32.const 30))
                (then (i32.const 30))
                (else (local.get $a1))))))
        (local.set $x (local.get $a0))
        (if
          (call $wl_and (call $get (i32.const 8)) (i32.const 1))
          (then (local.set $x (call $wl_sub (i32.const 0) (local.get $x)))))
        (if
          (call $wl_eqz (call $wl_and (call $get (i32.const 10)) (i32.const 1)))
          (then (local.set $x (call $wl_sub (i32.const 0) (local.get $x)))))
        (call $set
          (i32.const 3)
          (call $wl_and (call $wl_add (call $get (i32.const 3)) (local.get $x)) (i32.const 4095)))
        (local.set $x (call $wl_shl (i32.const 1) (local.get $shift)))
        (call $set (i32.const 4) (call $wl_div_pow2 (call $get (i32.const 4)) (local.get $x)))
        (call $set (i32.const 5) (call $wl_div_pow2 (call $get (i32.const 5)) (local.get $x)))
        (call $set (i32.const 6) (call $wl_div_pow2 (call $get (i32.const 6)) (local.get $x)))
        (call $set (i32.const 7) (call $wl_div_pow2 (call $get (i32.const 7)) (local.get $x)))))
    (if (call $wl_eq (local.get $op) (i32.const 13)) (then (call $set (i32.const 13) (local.get $payload))))
    (if
      (call $wl_eq (local.get $op) (i32.const 14))
      (then
        (call $set (i32.const 13) (local.get $payload))
        (call $set (i32.const 15) (call $wl_or (call $get (i32.const 15)) (i32.const 8)))
        (if
          (call $wl_and (local.get $flags) (i32.const 1))
          (then (call $set (i32.const 15) (call $wl_or (call $get (i32.const 15)) (i32.const 1)))))))
    (if
      (call $wl_eq (local.get $op) (i32.const 15))
      (then (call $set (i32.const 15) (call $wl_or (call $get (i32.const 15)) (i32.const 1)))))
    (call $normalize)
    (call $set
      (i32.const 12)
      (call $mix
        (call $wl_xor
          (call $wl_xor
            (call $wl_xor
              (call $wl_xor
                (call $wl_xor (call $wl_xor (call $get (i32.const 12)) (local.get $payload)) (local.get $aux))
                (local.get $kh))
              (call $wl_rotl (local.get $kl) (i32.const 7)))
            (call $get (i32.const 10)))
          (local.get $index))))
    (if
      (call $wl_eqz (call $wl_and (call $get (i32.const 15)) (i32.const 1)))
      (then
        (if
          (call $wl_and (local.get $flags) (i32.const 0x80000000))
          (then
            (local.set $x
              (call $find
                (call $hi
                  (call $get (i32.const 0))
                  (call $get (i32.const 1))
                  (call $get (i32.const 2))
                  (call $get (i32.const 3)))
                (call $lo
                  (call $get (i32.const 0))
                  (call $get (i32.const 1))
                  (call $get (i32.const 2))
                  (call $get (i32.const 3)))))
            (if
              (call $wl_ge_s (local.get $x) (i32.const 0))
              (then
                (call $set (i32.const 15) (call $wl_and (call $get (i32.const 15)) (i32.const -65)))
                (call $set (i32.const 11) (local.get $x)))
              (else
                (call $set (i32.const 15) (call $wl_or (call $get (i32.const 15)) (i32.const 64)))
                (call $set
                  (i32.const 11)
                  (if
                    (result i32)
                    (call $get (i32.const 10))
                    (then (local.get $next1))
                    (else (local.get $next0)))))))
          (else
            (call $set
              (i32.const 11)
              (if (result i32) (call $get (i32.const 10)) (then (local.get $next1)) (else (local.get $next0))))))))
    (i32.store (i32.const 16) (local.get $index))
    (i32.store (i32.const 20) (local.get $op))
    (i32.store (i32.const 24) (local.get $kh))
    (i32.store (i32.const 28) (local.get $kl))
    (i32.store (i32.const 8) (call $wl_add (i32.load (i32.const 8)) (i32.const 1)))
    (memory.copy (i32.const 256) (i32.const 320) (i32.const 64))
    (call $result (i32.const 0)))
  (func
    (export "run")
    (param $ticks i32)
    (result i32)
    (local $i i32)
    (local $v i32)
    (if (i32.gt_u (local.get $ticks) (i32.const 65536)) (then (return (call $result (i32.const 8)))))
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (local.get $ticks)))
        (local.set $v (call $step))
        (if (local.get $v) (then (return (local.get $v))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (call $result (i32.const 0)))
  (func
    (export "find_key")
    (param $h i32)
    (param $l i32)
    (result i32)
    (if (i32.eqz (i32.load (i32.const 0))) (then (return (i32.const -2))))
    (call $guard_data)
    (if (call $validate (i32.const 262144) (i32.load (i32.const 0))) (then (return (i32.const -2))))
    (call $find (local.get $h) (local.get $l)))
  (func (export "abi_version") (result i32) (i32.const 0x00010000))
  (func (export "upload_offset") (result i32) (i32.const 4096))
  (func (export "program_offset") (result i32) (i32.const 262144))
  (func (export "state_offset") (result i32) (i32.const 256))
  (func (export "candidate_offset") (result i32) (i32.const 320))
  (func (export "control_offset") (result i32) (i32.const 0))
  (func (export "max_cells") (result i32) (i32.const 4096))
  (func $bl_code_valid
    (result i32)
    (local $bad i32)
    (local.set $bad (i32.ne (i32.load (i32.add (i32.const 220000) (i32.const 136))) (i32.const 0x424c4131)))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 220000) (i32.const 128))) (i32.const 6))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 220000) (i32.const 129))) (i32.const 8))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 220000) (i32.const 130))) (i32.const 14))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 220000) (i32.const 131))) (i32.const 1))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 220000) (i32.const 132))) (i32.const 150))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 220000) (i32.const 133))) (i32.const 232))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 220000) (i32.const 134))) (i32.const 2))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 220000) (i32.const 135))) (i32.const 9))))
    (i32.eqz (local.get $bad)))
  (func $bl_lut
    (param $table i32)
    (param $address i32)
    (result i32)
    (i32.and
      (i32.shr_u
        (i32.load8_u (i32.add (i32.const 220000) (i32.add (i32.const 128) (local.get $table))))
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
          (i32.add (i32.const 220000) (i32.add (local.get $base) (i32.shr_u (local.get $i) (i32.const 3)))))
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
      (i32.add (i32.const 220000) (local.get $byte))
      (i32.or
        (i32.and
          (i32.load8_u (i32.add (i32.const 220000) (local.get $byte)))
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
    (memory.fill (i32.add (i32.const 220000) (i32.const 16)) (i32.const 0) (i32.const 16))
    (memory.fill (i32.add (i32.const 220000) (i32.const 64)) (i32.const 0) (i32.const 8)))
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
    (i32.store8 (i32.add (i32.const 220000) (i32.const 25)) (i32.const 1))
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
      (i32.add (i32.const 220000) (i32.const 80))
      (i32.add (i32.const 220000) (i32.const 0))
      (i32.const 8))
    (drop (call $bl_shift (i32.const 32) (i32.const 16) (i32.const 1)))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 8))
      (i32.add (i32.const 220000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 0))
      (i32.add (i32.const 220000) (i32.const 80))
      (i32.const 8))
    (drop (call $bl_xor (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 0))
      (i32.add (i32.const 220000) (i32.const 16))
      (i32.const 8))
    (i32.store (i32.add (i32.const 220000) (i32.const 8)) (i32.const 0x7feb352d))
    (i32.store (i32.add (i32.const 220000) (i32.const 12)) (i32.const 0))
    (drop (call $bl_mul (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 0))
      (i32.add (i32.const 220000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 80))
      (i32.add (i32.const 220000) (i32.const 0))
      (i32.const 8))
    (drop (call $bl_shift (i32.const 32) (i32.const 15) (i32.const 1)))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 8))
      (i32.add (i32.const 220000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 0))
      (i32.add (i32.const 220000) (i32.const 80))
      (i32.const 8))
    (drop (call $bl_xor (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 0))
      (i32.add (i32.const 220000) (i32.const 16))
      (i32.const 8))
    (i32.store (i32.add (i32.const 220000) (i32.const 8)) (i32.const 0x846ca68b))
    (i32.store (i32.add (i32.const 220000) (i32.const 12)) (i32.const 0))
    (drop (call $bl_mul (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 0))
      (i32.add (i32.const 220000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 80))
      (i32.add (i32.const 220000) (i32.const 0))
      (i32.const 8))
    (drop (call $bl_shift (i32.const 32) (i32.const 16) (i32.const 1)))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 8))
      (i32.add (i32.const 220000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 220000) (i32.const 0))
      (i32.add (i32.const 220000) (i32.const 80))
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
    (memory.fill (i32.add (i32.const 220000) (i32.const 0)) (i32.const 0) (i32.const 256))
    (i32.store8 (i32.add (i32.const 220000) (i32.const 128)) (i32.const 6))
    (i32.store8 (i32.add (i32.const 220000) (i32.const 129)) (i32.const 8))
    (i32.store8 (i32.add (i32.const 220000) (i32.const 130)) (i32.const 14))
    (i32.store8 (i32.add (i32.const 220000) (i32.const 131)) (i32.const 1))
    (i32.store8 (i32.add (i32.const 220000) (i32.const 132)) (i32.const 150))
    (i32.store8 (i32.add (i32.const 220000) (i32.const 133)) (i32.const 232))
    (i32.store8 (i32.add (i32.const 220000) (i32.const 134)) (i32.const 2))
    (i32.store8 (i32.add (i32.const 220000) (i32.const 135)) (i32.const 9))
    (i32.store (i32.add (i32.const 220000) (i32.const 136)) (i32.const 0x424c4131)))
  (func $wl_add
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (local.get $b))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_add (i32.const 32)))
    (i32.load (i32.const 220016)))
  (func $wl_sub
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (local.get $b))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_sub (i32.const 32)))
    (i32.load (i32.const 220016)))
  (func $wl_mul
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (local.get $b))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_mul (i32.const 32)))
    (i32.load (i32.const 220016)))
  (func $wl_and
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (local.get $b))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_and (i32.const 32)))
    (i32.load (i32.const 220016)))
  (func $wl_or
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (local.get $b))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_or (i32.const 32)))
    (i32.load (i32.const 220016)))
  (func $wl_xor
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (local.get $b))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_xor (i32.const 32)))
    (i32.load (i32.const 220016)))
  (func $wl_shl
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (i32.const 0))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_shl (i32.const 32) (local.get $b)))
    (i32.load (i32.const 220016)))
  (func $wl_shr_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (i32.const 0))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_shr_u (i32.const 32) (local.get $b)))
    (i32.load (i32.const 220016)))
  (func $wl_shr_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (i32.const 0))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_shr_s (i32.const 32) (local.get $b)))
    (i32.load (i32.const 220016)))
  (func $wl_rotl
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (i32.const 0))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_rotl (i32.const 32) (local.get $b)))
    (i32.load (i32.const 220016)))
  (func $wl_equal
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (local.get $b))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_eq (i32.const 32)))
    (i32.load (i32.const 220016)))
  (func $wl_less_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (local.get $b))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_ltu (i32.const 32)))
    (i32.load (i32.const 220016)))
  (func $wl_less_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i32.store (i32.const 220008) (local.get $b))
    (i32.store (i32.const 220012) (i32.const 0))
    (drop (call $bl_lts (i32.const 32)))
    (i32.load (i32.const 220016)))
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
  (func $wl64_add
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (local.get $b))
    (drop (call $bl_add (i32.const 64)))
    (i64.load (i32.const 220016)))
  (func $wl64_sub
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (local.get $b))
    (drop (call $bl_sub (i32.const 64)))
    (i64.load (i32.const 220016)))
  (func $wl64_mul
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (local.get $b))
    (drop (call $bl_mul (i32.const 64)))
    (i64.load (i32.const 220016)))
  (func $wl64_and
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (local.get $b))
    (drop (call $bl_and (i32.const 64)))
    (i64.load (i32.const 220016)))
  (func $wl64_or
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (local.get $b))
    (drop (call $bl_or (i32.const 64)))
    (i64.load (i32.const 220016)))
  (func $wl64_xor
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (local.get $b))
    (drop (call $bl_xor (i32.const 64)))
    (i64.load (i32.const 220016)))
  (func $wl64_shl
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (i64.const 0))
    (i64.store (i32.const 220192) (local.get $b))
    (drop (call $bl_shl (i32.const 64) (i32.load (i32.const 220192))))
    (i64.load (i32.const 220016)))
  (func $wl64_shr_u
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (i64.const 0))
    (i64.store (i32.const 220192) (local.get $b))
    (drop (call $bl_shr_u (i32.const 64) (i32.load (i32.const 220192))))
    (i64.load (i32.const 220016)))
  (func $wl64_shr_s
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (i64.const 0))
    (i64.store (i32.const 220192) (local.get $b))
    (drop (call $bl_shr_s (i32.const 64) (i32.load (i32.const 220192))))
    (i64.load (i32.const 220016)))
  (func $wl64_rotl
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (i64.const 0))
    (i64.store (i32.const 220192) (local.get $b))
    (drop (call $bl_rotl (i32.const 64) (i32.load (i32.const 220192))))
    (i64.load (i32.const 220016)))
  (func $wl64_equal
    (param $a i64)
    (param $b i64)
    (result i32)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (local.get $b))
    (drop (call $bl_eq (i32.const 64)))
    (i32.load (i32.const 220016)))
  (func $wl64_less_u
    (param $a i64)
    (param $b i64)
    (result i32)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (local.get $b))
    (drop (call $bl_ltu (i32.const 64)))
    (i32.load (i32.const 220016)))
  (func $wl64_less_s
    (param $a i64)
    (param $b i64)
    (result i32)
    (i64.store (i32.const 220000) (local.get $a))
    (i64.store (i32.const 220008) (local.get $b))
    (drop (call $bl_lts (i32.const 64)))
    (i32.load (i32.const 220016)))
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
  (func $guard_data (if (i32.eqz (call $bl_code_valid)) (then (unreachable))))
  (func $wl_extend_s
    (param $a i32)
    (result i64)
    (local $high i32)
    (local.set $high (call $wl_sub (i32.const 0) (i32.shr_u (local.get $a) (i32.const 31))))
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (local.get $high))
    (i64.load (i32.const 220000)))
  (func $wl_extend_u
    (param $a i32)
    (result i64)
    (i32.store (i32.const 220000) (local.get $a))
    (i32.store (i32.const 220004) (i32.const 0))
    (i64.load (i32.const 220000)))
  (func $wl_wrap
    (param $a i64)
    (result i32)
    (i64.store (i32.const 220000) (local.get $a))
    (i32.load (i32.const 220000)))
  (func $wl_div_pow2
    (param $a i32)
    (param $divisor i32)
    (result i32)
    (local $negative i32)
    (local $magnitude i32)
    (local $quotient i32)
    (local $shift i32)
    (if (call $wl_lt_s (local.get $divisor) (i32.const 1)) (then (unreachable)))
    (if
      (call $wl_ne
        (call $wl_and (local.get $divisor) (call $wl_sub (local.get $divisor) (i32.const 1)))
        (i32.const 0))
      (then (unreachable)))
    (block $found
      (loop $scan
        (br_if $found (i32.and (i32.shr_u (local.get $divisor) (local.get $shift)) (i32.const 1)))
        (local.set $shift (i32.add (local.get $shift) (i32.const 1)))
        (br $scan)))
    (local.set $negative (call $wl_lt_s (local.get $a) (i32.const 0)))
    (local.set $magnitude
      (if
        (result i32)
        (local.get $negative)
        (then (call $wl_sub (i32.const 0) (local.get $a)))
        (else (local.get $a))))
    (local.set $quotient (call $wl_shr_u (local.get $magnitude) (local.get $shift)))
    (if
      (result i32)
      (local.get $negative)
      (then (call $wl_sub (i32.const 0) (local.get $quotient)))
      (else (local.get $quotient))))
  (func $wl_popcnt
    (param $a i32)
    (result i32)
    (local $i i32)
    (local $count i32)
    (local $bit i32)
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 32)))
        (local.set $bit (i32.and (i32.shr_u (local.get $a) (local.get $i)) (i32.const 1)))
        (local.set $count (call $wl_add (local.get $count) (local.get $bit)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (local.get $count))
  (start $bl_init)
  (func (export "lut_code_valid") (result i32) (call $bl_code_valid))
  (func (export "lut_workspace_offset") (result i32) (i32.const 220000)))
