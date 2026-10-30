;; New exact BigRat physics DATA bit-LUT profile; declared control/address/transport retained.
(module
  (memory (export "memory") 16 16)
  (func $fail (param $code i32) (i32.store (i32.const 0) (local.get $code)))
  (func $err (result i32) (i32.load (i32.const 0)))
  (func $bp
    (param $slot i32)
    (result i32)
    (i32.add (i32.const 655360) (i32.mul (local.get $slot) (i32.const 2072))))
  (func $rp
    (param $slot i32)
    (result i32)
    (i32.add (i32.const 196608) (i32.mul (local.get $slot) (i32.const 2064))))
  (func $ep
    (param $slot i32)
    (result i32)
    (i32.add (i32.const 4096) (i32.mul (local.get $slot) (i32.const 2064))))
  (func $digit
    (param $p i32)
    (param $i i32)
    (result i32)
    (if
      (result i32)
      (i32.lt_u (local.get $i) (i32.load (local.get $p)))
      (then
        (i32.load16_u
          (i32.add (local.get $p) (i32.add (i32.const 16) (i32.shl (local.get $i) (i32.const 1))))))
      (else (i32.const 0))))
  (func $put
    (param $p i32)
    (param $i i32)
    (param $v i32)
    (i32.store16
      (i32.add (local.get $p) (i32.add (i32.const 16) (i32.shl (local.get $i) (i32.const 1))))
      (local.get $v)))
  (func $zero (param $p i32) (memory.fill (local.get $p) (i32.const 0) (i32.const 2072)))
  (func $copy
    (param $dst i32)
    (param $src i32)
    (memory.copy (local.get $dst) (local.get $src) (i32.const 2072)))
  (func $trim
    (param $p i32)
    (local $n i32)
    (local.set $n (i32.load (local.get $p)))
    (block $done
      (loop $again
        (br_if $done (i32.eqz (local.get $n)))
        (br_if $done
          (call $B_lut
            (i32.const 3)
            (call $N_eq16 (call $digit (local.get $p) (i32.sub (local.get $n) (i32.const 1))) (i32.const 0))))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br $again)))
    (i32.store (local.get $p) (local.get $n)))
  (func $cmp
    (param $a i32)
    (param $b i32)
    (result i32)
    (local $i i32)
    (local $x i32)
    (local $y i32)
    (if (call $N_gt_u16 (i32.load (local.get $a)) (i32.load (local.get $b))) (then (return (i32.const 1))))
    (if (call $N_lt_u16 (i32.load (local.get $a)) (i32.load (local.get $b))) (then (return (i32.const -1))))
    (local.set $i (i32.load (local.get $a)))
    (block $done
      (loop $again
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $x (call $digit (local.get $a) (local.get $i)))
        (local.set $y (call $digit (local.get $b) (local.get $i)))
        (if (call $N_gt_u16 (local.get $x) (local.get $y)) (then (return (i32.const 1))))
        (if (call $N_lt_u16 (local.get $x) (local.get $y)) (then (return (i32.const -1))))
        (br $again)))
    (i32.const 0))
  (func $add
    (param $o i32)
    (param $a i32)
    (param $b i32)
    (local $n i32)
    (local $i i32)
    (local $v i32)
    (local $carry i32)
    (call $zero (local.get $o))
    (local.set $n
      (if
        (result i32)
        (call $L_gt_u (i32.load (local.get $a)) (i32.load (local.get $b)))
        (then (i32.load (local.get $a)))
        (else (i32.load (local.get $b)))))
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $v
          (call $N_add17
            (call $N_add17
              (call $digit (local.get $a) (local.get $i))
              (call $digit (local.get $b) (local.get $i)))
            (local.get $carry)))
        (call $put (local.get $o) (local.get $i) (local.get $v))
        (local.set $carry (i32.shr_u (local.get $v) (i32.const 16)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (if
      (local.get $carry)
      (then
        (if (i32.ge_u (local.get $n) (i32.const 1025)) (then (call $fail (i32.const 4)) (return)))
        (call $put (local.get $o) (local.get $n) (local.get $carry))
        (local.set $n (i32.add (local.get $n) (i32.const 1)))))
    (i32.store (local.get $o) (local.get $n)))
  (func $sub_inplace
    (param $a i32)
    (param $b i32)
    (local $i i32)
    (local $borrow i32)
    (local $av i32)
    (local $bv i32)
    (block $done
      (loop $again
        (br_if $done (call $L_ge_u (local.get $i) (i32.load (local.get $a))))
        (local.set $av (call $digit (local.get $a) (local.get $i)))
        (local.set $bv (call $N_add17 (call $digit (local.get $b) (local.get $i)) (local.get $borrow)))
        (call $put (local.get $a) (local.get $i) (call $L_sub (local.get $av) (local.get $bv)))
        (local.set $borrow (call $N_lt_u17 (local.get $av) (local.get $bv)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (call $trim (local.get $a)))
  (func $mul
    (param $o i32)
    (param $a i32)
    (param $b i32)
    (local $an i32)
    (local $bn i32)
    (local $i i32)
    (local $j i32)
    (local $v i32)
    (local $carry i32)
    (call $zero (local.get $o))
    (local.set $an (i32.load (local.get $a)))
    (local.set $bn (i32.load (local.get $b)))
    (if
      (call $N_or16 (call $N_eq16 (local.get $an) (i32.const 0)) (call $N_eq16 (local.get $bn) (i32.const 0)))
      (then (return)))
    (if
      (i32.gt_u (i32.add (local.get $an) (local.get $bn)) (i32.const 1025))
      (then (call $fail (i32.const 4)) (return)))
    (i32.store (local.get $o) (i32.add (local.get $an) (local.get $bn)))
    (block $idone
      (loop $iloop
        (br_if $idone (i32.ge_u (local.get $i) (local.get $an)))
        (local.set $j (i32.const 0))
        (local.set $carry (i32.const 0))
        (block $jdone
          (loop $jloop
            (br_if $jdone (i32.ge_u (local.get $j) (local.get $bn)))
            (local.set $v
              (call $L_add
                (call $L_add
                  (call $L_mul
                    (call $digit (local.get $a) (local.get $i))
                    (call $digit (local.get $b) (local.get $j)))
                  (call $digit (local.get $o) (i32.add (local.get $i) (local.get $j))))
                (local.get $carry)))
            (call $put (local.get $o) (i32.add (local.get $i) (local.get $j)) (local.get $v))
            (local.set $carry (i32.shr_u (local.get $v) (i32.const 16)))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $jloop)))
        (call $put (local.get $o) (i32.add (local.get $i) (local.get $bn)) (local.get $carry))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $iloop)))
    (call $trim (local.get $o)))
  (func $shr1
    (param $a i32)
    (local $i i32)
    (local $v i32)
    (local $carry i32)
    (local.set $i (i32.load (local.get $a)))
    (block $done
      (loop $again
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $v (call $digit (local.get $a) (local.get $i)))
        (call $put
          (local.get $a)
          (local.get $i)
          (call $N_or16
            (call $N_shr_u16 (local.get $v) (i32.const 1))
            (call $N_shl16 (local.get $carry) (i32.const 15))))
        (local.set $carry (i32.and (local.get $v) (i32.const 1)))
        (br $again)))
    (call $trim (local.get $a)))
  (func $shl1
    (param $a i32)
    (param $bit i32)
    (local $i i32)
    (local $n i32)
    (local $v i32)
    (local $carry i32)
    (local.set $n (i32.load (local.get $a)))
    (local.set $carry (local.get $bit))
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $v
          (call $N_or17
            (call $N_shl17 (call $digit (local.get $a) (local.get $i)) (i32.const 1))
            (local.get $carry)))
        (call $put (local.get $a) (local.get $i) (local.get $v))
        (local.set $carry (i32.shr_u (local.get $v) (i32.const 16)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (if
      (local.get $carry)
      (then
        (if (i32.ge_u (local.get $n) (i32.const 1025)) (then (call $fail (i32.const 4)) (return)))
        (call $put (local.get $a) (local.get $n) (local.get $carry))
        (i32.store (local.get $a) (i32.add (local.get $n) (i32.const 1))))))
  (func $gcd
    (param $o i32)
    (param $a i32)
    (param $b i32)
    (local $x i32)
    (local $y i32)
    (local $t i32)
    (local $common i32)
    (if
      (i32.and
        (i32.le_u (i32.load (local.get $a)) (i32.const 2))
        (i32.le_u (i32.load (local.get $b)) (i32.const 2)))
      (then (call $L_small_gcd (local.get $o) (local.get $a) (local.get $b)) (return)))
    (local.set $x (call $bp (i32.const 20)))
    (local.set $y (call $bp (i32.const 21)))
    (local.set $t (call $bp (i32.const 22)))
    (call $copy (local.get $x) (local.get $a))
    (call $copy (local.get $y) (local.get $b))
    (if (call $L_eqz (i32.load (local.get $x))) (then (call $copy (local.get $o) (local.get $y)) (return)))
    (if (call $L_eqz (i32.load (local.get $y))) (then (call $copy (local.get $o) (local.get $x)) (return)))
    (block $cdone
      (loop $cloop
        (br_if $cdone
          (call $L_or
            (i32.and (call $digit (local.get $x) (i32.const 0)) (i32.const 1))
            (i32.and (call $digit (local.get $y) (i32.const 0)) (i32.const 1))))
        (call $shr1 (local.get $x))
        (call $shr1 (local.get $y))
        (local.set $common (i32.add (local.get $common) (i32.const 1)))
        (br $cloop)))
    (block $xdone
      (loop $xloop
        (br_if $xdone (i32.and (call $digit (local.get $x) (i32.const 0)) (i32.const 1)))
        (call $shr1 (local.get $x))
        (br $xloop)))
    (block $done
      (loop $again
        (br_if $done (call $L_eqz (i32.load (local.get $y))))
        (block $ydone
          (loop $yloop
            (br_if $ydone (i32.and (call $digit (local.get $y) (i32.const 0)) (i32.const 1)))
            (call $shr1 (local.get $y))
            (br $yloop)))
        (if
          (call $L_gt_s (call $cmp (local.get $x) (local.get $y)) (i32.const 0))
          (then
            (call $copy (local.get $t) (local.get $x))
            (call $copy (local.get $x) (local.get $y))
            (call $copy (local.get $y) (local.get $t))))
        (call $sub_inplace (local.get $y) (local.get $x))
        (br $again)))
    (block $restore_done
      (loop $restore
        (br_if $restore_done (i32.eqz (local.get $common)))
        (call $shl1 (local.get $x) (i32.const 0))
        (local.set $common (i32.sub (local.get $common) (i32.const 1)))
        (br $restore)))
    (call $copy (local.get $o) (local.get $x)))
  (func $divmod
    (param $q i32)
    (param $r i32)
    (param $a i32)
    (param $b i32)
    (local $i i32)
    (local $bit i32)
    (local $limb i32)
    (call $zero (local.get $q))
    (call $zero (local.get $r))
    (if (call $L_eqz (i32.load (local.get $b))) (then (call $fail (i32.const 3)) (return)))
    (if
      (call $L_and
        (call $L_eq (i32.load (local.get $b)) (i32.const 1))
        (call $L_eq (call $digit (local.get $b) (i32.const 0)) (i32.const 1)))
      (then (call $copy (local.get $q) (local.get $a)) (return)))
    (if
      (i32.eq (i32.load (local.get $b)) (i32.const 1))
      (then (call $L_small_div (local.get $q) (local.get $r) (local.get $a) (local.get $b)) (return)))
    (i32.store (local.get $q) (i32.load (local.get $a)))
    (local.set $i (call $L_mul (i32.load (local.get $a)) (i32.const 16)))
    (block $done
      (loop $again
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $bit
          (i32.and
            (call $L_shr_u
              (call $digit (local.get $a) (i32.shr_u (local.get $i) (i32.const 4)))
              (i32.and (local.get $i) (i32.const 15)))
            (i32.const 1)))
        (call $shl1 (local.get $r) (local.get $bit))
        (if (call $err) (then (return)))
        (if
          (call $L_ge_s (call $cmp (local.get $r) (local.get $b)) (i32.const 0))
          (then
            (call $sub_inplace (local.get $r) (local.get $b))
            (local.set $limb (i32.shr_u (local.get $i) (i32.const 4)))
            (call $put
              (local.get $q)
              (local.get $limb)
              (call $N_or16
                (call $digit (local.get $q) (local.get $limb))
                (i32.shl (i32.const 1) (i32.and (local.get $i) (i32.const 15)))))))
        (br $again)))
    (call $trim (local.get $q)))
  (func $rat_big
    (param $rat i32)
    (param $which i32)
    (param $big i32)
    (call $zero (local.get $big))
    (i32.store
      (local.get $big)
      (i32.load (i32.add (local.get $rat) (i32.add (i32.const 4) (i32.shl (local.get $which) (i32.const 2))))))
    (memory.copy
      (i32.add (local.get $big) (i32.const 16))
      (i32.add (local.get $rat) (i32.add (i32.const 16) (i32.mul (local.get $which) (i32.const 1024))))
      (i32.const 1024)))
  (func $rat_zero
    (param $p i32)
    (memory.fill (local.get $p) (i32.const 0) (i32.const 2064))
    (i32.store offset=8 (local.get $p) (i32.const 1))
    (i32.store16 offset=1040 (local.get $p) (i32.const 1)))
  (func $store_rat
    (param $o i32)
    (param $sign i32)
    (param $n i32)
    (param $d i32)
    (local $g i32)
    (local $qn i32)
    (local $qd i32)
    (local $rem i32)
    (if (call $err) (then (return)))
    (if (i32.eqz (i32.load (local.get $d))) (then (call $fail (i32.const 3)) (return)))
    (if
      (call $N_eq16 (i32.load (local.get $n)) (i32.const 0))
      (then (call $rat_zero (local.get $o)) (return)))
    (local.set $g (call $bp (i32.const 10)))
    (local.set $qn (call $bp (i32.const 11)))
    (local.set $qd (call $bp (i32.const 12)))
    (local.set $rem (call $bp (i32.const 13)))
    (call $gcd (local.get $g) (local.get $n) (local.get $d))
    (call $divmod (local.get $qn) (local.get $rem) (local.get $n) (local.get $g))
    (call $divmod (local.get $qd) (local.get $rem) (local.get $d) (local.get $g))
    (if (call $err) (then (return)))
    (if
      (i32.or
        (i32.gt_u (i32.load (local.get $qn)) (i32.const 512))
        (i32.gt_u (i32.load (local.get $qd)) (i32.const 512)))
      (then (call $fail (i32.const 4)) (return)))
    (call $rat_zero (local.get $o))
    (i32.store (local.get $o) (local.get $sign))
    (i32.store offset=4 (local.get $o) (i32.load (local.get $qn)))
    (i32.store offset=8 (local.get $o) (i32.load (local.get $qd)))
    (memory.copy
      (i32.add (local.get $o) (i32.const 16))
      (i32.add (local.get $qn) (i32.const 16))
      (i32.mul (i32.load (local.get $qn)) (i32.const 2)))
    (memory.copy
      (i32.add (local.get $o) (i32.const 1040))
      (i32.add (local.get $qd) (i32.const 16))
      (i32.mul (i32.load (local.get $qd)) (i32.const 2))))
  (func $rat_op
    (param $o i32)
    (param $a i32)
    (param $b i32)
    (param $op i32)
    (local $sa i32)
    (local $sb i32)
    (local $sign i32)
    (local $cmp i32)
    (if (call $err) (then (return)))
    (call $rat_big (local.get $a) (i32.const 0) (call $bp (i32.const 0)))
    (call $rat_big (local.get $a) (i32.const 1) (call $bp (i32.const 1)))
    (call $rat_big (local.get $b) (i32.const 0) (call $bp (i32.const 2)))
    (call $rat_big (local.get $b) (i32.const 1) (call $bp (i32.const 3)))
    (local.set $sa (i32.load (local.get $a)))
    (local.set $sb (i32.load (local.get $b)))
    (if
      (i32.eq (local.get $op) (i32.const 1))
      (then (local.set $sb (call $L_xor (local.get $sb) (i32.const 1)))))
    (if
      (i32.lt_u (local.get $op) (i32.const 2))
      (then
        (call $mul (call $bp (i32.const 4)) (call $bp (i32.const 0)) (call $bp (i32.const 3)))
        (call $mul (call $bp (i32.const 5)) (call $bp (i32.const 2)) (call $bp (i32.const 1)))
        (call $mul (call $bp (i32.const 7)) (call $bp (i32.const 1)) (call $bp (i32.const 3)))
        (if
          (call $L_eq (local.get $sa) (local.get $sb))
          (then
            (call $add (call $bp (i32.const 6)) (call $bp (i32.const 4)) (call $bp (i32.const 5)))
            (local.set $sign (local.get $sa)))
          (else
            (local.set $cmp (call $cmp (call $bp (i32.const 4)) (call $bp (i32.const 5))))
            (if
              (call $L_ge_s (local.get $cmp) (i32.const 0))
              (then
                (call $copy (call $bp (i32.const 6)) (call $bp (i32.const 4)))
                (call $sub_inplace (call $bp (i32.const 6)) (call $bp (i32.const 5)))
                (local.set $sign (local.get $sa)))
              (else
                (call $copy (call $bp (i32.const 6)) (call $bp (i32.const 5)))
                (call $sub_inplace (call $bp (i32.const 6)) (call $bp (i32.const 4)))
                (local.set $sign (local.get $sb)))))))
      (else
        (local.set $sign (call $L_xor (local.get $sa) (local.get $sb)))
        (if
          (i32.eq (local.get $op) (i32.const 3))
          (then
            (call $mul (call $bp (i32.const 6)) (call $bp (i32.const 0)) (call $bp (i32.const 3)))
            (call $mul (call $bp (i32.const 7)) (call $bp (i32.const 1)) (call $bp (i32.const 2))))
          (else
            (call $mul (call $bp (i32.const 6)) (call $bp (i32.const 0)) (call $bp (i32.const 2)))
            (call $mul (call $bp (i32.const 7)) (call $bp (i32.const 1)) (call $bp (i32.const 3)))))))
    (call $store_rat (local.get $o) (local.get $sign) (call $bp (i32.const 6)) (call $bp (i32.const 7))))
  (func $canonical
    (param $p i32)
    (result i32)
    (local $n i32)
    (local $d i32)
    (local $i i32)
    (local.set $n (i32.load offset=4 (local.get $p)))
    (local.set $d (i32.load offset=8 (local.get $p)))
    (if
      (i32.or (i32.gt_u (i32.load (local.get $p)) (i32.const 1)) (i32.load offset=12 (local.get $p)))
      (then (return (i32.const 0))))
    (if
      (i32.or
        (i32.gt_u (local.get $n) (i32.const 512))
        (i32.or (i32.eqz (local.get $d)) (i32.gt_u (local.get $d) (i32.const 512))))
      (then (return (i32.const 0))))
    (if
      (i32.eqz
        (i32.load16_u
          (i32.add
            (local.get $p)
            (i32.add (i32.const 1040) (i32.shl (i32.sub (local.get $d) (i32.const 1)) (i32.const 1))))))
      (then (return (i32.const 0))))
    (if
      (local.get $n)
      (then
        (if
          (i32.eqz
            (i32.load16_u
              (i32.add
                (local.get $p)
                (i32.add (i32.const 16) (i32.shl (i32.sub (local.get $n) (i32.const 1)) (i32.const 1))))))
          (then (return (i32.const 0)))))
      (else
        (if
          (i32.or
            (i32.load (local.get $p))
            (i32.or
              (i32.ne (local.get $d) (i32.const 1))
              (i32.ne (i32.load16_u offset=1040 (local.get $p)) (i32.const 1))))
          (then (return (i32.const 0))))))
    (local.set $i (local.get $n))
    (block $ndone
      (loop $nloop
        (br_if $ndone (i32.ge_u (local.get $i) (i32.const 512)))
        (if
          (i32.load16_u
            (i32.add (local.get $p) (i32.add (i32.const 16) (i32.shl (local.get $i) (i32.const 1)))))
          (then (return (i32.const 0))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $nloop)))
    (local.set $i (local.get $d))
    (block $ddone
      (loop $dloop
        (br_if $ddone (i32.ge_u (local.get $i) (i32.const 512)))
        (if
          (i32.load16_u
            (i32.add (local.get $p) (i32.add (i32.const 1040) (i32.shl (local.get $i) (i32.const 1)))))
          (then (return (i32.const 0))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $dloop)))
    (call $rat_big (local.get $p) (i32.const 0) (call $bp (i32.const 0)))
    (call $rat_big (local.get $p) (i32.const 1) (call $bp (i32.const 1)))
    (call $gcd (call $bp (i32.const 10)) (call $bp (i32.const 0)) (call $bp (i32.const 1)))
    (i32.and
      (i32.eq (i32.load (call $bp (i32.const 10))) (i32.const 1))
      (i32.eq (call $digit (call $bp (i32.const 10)) (i32.const 0)) (i32.const 1))))
  (func $domain
    (param $p i32)
    (param $positive i32)
    (result i32)
    (i32.and
      (i32.eqz (i32.load (local.get $p)))
      (if
        (result i32)
        (local.get $positive)
        (then (i32.ne (i32.load offset=4 (local.get $p)) (i32.const 0)))
        (else (i32.const 1)))))
  (func
    (export "reset")
    (result i32)
    (local $i i32)
    (memory.fill (i32.const 0) (i32.const 0) (i32.const 1048576))
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (i32.const 64)))
        (call $rat_zero (call $ep (local.get $i)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (call $L_init)
    (i32.const 0))
  (func (export "last_status") (result i32) (call $err))
  (func (export "tick") (result i64) (i64.load (i32.const 8)))
  (func (export "abi_version") (result i32) (i32.const 1))
  (func
    (export "rat_add")
    (param $dst i32)
    (param $a i32)
    (param $b i32)
    (result i32)
    (if (i32.eqz (call $B_code_valid)) (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (i32.store (i32.const 0) (i32.const 0))
    (if (i32.gt_u (local.get $dst) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if (i32.gt_u (local.get $a) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if (i32.gt_u (local.get $b) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $a) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $b) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (call $rat_op (call $rp (i32.const 0)) (call $ep (local.get $a)) (call $ep (local.get $b)) (i32.const 0))
    (if (call $err) (then (return (call $err))))
    (memory.copy (call $ep (local.get $dst)) (call $rp (i32.const 0)) (i32.const 2064))
    (i32.const 0))
  (func
    (export "rat_sub")
    (param $dst i32)
    (param $a i32)
    (param $b i32)
    (result i32)
    (if (i32.eqz (call $B_code_valid)) (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (i32.store (i32.const 0) (i32.const 0))
    (if (i32.gt_u (local.get $dst) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if (i32.gt_u (local.get $a) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if (i32.gt_u (local.get $b) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $a) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $b) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (call $rat_op (call $rp (i32.const 0)) (call $ep (local.get $a)) (call $ep (local.get $b)) (i32.const 1))
    (if (call $err) (then (return (call $err))))
    (memory.copy (call $ep (local.get $dst)) (call $rp (i32.const 0)) (i32.const 2064))
    (i32.const 0))
  (func
    (export "rat_mul")
    (param $dst i32)
    (param $a i32)
    (param $b i32)
    (result i32)
    (if (i32.eqz (call $B_code_valid)) (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (i32.store (i32.const 0) (i32.const 0))
    (if (i32.gt_u (local.get $dst) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if (i32.gt_u (local.get $a) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if (i32.gt_u (local.get $b) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $a) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $b) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (call $rat_op (call $rp (i32.const 0)) (call $ep (local.get $a)) (call $ep (local.get $b)) (i32.const 2))
    (if (call $err) (then (return (call $err))))
    (memory.copy (call $ep (local.get $dst)) (call $rp (i32.const 0)) (i32.const 2064))
    (i32.const 0))
  (func
    (export "rat_div")
    (param $dst i32)
    (param $a i32)
    (param $b i32)
    (result i32)
    (if (i32.eqz (call $B_code_valid)) (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (i32.store (i32.const 0) (i32.const 0))
    (if (i32.gt_u (local.get $dst) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if (i32.gt_u (local.get $a) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if (i32.gt_u (local.get $b) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $a) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $b) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (call $rat_op (call $rp (i32.const 0)) (call $ep (local.get $a)) (call $ep (local.get $b)) (i32.const 3))
    (if (call $err) (then (return (call $err))))
    (memory.copy (call $ep (local.get $dst)) (call $rp (i32.const 0)) (i32.const 2064))
    (i32.const 0))
  (func
    (export "rat_neg")
    (param $dst i32)
    (param $a i32)
    (result i32)
    (if (i32.eqz (call $B_code_valid)) (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (i32.store (i32.const 0) (i32.const 0))
    (if
      (call $L_gt_u (local.get $dst) (i32.const 63))
      (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if (call $L_gt_u (local.get $a) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (call $L_eqz (call $canonical (call $ep (call $L_add (local.get $a) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (memory.copy (call $rp (i32.const 0)) (call $ep (local.get $a)) (i32.const 2064))
    (if
      (call $B_lut (i32.const 3) (call $N_eq16 (i32.load offset=4 (call $rp (i32.const 0))) (i32.const 0)))
      (then
        (i32.store (call $rp (i32.const 0)) (call $L_xor (i32.load (call $rp (i32.const 0))) (i32.const 1)))))
    (memory.copy (call $ep (local.get $dst)) (call $rp (i32.const 0)) (i32.const 2064))
    (i32.const 0))
  (func
    (export "rat_cmp")
    (param $a i32)
    (param $b i32)
    (result i32)
    (local $c i32)
    (if (i32.eqz (call $B_code_valid)) (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (i32.store (i32.const 0) (i32.const 0))
    (if (call $L_gt_u (local.get $a) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if (call $L_gt_u (local.get $b) (i32.const 63)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (call $L_eqz (call $canonical (call $ep (call $L_add (local.get $a) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (call $L_eqz (call $canonical (call $ep (call $L_add (local.get $b) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (call $rat_big (call $ep (local.get $a)) (i32.const 0) (call $bp (i32.const 0)))
    (call $rat_big (call $ep (local.get $a)) (i32.const 1) (call $bp (i32.const 1)))
    (call $rat_big (call $ep (local.get $b)) (i32.const 0) (call $bp (i32.const 2)))
    (call $rat_big (call $ep (local.get $b)) (i32.const 1) (call $bp (i32.const 3)))
    (call $mul (call $bp (i32.const 4)) (call $bp (i32.const 0)) (call $bp (i32.const 3)))
    (call $mul (call $bp (i32.const 5)) (call $bp (i32.const 2)) (call $bp (i32.const 1)))
    (if
      (call $L_ne (i32.load (call $ep (local.get $a))) (i32.load (call $ep (local.get $b))))
      (then
        (return
          (if
            (result i32)
            (call $B_lut (i32.const 6) (i32.load (call $ep (local.get $a))))
            (then (i32.const -1))
            (else (i32.const 1))))))
    (local.set $c (call $cmp (call $bp (i32.const 4)) (call $bp (i32.const 5))))
    (if
      (result i32)
      (call $B_lut (i32.const 6) (i32.load (call $ep (local.get $a))))
      (then (call $L_sub (i32.const 0) (local.get $c)))
      (else (local.get $c))))
  (func
    (export "oscillator")
    (param $input i32)
    (param $output i32)
    (result i32)
    (if (i32.eqz (call $B_code_valid)) (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (i32.store (i32.const 0) (i32.const 0))
    (if (i32.gt_u (local.get $input) (i32.const 57)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.gt_u (local.get $output) (i32.const 60))
      (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 1)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 2)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 3)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 4)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 5)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 6)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 2))) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 3))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 4))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 6))) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (memory.copy (i32.const 196608) (call $ep (i32.add (local.get $input) (i32.const 0))) (i32.const 2064))
    (memory.copy (i32.const 198672) (call $ep (i32.add (local.get $input) (i32.const 1))) (i32.const 2064))
    (memory.copy (i32.const 200736) (call $ep (i32.add (local.get $input) (i32.const 2))) (i32.const 2064))
    (memory.copy (i32.const 202800) (call $ep (i32.add (local.get $input) (i32.const 3))) (i32.const 2064))
    (memory.copy (i32.const 204864) (call $ep (i32.add (local.get $input) (i32.const 4))) (i32.const 2064))
    (memory.copy (i32.const 206928) (call $ep (i32.add (local.get $input) (i32.const 5))) (i32.const 2064))
    (memory.copy (i32.const 208992) (call $ep (i32.add (local.get $input) (i32.const 6))) (i32.const 2064))
    (call $rat_zero (i32.const 211056))
    (i32.store (i32.const 211056) (i32.const 0))
    (i32.store (i32.const 211060) (i32.const 1))
    (i32.store16 (i32.const 211072) (i32.const 2))
    (i32.store16 (i32.const 212096) (i32.const 1))
    (call $rat_op (i32.const 213120) (i32.const 211056) (i32.const 200736) (i32.const 2))
    (call $rat_op (i32.const 200736) (i32.const 208992) (i32.const 213120) (i32.const 3))
    (call $rat_op (i32.const 215184) (i32.const 208992) (i32.const 202800) (i32.const 2))
    (call $rat_op (i32.const 202800) (i32.const 215184) (i32.const 211056) (i32.const 3))
    (call $rat_zero (i32.const 211056))
    (i32.store (i32.const 211056) (i32.const 0))
    (i32.store (i32.const 211060) (i32.const 1))
    (i32.store16 (i32.const 211072) (i32.const 1))
    (i32.store16 (i32.const 212096) (i32.const 1))
    (call $rat_op (i32.const 215184) (i32.const 208992) (i32.const 204864) (i32.const 2))
    (call $rat_op (i32.const 204864) (i32.const 215184) (i32.const 213120) (i32.const 3))
    (call $rat_op (i32.const 217248) (i32.const 211056) (i32.const 204864) (i32.const 0))
    (call $rat_op (i32.const 219312) (i32.const 200736) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 221376) (i32.const 196608) (i32.const 219312) (i32.const 0))
    (call $rat_zero (i32.const 219312))
    (i32.store (i32.const 219312) (i32.const 0))
    (i32.store (i32.const 219316) (i32.const 0))
    (i32.store16 (i32.const 219328) (i32.const 0))
    (i32.store16 (i32.const 220352) (i32.const 1))
    (call $rat_op (i32.const 223440) (i32.const 219312) (i32.const 202800) (i32.const 1))
    (call $rat_op (i32.const 219312) (i32.const 223440) (i32.const 196608) (i32.const 2))
    (call $rat_op (i32.const 196608) (i32.const 211056) (i32.const 204864) (i32.const 1))
    (call $rat_op (i32.const 204864) (i32.const 196608) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 196608) (i32.const 219312) (i32.const 204864) (i32.const 0))
    (call $rat_op (i32.const 204864) (i32.const 208992) (i32.const 206928) (i32.const 2))
    (call $rat_op (i32.const 206928) (i32.const 196608) (i32.const 204864) (i32.const 0))
    (call $rat_op (i32.const 196608) (i32.const 202800) (i32.const 221376) (i32.const 2))
    (call $rat_op (i32.const 208992) (i32.const 206928) (i32.const 196608) (i32.const 1))
    (call $rat_op (i32.const 196608) (i32.const 200736) (i32.const 202800) (i32.const 2))
    (call $rat_op (i32.const 202800) (i32.const 217248) (i32.const 196608) (i32.const 0))
    (call $rat_op (i32.const 196608) (i32.const 208992) (i32.const 202800) (i32.const 3))
    (call $rat_op (i32.const 202800) (i32.const 200736) (i32.const 196608) (i32.const 2))
    (call $rat_op (i32.const 200736) (i32.const 221376) (i32.const 202800) (i32.const 0))
    (call $rat_op (i32.const 202800) (i32.const 198672) (i32.const 196608) (i32.const 0))
    (call $rat_op (i32.const 198672) (i32.const 202800) (i32.const 213120) (i32.const 3))
    (call $rat_op (i32.const 202800) (i32.const 198672) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 206928) (i32.const 215184) (i32.const 202800) (i32.const 2))
    (call $rat_op (i32.const 202800) (i32.const 204864) (i32.const 198672) (i32.const 2))
    (if (call $err) (then (return (call $err))))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 0))) (i32.const 200736) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 1))) (i32.const 196608) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 2))) (i32.const 206928) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 3))) (i32.const 202800) (i32.const 2064))
    (i32.const 0))
  (func
    (export "heat")
    (param $input i32)
    (param $output i32)
    (result i32)
    (if (i32.eqz (call $B_code_valid)) (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (i32.store (i32.const 0) (i32.const 0))
    (if (i32.gt_u (local.get $input) (i32.const 58)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.gt_u (local.get $output) (i32.const 62))
      (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 1)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 2)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 3)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 4)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 5)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 2))) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 3))) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 4))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 5))) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (memory.copy (i32.const 196608) (call $ep (i32.add (local.get $input) (i32.const 0))) (i32.const 2064))
    (memory.copy (i32.const 198672) (call $ep (i32.add (local.get $input) (i32.const 1))) (i32.const 2064))
    (memory.copy (i32.const 200736) (call $ep (i32.add (local.get $input) (i32.const 2))) (i32.const 2064))
    (memory.copy (i32.const 202800) (call $ep (i32.add (local.get $input) (i32.const 3))) (i32.const 2064))
    (memory.copy (i32.const 204864) (call $ep (i32.add (local.get $input) (i32.const 4))) (i32.const 2064))
    (memory.copy (i32.const 206928) (call $ep (i32.add (local.get $input) (i32.const 5))) (i32.const 2064))
    (call $rat_zero (i32.const 208992))
    (i32.store (i32.const 208992) (i32.const 0))
    (i32.store (i32.const 208996) (i32.const 0))
    (i32.store16 (i32.const 209008) (i32.const 0))
    (i32.store16 (i32.const 210032) (i32.const 1))
    (call $rat_op (i32.const 211056) (i32.const 208992) (i32.const 196608) (i32.const 0))
    (call $rat_op (i32.const 208992) (i32.const 211056) (i32.const 198672) (i32.const 0))
    (call $rat_op (i32.const 211056) (i32.const 200736) (i32.const 202800) (i32.const 0))
    (call $rat_op (i32.const 213120) (i32.const 208992) (i32.const 211056) (i32.const 3))
    (call $rat_op (i32.const 208992) (i32.const 196608) (i32.const 200736) (i32.const 3))
    (call $rat_op (i32.const 196608) (i32.const 198672) (i32.const 202800) (i32.const 3))
    (call $rat_op (i32.const 198672) (i32.const 208992) (i32.const 196608) (i32.const 1))
    (call $rat_zero (i32.const 196608))
    (i32.store (i32.const 196608) (i32.const 0))
    (i32.store (i32.const 196612) (i32.const 1))
    (i32.store16 (i32.const 196624) (i32.const 1))
    (i32.store16 (i32.const 197648) (i32.const 1))
    (call $rat_op (i32.const 208992) (i32.const 206928) (i32.const 204864) (i32.const 2))
    (call $rat_op (i32.const 204864) (i32.const 196608) (i32.const 200736) (i32.const 3))
    (call $rat_op (i32.const 206928) (i32.const 196608) (i32.const 202800) (i32.const 3))
    (call $rat_op (i32.const 215184) (i32.const 204864) (i32.const 206928) (i32.const 0))
    (call $rat_op (i32.const 204864) (i32.const 208992) (i32.const 215184) (i32.const 2))
    (call $rat_op (i32.const 206928) (i32.const 196608) (i32.const 204864) (i32.const 0))
    (call $rat_op (i32.const 196608) (i32.const 198672) (i32.const 206928) (i32.const 3))
    (call $rat_op (i32.const 198672) (i32.const 202800) (i32.const 196608) (i32.const 2))
    (call $rat_op (i32.const 204864) (i32.const 198672) (i32.const 211056) (i32.const 3))
    (call $rat_op (i32.const 198672) (i32.const 213120) (i32.const 204864) (i32.const 0))
    (call $rat_op (i32.const 204864) (i32.const 200736) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 198672) (i32.const 200736) (i32.const 196608) (i32.const 2))
    (call $rat_op (i32.const 196608) (i32.const 198672) (i32.const 211056) (i32.const 3))
    (call $rat_op (i32.const 198672) (i32.const 213120) (i32.const 196608) (i32.const 1))
    (call $rat_op (i32.const 196608) (i32.const 202800) (i32.const 198672) (i32.const 2))
    (if (call $err) (then (return (call $err))))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 0))) (i32.const 204864) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 1))) (i32.const 196608) (i32.const 2064))
    (i32.const 0))
  (func
    (export "energy")
    (param $input i32)
    (param $output i32)
    (result i32)
    (if (i32.eqz (call $B_code_valid)) (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (i32.store (i32.const 0) (i32.const 0))
    (if (i32.gt_u (local.get $input) (i32.const 58)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.gt_u (local.get $output) (i32.const 63))
      (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 1)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 2)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 3)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 4)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 5)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 2))) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 3))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (memory.copy (i32.const 196608) (call $ep (i32.add (local.get $input) (i32.const 0))) (i32.const 2064))
    (memory.copy (i32.const 198672) (call $ep (i32.add (local.get $input) (i32.const 1))) (i32.const 2064))
    (memory.copy (i32.const 200736) (call $ep (i32.add (local.get $input) (i32.const 2))) (i32.const 2064))
    (memory.copy (i32.const 202800) (call $ep (i32.add (local.get $input) (i32.const 3))) (i32.const 2064))
    (memory.copy (i32.const 204864) (call $ep (i32.add (local.get $input) (i32.const 4))) (i32.const 2064))
    (memory.copy (i32.const 206928) (call $ep (i32.add (local.get $input) (i32.const 5))) (i32.const 2064))
    (call $rat_op (i32.const 208992) (i32.const 196608) (i32.const 196608) (i32.const 2))
    (call $rat_op (i32.const 196608) (i32.const 202800) (i32.const 208992) (i32.const 2))
    (call $rat_op (i32.const 202800) (i32.const 198672) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 198672) (i32.const 202800) (i32.const 200736) (i32.const 3))
    (call $rat_op (i32.const 200736) (i32.const 196608) (i32.const 198672) (i32.const 0))
    (call $rat_zero (i32.const 196608))
    (i32.store (i32.const 196608) (i32.const 0))
    (i32.store (i32.const 196612) (i32.const 1))
    (i32.store16 (i32.const 196624) (i32.const 2))
    (i32.store16 (i32.const 197648) (i32.const 1))
    (call $rat_op (i32.const 198672) (i32.const 200736) (i32.const 196608) (i32.const 3))
    (call $rat_zero (i32.const 196608))
    (i32.store (i32.const 196608) (i32.const 0))
    (i32.store (i32.const 196612) (i32.const 0))
    (i32.store16 (i32.const 196624) (i32.const 0))
    (i32.store16 (i32.const 197648) (i32.const 1))
    (call $rat_op (i32.const 200736) (i32.const 196608) (i32.const 204864) (i32.const 0))
    (call $rat_op (i32.const 196608) (i32.const 200736) (i32.const 206928) (i32.const 0))
    (call $rat_op (i32.const 200736) (i32.const 198672) (i32.const 196608) (i32.const 0))
    (if (call $err) (then (return (call $err))))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 0))) (i32.const 200736) (i32.const 2064))
    (i32.const 0))
  (func
    (export "coupled")
    (param $input i32)
    (param $output i32)
    (param $params i32)
    (param $count i32)
    (param $bit i32)
    (result i32)
    (if (i32.eqz (call $B_code_valid)) (then (call $fail (i32.const 6)) (return (i32.const 6))))
    (i32.store (i32.const 0) (i32.const 0))
    (if (i32.gt_u (local.get $input) (i32.const 51)) (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.gt_u (local.get $output) (i32.const 36))
      (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.gt_u (local.get $params) (i32.const 59))
      (then (call $fail (i32.const 1)) (return (i32.const 1))))
    (if
      (i32.or (i32.gt_u (local.get $count) (i32.const 9)) (i32.gt_u (local.get $bit) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i64.eq (i64.load (i32.const 8)) (i64.const -1))
      (then (call $fail (i32.const 5)) (return (i32.const 5))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $params) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $params) (i32.const 1)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $params) (i32.const 2)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $params) (i32.const 3)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $params) (i32.const 4)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $params) (i32.const 0))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $params) (i32.const 2))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $params) (i32.const 3))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $params) (i32.const 4))) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 0)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 1)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 2)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 3)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 4)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 5)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 6)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 7)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 8)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 9)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 10)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 11)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $canonical (call $ep (i32.add (local.get $input) (i32.const 12)))))
      (then (call $fail (i32.const 2)) (return (i32.const 2))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 2))) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 3))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 4))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 5))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 6))) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 7))) (i32.const 1)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (if
      (i32.eqz (call $domain (call $ep (i32.add (local.get $input) (i32.const 8))) (i32.const 0)))
      (then (call $fail (i32.const 3)) (return (i32.const 3))))
    (memory.copy (i32.const 196608) (call $ep (i32.add (local.get $input) (i32.const 0))) (i32.const 2064))
    (memory.copy (i32.const 198672) (call $ep (i32.add (local.get $input) (i32.const 1))) (i32.const 2064))
    (memory.copy (i32.const 200736) (call $ep (i32.add (local.get $input) (i32.const 2))) (i32.const 2064))
    (memory.copy (i32.const 202800) (call $ep (i32.add (local.get $input) (i32.const 3))) (i32.const 2064))
    (memory.copy (i32.const 204864) (call $ep (i32.add (local.get $input) (i32.const 4))) (i32.const 2064))
    (memory.copy (i32.const 206928) (call $ep (i32.add (local.get $input) (i32.const 5))) (i32.const 2064))
    (memory.copy (i32.const 208992) (call $ep (i32.add (local.get $input) (i32.const 6))) (i32.const 2064))
    (memory.copy (i32.const 211056) (call $ep (i32.add (local.get $input) (i32.const 7))) (i32.const 2064))
    (memory.copy (i32.const 213120) (call $ep (i32.add (local.get $input) (i32.const 8))) (i32.const 2064))
    (memory.copy (i32.const 215184) (call $ep (i32.add (local.get $input) (i32.const 9))) (i32.const 2064))
    (memory.copy (i32.const 217248) (call $ep (i32.add (local.get $input) (i32.const 10))) (i32.const 2064))
    (memory.copy (i32.const 219312) (call $ep (i32.add (local.get $input) (i32.const 11))) (i32.const 2064))
    (memory.copy (i32.const 221376) (call $ep (i32.add (local.get $input) (i32.const 12))) (i32.const 2064))
    (memory.copy (i32.const 223440) (call $ep (i32.add (local.get $params) (i32.const 0))) (i32.const 2064))
    (memory.copy (i32.const 225504) (call $ep (i32.add (local.get $params) (i32.const 1))) (i32.const 2064))
    (memory.copy (i32.const 227568) (call $ep (i32.add (local.get $params) (i32.const 2))) (i32.const 2064))
    (memory.copy (i32.const 229632) (call $ep (i32.add (local.get $params) (i32.const 3))) (i32.const 2064))
    (memory.copy (i32.const 231696) (call $ep (i32.add (local.get $params) (i32.const 4))) (i32.const 2064))
    (call $rat_op (i32.const 233760) (i32.const 196608) (i32.const 196608) (i32.const 2))
    (call $rat_op (i32.const 235824) (i32.const 202800) (i32.const 233760) (i32.const 2))
    (call $rat_op (i32.const 237888) (i32.const 198672) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 239952) (i32.const 237888) (i32.const 200736) (i32.const 3))
    (call $rat_op (i32.const 237888) (i32.const 235824) (i32.const 239952) (i32.const 0))
    (call $rat_zero (i32.const 235824))
    (i32.store (i32.const 235824) (i32.const 0))
    (i32.store (i32.const 235828) (i32.const 1))
    (i32.store16 (i32.const 235840) (i32.const 2))
    (i32.store16 (i32.const 236864) (i32.const 1))
    (call $rat_op (i32.const 242016) (i32.const 237888) (i32.const 235824) (i32.const 3))
    (call $rat_zero (i32.const 237888))
    (i32.store (i32.const 237888) (i32.const 0))
    (i32.store (i32.const 237892) (i32.const 0))
    (i32.store16 (i32.const 237904) (i32.const 0))
    (i32.store16 (i32.const 238928) (i32.const 1))
    (call $rat_op (i32.const 244080) (i32.const 237888) (i32.const 204864) (i32.const 0))
    (call $rat_op (i32.const 246144) (i32.const 244080) (i32.const 206928) (i32.const 0))
    (call $rat_op (i32.const 244080) (i32.const 242016) (i32.const 246144) (i32.const 0))
    (call $rat_op (i32.const 242016) (i32.const 223440) (i32.const 202800) (i32.const 1))
    (call $rat_op (i32.const 202800) (i32.const 242016) (i32.const 233760) (i32.const 2))
    (call $rat_op (i32.const 242016) (i32.const 202800) (i32.const 235824) (i32.const 3))
    (call $rat_op (i32.const 202800) (i32.const 215184) (i32.const 242016) (i32.const 0))
    (call $rat_op (i32.const 215184) (i32.const 237888) (i32.const 242016) (i32.const 0))
    (call $rat_op (i32.const 248208) (i32.const 223440) (i32.const 233760) (i32.const 2))
    (call $rat_op (i32.const 233760) (i32.const 248208) (i32.const 239952) (i32.const 0))
    (call $rat_op (i32.const 239952) (i32.const 233760) (i32.const 235824) (i32.const 3))
    (call $rat_op (i32.const 233760) (i32.const 239952) (i32.const 246144) (i32.const 0))
    (call $rat_op (i32.const 239952) (i32.const 233760) (i32.const 244080) (i32.const 1))
    (call $rat_op (i32.const 233760) (i32.const 239952) (i32.const 215184) (i32.const 1))
    (call $rat_zero (i32.const 239952))
    (i32.store (i32.const 239952) (i32.const 0))
    (i32.store (i32.const 239956) (i32.const 0))
    (i32.store16 (i32.const 239968) (i32.const 0))
    (i32.store16 (i32.const 240992) (i32.const 1))
    (i32.store16 (i32.const 239968) (call $L_id16 (local.get $count)))
    (i32.store (i32.const 239956) (call $L_ne (local.get $count) (i32.const 0)))
    (call $rat_zero (i32.const 246144))
    (i32.store (i32.const 246144) (i32.const 0))
    (i32.store (i32.const 246148) (i32.const 1))
    (i32.store16 (i32.const 246160) (i32.const 9))
    (i32.store16 (i32.const 247184) (i32.const 1))
    (call $rat_op (i32.const 248208) (i32.const 239952) (i32.const 246144) (i32.const 3))
    (call $rat_zero (i32.const 239952))
    (i32.store (i32.const 239952) (i32.const 0))
    (i32.store (i32.const 239956) (i32.const 1))
    (i32.store16 (i32.const 239968) (i32.const 1))
    (i32.store16 (i32.const 240992) (i32.const 4))
    (call $rat_zero (i32.const 246144))
    (i32.store (i32.const 246144) (i32.const 0))
    (i32.store (i32.const 246148) (i32.const 1))
    (i32.store16 (i32.const 246160) (i32.const 5))
    (i32.store16 (i32.const 247184) (i32.const 1))
    (call $rat_op (i32.const 250272) (i32.const 248208) (i32.const 246144) (i32.const 3))
    (call $rat_op (i32.const 246144) (i32.const 239952) (i32.const 250272) (i32.const 0))
    (call $rat_zero (i32.const 239952))
    (i32.store (i32.const 239952) (i32.const 0))
    (i32.store (i32.const 239956) (i32.const 0))
    (i32.store16 (i32.const 239968) (i32.const 0))
    (i32.store16 (i32.const 240992) (i32.const 1))
    (i32.store16 (i32.const 239968) (call $L_id16 (local.get $bit)))
    (i32.store (i32.const 239956) (call $L_ne (local.get $bit) (i32.const 0)))
    (call $rat_zero (i32.const 248208))
    (i32.store (i32.const 248208) (i32.const 0))
    (i32.store (i32.const 248212) (i32.const 1))
    (i32.store16 (i32.const 248224) (i32.const 10))
    (i32.store16 (i32.const 249248) (i32.const 1))
    (call $rat_op (i32.const 250272) (i32.const 239952) (i32.const 248208) (i32.const 3))
    (call $rat_op (i32.const 239952) (i32.const 229632) (i32.const 250272) (i32.const 0))
    (call $rat_zero (i32.const 229632))
    (i32.store (i32.const 229632) (i32.const 0))
    (i32.store (i32.const 229636) (i32.const 1))
    (i32.store16 (i32.const 229648) (i32.const 1))
    (i32.store16 (i32.const 230672) (i32.const 3))
    (call $rat_op (i32.const 248208) (i32.const 235824) (i32.const 200736) (i32.const 2))
    (call $rat_op (i32.const 250272) (i32.const 231696) (i32.const 248208) (i32.const 3))
    (call $rat_op (i32.const 252336) (i32.const 231696) (i32.const 223440) (i32.const 2))
    (call $rat_op (i32.const 254400) (i32.const 252336) (i32.const 235824) (i32.const 3))
    (call $rat_zero (i32.const 252336))
    (i32.store (i32.const 252336) (i32.const 0))
    (i32.store (i32.const 252340) (i32.const 1))
    (i32.store16 (i32.const 252352) (i32.const 1))
    (i32.store16 (i32.const 253376) (i32.const 1))
    (call $rat_op (i32.const 256464) (i32.const 231696) (i32.const 229632) (i32.const 2))
    (call $rat_op (i32.const 229632) (i32.const 256464) (i32.const 248208) (i32.const 3))
    (call $rat_op (i32.const 258528) (i32.const 252336) (i32.const 229632) (i32.const 0))
    (call $rat_op (i32.const 260592) (i32.const 250272) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 262656) (i32.const 196608) (i32.const 260592) (i32.const 0))
    (call $rat_op (i32.const 260592) (i32.const 237888) (i32.const 254400) (i32.const 1))
    (call $rat_op (i32.const 264720) (i32.const 260592) (i32.const 196608) (i32.const 2))
    (call $rat_op (i32.const 196608) (i32.const 252336) (i32.const 229632) (i32.const 1))
    (call $rat_op (i32.const 229632) (i32.const 196608) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 196608) (i32.const 264720) (i32.const 229632) (i32.const 0))
    (call $rat_op (i32.const 229632) (i32.const 231696) (i32.const 225504) (i32.const 2))
    (call $rat_op (i32.const 225504) (i32.const 196608) (i32.const 229632) (i32.const 0))
    (call $rat_op (i32.const 196608) (i32.const 254400) (i32.const 262656) (i32.const 2))
    (call $rat_op (i32.const 260592) (i32.const 225504) (i32.const 196608) (i32.const 1))
    (call $rat_op (i32.const 196608) (i32.const 250272) (i32.const 254400) (i32.const 2))
    (call $rat_op (i32.const 225504) (i32.const 258528) (i32.const 196608) (i32.const 0))
    (call $rat_op (i32.const 196608) (i32.const 260592) (i32.const 225504) (i32.const 3))
    (call $rat_op (i32.const 225504) (i32.const 250272) (i32.const 196608) (i32.const 2))
    (call $rat_op (i32.const 250272) (i32.const 262656) (i32.const 225504) (i32.const 0))
    (call $rat_op (i32.const 225504) (i32.const 198672) (i32.const 196608) (i32.const 0))
    (call $rat_op (i32.const 198672) (i32.const 225504) (i32.const 248208) (i32.const 3))
    (call $rat_op (i32.const 225504) (i32.const 198672) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 248208) (i32.const 256464) (i32.const 225504) (i32.const 2))
    (call $rat_op (i32.const 225504) (i32.const 229632) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 198672) (i32.const 204864) (i32.const 248208) (i32.const 0))
    (call $rat_op (i32.const 204864) (i32.const 217248) (i32.const 225504) (i32.const 0))
    (call $rat_op (i32.const 217248) (i32.const 215184) (i32.const 225504) (i32.const 0))
    (call $rat_op (i32.const 215184) (i32.const 250272) (i32.const 250272) (i32.const 2))
    (call $rat_op (i32.const 229632) (i32.const 223440) (i32.const 215184) (i32.const 2))
    (call $rat_op (i32.const 215184) (i32.const 196608) (i32.const 196608) (i32.const 2))
    (call $rat_op (i32.const 248208) (i32.const 215184) (i32.const 200736) (i32.const 3))
    (call $rat_op (i32.const 215184) (i32.const 229632) (i32.const 248208) (i32.const 0))
    (call $rat_op (i32.const 229632) (i32.const 215184) (i32.const 235824) (i32.const 3))
    (call $rat_op (i32.const 215184) (i32.const 237888) (i32.const 198672) (i32.const 0))
    (call $rat_op (i32.const 235824) (i32.const 215184) (i32.const 206928) (i32.const 0))
    (call $rat_op (i32.const 248208) (i32.const 229632) (i32.const 235824) (i32.const 0))
    (call $rat_op (i32.const 235824) (i32.const 248208) (i32.const 244080) (i32.const 1))
    (call $rat_op (i32.const 248208) (i32.const 235824) (i32.const 217248) (i32.const 1))
    (call $rat_op (i32.const 235824) (i32.const 231696) (i32.const 227568) (i32.const 2))
    (call $rat_op (i32.const 227568) (i32.const 252336) (i32.const 246144) (i32.const 0))
    (call $rat_op (i32.const 254400) (i32.const 235824) (i32.const 227568) (i32.const 3))
    (call $rat_op (i32.const 227568) (i32.const 235824) (i32.const 254400) (i32.const 1))
    (call $rat_op (i32.const 256464) (i32.const 206928) (i32.const 227568) (i32.const 0))
    (call $rat_op (i32.const 206928) (i32.const 219312) (i32.const 235824) (i32.const 0))
    (call $rat_op (i32.const 219312) (i32.const 221376) (i32.const 254400) (i32.const 0))
    (call $rat_op (i32.const 221376) (i32.const 217248) (i32.const 227568) (i32.const 0))
    (call $rat_op (i32.const 217248) (i32.const 215184) (i32.const 256464) (i32.const 0))
    (call $rat_op (i32.const 215184) (i32.const 229632) (i32.const 217248) (i32.const 0))
    (call $rat_op (i32.const 227568) (i32.const 215184) (i32.const 244080) (i32.const 1))
    (call $rat_op (i32.const 215184) (i32.const 227568) (i32.const 221376) (i32.const 1))
    (call $rat_op (i32.const 227568) (i32.const 208992) (i32.const 211056) (i32.const 0))
    (call $rat_op (i32.const 258528) (i32.const 217248) (i32.const 227568) (i32.const 3))
    (call $rat_op (i32.const 217248) (i32.const 198672) (i32.const 208992) (i32.const 3))
    (call $rat_op (i32.const 198672) (i32.const 256464) (i32.const 211056) (i32.const 3))
    (call $rat_op (i32.const 256464) (i32.const 217248) (i32.const 198672) (i32.const 1))
    (call $rat_op (i32.const 198672) (i32.const 231696) (i32.const 239952) (i32.const 2))
    (call $rat_op (i32.const 217248) (i32.const 252336) (i32.const 208992) (i32.const 3))
    (call $rat_op (i32.const 260592) (i32.const 252336) (i32.const 211056) (i32.const 3))
    (call $rat_op (i32.const 262656) (i32.const 217248) (i32.const 260592) (i32.const 0))
    (call $rat_op (i32.const 217248) (i32.const 198672) (i32.const 262656) (i32.const 2))
    (call $rat_op (i32.const 198672) (i32.const 252336) (i32.const 217248) (i32.const 0))
    (call $rat_op (i32.const 217248) (i32.const 256464) (i32.const 198672) (i32.const 3))
    (call $rat_op (i32.const 198672) (i32.const 211056) (i32.const 217248) (i32.const 2))
    (call $rat_op (i32.const 252336) (i32.const 198672) (i32.const 227568) (i32.const 3))
    (call $rat_op (i32.const 198672) (i32.const 258528) (i32.const 252336) (i32.const 0))
    (call $rat_op (i32.const 252336) (i32.const 208992) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 198672) (i32.const 208992) (i32.const 217248) (i32.const 2))
    (call $rat_op (i32.const 217248) (i32.const 198672) (i32.const 227568) (i32.const 3))
    (call $rat_op (i32.const 198672) (i32.const 258528) (i32.const 217248) (i32.const 1))
    (call $rat_op (i32.const 217248) (i32.const 211056) (i32.const 198672) (i32.const 2))
    (call $rat_op (i32.const 198672) (i32.const 237888) (i32.const 252336) (i32.const 0))
    (call $rat_op (i32.const 227568) (i32.const 198672) (i32.const 217248) (i32.const 0))
    (call $rat_op (i32.const 198672) (i32.const 229632) (i32.const 227568) (i32.const 0))
    (call $rat_op (i32.const 227568) (i32.const 198672) (i32.const 244080) (i32.const 1))
    (call $rat_op (i32.const 229632) (i32.const 227568) (i32.const 221376) (i32.const 1))
    (call $rat_op (i32.const 221376) (i32.const 213120) (i32.const 231696) (i32.const 0))
    (call $rat_op (i32.const 213120) (i32.const 227568) (i32.const 242016) (i32.const 1))
    (call $rat_op (i32.const 227568) (i32.const 213120) (i32.const 225504) (i32.const 1))
    (call $rat_op (i32.const 213120) (i32.const 227568) (i32.const 235824) (i32.const 1))
    (call $rat_op (i32.const 225504) (i32.const 213120) (i32.const 254400) (i32.const 0))
    (if (call $err) (then (return (call $err))))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 0))) (i32.const 250272) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 1))) (i32.const 196608) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 2))) (i32.const 200736) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 3))) (i32.const 223440) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 4))) (i32.const 252336) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 5))) (i32.const 217248) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 6))) (i32.const 208992) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 7))) (i32.const 211056) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 8))) (i32.const 221376) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 9))) (i32.const 202800) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 10))) (i32.const 204864) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 11))) (i32.const 206928) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 12))) (i32.const 219312) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 13))) (i32.const 242016) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 14))) (i32.const 246144) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 15))) (i32.const 239952) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 16))) (i32.const 235824) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 17))) (i32.const 254400) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 18))) (i32.const 244080) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 19))) (i32.const 198672) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 20))) (i32.const 225504) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 21))) (i32.const 233760) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 22))) (i32.const 233760) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 23))) (i32.const 248208) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 24))) (i32.const 215184) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 25))) (i32.const 229632) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 26))) (i32.const 229632) (i32.const 2064))
    (memory.copy (call $ep (i32.add (local.get $output) (i32.const 27))) (i32.const 229632) (i32.const 2064))
    (i64.store (i32.const 8) (call $L_add64 (i64.load (i32.const 8)) (i64.const 1)))
    (i32.const 0))
  (func $B_code_valid
    (result i32)
    (local $bad i32)
    (local.set $bad (i32.ne (i32.load (i32.add (i32.const 900000) (i32.const 136))) (i32.const 0x424c4131)))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 900000) (i32.const 128))) (i32.const 6))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 900000) (i32.const 129))) (i32.const 8))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 900000) (i32.const 130))) (i32.const 14))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 900000) (i32.const 131))) (i32.const 1))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 900000) (i32.const 132))) (i32.const 150))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 900000) (i32.const 133))) (i32.const 232))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 900000) (i32.const 134))) (i32.const 2))))
    (local.set $bad
      (i32.or
        (local.get $bad)
        (i32.ne (i32.load8_u (i32.add (i32.const 900000) (i32.const 135))) (i32.const 9))))
    (i32.eqz (local.get $bad)))
  (func $B_lut
    (param $table i32)
    (param $address i32)
    (result i32)
    (i32.and
      (i32.shr_u
        (i32.load8_u (i32.add (i32.const 900000) (i32.add (i32.const 128) (local.get $table))))
        (local.get $address))
      (i32.const 1)))
  (func $B_address2
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.or (i32.shl (local.get $a) (i32.const 1)) (local.get $b)))
  (func $B_address3
    (param $a i32)
    (param $b i32)
    (param $c i32)
    (result i32)
    (i32.or
      (i32.shl (local.get $a) (i32.const 2))
      (i32.or (i32.shl (local.get $b) (i32.const 1)) (local.get $c))))
  (func $B_get_bit
    (param $base i32)
    (param $i i32)
    (result i32)
    (i32.and
      (i32.shr_u
        (i32.load8_u
          (i32.add (i32.const 900000) (i32.add (local.get $base) (i32.shr_u (local.get $i) (i32.const 3)))))
        (i32.and (local.get $i) (i32.const 7)))
      (i32.const 1)))
  (func $B_emit_bit
    (param $base i32)
    (param $i i32)
    (param $table i32)
    (param $address i32)
    (local $bit i32)
    (local $byte i32)
    (local $shift i32)
    (local $mask i32)
    (local.set $bit (call $B_lut (local.get $table) (local.get $address)))
    (local.set $byte (i32.add (local.get $base) (i32.shr_u (local.get $i) (i32.const 3))))
    (local.set $shift (i32.and (local.get $i) (i32.const 7)))
    (local.set $mask (i32.shl (i32.const 1) (local.get $shift)))
    (i32.store8
      (i32.add (i32.const 900000) (local.get $byte))
      (i32.or
        (i32.and
          (i32.load8_u (i32.add (i32.const 900000) (local.get $byte)))
          (i32.sub (i32.const 255) (local.get $mask)))
        (i32.shl (local.get $bit) (local.get $shift)))))
  (func $B_valid
    (param $n i32)
    (result i32)
    (local $i i32)
    (if (i32.eqz (call $B_code_valid)) (then (return (i32.const 1))))
    (if
      (i32.or (i32.lt_u (local.get $n) (i32.const 1)) (i32.gt_u (local.get $n) (i32.const 64)))
      (then (return (i32.const 2))))
    (local.set $i (local.get $n))
    (block $done
      (loop $padding
        (br_if $done (i32.ge_u (local.get $i) (i32.const 64)))
        (if
          (i32.or
            (call $B_get_bit (i32.const 0) (local.get $i))
            (call $B_get_bit (i32.const 8) (local.get $i)))
          (then (return (i32.const 3))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $padding)))
    (i32.const 0))
  (func $B_clear
    (memory.fill (i32.add (i32.const 900000) (i32.const 16)) (i32.const 0) (i32.const 16))
    (memory.fill (i32.add (i32.const 900000) (i32.const 64)) (i32.const 0) (i32.const 8)))
  (func $B_arithmetic
    (param $n i32)
    (param $mode i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local $a i32)
    (local $b i32)
    (local $carry i32)
    (local $address i32)
    (call $B_clear)
    (if (local.get $mode) (then (local.set $carry (i32.const 1))))
    (block $done
      (loop $ripple
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $a (call $B_get_bit (i32.const 0) (local.get $i)))
        (local.set $b (call $B_get_bit (i32.const 8) (local.get $i)))
        (if
          (i32.eq (local.get $mode) (i32.const 1))
          (then (local.set $b (call $B_lut (i32.const 3) (local.get $b)))))
        (if
          (i32.eq (local.get $mode) (i32.const 2))
          (then (local.set $b (call $B_lut (i32.const 3) (local.get $a))) (local.set $a (i32.const 0))))
        (local.set $address (call $B_address3 (local.get $a) (local.get $b) (local.get $carry)))
        (call $B_emit_bit (i32.const 16) (local.get $i) (i32.const 4) (local.get $address))
        (local.set $carry (call $B_lut (i32.const 5) (local.get $address)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $ripple)))
    (call $B_emit_bit (i32.const 24) (i32.const 0) (i32.const 6) (local.get $carry))
    (i32.store8 (i32.add (i32.const 900000) (i32.const 25)) (i32.const 1))
    (i32.const 0))
  (func $B_add (param $n i32) (result i32) (call $B_arithmetic (local.get $n) (i32.const 0)))
  (func $B_sub (param $n i32) (result i32) (call $B_arithmetic (local.get $n) (i32.const 1)))
  (func $B_neg (param $n i32) (result i32) (call $B_arithmetic (local.get $n) (i32.const 2)))
  (func $B_logical
    (param $n i32)
    (param $table i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (call $B_clear)
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (call $B_emit_bit
          (i32.const 16)
          (local.get $i)
          (local.get $table)
          (call $B_address2
            (call $B_get_bit (i32.const 0) (local.get $i))
            (call $B_get_bit (i32.const 8) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (i32.const 0))
  (func $B_and (param $n i32) (result i32) (call $B_logical (local.get $n) (i32.const 1)))
  (func $B_or (param $n i32) (result i32) (call $B_logical (local.get $n) (i32.const 2)))
  (func $B_xor (param $n i32) (result i32) (call $B_logical (local.get $n) (i32.const 0)))
  (func $B_mul
    (param $n i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local $j i32)
    (local $partial i32)
    (local $carry i32)
    (local $address i32)
    (call $B_clear)
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
                  (call $B_lut
                    (i32.const 1)
                    (call $B_address2
                      (call $B_get_bit (i32.const 0) (i32.sub (local.get $i) (local.get $j)))
                      (call $B_get_bit (i32.const 8) (local.get $j)))))))
            (local.set $address
              (call $B_address3
                (call $B_get_bit (i32.const 64) (local.get $i))
                (local.get $partial)
                (local.get $carry)))
            (call $B_emit_bit (i32.const 64) (local.get $i) (i32.const 4) (local.get $address))
            (local.set $carry (call $B_lut (i32.const 5) (local.get $address)))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $inner)))
        (local.set $j (i32.add (local.get $j) (i32.const 1)))
        (br $outer)))
    (local.set $i (i32.const 0))
    (block $copy_done
      (loop $copy
        (br_if $copy_done (i32.ge_u (local.get $i) (local.get $n)))
        (call $B_emit_bit
          (i32.const 16)
          (local.get $i)
          (i32.const 6)
          (call $B_get_bit (i32.const 64) (local.get $i)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $copy)))
    (i32.const 0))
  (func $B_mul16x16
    (param $n i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local $j i32)
    (local $partial i32)
    (local $carry i32)
    (local $address i32)
    (call $B_clear)
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_u (local.get $j) (i32.const 16)))
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
                  (call $B_lut
                    (i32.const 1)
                    (call $B_address2
                      (call $B_get_bit (i32.const 0) (i32.sub (local.get $i) (local.get $j)))
                      (call $B_get_bit (i32.const 8) (local.get $j)))))))
            (local.set $address
              (call $B_address3
                (call $B_get_bit (i32.const 64) (local.get $i))
                (local.get $partial)
                (local.get $carry)))
            (call $B_emit_bit (i32.const 64) (local.get $i) (i32.const 4) (local.get $address))
            (local.set $carry (call $B_lut (i32.const 5) (local.get $address)))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $inner)))
        (local.set $j (i32.add (local.get $j) (i32.const 1)))
        (br $outer)))
    (local.set $i (i32.const 0))
    (block $copy_done
      (loop $copy
        (br_if $copy_done (i32.ge_u (local.get $i) (local.get $n)))
        (call $B_emit_bit
          (i32.const 16)
          (local.get $i)
          (i32.const 6)
          (call $B_get_bit (i32.const 64) (local.get $i)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $copy)))
    (i32.const 0))
  (func $B_rotl
    (param $n i32)
    (param $count i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local $source i32)
    (local $r i32)
    (call $B_clear)
    (local.set $r (i32.rem_u (local.get $count) (local.get $n)))
    (block $done
      (loop $rotate
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $source
          (i32.rem_u (i32.sub (i32.add (local.get $i) (local.get $n)) (local.get $r)) (local.get $n)))
        (call $B_emit_bit
          (i32.const 16)
          (local.get $i)
          (i32.const 6)
          (call $B_get_bit (i32.const 0) (local.get $source)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $rotate)))
    (i32.const 0))
  (func $B_shift
    (param $n i32)
    (param $count i32)
    (param $mode i32)
    (result i32)
    (local $status i32)
    (local $i i32)
    (local $source i32)
    (local $r i32)
    (local $bit i32)
    (call $B_clear)
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
              (then (local.set $bit (call $B_get_bit (i32.const 0) (i32.sub (local.get $i) (local.get $r)))))))
          (else
            (local.set $source (i32.add (local.get $i) (local.get $r)))
            (if
              (i32.lt_u (local.get $source) (local.get $n))
              (then (local.set $bit (call $B_get_bit (i32.const 0) (local.get $source))))
              (else
                (if
                  (i32.eq (local.get $mode) (i32.const 2))
                  (then
                    (local.set $bit (call $B_get_bit (i32.const 0) (i32.sub (local.get $n) (i32.const 1))))))))))
        (call $B_emit_bit (i32.const 16) (local.get $i) (i32.const 6) (local.get $bit))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $shift_loop)))
    (i32.const 0))
  (func $B_shl
    (param $n i32)
    (param $count i32)
    (result i32)
    (call $B_shift (local.get $n) (local.get $count) (i32.const 0)))
  (func $B_shr_u
    (param $n i32)
    (param $count i32)
    (result i32)
    (call $B_shift (local.get $n) (local.get $count) (i32.const 1)))
  (func $B_shr_s
    (param $n i32)
    (param $count i32)
    (result i32)
    (call $B_shift (local.get $n) (local.get $count) (i32.const 2)))
  (func $B_compare
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
    (call $B_clear)
    (local.set $equal (i32.const 1))
    (local.set $i (local.get $n))
    (block $done
      (loop $cmp
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $a (call $B_get_bit (i32.const 0) (local.get $i)))
        (local.set $b (call $B_get_bit (i32.const 8) (local.get $i)))
        (local.set $different
          (call $B_lut
            (i32.const 1)
            (call $B_address2 (call $B_lut (i32.const 3) (local.get $a)) (local.get $b))))
        (local.set $less
          (call $B_lut
            (i32.const 2)
            (call $B_address2
              (local.get $less)
              (call $B_lut (i32.const 1) (call $B_address2 (local.get $equal) (local.get $different))))))
        (local.set $equal
          (call $B_lut
            (i32.const 1)
            (call $B_address2
              (local.get $equal)
              (call $B_lut (i32.const 7) (call $B_address2 (local.get $a) (local.get $b))))))
        (br $cmp)))
    (local.set $result (local.get $less))
    (if
      (i32.eq (local.get $mode) (i32.const 1))
      (then
        (local.set $a (call $B_get_bit (i32.const 0) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $b (call $B_get_bit (i32.const 8) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $sign (call $B_lut (i32.const 0) (call $B_address2 (local.get $a) (local.get $b))))
        (local.set $result
          (call $B_lut
            (i32.const 2)
            (call $B_address2
              (call $B_lut (i32.const 1) (call $B_address2 (local.get $sign) (local.get $a)))
              (call $B_lut
                (i32.const 1)
                (call $B_address2 (call $B_lut (i32.const 3) (local.get $sign)) (local.get $less))))))))
    (if (i32.eq (local.get $mode) (i32.const 2)) (then (local.set $result (local.get $equal))))
    (call $B_emit_bit (i32.const 16) (i32.const 0) (i32.const 6) (local.get $result))
    (i32.const 0))
  (func $B_ltu (param $n i32) (result i32) (call $B_compare (local.get $n) (i32.const 0)))
  (func $B_lts (param $n i32) (result i32) (call $B_compare (local.get $n) (i32.const 1)))
  (func $B_eq (param $n i32) (result i32) (call $B_compare (local.get $n) (i32.const 2)))
  (func $B_tomk_mix32
    (result i32)
    (local $status i32)
    (local.set $status (call $B_valid (i32.const 32)))
    (if (local.get $status) (then (return (local.get $status))))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 80))
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.const 8))
    (drop (call $B_shift (i32.const 32) (i32.const 16) (i32.const 1)))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 8))
      (i32.add (i32.const 900000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.add (i32.const 900000) (i32.const 80))
      (i32.const 8))
    (drop (call $B_xor (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.add (i32.const 900000) (i32.const 16))
      (i32.const 8))
    (i32.store (i32.add (i32.const 900000) (i32.const 8)) (i32.const 0x7feb352d))
    (i32.store (i32.add (i32.const 900000) (i32.const 12)) (i32.const 0))
    (drop (call $B_mul (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.add (i32.const 900000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 80))
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.const 8))
    (drop (call $B_shift (i32.const 32) (i32.const 15) (i32.const 1)))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 8))
      (i32.add (i32.const 900000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.add (i32.const 900000) (i32.const 80))
      (i32.const 8))
    (drop (call $B_xor (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.add (i32.const 900000) (i32.const 16))
      (i32.const 8))
    (i32.store (i32.add (i32.const 900000) (i32.const 8)) (i32.const 0x846ca68b))
    (i32.store (i32.add (i32.const 900000) (i32.const 12)) (i32.const 0))
    (drop (call $B_mul (i32.const 32)))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.add (i32.const 900000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 80))
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.const 8))
    (drop (call $B_shift (i32.const 32) (i32.const 16) (i32.const 1)))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 8))
      (i32.add (i32.const 900000) (i32.const 16))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.add (i32.const 900000) (i32.const 80))
      (i32.const 8))
    (drop (call $B_xor (i32.const 32)))
    (i32.const 0))
  (func $B_add32 (result i32) (call $B_add (i32.const 32)))
  (func $B_add64 (result i32) (call $B_add (i32.const 64)))
  (func $B_sub32 (result i32) (call $B_sub (i32.const 32)))
  (func $B_sub64 (result i32) (call $B_sub (i32.const 64)))
  (func $B_neg32 (result i32) (call $B_neg (i32.const 32)))
  (func $B_neg64 (result i32) (call $B_neg (i32.const 64)))
  (func $B_mul32 (result i32) (call $B_mul (i32.const 32)))
  (func $B_mul64 (result i32) (call $B_mul (i32.const 64)))
  (func $D_word_zero
    (param $p i32)
    (param $n i32)
    (result i32)
    (local $i i32)
    (local $any i32)
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $any
          (call $B_lut
            (i32.const 2)
            (call $B_address2 (local.get $any) (call $B_get_bit (local.get $p) (local.get $i)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (call $B_lut (i32.const 3) (local.get $any)))
  (func $D_word_min
    (param $p i32)
    (param $n i32)
    (result i32)
    (local $i i32)
    (local $any i32)
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $any
          (call $B_lut
            (i32.const 2)
            (call $B_address2 (local.get $any) (call $B_get_bit (local.get $p) (local.get $i)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (call $B_lut
      (i32.const 1)
      (call $B_address2
        (call $B_lut (i32.const 3) (local.get $any))
        (call $B_get_bit (local.get $p) (i32.sub (local.get $n) (i32.const 1))))))
  (func $D_word_ones
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
          (call $B_lut
            (i32.const 1)
            (call $B_address2 (local.get $all) (call $B_get_bit (local.get $p) (local.get $i)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again)))
    (local.get $all))
  (func $D_emit_word
    (param $dst i32)
    (param $src i32)
    (param $n i32)
    (local $i i32)
    (memory.fill (i32.add (i32.const 900000) (local.get $dst)) (i32.const 0) (i32.const 8))
    (block $done
      (loop $again
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (call $B_emit_bit
          (local.get $dst)
          (local.get $i)
          (i32.const 6)
          (call $B_get_bit (local.get $src) (local.get $i)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $again))))
  (func $D_neg_word
    (param $p i32)
    (param $n i32)
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.add (i32.const 900000) (local.get $p))
      (i32.const 8))
    (memory.fill (i32.add (i32.const 900000) (i32.const 8)) (i32.const 0) (i32.const 8))
    (drop (call $B_neg (local.get $n)))
    (memory.copy
      (i32.add (i32.const 900000) (local.get $p))
      (i32.add (i32.const 900000) (i32.const 16))
      (i32.const 8)))
  (func $D_remainder_digit
    (param $n i32)
    (param $b i32)
    (param $bit i32)
    (result i32)
    (local $j i32)
    (local $high i32)
    (local $qbit i32)
    (local $incoming i32)
    (local.set $high (call $B_get_bit (i32.const 536) (i32.sub (local.get $n) (i32.const 1))))
    (memory.fill (i32.add (i32.const 900000) (i32.const 544)) (i32.const 0) (i32.const 8))
    (block $done
      (loop $shift
        (br_if $done (i32.ge_u (local.get $j) (local.get $n)))
        (local.set $incoming
          (if
            (result i32)
            (i32.eqz (local.get $j))
            (then (local.get $bit))
            (else (call $B_get_bit (i32.const 536) (i32.sub (local.get $j) (i32.const 1))))))
        (call $B_emit_bit (i32.const 544) (local.get $j) (i32.const 6) (local.get $incoming))
        (local.set $j (i32.add (local.get $j) (i32.const 1)))
        (br $shift)))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.add (i32.const 900000) (i32.const 544))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 8))
      (i32.add (i32.const 900000) (local.get $b))
      (i32.const 8))
    (drop (call $B_sub (local.get $n)))
    (local.set $qbit
      (call $B_lut
        (i32.const 2)
        (call $B_address2 (local.get $high) (call $B_get_bit (i32.const 24) (i32.const 0)))))
    (if
      (local.get $qbit)
      (then
        (memory.copy
          (i32.add (i32.const 900000) (i32.const 536))
          (i32.add (i32.const 900000) (i32.const 16))
          (i32.const 8)))
      (else
        (memory.copy
          (i32.add (i32.const 900000) (i32.const 536))
          (i32.add (i32.const 900000) (i32.const 544))
          (i32.const 8))))
    (local.get $qbit))
  (func $D_unsigned_core
    (param $n i32)
    (param $a i32)
    (param $b i32)
    (local $i i32)
    (local $qbit i32)
    (memory.fill (i32.add (i32.const 900000) (i32.const 528)) (i32.const 0) (i32.const 24))
    (local.set $i (local.get $n))
    (block $done
      (loop $digits
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $qbit
          (call $D_remainder_digit
            (local.get $n)
            (local.get $b)
            (call $B_get_bit (local.get $a) (local.get $i))))
        (call $B_emit_bit (i32.const 528) (local.get $i) (i32.const 6) (local.get $qbit))
        (br $digits))))
  (func $D_publish
    (param $n i32)
    (param $select_rem i32)
    (param $qvalid i32)
    (call $D_emit_word (i32.const 256) (i32.const 528) (local.get $n))
    (call $D_emit_word (i32.const 264) (i32.const 536) (local.get $n))
    (memory.fill (i32.add (i32.const 900000) (i32.const 280)) (i32.const 0) (i32.const 8))
    (call $B_emit_bit (i32.const 280) (i32.const 0) (i32.const 6) (local.get $qvalid))
    (call $D_emit_word
      (i32.const 16)
      (if (result i32) (local.get $select_rem) (then (i32.const 264)) (else (i32.const 256)))
      (local.get $n))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.add (i32.const 900000) (i32.const 512))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 8))
      (i32.add (i32.const 900000) (i32.const 520))
      (i32.const 8)))
  (func $D_divide
    (param $n i32)
    (param $mode i32)
    (result i32)
    (local $status i32)
    (local $sa i32)
    (local $sb i32)
    (local $overflow i32)
    (local $qvalid i32)
    (local.set $status (call $B_valid (local.get $n)))
    (if (local.get $status) (then (return (local.get $status))))
    (if (call $D_word_zero (i32.const 8) (local.get $n)) (then (return (i32.const 4))))
    (if
      (i32.ge_u (local.get $mode) (i32.const 2))
      (then
        (local.set $overflow
          (call $B_lut
            (i32.const 1)
            (call $B_address2
              (call $D_word_min (i32.const 0) (local.get $n))
              (call $D_word_ones (i32.const 8) (local.get $n)))))
        (if
          (i32.and (i32.eq (local.get $mode) (i32.const 2)) (local.get $overflow))
          (then (return (i32.const 5))))))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 512))
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.const 16))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 552))
      (i32.add (i32.const 900000) (i32.const 512))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 560))
      (i32.add (i32.const 900000) (i32.const 520))
      (i32.const 8))
    (if
      (i32.ge_u (local.get $mode) (i32.const 2))
      (then
        (local.set $sa (call $B_get_bit (i32.const 512) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $sb (call $B_get_bit (i32.const 520) (i32.sub (local.get $n) (i32.const 1))))
        (if (local.get $sa) (then (call $D_neg_word (i32.const 552) (local.get $n))))
        (if (local.get $sb) (then (call $D_neg_word (i32.const 560) (local.get $n))))))
    (call $D_unsigned_core (local.get $n) (i32.const 552) (i32.const 560))
    (if
      (i32.ge_u (local.get $mode) (i32.const 2))
      (then
        (if
          (call $B_lut (i32.const 0) (call $B_address2 (local.get $sa) (local.get $sb)))
          (then (call $D_neg_word (i32.const 528) (local.get $n))))
        (if (local.get $sa) (then (call $D_neg_word (i32.const 536) (local.get $n))))))
    (local.set $qvalid (call $B_lut (i32.const 3) (local.get $overflow)))
    (if
      (local.get $overflow)
      (then (memory.fill (i32.add (i32.const 900000) (i32.const 528)) (i32.const 0) (i32.const 8))))
    (call $D_publish (local.get $n) (i32.and (local.get $mode) (i32.const 1)) (local.get $qvalid))
    (i32.const 0))
  (func $D_gcd
    (param $n i32)
    (result i32)
    (local $status i32)
    (local.set $status (call $B_valid (local.get $n)))
    (if (local.get $status) (then (return (local.get $status))))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 512))
      (i32.add (i32.const 900000) (i32.const 0))
      (i32.const 16))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 568))
      (i32.add (i32.const 900000) (i32.const 512))
      (i32.const 8))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 576))
      (i32.add (i32.const 900000) (i32.const 520))
      (i32.const 8))
    (block $done
      (loop $euclid
        (br_if $done (call $D_word_zero (i32.const 576) (local.get $n)))
        (call $D_unsigned_core (local.get $n) (i32.const 568) (i32.const 576))
        (memory.copy
          (i32.add (i32.const 900000) (i32.const 568))
          (i32.add (i32.const 900000) (i32.const 576))
          (i32.const 8))
        (memory.copy
          (i32.add (i32.const 900000) (i32.const 576))
          (i32.add (i32.const 900000) (i32.const 536))
          (i32.const 8))
        (br $euclid)))
    (memory.copy
      (i32.add (i32.const 900000) (i32.const 528))
      (i32.add (i32.const 900000) (i32.const 568))
      (i32.const 8))
    (memory.fill (i32.add (i32.const 900000) (i32.const 536)) (i32.const 0) (i32.const 8))
    (call $D_publish (local.get $n) (i32.const 0) (i32.const 1))
    (i32.const 0))
  (func $D_udiv (param $n i32) (result i32) (call $D_divide (local.get $n) (i32.const 0)))
  (func $D_urem (param $n i32) (result i32) (call $D_divide (local.get $n) (i32.const 1)))
  (func $D_sdiv (param $n i32) (result i32) (call $D_divide (local.get $n) (i32.const 2)))
  (func $D_srem (param $n i32) (result i32) (call $D_divide (local.get $n) (i32.const 3)))
  (func $L_init
    (memory.fill (i32.const 900000) (i32.const 0) (i32.const 1024))
    (i32.store8 (i32.const 900128) (i32.const 6))
    (i32.store8 (i32.const 900129) (i32.const 8))
    (i32.store8 (i32.const 900130) (i32.const 14))
    (i32.store8 (i32.const 900131) (i32.const 1))
    (i32.store8 (i32.const 900132) (i32.const 150))
    (i32.store8 (i32.const 900133) (i32.const 232))
    (i32.store8 (i32.const 900134) (i32.const 2))
    (i32.store8 (i32.const 900135) (i32.const 9))
    (i32.store (i32.const 900136) (i32.const 0x424c4131)))
  (func $L_add (param $a i32) (param $b i32) (result i32) (call $R_add (local.get $a) (local.get $b)))
  (func $L_sub (param $a i32) (param $b i32) (result i32) (call $R_sub (local.get $a) (local.get $b)))
  (func $L_mul (param $a i32) (param $b i32) (result i32) (call $R_mul (local.get $a) (local.get $b)))
  (func $L_and (param $a i32) (param $b i32) (result i32) (call $R_and (local.get $a) (local.get $b)))
  (func $L_or (param $a i32) (param $b i32) (result i32) (call $R_or (local.get $a) (local.get $b)))
  (func $L_xor (param $a i32) (param $b i32) (result i32) (call $R_xor (local.get $a) (local.get $b)))
  (func $L_shl (param $a i32) (param $b i32) (result i32) (call $R_shl (local.get $a) (local.get $b)))
  (func $L_shr_u (param $a i32) (param $b i32) (result i32) (call $R_shr_u (local.get $a) (local.get $b)))
  (func $L_shr_s (param $a i32) (param $b i32) (result i32) (call $R_shr_s (local.get $a) (local.get $b)))
  (func $L_rotl
    (param $a i32)
    (param $b i32)
    (result i32)
    (i32.store (i32.const 900000) (local.get $a))
    (i32.store (i32.const 900004) (i32.const 0))
    (i32.store (i32.const 900008) (i32.const 0))
    (i32.store (i32.const 900012) (i32.const 0))
    (drop (call $B_rotl (i32.const 32) (local.get $b)))
    (i32.load (i32.const 900016)))
  (func $L_equal (param $a i32) (param $b i32) (result i32) (call $R_equal (local.get $a) (local.get $b)))
  (func $L_less_u (param $a i32) (param $b i32) (result i32) (call $R_less_u (local.get $a) (local.get $b)))
  (func $L_less_s (param $a i32) (param $b i32) (result i32) (call $R_less_s (local.get $a) (local.get $b)))
  (func $L_eq (param $a i32) (param $b i32) (result i32) (call $L_equal (local.get $a) (local.get $b)))
  (func $L_ne
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $B_lut (i32.const 3) (call $L_equal (local.get $a) (local.get $b))))
  (func $L_lt_u (param $a i32) (param $b i32) (result i32) (call $L_less_u (local.get $a) (local.get $b)))
  (func $L_lt_s (param $a i32) (param $b i32) (result i32) (call $L_less_s (local.get $a) (local.get $b)))
  (func $L_gt_u (param $a i32) (param $b i32) (result i32) (call $L_less_u (local.get $b) (local.get $a)))
  (func $L_gt_s (param $a i32) (param $b i32) (result i32) (call $L_less_s (local.get $b) (local.get $a)))
  (func $L_le_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $B_lut (i32.const 3) (call $L_less_u (local.get $b) (local.get $a))))
  (func $L_le_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $B_lut (i32.const 3) (call $L_less_s (local.get $b) (local.get $a))))
  (func $L_ge_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $B_lut (i32.const 3) (call $L_less_u (local.get $a) (local.get $b))))
  (func $L_ge_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $B_lut (i32.const 3) (call $L_less_s (local.get $a) (local.get $b))))
  (func $L_eqz (param $a i32) (result i32) (call $L_equal (local.get $a) (i32.const 0)))
  (func $L_add64
    (param $a i64)
    (param $b i64)
    (result i64)
    (i64.store (i32.const 900000) (local.get $a))
    (i64.store (i32.const 900008) (local.get $b))
    (drop (call $B_add (i32.const 64)))
    (i64.load (i32.const 900016)))
  (func $L_id16
    (param $a i32)
    (result i32)
    (local $i i32)
    (memory.fill (i32.const 900800) (i32.const 0) (i32.const 4))
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 16)))
        (call $B_emit_bit
          (i32.const 800)
          (local.get $i)
          (i32.const 6)
          (i32.and (i32.shr_u (local.get $a) (local.get $i)) (i32.const 1)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (i32.load (i32.const 900800)))
  (func $L_small_gcd
    (param $o i32)
    (param $a i32)
    (param $b i32)
    (memory.fill (i32.const 900000) (i32.const 0) (i32.const 16))
    (memory.copy (i32.const 900000) (i32.add (local.get $a) (i32.const 16)) (i32.const 4))
    (memory.copy (i32.const 900008) (i32.add (local.get $b) (i32.const 16)) (i32.const 4))
    (drop (call $D_gcd (i32.const 32)))
    (call $zero (local.get $o))
    (i32.store (local.get $o) (i32.const 2))
    (memory.copy (i32.add (local.get $o) (i32.const 16)) (i32.const 900016) (i32.const 4))
    (call $trim (local.get $o)))
  (func $L_small_div
    (param $q i32)
    (param $r i32)
    (param $a i32)
    (param $b i32)
    (local $i i32)
    (local $rem i32)
    (local $d i32)
    (local.set $d (call $digit (local.get $b) (i32.const 0)))
    (i32.store (local.get $q) (i32.load (local.get $a)))
    (local.set $i (i32.load (local.get $a)))
    (block $done
      (loop $limbs
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (memory.fill (i32.const 900000) (i32.const 0) (i32.const 16))
        (i32.store16 (i32.const 900000) (call $digit (local.get $a) (local.get $i)))
        (i32.store16 (i32.const 900002) (local.get $rem))
        (i32.store (i32.const 900008) (local.get $d))
        (drop (call $D_divide (i32.const 32) (i32.const 0)))
        (call $put (local.get $q) (local.get $i) (i32.load (i32.const 900016)))
        (local.set $rem (i32.load (i32.const 900264)))
        (br $limbs)))
    (call $trim (local.get $q))
    (i32.store (local.get $r) (i32.const 1))
    (call $put (local.get $r) (i32.const 0) (local.get $rem))
    (call $trim (local.get $r)))
  (func $R_bit
    (param $a i32)
    (param $i i32)
    (result i32)
    (i32.and (i32.shr_u (local.get $a) (local.get $i)) (i32.const 1)))
  (func $R_arithmetic
    (param $a i32)
    (param $b i32)
    (param $subtract i32)
    (result i32)
    (local $i i32)
    (local $r i32)
    (local $carry i32)
    (local $x i32)
    (local $y i32)
    (local $address i32)
    (local $bit i32)
    (local.set $carry (local.get $subtract))
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 32)))
        (local.set $x (call $R_bit (local.get $a) (local.get $i)))
        (local.set $y (call $R_bit (local.get $b) (local.get $i)))
        (if (local.get $subtract) (then (local.set $y (call $B_lut (i32.const 3) (local.get $y)))))
        (local.set $address (call $B_address3 (local.get $x) (local.get $y) (local.get $carry)))
        (local.set $bit (call $B_lut (i32.const 4) (local.get $address)))
        (local.set $r (i32.or (local.get $r) (i32.shl (local.get $bit) (local.get $i))))
        (local.set $carry (call $B_lut (i32.const 5) (local.get $address)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (local.get $r))
  (func $R_add
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_arithmetic (local.get $a) (local.get $b) (i32.const 0)))
  (func $R_sub
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_arithmetic (local.get $a) (local.get $b) (i32.const 1)))
  (func $R_logic
    (param $a i32)
    (param $b i32)
    (param $table i32)
    (result i32)
    (local $i i32)
    (local $r i32)
    (local $bit i32)
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 32)))
        (local.set $bit
          (call $B_lut
            (local.get $table)
            (call $B_address2
              (call $R_bit (local.get $a) (local.get $i))
              (call $R_bit (local.get $b) (local.get $i)))))
        (local.set $r (i32.or (local.get $r) (i32.shl (local.get $bit) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (local.get $r))
  (func $R_and
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_logic (local.get $a) (local.get $b) (i32.const 1)))
  (func $R_or
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_logic (local.get $a) (local.get $b) (i32.const 2)))
  (func $R_xor
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_logic (local.get $a) (local.get $b) (i32.const 0)))
  (func $R_compare
    (param $a i32)
    (param $b i32)
    (param $mode i32)
    (result i32)
    (local $i i32)
    (local $equal i32)
    (local $less i32)
    (local $x i32)
    (local $y i32)
    (local $different i32)
    (local $sign i32)
    (local.set $equal (i32.const 1))
    (local.set $i (i32.const 32))
    (block $done
      (loop $bits
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $x (call $R_bit (local.get $a) (local.get $i)))
        (local.set $y (call $R_bit (local.get $b) (local.get $i)))
        (local.set $different
          (call $B_lut
            (i32.const 1)
            (call $B_address2 (call $B_lut (i32.const 3) (local.get $x)) (local.get $y))))
        (local.set $less
          (call $B_lut
            (i32.const 2)
            (call $B_address2
              (local.get $less)
              (call $B_lut (i32.const 1) (call $B_address2 (local.get $equal) (local.get $different))))))
        (local.set $equal
          (call $B_lut
            (i32.const 1)
            (call $B_address2
              (local.get $equal)
              (call $B_lut (i32.const 7) (call $B_address2 (local.get $x) (local.get $y))))))
        (br $bits)))
    (if
      (i32.eq (local.get $mode) (i32.const 2))
      (then (return (call $B_lut (i32.const 6) (local.get $equal)))))
    (if
      (local.get $mode)
      (then
        (local.set $x (call $R_bit (local.get $a) (i32.const 31)))
        (local.set $y (call $R_bit (local.get $b) (i32.const 31)))
        (local.set $sign (call $B_lut (i32.const 0) (call $B_address2 (local.get $x) (local.get $y))))
        (local.set $less
          (call $B_lut
            (i32.const 2)
            (call $B_address2
              (call $B_lut (i32.const 1) (call $B_address2 (local.get $sign) (local.get $x)))
              (call $B_lut
                (i32.const 1)
                (call $B_address2 (call $B_lut (i32.const 3) (local.get $sign)) (local.get $less))))))))
    (call $B_lut (i32.const 6) (local.get $less)))
  (func $R_equal
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_compare (local.get $a) (local.get $b) (i32.const 2)))
  (func $R_less_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_compare (local.get $a) (local.get $b) (i32.const 0)))
  (func $R_less_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_compare (local.get $a) (local.get $b) (i32.const 1)))
  (func $R_shift
    (param $a i32)
    (param $count i32)
    (param $mode i32)
    (result i32)
    (local $i i32)
    (local $r i32)
    (local $index i32)
    (local $shift i32)
    (local $bit i32)
    (local.set $shift (i32.and (local.get $count) (i32.const 31)))
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 32)))
        (local.set $bit (i32.const 0))
        (if
          (i32.eqz (local.get $mode))
          (then
            (if
              (i32.ge_u (local.get $i) (local.get $shift))
              (then (local.set $bit (call $R_bit (local.get $a) (i32.sub (local.get $i) (local.get $shift)))))))
          (else
            (local.set $index (i32.add (local.get $i) (local.get $shift)))
            (if
              (i32.lt_u (local.get $index) (i32.const 32))
              (then (local.set $bit (call $R_bit (local.get $a) (local.get $index))))
              (else
                (if
                  (i32.eq (local.get $mode) (i32.const 2))
                  (then (local.set $bit (call $R_bit (local.get $a) (i32.const 31)))))))))
        (local.set $bit (call $B_lut (i32.const 6) (local.get $bit)))
        (local.set $r (i32.or (local.get $r) (i32.shl (local.get $bit) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (local.get $r))
  (func $R_shl
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_shift (local.get $a) (local.get $b) (i32.const 0)))
  (func $R_shr_u
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_shift (local.get $a) (local.get $b) (i32.const 1)))
  (func $R_shr_s
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $R_shift (local.get $a) (local.get $b) (i32.const 2)))
  (func $R_mul
    (param $a i32)
    (param $b i32)
    (result i32)
    (local $i i32)
    (local $j i32)
    (local $r i32)
    (local $next i32)
    (local $carry i32)
    (local $part i32)
    (local $address i32)
    (local $bit i32)
    (local $bbit i32)
    (block $outerdone
      (loop $rows
        (br_if $outerdone (i32.ge_u (local.get $j) (i32.const 16)))
        (local.set $bbit (call $R_bit (local.get $b) (local.get $j)))
        (if
          (local.get $bbit)
          (then
            (local.set $i (i32.const 0))
            (local.set $next (i32.const 0))
            (local.set $carry (i32.const 0))
            (block $innerdone
              (loop $bits
                (br_if $innerdone (i32.ge_u (local.get $i) (i32.const 32)))
                (local.set $part (i32.const 0))
                (if
                  (i32.and
                    (i32.ge_u (local.get $i) (local.get $j))
                    (i32.lt_u (local.get $i) (i32.add (local.get $j) (i32.const 16))))
                  (then
                    (local.set $part
                      (call $B_lut
                        (i32.const 1)
                        (call $B_address2
                          (call $R_bit (local.get $a) (i32.sub (local.get $i) (local.get $j)))
                          (local.get $bbit))))))
                (local.set $address
                  (call $B_address3
                    (call $R_bit (local.get $r) (local.get $i))
                    (local.get $part)
                    (local.get $carry)))
                (local.set $bit (call $B_lut (i32.const 4) (local.get $address)))
                (local.set $carry (call $B_lut (i32.const 5) (local.get $address)))
                (local.set $next (i32.or (local.get $next) (i32.shl (local.get $bit) (local.get $i))))
                (local.set $i (i32.add (local.get $i) (i32.const 1)))
                (br $bits)))
            (local.set $r (local.get $next))))
        (local.set $j (i32.add (local.get $j) (i32.const 1)))
        (br $rows)))
    (local.set $i (i32.const 0))
    (local.set $next (i32.const 0))
    (block $done
      (loop $copy
        (br_if $done (i32.ge_u (local.get $i) (i32.const 32)))
        (local.set $bit (call $B_lut (i32.const 6) (call $R_bit (local.get $r) (local.get $i))))
        (local.set $next (i32.or (local.get $next) (i32.shl (local.get $bit) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $copy)))
    (local.get $next))
  (func $N_arithmetic16
    (param $a i32)
    (param $b i32)
    (param $subtract i32)
    (result i32)
    (local $i i32)
    (local $r i32)
    (local $carry i32)
    (local $x i32)
    (local $y i32)
    (local $address i32)
    (local $bit i32)
    (local.set $carry (local.get $subtract))
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 16)))
        (local.set $x (call $R_bit (local.get $a) (local.get $i)))
        (local.set $y (call $R_bit (local.get $b) (local.get $i)))
        (if (local.get $subtract) (then (local.set $y (call $B_lut (i32.const 3) (local.get $y)))))
        (local.set $address (call $B_address3 (local.get $x) (local.get $y) (local.get $carry)))
        (local.set $bit (call $B_lut (i32.const 4) (local.get $address)))
        (local.set $r (i32.or (local.get $r) (i32.shl (local.get $bit) (local.get $i))))
        (local.set $carry (call $B_lut (i32.const 5) (local.get $address)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (local.get $r))
  (func $N_logic16
    (param $a i32)
    (param $b i32)
    (param $table i32)
    (result i32)
    (local $i i32)
    (local $r i32)
    (local $bit i32)
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 16)))
        (local.set $bit
          (call $B_lut
            (local.get $table)
            (call $B_address2
              (call $R_bit (local.get $a) (local.get $i))
              (call $R_bit (local.get $b) (local.get $i)))))
        (local.set $r (i32.or (local.get $r) (i32.shl (local.get $bit) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (local.get $r))
  (func $N_compare16
    (param $a i32)
    (param $b i32)
    (param $mode i32)
    (result i32)
    (local $i i32)
    (local $equal i32)
    (local $less i32)
    (local $x i32)
    (local $y i32)
    (local $different i32)
    (local $sign i32)
    (local.set $equal (i32.const 1))
    (local.set $i (i32.const 16))
    (block $done
      (loop $bits
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $x (call $R_bit (local.get $a) (local.get $i)))
        (local.set $y (call $R_bit (local.get $b) (local.get $i)))
        (local.set $different
          (call $B_lut
            (i32.const 1)
            (call $B_address2 (call $B_lut (i32.const 3) (local.get $x)) (local.get $y))))
        (local.set $less
          (call $B_lut
            (i32.const 2)
            (call $B_address2
              (local.get $less)
              (call $B_lut (i32.const 1) (call $B_address2 (local.get $equal) (local.get $different))))))
        (local.set $equal
          (call $B_lut
            (i32.const 1)
            (call $B_address2
              (local.get $equal)
              (call $B_lut (i32.const 7) (call $B_address2 (local.get $x) (local.get $y))))))
        (br $bits)))
    (if
      (i32.eq (local.get $mode) (i32.const 2))
      (then (return (call $B_lut (i32.const 6) (local.get $equal)))))
    (if
      (local.get $mode)
      (then
        (local.set $x (call $R_bit (local.get $a) (i32.const 15)))
        (local.set $y (call $R_bit (local.get $b) (i32.const 15)))
        (local.set $sign (call $B_lut (i32.const 0) (call $B_address2 (local.get $x) (local.get $y))))
        (local.set $less
          (call $B_lut
            (i32.const 2)
            (call $B_address2
              (call $B_lut (i32.const 1) (call $B_address2 (local.get $sign) (local.get $x)))
              (call $B_lut
                (i32.const 1)
                (call $B_address2 (call $B_lut (i32.const 3) (local.get $sign)) (local.get $less))))))))
    (call $B_lut (i32.const 6) (local.get $less)))
  (func $N_shift16
    (param $a i32)
    (param $count i32)
    (param $mode i32)
    (result i32)
    (local $i i32)
    (local $r i32)
    (local $index i32)
    (local $shift i32)
    (local $bit i32)
    (local.set $shift (i32.and (local.get $count) (i32.const 31)))
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 16)))
        (local.set $bit (i32.const 0))
        (if
          (i32.eqz (local.get $mode))
          (then
            (if
              (i32.ge_u (local.get $i) (local.get $shift))
              (then (local.set $bit (call $R_bit (local.get $a) (i32.sub (local.get $i) (local.get $shift)))))))
          (else
            (local.set $index (i32.add (local.get $i) (local.get $shift)))
            (if
              (i32.lt_u (local.get $index) (i32.const 16))
              (then (local.set $bit (call $R_bit (local.get $a) (local.get $index))))
              (else
                (if
                  (i32.eq (local.get $mode) (i32.const 2))
                  (then (local.set $bit (call $R_bit (local.get $a) (i32.const 15)))))))))
        (local.set $bit (call $B_lut (i32.const 6) (local.get $bit)))
        (local.set $r (i32.or (local.get $r) (i32.shl (local.get $bit) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (local.get $r))
  (func $N_add16
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_arithmetic16 (local.get $a) (local.get $b) (i32.const 0)))
  (func $N_or16
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_logic16 (local.get $a) (local.get $b) (i32.const 2)))
  (func $N_lt_u16
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_compare16 (local.get $a) (local.get $b) (i32.const 0)))
  (func $N_eq16
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_compare16 (local.get $a) (local.get $b) (i32.const 2)))
  (func $N_shl16
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_shift16 (local.get $a) (local.get $b) (i32.const 0)))
  (func $N_shr_u16
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_shift16 (local.get $a) (local.get $b) (i32.const 1)))
  (func $N_gt_u16
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_compare16 (local.get $b) (local.get $a) (i32.const 0)))
  (func $N_arithmetic17
    (param $a i32)
    (param $b i32)
    (param $subtract i32)
    (result i32)
    (local $i i32)
    (local $r i32)
    (local $carry i32)
    (local $x i32)
    (local $y i32)
    (local $address i32)
    (local $bit i32)
    (local.set $carry (local.get $subtract))
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 17)))
        (local.set $x (call $R_bit (local.get $a) (local.get $i)))
        (local.set $y (call $R_bit (local.get $b) (local.get $i)))
        (if (local.get $subtract) (then (local.set $y (call $B_lut (i32.const 3) (local.get $y)))))
        (local.set $address (call $B_address3 (local.get $x) (local.get $y) (local.get $carry)))
        (local.set $bit (call $B_lut (i32.const 4) (local.get $address)))
        (local.set $r (i32.or (local.get $r) (i32.shl (local.get $bit) (local.get $i))))
        (local.set $carry (call $B_lut (i32.const 5) (local.get $address)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (local.get $r))
  (func $N_logic17
    (param $a i32)
    (param $b i32)
    (param $table i32)
    (result i32)
    (local $i i32)
    (local $r i32)
    (local $bit i32)
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 17)))
        (local.set $bit
          (call $B_lut
            (local.get $table)
            (call $B_address2
              (call $R_bit (local.get $a) (local.get $i))
              (call $R_bit (local.get $b) (local.get $i)))))
        (local.set $r (i32.or (local.get $r) (i32.shl (local.get $bit) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (local.get $r))
  (func $N_compare17
    (param $a i32)
    (param $b i32)
    (param $mode i32)
    (result i32)
    (local $i i32)
    (local $equal i32)
    (local $less i32)
    (local $x i32)
    (local $y i32)
    (local $different i32)
    (local $sign i32)
    (local.set $equal (i32.const 1))
    (local.set $i (i32.const 17))
    (block $done
      (loop $bits
        (br_if $done (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (local.set $x (call $R_bit (local.get $a) (local.get $i)))
        (local.set $y (call $R_bit (local.get $b) (local.get $i)))
        (local.set $different
          (call $B_lut
            (i32.const 1)
            (call $B_address2 (call $B_lut (i32.const 3) (local.get $x)) (local.get $y))))
        (local.set $less
          (call $B_lut
            (i32.const 2)
            (call $B_address2
              (local.get $less)
              (call $B_lut (i32.const 1) (call $B_address2 (local.get $equal) (local.get $different))))))
        (local.set $equal
          (call $B_lut
            (i32.const 1)
            (call $B_address2
              (local.get $equal)
              (call $B_lut (i32.const 7) (call $B_address2 (local.get $x) (local.get $y))))))
        (br $bits)))
    (if
      (i32.eq (local.get $mode) (i32.const 2))
      (then (return (call $B_lut (i32.const 6) (local.get $equal)))))
    (if
      (local.get $mode)
      (then
        (local.set $x (call $R_bit (local.get $a) (i32.const 16)))
        (local.set $y (call $R_bit (local.get $b) (i32.const 16)))
        (local.set $sign (call $B_lut (i32.const 0) (call $B_address2 (local.get $x) (local.get $y))))
        (local.set $less
          (call $B_lut
            (i32.const 2)
            (call $B_address2
              (call $B_lut (i32.const 1) (call $B_address2 (local.get $sign) (local.get $x)))
              (call $B_lut
                (i32.const 1)
                (call $B_address2 (call $B_lut (i32.const 3) (local.get $sign)) (local.get $less))))))))
    (call $B_lut (i32.const 6) (local.get $less)))
  (func $N_shift17
    (param $a i32)
    (param $count i32)
    (param $mode i32)
    (result i32)
    (local $i i32)
    (local $r i32)
    (local $index i32)
    (local $shift i32)
    (local $bit i32)
    (local.set $shift (i32.and (local.get $count) (i32.const 31)))
    (block $done
      (loop $bits
        (br_if $done (i32.ge_u (local.get $i) (i32.const 17)))
        (local.set $bit (i32.const 0))
        (if
          (i32.eqz (local.get $mode))
          (then
            (if
              (i32.ge_u (local.get $i) (local.get $shift))
              (then (local.set $bit (call $R_bit (local.get $a) (i32.sub (local.get $i) (local.get $shift)))))))
          (else
            (local.set $index (i32.add (local.get $i) (local.get $shift)))
            (if
              (i32.lt_u (local.get $index) (i32.const 17))
              (then (local.set $bit (call $R_bit (local.get $a) (local.get $index))))
              (else
                (if
                  (i32.eq (local.get $mode) (i32.const 2))
                  (then (local.set $bit (call $R_bit (local.get $a) (i32.const 16)))))))))
        (local.set $bit (call $B_lut (i32.const 6) (local.get $bit)))
        (local.set $r (i32.or (local.get $r) (i32.shl (local.get $bit) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $bits)))
    (local.get $r))
  (func $N_add17
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_arithmetic17 (local.get $a) (local.get $b) (i32.const 0)))
  (func $N_or17
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_logic17 (local.get $a) (local.get $b) (i32.const 2)))
  (func $N_lt_u17
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_compare17 (local.get $a) (local.get $b) (i32.const 0)))
  (func $N_eq17
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_compare17 (local.get $a) (local.get $b) (i32.const 2)))
  (func $N_shl17
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_shift17 (local.get $a) (local.get $b) (i32.const 0)))
  (func $N_shr_u17
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_shift17 (local.get $a) (local.get $b) (i32.const 1)))
  (func $N_gt_u17
    (param $a i32)
    (param $b i32)
    (result i32)
    (call $N_compare17 (local.get $b) (local.get $a) (i32.const 0)))
  (start $L_init)
  (func (export "code_valid") (result i32) (call $B_code_valid)))
