;; Pinion/Maktub new bit-LUT computational data variant.
(module
  (memory (export "memory") 1 1)
  (func $reset
    (export "reset")
    (if (i32.eqz (call $bl_code_valid)) (then (unreachable)))
    (memory.fill (i32.const 0) (i32.const 0) (i32.const 65536))
    (i32.store (i32.const 0) (i32.const 1347241265))
    (i32.store8 (i32.const 128) (i32.const 6))
    (i32.store8 (i32.const 129) (i32.const 1))
    (call $bl_init))
  (func (export "abi_version") (result i32) (i32.const 1))
  (func $code_valid
    (export "code_valid")
    (result i32)
    (i32.and
      (call $bl_code_valid)
      (i32.and
        (i32.eq (i32.load (i32.const 0)) (i32.const 1347241265))
        (i32.and
          (i32.eq (i32.load8_u (i32.const 128)) (i32.const 6))
          (i32.eq (i32.load8_u (i32.const 129)) (i32.const 1))))))
  (func $uget
    (param $base i32)
    (param $index i32)
    (result i32)
    (i32.load (i32.add (local.get $base) (i32.shl (local.get $index) (i32.const 2)))))
  (func $put
    (param $base i32)
    (param $index i32)
    (param $value i32)
    (i32.store (i32.add (local.get $base) (i32.shl (local.get $index) (i32.const 2))) (local.get $value)))
  (func $abs
    (param $v i32)
    (result i32)
    (local $out i32)
    (local.set $out (local.get $v))
    (if
      (call $wl_lt_s (local.get $v) (i32.const 0))
      (then (local.set $out (call $wl_sub (i32.const 0) (local.get $v)))))
    (local.get $out))
  (func $parity (param $v i32) (result i32) (call $wl_and (call $wl_popcnt (local.get $v)) (i32.const 1)))
  (func $xor_bit
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $wl_and
      (call $wl_shr_u
        (i32.load8_u (i32.const 128))
        (call $wl_or (call $wl_shl (local.get $a) (i32.const 1)) (local.get $b)))
      (i32.const 1)))
  (func $pack
    (param $r i32)
    (param $i i32)
    (param $b i32)
    (param $a i32)
    (result i32)
    (local $v i32)
    (local.set $v
      (call $wl_or
        (local.get $r)
        (call $wl_or
          (call $wl_shl (local.get $i) (i32.const 8))
          (call $wl_or
            (call $wl_shl (call $wl_and (local.get $b) (i32.const 255)) (i32.const 16))
            (call $wl_shl (local.get $a) (i32.const 24))))))
    (call $wl_or (local.get $v) (call $wl_shl (call $parity (local.get $v)) (i32.const 31))))
  (func $field
    (param $word i32)
    (result i32)
    (call $wl_shr_s (call $wl_shl (local.get $word) (i32.const 8)) (i32.const 24)))
  (func $class
    (param $b i32)
    (result i32)
    (local $c i32)
    (local.set $c (i32.const 1))
    (if (call $wl_lt_s (local.get $b) (i32.const 0)) (then (local.set $c (i32.const 0))))
    (if (call $wl_gt_s (local.get $b) (i32.const 0)) (then (local.set $c (i32.const 2))))
    (local.get $c))
  (func $mirror
    (param $word i32)
    (result i32)
    (call $pack
      (call $wl_and (call $wl_sub (i32.const 0) (local.get $word)) (i32.const 255))
      (call $wl_and (call $wl_shr_u (local.get $word) (i32.const 8)) (i32.const 255))
      (call $field (local.get $word))
      (call $wl_xor
        (call $wl_and (call $wl_shr_u (local.get $word) (i32.const 24)) (i32.const 127))
        (i32.const 16))))
  (func $genes_valid
    (param $base i32)
    (result i32)
    (local $i i32)
    (local $v i32)
    (block $done
      (loop $scan
        (br_if $done (call $wl_ge_u (local.get $i) (i32.const 11)))
        (local.set $v (call $uget (local.get $base) (local.get $i)))
        (if
          (call $wl_lt_u (local.get $i) (i32.const 3))
          (then (if (call $wl_gt_u (local.get $v) (i32.const 255)) (then (return (i32.const 0)))))
          (else
            (if
              (call $wl_or
                (call $wl_lt_s (local.get $v) (i32.const -4))
                (call $wl_gt_s (local.get $v) (i32.const 4)))
              (then (return (i32.const 0))))))
        (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
        (br $scan)))
    (i32.const 1))
  (func $keycmp
    (param $base i32)
    (param $n i32)
    (param $a i32)
    (param $b i32)
    (result i32)
    (local $k i32)
    (local $va i32)
    (local $vb i32)
    (local $first i32)
    (local.set $first (call $wl_mul (local.get $n) (i32.const 11)))
    (block $done
      (loop $key
        (br_if $done (call $wl_ge_u (local.get $k) (i32.const 5)))
        (local.set $va
          (call $uget
            (local.get $base)
            (call $wl_add
              (local.get $first)
              (call $wl_add (call $wl_mul (local.get $a) (i32.const 5)) (local.get $k)))))
        (local.set $vb
          (call $uget
            (local.get $base)
            (call $wl_add
              (local.get $first)
              (call $wl_add (call $wl_mul (local.get $b) (i32.const 5)) (local.get $k)))))
        (if (call $wl_lt_s (local.get $va) (local.get $vb)) (then (return (i32.const -1))))
        (if (call $wl_gt_s (local.get $va) (local.get $vb)) (then (return (i32.const 1))))
        (local.set $k (call $wl_add (local.get $k) (i32.const 1)))
        (br $key)))
    (i32.const 0))
  (func $world_valid
    (param $base i32)
    (param $n i32)
    (result i32)
    (local $i i32)
    (local $s i32)
    (local $d i32)
    (local $t i32)
    (local $phi i32)
    (local $ordered i32)
    (local $last i32)
    (if
      (call $wl_or
        (call $wl_lt_u (local.get $n) (i32.const 9))
        (call $wl_gt_u (local.get $n) (i32.const 256)))
      (then (return (i32.const 0))))
    (block $done
      (loop $nodes
        (br_if $done (call $wl_ge_u (local.get $i) (local.get $n)))
        (local.set $phi (call $uget (local.get $base) (local.get $i)))
        (if
          (call $wl_or
            (call $wl_lt_s (local.get $phi) (i32.const -127))
            (call $wl_gt_s (local.get $phi) (i32.const 127)))
          (then (return (i32.const 0))))
        (local.set $s (i32.const 0))
        (block $edges_done
          (loop $edges
            (br_if $edges_done (call $wl_ge_u (local.get $s) (i32.const 4)))
            (local.set $d
              (call $uget
                (local.get $base)
                (call $wl_add
                  (local.get $n)
                  (call $wl_add
                    (call $wl_mul (local.get $i) (i32.const 8))
                    (call $wl_mul (local.get $s) (i32.const 2))))))
            (local.set $t
              (call $uget
                (local.get $base)
                (call $wl_add
                  (local.get $n)
                  (call $wl_add
                    (call $wl_mul (local.get $i) (i32.const 8))
                    (call $wl_add (call $wl_mul (local.get $s) (i32.const 2)) (i32.const 1))))))
            (if
              (call $wl_or
                (call $wl_ge_u (local.get $d) (local.get $n))
                (call $wl_gt_u (local.get $t) (i32.const 1)))
              (then (return (i32.const 0))))
            (if
              (call $wl_gt_u
                (call $abs (call $wl_sub (local.get $phi) (call $uget (local.get $base) (local.get $d))))
                (i32.const 1))
              (then (return (i32.const 0))))
            (local.set $s (call $wl_add (local.get $s) (i32.const 1)))
            (br $edges)))
        (local.set $s (i32.const 0))
        (block $factor_done
          (loop $factors
            (br_if $factor_done (call $wl_ge_u (local.get $s) (i32.const 2)))
            (local.set $d
              (call $uget
                (local.get $base)
                (call $wl_add
                  (call $wl_mul (local.get $n) (i32.const 9))
                  (call $wl_add (call $wl_mul (local.get $i) (i32.const 2)) (local.get $s)))))
            (if
              (call $wl_or
                (call $wl_lt_s (local.get $d) (i32.const -10))
                (call $wl_gt_s (local.get $d) (i32.const 10)))
              (then (return (i32.const 0))))
            (local.set $s (call $wl_add (local.get $s) (i32.const 1)))
            (br $factors)))
        (local.set $ordered
          (call $uget
            (local.get $base)
            (call $wl_add (call $wl_mul (local.get $n) (i32.const 16)) (local.get $i))))
        (if (call $wl_ge_u (local.get $ordered) (local.get $n)) (then (return (i32.const 0))))
        (if
          (call $wl_ne
            (call $uget
              (local.get $base)
              (call $wl_add
                (call $wl_mul (local.get $n) (i32.const 11))
                (call $wl_add (call $wl_mul (local.get $ordered) (i32.const 5)) (i32.const 4))))
            (local.get $ordered))
          (then (return (i32.const 0))))
        (if
          (call $wl_gt_u (local.get $i) (i32.const 0))
          (then
            (if
              (call $wl_ge_s
                (call $keycmp (local.get $base) (local.get $n) (local.get $last) (local.get $ordered))
                (i32.const 0))
              (then (return (i32.const 0))))))
        (local.set $last (local.get $ordered))
        (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
        (br $nodes)))
    (i32.const 1))
  (func $live_valid
    (param $base i32)
    (param $n i32)
    (param $word i32)
    (result i32)
    (local $i i32)
    (local $a i32)
    (if (call $parity (local.get $word)) (then (return (i32.const 0))))
    (local.set $i (call $wl_and (call $wl_shr_u (local.get $word) (i32.const 8)) (i32.const 255)))
    (if (call $wl_ge_u (local.get $i) (local.get $n)) (then (return (i32.const 0))))
    (local.set $a (call $wl_and (call $wl_shr_u (local.get $word) (i32.const 24)) (i32.const 127)))
    (if
      (call $wl_and (call $wl_ne (local.get $a) (i32.const 1)) (call $wl_ne (local.get $a) (i32.const 17)))
      (then (return (i32.const 0))))
    (call $wl_eq (call $field (local.get $word)) (call $uget (local.get $base) (local.get $i))))
  (func $overlay_count
    (param $n i32)
    (result i32)
    (call $wl_shr_u (call $wl_add (call $wl_mul (local.get $n) (i32.const 12)) (i32.const 31)) (i32.const 5)))
  (func $overlay_valid
    (param $base i32)
    (param $n i32)
    (result i32)
    (local $used i32)
    (local.set $used (call $wl_and (call $wl_mul (local.get $n) (i32.const 12)) (i32.const 31)))
    (if
      (local.get $used)
      (then
        (if
          (call $wl_shr_u
            (call $uget (local.get $base) (call $wl_sub (call $overlay_count (local.get $n)) (i32.const 1)))
            (local.get $used))
          (then (return (i32.const 0))))))
    (i32.const 1))
  (func
    (export "pinion_install")
    (param $w i32)
    (param $h i32)
    (param $radius i32)
    (param $center i32)
    (param $word i32)
    (param $tick i32)
    (param $epoch i32)
    (result i32)
    (local $n i32)
    (local $i i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 9))))
    (if (call $wl_eqz (call $code_valid)) (then (return (i32.const 1))))
    (if
      (call $wl_or
        (call $wl_or
          (call $wl_lt_u (local.get $w) (i32.const 3))
          (call $wl_gt_u (local.get $w) (i32.const 85)))
        (call $wl_or
          (call $wl_lt_u (local.get $h) (i32.const 3))
          (call $wl_gt_u (local.get $h) (i32.const 85))))
      (then (return (i32.const 2))))
    (local.set $n (call $wl_mul (local.get $w) (local.get $h)))
    (if
      (call $wl_or
        (call $wl_gt_u (local.get $n) (i32.const 256))
        (call $wl_ge_u (local.get $center) (local.get $n)))
      (then (return (i32.const 2))))
    (if
      (call $wl_or
        (call $wl_lt_u (local.get $radius) (i32.const 1))
        (call $wl_gt_u (local.get $radius) (i32.const 127)))
      (then (return (i32.const 2))))
    (if
      (call $wl_or
        (call $wl_gt_u (local.get $epoch) (local.get $tick))
        (call $wl_eqz (call $genes_valid (i32.const 768))))
      (then (return (i32.const 3))))
    (if (call $wl_eqz (call $world_valid (i32.const 40000) (local.get $n))) (then (return (i32.const 4))))
    (if
      (call $wl_or
        (call $wl_eqz (call $live_valid (i32.const 40000) (local.get $n) (local.get $word)))
        (call $wl_eqz (call $overlay_valid (i32.const 58000) (local.get $n))))
      (then (return (i32.const 5))))
    (memory.fill (i32.const 1024) (i32.const 0) (i32.const 17408))
    (memory.copy (i32.const 1024) (i32.const 40000) (call $wl_mul (local.get $n) (i32.const 68)))
    (memory.fill (i32.const 256) (i32.const 0) (i32.const 400))
    (memory.copy
      (i32.const 272)
      (i32.const 58000)
      (call $wl_mul (call $overlay_count (local.get $n)) (i32.const 4)))
    (memory.copy (i32.const 24) (i32.const 768) (i32.const 44))
    (i32.store (i32.const 4) (local.get $n))
    (i32.store (i32.const 8) (local.get $w))
    (i32.store (i32.const 12) (local.get $h))
    (i32.store (i32.const 16) (local.get $radius))
    (i32.store (i32.const 20) (local.get $center))
    (i32.store (i32.const 256) (local.get $word))
    (i32.store (i32.const 260) (local.get $tick))
    (i32.store (i32.const 264) (local.get $epoch))
    (memory.fill (i32.const 20480) (i32.const 0) (i32.const 32))
    (i32.const 0))
  (func $state_valid
    (export "pinion_state_valid")
    (result i32)
    (local $n i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 0))))
    (local.set $n (i32.load (i32.const 4)))
    (if (call $wl_eqz (call $code_valid)) (then (return (i32.const 0))))
    (if (call $wl_ne (i32.load (i32.const 268)) (i32.const 0)) (then (return (i32.const 0))))
    (if
      (call $wl_ne (local.get $n) (call $wl_mul (i32.load (i32.const 8)) (i32.load (i32.const 12))))
      (then (return (i32.const 0))))
    (if
      (call $wl_or
        (call $wl_eqz (call $genes_valid (i32.const 24)))
        (call $wl_gt_u (i32.load (i32.const 264)) (i32.load (i32.const 260))))
      (then (return (i32.const 0))))
    (if (call $wl_eqz (call $world_valid (i32.const 1024) (local.get $n))) (then (return (i32.const 0))))
    (if
      (call $wl_eqz (call $live_valid (i32.const 1024) (local.get $n) (i32.load (i32.const 256))))
      (then (return (i32.const 0))))
    (call $overlay_valid (i32.const 272) (local.get $n)))
  (func
    (export "pinion_set_genes")
    (result i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 9))))
    (if (call $wl_eqz (call $code_valid)) (then (return (i32.const 1))))
    (if (call $wl_eqz (call $state_valid)) (then (return (i32.const 7))))
    (if (call $wl_eqz (call $genes_valid (i32.const 768))) (then (return (i32.const 3))))
    (memory.copy (i32.const 24) (i32.const 768) (i32.const 44))
    (i32.const 0))
  (func $row
    (param $row i32)
    (result i32)
    (local $n i32)
    (local $i i32)
    (local $c i32)
    (local $s i32)
    (local $d i32)
    (local $t i32)
    (local $bit i32)
    (local.set $n (i32.load (i32.const 4)))
    (local.set $i (call $wl_div_u (local.get $row) (i32.const 12)))
    (local.set $c (call $wl_div_u (call $wl_rem_u (local.get $row) (i32.const 12)) (i32.const 4)))
    (local.set $s (call $wl_and (local.get $row) (i32.const 3)))
    (local.set $d
      (call $uget
        (i32.const 1024)
        (call $wl_add
          (local.get $n)
          (call $wl_add
            (call $wl_mul (local.get $i) (i32.const 8))
            (call $wl_mul (local.get $s) (i32.const 2))))))
    (local.set $t
      (call $uget
        (i32.const 1024)
        (call $wl_add
          (local.get $n)
          (call $wl_add
            (call $wl_mul (local.get $i) (i32.const 8))
            (call $wl_add (call $wl_mul (local.get $s) (i32.const 2)) (i32.const 1))))))
    (local.set $bit
      (call $wl_and
        (call $wl_shr_u
          (call $uget (i32.const 272) (call $wl_shr_u (local.get $row) (i32.const 5)))
          (call $wl_and (local.get $row) (i32.const 31)))
        (i32.const 1)))
    (call $pack
      (call $wl_xor (call $uget (i32.const 24) (local.get $c)) (local.get $bit))
      (local.get $d)
      (call $uget (i32.const 1024) (local.get $d))
      (call $wl_or (i32.const 1) (call $wl_shl (local.get $t) (i32.const 6)))))
  (func
    (export "pinion_row_word")
    (param $row i32)
    (result i32)
    (if (i32.eqz (call $bl_code_valid)) (then (unreachable)))
    (if (call $wl_eqz (call $state_valid)) (then (return (i32.const -1))))
    (if
      (call $wl_ge_u (local.get $row) (call $wl_mul (i32.load (i32.const 4)) (i32.const 12)))
      (then (return (i32.const -1))))
    (call $row (local.get $row)))
  (func
    (export "pinion_step")
    (param $j i32)
    (result i32)
    (local $n i32)
    (local $word i32)
    (local $r i32)
    (local $i i32)
    (local $b i32)
    (local $eta i32)
    (local $theta i32)
    (local $bank i32)
    (local $qx i32)
    (local $qy i32)
    (local $lo i32)
    (local $hi i32)
    (local $mid i32)
    (local $id i32)
    (local $cmp i32)
    (local $found i32)
    (local $s i32)
    (local $d i32)
    (local $score i32)
    (local $bestscore i32)
    (local $bestd i32)
    (local $bests i32)
    (local $dot i32)
    (local $row i32)
    (local $old i32)
    (local $tau i32)
    (local $ne i32)
    (local $nt i32)
    (local $nr i32)
    (local $nw i32)
    (local $cost i32)
    (local $mx i32)
    (local $ov i32)
    (local $shift i32)
    (local $flag i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 9))))
    (if (call $wl_gt_u (local.get $j) (i32.const 1)) (then (return (i32.const 6))))
    (if (call $wl_eqz (call $state_valid)) (then (return (i32.const 7))))
    (if
      (call $wl_or
        (call $wl_eq (i32.load (i32.const 260)) (i32.const -1))
        (call $wl_eq (i32.load (i32.const 264)) (i32.const -1)))
      (then (return (i32.const 8))))
    (local.set $n (i32.load (i32.const 4)))
    (local.set $word (i32.load (i32.const 256)))
    (local.set $r (call $wl_and (local.get $word) (i32.const 255)))
    (local.set $i (call $wl_and (call $wl_shr_u (local.get $word) (i32.const 8)) (i32.const 255)))
    (local.set $b (call $field (local.get $word)))
    (local.set $eta (call $wl_and (call $wl_shr_u (local.get $word) (i32.const 28)) (i32.const 1)))
    (local.set $theta (local.get $r))
    (if
      (local.get $eta)
      (then (local.set $theta (call $wl_and (call $wl_sub (i32.const 0) (local.get $r)) (i32.const 255)))))
    (local.set $bank (call $wl_shr_u (local.get $theta) (i32.const 6)))
    (local.set $qx
      (call $wl_mul
        (call $uget
          (i32.const 1024)
          (call $wl_add
            (call $wl_mul (local.get $n) (i32.const 9))
            (call $wl_mul (local.get $i) (i32.const 2))))
        (call $uget (i32.const 36) (call $wl_mul (local.get $bank) (i32.const 2)))))
    (local.set $qy
      (call $wl_mul
        (call $uget
          (i32.const 1024)
          (call $wl_add
            (call $wl_mul (local.get $n) (i32.const 9))
            (call $wl_add (call $wl_mul (local.get $i) (i32.const 2)) (i32.const 1))))
        (call $uget
          (i32.const 36)
          (call $wl_add (call $wl_mul (local.get $bank) (i32.const 2)) (i32.const 1)))))
    (local.set $hi (local.get $n))
    (local.set $found (i32.const -1))
    (block $lookup_done
      (loop $lookup
        (br_if $lookup_done (call $wl_ge_u (local.get $lo) (local.get $hi)))
        (local.set $mid
          (call $wl_shr_u
            (call $wl_sub (call $wl_add (local.get $lo) (local.get $hi)) (i32.const 1))
            (i32.const 1)))
        (local.set $id
          (call $uget
            (i32.const 1024)
            (call $wl_add (call $wl_mul (local.get $n) (i32.const 16)) (local.get $mid))))
        (local.set $cmp (call $keycmp (i32.const 1024) (local.get $n) (local.get $i) (local.get $id)))
        (if (call $wl_eqz (local.get $cmp)) (then (local.set $found (local.get $id)) (br $lookup_done)))
        (if
          (call $wl_lt_s (local.get $cmp) (i32.const 0))
          (then (local.set $hi (local.get $mid)))
          (else (local.set $lo (call $wl_add (local.get $mid) (i32.const 1)))))
        (br $lookup)))
    (if (call $wl_ne (local.get $found) (local.get $i)) (then (return (i32.const 9))))
    (local.set $bestscore (i32.const 2147483647))
    (local.set $bestd (i32.const 2147483647))
    (block $score_done
      (loop $score_loop
        (br_if $score_done (call $wl_ge_u (local.get $s) (i32.const 4)))
        (local.set $d
          (call $uget
            (i32.const 1024)
            (call $wl_add
              (local.get $n)
              (call $wl_add
                (call $wl_mul (local.get $i) (i32.const 8))
                (call $wl_mul (local.get $s) (i32.const 2))))))
        (local.set $dot (local.get $qx))
        (if
          (call $wl_eq (local.get $s) (i32.const 1))
          (then (local.set $dot (call $wl_sub (i32.const 0) (local.get $qx)))))
        (if (call $wl_eq (local.get $s) (i32.const 2)) (then (local.set $dot (local.get $qy))))
        (if
          (call $wl_eq (local.get $s) (i32.const 3))
          (then (local.set $dot (call $wl_sub (i32.const 0) (local.get $qy)))))
        (local.set $score
          (call $wl_sub (call $abs (call $uget (i32.const 1024) (local.get $d))) (local.get $dot)))
        (if
          (call $wl_or
            (call $wl_lt_s (local.get $score) (local.get $bestscore))
            (call $wl_and
              (call $wl_eq (local.get $score) (local.get $bestscore))
              (call $wl_lt_u (local.get $d) (local.get $bestd))))
          (then
            (local.set $bestscore (local.get $score))
            (local.set $bestd (local.get $d))
            (local.set $bests (local.get $s))))
        (local.set $s (call $wl_add (local.get $s) (i32.const 1)))
        (br $score_loop)))
    (local.set $s (local.get $bests))
    (local.set $d (local.get $bestd))
    (local.set $row
      (call $wl_add
        (call $wl_mul (local.get $i) (i32.const 12))
        (call $wl_add (call $wl_mul (call $class (local.get $b)) (i32.const 4)) (local.get $s))))
    (local.set $old (call $row (local.get $row)))
    (local.set $tau
      (call $uget
        (i32.const 1024)
        (call $wl_add
          (local.get $n)
          (call $wl_add
            (call $wl_mul (local.get $i) (i32.const 8))
            (call $wl_add (call $wl_mul (local.get $s) (i32.const 2)) (i32.const 1))))))
    (local.set $ne (call $wl_xor (local.get $eta) (local.get $tau)))
    (local.set $nt
      (call $wl_and
        (call $wl_add (local.get $theta) (call $wl_and (local.get $old) (i32.const 255)))
        (i32.const 255)))
    (local.set $nr (local.get $nt))
    (if
      (local.get $ne)
      (then (local.set $nr (call $wl_and (call $wl_sub (i32.const 0) (local.get $nt)) (i32.const 255)))))
    (local.set $nw
      (call $pack
        (local.get $nr)
        (local.get $d)
        (call $uget (i32.const 1024) (local.get $d))
        (call $wl_or (i32.const 1) (call $wl_shl (local.get $ne) (i32.const 4)))))
    (local.set $mx (call $abs (local.get $qx)))
    (if
      (call $wl_gt_u (call $abs (local.get $qy)) (local.get $mx))
      (then (local.set $mx (call $abs (local.get $qy)))))
    (local.set $cost (call $wl_add (i32.const 1) (call $wl_add (local.get $mx) (local.get $bestscore))))
    (local.set $ov (call $uget (i32.const 272) (call $wl_shr_u (local.get $row) (i32.const 5))))
    (local.set $shift (call $wl_and (local.get $row) (i32.const 31)))
    (local.set $flag
      (call $xor_bit
        (call $wl_and (call $wl_shr_u (local.get $ov) (local.get $shift)) (i32.const 1))
        (local.get $j)))
    (call $put
      (i32.const 272)
      (call $wl_shr_u (local.get $row) (i32.const 5))
      (call $wl_or
        (call $wl_and
          (local.get $ov)
          (call $wl_xor (i32.const -1) (call $wl_shl (i32.const 1) (local.get $shift))))
        (call $wl_shl (local.get $flag) (local.get $shift))))
    (i32.store (i32.const 256) (local.get $nw))
    (i32.store (i32.const 260) (call $wl_add (i32.load (i32.const 260)) (i32.const 1)))
    (i32.store (i32.const 264) (call $wl_add (i32.load (i32.const 264)) (local.get $j)))
    (i32.store (i32.const 20480) (local.get $nw))
    (i32.store (i32.const 20484) (call $mirror (local.get $nw)))
    (i32.store (i32.const 20488) (local.get $row))
    (i32.store (i32.const 20492) (local.get $old))
    (i32.store (i32.const 20496) (call $row (local.get $row)))
    (i32.store (i32.const 20500) (local.get $qx))
    (i32.store (i32.const 20504) (local.get $qy))
    (i32.store (i32.const 20508) (local.get $cost))
    (i32.const 0))
  (func
    (export "pinion_checkpoint")
    (result i32)
    (local $n i32)
    (local $count i32)
    (local $i i32)
    (local $any i32)
    (local $length i32)
    (local $word i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 0))))
    (if (call $wl_eqz (call $state_valid)) (then (return (i32.const 0))))
    (local.set $n (i32.load (i32.const 4)))
    (local.set $count (call $overlay_count (local.get $n)))
    (block $done
      (loop $scan
        (br_if $done (call $wl_ge_u (local.get $i) (local.get $count)))
        (local.set $any (call $wl_or (local.get $any) (call $uget (i32.const 272) (local.get $i))))
        (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
        (br $scan)))
    (local.set $length (i32.const 32))
    (if
      (local.get $any)
      (then (local.set $length (call $wl_add (i32.const 32) (call $wl_mul (local.get $count) (i32.const 4))))))
    (memory.fill (i32.const 21000) (i32.const 0) (i32.const 416))
    (i32.store (i32.const 21000) (i32.const 826755924))
    (i32.store8 (i32.const 21004) (i32.const 1))
    (i32.store8 (i32.const 21006) (i32.load (i32.const 8)))
    (i32.store8 (i32.const 21007) (i32.load (i32.const 12)))
    (i32.store8 (i32.const 21008) (i32.load (i32.const 16)))
    (i32.store8 (i32.const 21009) (i32.load (i32.const 20)))
    (local.set $word (i32.load (i32.const 256)))
    (i32.store8 (i32.const 21010) (call $wl_shr_u (local.get $word) (i32.const 8)))
    (i32.store8 (i32.const 21011) (local.get $word))
    (i32.store8
      (i32.const 21012)
      (call $wl_and (call $wl_shr_u (local.get $word) (i32.const 28)) (i32.const 1)))
    (local.set $i (i32.const 0))
    (block $genes_done
      (loop $genes
        (br_if $genes_done (call $wl_ge_u (local.get $i) (i32.const 11)))
        (i32.store8 (i32.add (i32.const 21013) (local.get $i)) (call $uget (i32.const 24) (local.get $i)))
        (local.set $i (call $wl_add (local.get $i) (i32.const 1)))
        (br $genes)))
    (i32.store (i32.const 21024) (i32.load (i32.const 260)))
    (i32.store (i32.const 21028) (i32.load (i32.const 264)))
    (if
      (local.get $any)
      (then (memory.copy (i32.const 21032) (i32.const 272) (call $wl_mul (local.get $count) (i32.const 4)))))
    (local.get $length))
  (func
    (export "maktub_step")
    (param $b i32)
    (param $d i32)
    (param $length i32)
    (result i32)
    (local $next i32)
    (if (i32.eqz (call $bl_code_valid)) (then (return (i32.const 9))))
    (if (call $wl_eqz (call $code_valid)) (then (return (i32.const 1))))
    (if
      (call $wl_or
        (call $wl_gt_u (local.get $b) (i32.const 1))
        (call $wl_or (call $wl_gt_u (local.get $d) (i32.const 1)) (call $wl_ne (local.get $b) (local.get $d))))
      (then (return (i32.const 10))))
    (if (call $wl_gt_u (local.get $length) (i32.const 4096)) (then (return (i32.const 11))))
    (local.set $next
      (call $wl_and (call $wl_shr_u (i32.load8_u (i32.const 129)) (local.get $b)) (i32.const 1)))
    (memory.fill (i32.const 30000) (i32.const 0) (i32.const 4128))
    (i32.store (i32.const 30000) (local.get $b))
    (i32.store (i32.const 30004) (local.get $d))
    (i32.store (i32.const 30008) (local.get $next))
    (i32.store (i32.const 30012) (local.get $next))
    (i32.store (i32.const 30016) (local.get $length))
    (i32.store (i32.const 30020) (i32.const 1))
    (i32.store (i32.const 30024) (i32.const 1))
    (memory.copy (i32.const 30032) (i32.const 24000) (local.get $length))
    (i32.const 0))
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
  (func $wl_div_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (if (call $dv_divide (i32.const 32) (i32.const 0)) (then (unreachable)))
    (i32.load (i32.const 60016)))
  (func $wl_rem_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 60000) (local.get $a))
    (i32.store (i32.const 60004) (i32.const 0))
    (i32.store (i32.const 60008) (local.get $b))
    (i32.store (i32.const 60012) (i32.const 0))
    (if (call $dv_divide (i32.const 32) (i32.const 1)) (then (unreachable)))
    (i32.load (i32.const 60016)))
  (func $boot (call $bl_init) (call $reset))
  (start $boot)
  (func (export "lut_code_valid") (result i32) (call $bl_code_valid))
  (func (export "lut_workspace_offset") (result i32) (i32.const 60000)))
