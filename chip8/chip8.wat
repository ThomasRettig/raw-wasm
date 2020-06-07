(import "Math" "random" (func $random (result f32)))

;; [0x0000, 0x0010)  Char[16]       Font data
;; [0x0050, 0x0060)  u8[16]         Key data
;; [0x0060, 0x0070)  u8[16]         v0..vf registers
;; [0x0070, 0x0090)  u16[16]        Call stack
;; [0x0093, 0x0093)  u8             delay timer
;; [0x0094, 0x0095)  u8             sound timer
;; [0x0200, 0x1000)  u8[0x800]      Chip8 ROM
;; [0x1000, 0x1100)  u8[8*32]       1bpp screen data
;; [0x1100, 0x3100)  Color[64*32]   canvas
(memory (export "mem") 1)

(global $pc (mut i32) (i32.const 0x200))
(global $sp (mut i32) (i32.const 0x90))
(global $i (mut i32) (i32.const 0))
(global $delay (mut i32) (i32.const 0))
(global $sound (mut i32) (i32.const 0))
(global $wait-vx (mut i32) (i32.const -1))

;; Font (taken from Octo's VIP font, see
;; https://github.com/JohnEarnest/Octo/blob/gh-pages/js/emulator.js)
(data (i32.const 0)
  "\F0\90\90\90\F0" ;; 0
  "\60\20\20\20\70" ;; 1
  "\F0\10\F0\80\F0" ;; 2
  "\F0\10\F0\10\F0" ;; 3
  "\A0\A0\F0\20\20" ;; 4
  "\F0\80\F0\10\F0" ;; 5
  "\F0\80\F0\90\F0" ;; 6
  "\F0\10\10\10\10" ;; 7
  "\F0\90\F0\90\F0" ;; 8
  "\F0\90\F0\10\F0" ;; 9
  "\F0\90\F0\90\90" ;; a
  "\F0\50\70\50\F0" ;; b
  "\F0\80\80\80\F0" ;; c
  "\F0\50\50\50\F0" ;; d
  "\F0\80\F0\80\F0" ;; e
  "\F0\80\F0\80\80" ;; f
)

(func (export "run") (param $cycles i32)
  (local $b0 i32)
  (local $x i32)
  (local $vx i32)
  (local $vy i32)
  (local $vf i32)
  (local $n i32)
  (local $nn i32)
  (local $nnn i32)
  (local $nextpc i32)
  (local $copy-src i32)
  (local $copy-dst i32)
  (local $j i32)

  (loop $cycle
    (local.set $vf (i32.const 0))

    (block $setpc (result i32)
    (block $nextpc
    (block $set-vx (result i32)
    (block $skip (result i32)
    (block $do-copy
    (block  ;; f
    (block  ;; e
    (block  ;; d
    (block  ;; c
    (block  ;; b
    (block  ;; a
    (block  ;; 9
    (block  ;; 8
    (block  ;; 7
    (block  ;; 6
    (block  ;; 5
    (block  ;; 4
    (block  ;; 3
    (block  ;; 1
    (block  ;; 2
    (block  ;; 0
      (local.set $nextpc (i32.add (global.get $pc) (i32.const 2)))
      (local.set $vx
        (i32.load8_u offset=0x60
          (local.tee $x
            (i32.and
              (local.tee $b0 (i32.load8_u (global.get $pc)))
              (i32.const 0xf)))))
      (local.set $vy
        (i32.load8_u offset=0x60
          (i32.shr_u
            (local.tee $nn (i32.load8_u offset=1 (global.get $pc)))
            (i32.const 4))))
      (local.set $n (i32.and (local.get $nn) (i32.const 0xf)))
      (local.set $nnn
        (i32.or
          (i32.shl (local.get $b0) (i32.const 4))
          (local.get $nn)))

      (br_table 0 2 1 3 4 5 6 7 8 9 10 11 12 13 14 15
        (i32.shr_u (local.get $b0) (i32.const 4)))

    )
    ;; 0x0???
    (if (local.get $n)
      (then
        ;; 0x00EE  return
        (local.set $nextpc (i32.load16_u (global.get $sp)))
        (global.set $sp (i32.add (global.get $sp) (i32.const 2)))
        (br $nextpc))
      (else
        ;; 0x00E0  clear screen
        (local.set $copy-dst (i32.const 0x1000))
        (local.set $copy-src (i32.const 0x3100)) ;; Uninit, so has zeroes.
        (local.set $x (i32.const 0xff)) ;; do-copy always copies N+1 bytes.
        (br $do-copy)))

    )
    ;; 0x2NNN  call NNN
    (global.set $sp (i32.sub (global.get $sp) (i32.const 2)))
    (i32.store16 (global.get $sp) (local.get $nextpc))
    ;; fallthrough.

    )
    ;; 0x1NNN  PC = NNN
    (br $setpc (local.get $nnn))

    )
    ;; 0x3XNN  skip if v[x] == NN
    (br $skip (i32.eq (local.get $vx) (local.get $nn)))

    )
    ;; 0x4XNN  skip if v[x] != NN
    (br $skip (i32.ne (local.get $vx) (local.get $nn)))

    )
    ;; 0x5XY0  skip if v[x] == v[y]
    (br $skip (i32.eq (local.get $vx) (local.get $vy)))

    )
    ;; 0x6XNN  v[x] = NN
    (br $set-vx (local.get $nn))

    )
    ;; 0x7XNN  v[x] += NN
    (br $set-vx (i32.add (local.get $vx) (local.get $nn)))

    )
    ;; 0x8???

      (block
      (block
      (block
      (block
      (block
      (block
      (block
      (block
      (block
        (br_table 0 1 2 3 4 5 6 7 8 (local.get $n))

      )
      ;; 0x8XY0  v[x] = v[y]
      (br $set-vx (local.get $vy))

      )
      ;; 0x8XY1  v[x] |= v[y]
      (br $set-vx (i32.or (local.get $vx) (local.get $vy)))

      )
      ;; 0x8XY2  v[x] &= v[y]
      (br $set-vx (i32.and (local.get $vx) (local.get $vy)))

      )
      ;; 0x8XY3  v[x] ^= v[y]
      (br $set-vx (i32.xor (local.get $vx) (local.get $vy)))

      )
      ;; 0x8XY4  v[x] += v[y], vf = carry
      (local.set $vx (i32.add (local.get $vx) (local.get $vy)))
      (local.set $vf (i32.shl (local.get $vx) (i32.const 8)))
      (br $set-vx (local.get $vx))

      )
      ;; 0x8XY5  v[x] -= v[y], vf = borrow
      (local.set $vf (i32.lt_u (local.get $vx) (local.get $vy)))
      (br $set-vx (i32.sub (local.get $vx) (local.get $vy)))

      )
      ;; 0x8XY6  v[x] = v[y] >> 1, vf = shifted out bit
      (local.set $vf (i32.and (local.get $vy) (i32.const 1)))
      (br $set-vx (i32.shr_u (local.get $vy) (i32.const 1)))

      )
      ;; 0x8XY7  v[x] = v[y] - v[x]
      (local.set $vf (i32.lt_u (local.get $vy) (local.get $vx)))
      (br $set-vx (i32.sub (local.get $vy) (local.get $vx)))

      )
      ;; 0x8XYE  v[x] = v[y] << 1, vf = shifted out bit
      (local.set $vf (i32.shr_u (local.get $vy) (i32.const 7)))
      (br $set-vx (i32.shl (local.get $vy) (i32.const 1)))


    )
    ;; 0x9XY0  skip if v[x] != v[y]
    (br $skip (i32.ne (local.get $vx) (local.get $vy)))

    )
    ;; 0xANNN  I = NNN
    (global.set $i (local.get $nnn))
    (br $nextpc)

    )
    ;; 0xBNNN  PC = NNN + v[0]
    (br $setpc
      (i32.add (local.get $nnn) (i32.load8_u offset=0x60 (i32.const 0))))

    )
    ;; 0xCXNN  v[x] = random() & NN
    (br $set-vx
      (i32.and
        (i32.trunc_f32_u
          (f32.mul (call $random) (f32.const 256)))
        (local.get $nn)))

    )
    ;; 0xDXYN  draw N-line sprite at (x, y)
    (loop $yloop
      ;; load sprite data.
      (local.set $b0 (i32.load8_u (i32.add (global.get $i) (local.get $j))))

      (br_if $yloop
        (i32.lt_u
          (local.tee $j (i32.add (local.get $j) (i32.const 1)))
          (local.get $n))))
    (br $nextpc)

    )
    ;; 0xEX9E  skip if v[x] key is pressed
    ;; 0xEXA1  skip if v[x] key is not pressed
    (br $skip
      (i32.xor
        (i32.load8_u offset=0x50 (local.get $vx))
        (i32.eq (local.get $nn) (i32.const 0xa1))))

    )
    ;; 0xF???

      (block
      (block
      (block
      (block
      (block
      (block
      (block
      (block
               ;; 0 1 2 3 4 5 6 7 8 9 10 11 12
        (br_table 0 1 2 3 3 4 5 5 5 5 6  6  7
          (i32.shr_u (local.get $nn) (i32.const 3)))

      )
      ;; 0xFX07  v[x] = delay
      (br $set-vx (global.get $delay))

      )
      ;; 0xFX0A  v[x] = wait for key
      (global.set $wait-vx (local.get $vx) (i32.const 1))
      (return)

      )
      ;; 0xFX15  delay = v[x]
      (global.set $delay (local.get $vx))
      (br $nextpc)

      )
      ;; 0xFX18 or 0xFX1E
      (if (i32.eq (local.get $nn) (i32.const 0x18))
        (then
          ;; 0xFX18  sound = v[x]
          (global.set $sound (local.get $vx)))
        (else
          ;; 0xFX1E  I += v[x]
          (global.set $i (i32.add (global.get $i) (local.get $vx)))))
      (br $nextpc)

      )
      ;; 0xFX29  I = &font[v[x] & 0xf]
      (global.set $i
        (i32.and
          (i32.mul (local.get $vx) (i32.const 5))
          (i32.const 0xf)))
      (br $nextpc)

      )
      ;; 0xFX33  I[0:2] = BCD(v[x])
      (i32.store8 (global.get $i)
        (i32.rem_u (i32.div_u (local.get $vx) (i32.const 100)) (i32.const 10)))
      (i32.store8 offset=1 (global.get $i)
        (i32.rem_u (i32.div_u (local.get $vx) (i32.const 10)) (i32.const 10)))
      (i32.store8 offset=2 (global.get $i)
        (i32.rem_u (local.get $vx) (i32.const 10)))
      (br $nextpc)

      )
      ;; 0xFX55  I[0:X] = v[0:X], I += X + 1
      (local.set $copy-src (i32.const 0x60))
      (local.set $copy-dst (global.get $i))
      (br $do-copy)

      )
      ;; 0xFX65  v[0:X] = I[0:X], I += X + 1
      (local.set $copy-src (global.get $i))
      (local.set $copy-dst (i32.const 0x60))
      ;; fallthrough.

    )
    ;; $do-copy
    (local.set $j (i32.const 0))
    (loop $copy
      (i32.store8 (local.get $copy-dst) (i32.load8_u (local.get $copy-src)))
      (br_if $copy
        (i32.lt_u
          (local.tee $j (i32.add (local.get $j) (i32.const 1)))
          (local.get $x))))
    ;; i += x + 1
    (global.set $i (i32.add (global.get $i) (local.get $j)))
    (br $nextpc)

    )
    ;; $skip
    ;; (i32.const <skip>)
    (br $setpc
      (i32.add (local.get $nextpc) (i32.shl (i32.const 1))))

    )
    ;; $set-vx
    ;; (i32.const <new-vx>)
    (local.set $vx)
    (i32.store8 offset=0x60 (local.get $x) (local.get $vx))
    (i32.store8 offset=0x6f (i32.const 0) (local.get $vf))
    ;; fallthrough.

    )
    ;; $nextpc
    (local.get $nextpc)
    ;; fallthrough.

    )
    ;; $setpc
    ;; (local.get $nextpc)
    (global.set $pc)

    (br_if $cycle
      (local.tee $cycles (i32.sub (local.get $cycles) (i32.const 1))))
  )
)
