(memory (export "mem") 1)
(data (i32.const 1020)
  ;; == Temp huffman data ==
  ;; addr:0    lens        (size: 1b x 288 = 288)
  ;; addr:288  offs        (size: 2b x  16 =  16)

  ;; == Lit/codelen huffman ==
  ;; addr:304  lit count   (size: 1b x  16 =  16)
  ;; addr:320  lit syms    (size: 2b x 288 = 576)

  ;; == Dist huffman ==
  ;; addr:896  dist count  (size: 1b x  16 =  16)
  ;; addr:912  dist syms   (size: 2b x  30 =  60)

  ;; == Constant data ==
  ;; addr:972    codelen literals  (size: 1b x 19 = 19)
  (i8 16 17 18 0 8 7 9 6 10 5 11 4 12 3 13 2 14 1 15)
  ;; addr:991    length base (-3)  (size: 1b x 29 = 29)
  (i8 0 1 2 3 4 5 6 7 8 10 12 14 16 20 24 28 32 40 48 56 64 80 96 112 128 160 192 224 255)
  ;; addr:1020   extra length bits (size: 1b x 29 = 29)
  (i8 0 0 0 0 0 0 0 0 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5 0)
  ;; addr:1049   dist base         (size: 2b x 30 = 60)
  (i16 1 2 3 4 5 7 9 13 17 25 33 49 65 97 129 193 257 385 513 769 1025 1537 2049 3073 4097 6145 8193 12289 16385 24577)
  ;; addr:1109   extra dist bits   (size: 1b x 30 = 30)
  (i8 0 0 0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 11 11 12 12 13 13)

  ;; addr:1139   compressed data
  "\8d\58\7b\fa\48\10\ff\df\9f\62\7b\95\6a\fb\42\08\36\38\40\94\44\4a\9b\dc"
  "\5d\a4\de\43\4d\4e\3a\89\5a\96\c1\4b\70\0b\6b\64\9b\96\5c\2e\f7\d9\6f\66"
  "\f6\e1\35\90\f6\24\03\de\9d\99\df\bc\f7\c1\eb\57\27\9b\aa\3c\99\e6\e2\84"
  "\8b\2f\6c\fd\58\2f\0a\e1\38\f9\6a\5d\94\35\4b\cb\87\75\5a\56\5c\8f\ab\c7"
  "\ca\71\7e\bd\fa\eb\ed\ed\fd\1d\bb\60\41\84\83\77\ef\df\fd\7e\7d\43\e3\31"
  "\8e\cd\30\1c\9d\e2\f8\5a\8f\fb\3d\e7\a7\5b\9b\3c\72\70\e2\e6\3a\79\7f\7b"
  "\9f\bc\bf\f9\0d\67\27\a3\98\fd\c8\82\c1\80\1d\b1\c9\98\de\83\10\df\87\f8"
  "\1e\d2\34\b1\8c\94\ec\f5\ed\5d\23\1c\21\a5\1f\3a\a8\03\e6\10\98\e6\83\d3"
  "\0e\0b\86\f0\19\75\58\af\c3\e0\1b\06\e3\0e\c3\69\18\47\f0\13\74\d8\00\7e"
  "\c2\0e\eb\c3\0f\7c\e0\2d\c0\19\78\a2\d8\01\b4\9f\ef\7f\49\de\5e\dd\dd\20"
  "\60\9f\b8\23\42\18\12\e0\58\42\21\0e\4a\07\91\d2\08\f3\21\a2\c1\7b\1f\68"
  "\7d\98\1f\c0\38\82\f7\08\2d\40\69\18\8f\51\9e\84\90\2b\38\45\88\31\0c\43"
  "\14\0c\a3\51\ec\90\a3\5a\7f\40\f6\19\2b\a4\37\a4\97\d8\81\84\34\c4\87\f7"
  "\31\da\11\22\c3\18\2d\89\d0\94\51\84\36\c0\70\78\4a\96\a3\4c\10\f5\51\ba"
  "\87\72\fd\de\10\11\7a\28\7b\1a\0c\80\3a\22\e9\20\0c\47\63\32\10\11\c2\41"
  "\34\1c\c6\ce\cd\5f\f7\1f\ae\12\1d\22\15\f3\1e\85\7a\ff\09\ac\27\b4\9e\be"
  "\f5\0c\ac\27\b2\9e\9e\d6\25\83\71\40\93\8d\6b\63\45\3a\5b\32\61\32\67\32"
  "\6d\3a\73\3a\7b\81\2c\03\fa\50\2d\c4\8e\e3\cc\96\69\55\b1\5f\36\f3\f9\2a"
  "\15\5e\31\fd\c4\67\b5\7f\e6\30\96\f1\39\4b\92\5c\e4\75\92\78\15\5f\ce\3b"
  "\6c\c9\45\d5\61\ab\74\5b\3d\ae\2a\62\62\ec\35\9b\6e\f2\65\c6\66\c5\46\d4"
  "\34\83\bc\5d\1a\92\0f\58\b9\aa\b5\88\3c\2f\4a\b6\64\b9\20\34\89\61\cb\4c"
  "\96\31\3b\82\96\73\5a\e8\c5\7c\5e\71\09\8f\af\3a\38\b1\41\cc\11\b1\4c\c5"
  "\03\f7\c0\4d\a5\cf\d7\f0\28\d3\4d\d7\6b\2e\32\0f\df\27\39\28\b1\95\e6\b1"
  "\ef\ec\b8\93\71\76\7c\09\2b\c3\6a\5a\2c\1b\bf\e4\d8\38\a6\62\d1\98\d1\91"
  "\be\71\b1\59\f1\32\ad\b9\87\5e\1a\3b\f2\39\90\5f\5d\b0\9e\9e\68\a1\4e\c8"
  "\b4\65\1c\03\7c\6e\18\d4\a4\0a\8a\ca\d7\ad\98\2f\01\bd\fc\4e\c2\b2\b4\4e"
  "\95\72\d2\93\8b\f5\06\b3\82\f3\10\80\a9\fb\b1\f7\b1\e7\a2\d7\77\05\fb\ca"
  "\d9\2c\85\20\f2\34\63\29\5b\e6\75\bd\e4\6c\9d\56\35\ab\17\1c\3c\ca\54\80"
  "\1e\fe\ce\d7\6c\01\5c\bc\a4\19\b0\87\97\b5\d7\28\c0\d0\5c\80\93\db\60\ee"
  "\bf\c0\11\28\8e\d1\f4\25\8e\50\71\f4\46\2a\33\e0\f0\03\26\de\e2\e9\cb\fc"
  "\2f\d2\2a\a9\f9\16\1d\f3\24\d7\1b\16\f8\14\67\43\9f\95\b3\e0\d4\66\08\77"
  "\18\40\be\4c\6d\86\c1\0e\83\48\57\dc\a6\8f\76\35\14\ab\15\17\2d\23\20\02"
  "\3d\c5\65\7b\29\8a\da\d8\ec\1f\22\90\b1\07\29\64\e5\61\19\a9\5e\05\8b\82"
  "\34\85\4a\c8\b3\2d\58\34\ea\61\e2\ae\e6\50\31\94\4c\95\3d\47\d5\a4\76\4f"
  "\57\e5\d7\45\0e\a9\b7\02\dd\82\3b\39\61\b0\51\1d\a8\62\cd\00\95\3a\72\5e"
  "\9a\6f\cc\2b\36\b5\ac\c6\49\ec\a8\f2\55\65\4d\75\a0\ea\d6\b2\e5\03\58\fd"
  "\76\59\cc\3e\7b\a6\a1\a0\3c\65\f3\95\bc\de\94\c2\06\d6\98\24\95\d7\95\6a"
  "\09\a1\64\a7\8f\35\57\d1\d9\f3\4e\32\98\e8\b5\e8\6f\d8\90\c8\d4\42\ad\6a"
  "\d4\88\71\43\ff\e7\20\03\74\1e\d4\ff\f9\b9\52\f4\6d\ce\90\38\83\d3\86\f5"
  "\f2\f2\42\1b\d7\4c\be\81\b2\f3\02\64\15\3e\3b\86\f2\77\0e\85\5f\a8\16\5e"
  "\97\b9\a8\bd\b9\6b\62\f3\24\9e\7d\76\71\c9\9e\10\ec\d9\f5\ed\98\e2\54\2b"
  "\98\94\02\2b\45\d3\79\2e\d2\a5\0e\86\c1\54\36\4c\eb\c7\35\df\23\86\be\a9"
  "\3e\c5\80\f5\84\b6\6d\04\94\f2\ba\e4\50\de\d9\a1\2a\02\47\db\6e\b1\a1\0f"
  "\59\f9\77\88\c2\e9\32\7f\10\4a\0a\56\de\64\df\28\d5\57\8c\89\ef\d0\ad\52"
  "\ea\42\db\e1\d6\61\2f\71\67\28\1e\fb\2f\d4\39\61\ff\68\da\40\45\12\7b\55"
  "\06\8b\e6\f9\d2\f6\3e\20\ef\e7\f9\96\67\6c\21\b7\63\ed\08\e0\e2\0c\03\6b"
  "\f5\46\dd\3e\5f\76\98\39\80\6a\8b\b2\bc\52\52\bb\42\e6\60\49\fb\e4\b5\25"
  "\d5\36\28\24\83\b2\47\58\19\f2\d9\8e\49\0b\b0\69\2f\76\91\8f\f5\1a\0d\35"
  "\0f\9a\70\98\29\d0\2c\33\08\d4\1e\cb\00\59\06\4d\16\2b\fb\1c\a1\4e\e5\8a"
  "\ba\b3\f5\13\9e\df\2c\4b\28\3c\b1\cf\cc\b0\d1\c7\7b\fa\fa\3a\66\b8\e9\63"
  "\e6\76\c2\26\8f\3d\8d\6e\55\ba\94\98\2a\41\2f\2b\1b\f3\1d\a0\bc\07\11\cf"
  "\86\eb\c8\90\1d\c9\a8\f8\bb\99\b5\94\19\cc\c9\19\8a\c4\a4\f9\fb\b9\b5\e4"
  "\50\ec\2c\3e\90\dd\8a\53\4a\a1\b7\78\f9\c5\74\97\da\48\7e\4a\81\ae\5c\93"
  "\8b\ee\7d\b9\31\5b\02\9d\87\76\9c\f4\b4\f9\7e\73\bc\21\be\73\a8\82\d3\9d"
  "\cd\41\75\92\3a\84\21\9b\6f\18\f4\72\74\79\c9\7e\97\9b\82\f7\54\f2\75\e9"
  "\cd\16\a5\64\f5\9f\7d\57\f3\53\95\4a\7b\2e\da\8a\2c\9c\bb\ba\58\bb\8d\86"
  "\29\9c\6a\3e\1b\f9\8a\db\25\a2\36\fe\76\4d\ec\9d\fc\27\f2\44\88\f5\1d\fb"
  "\76\81\3d\d4\0b\90\b6\ae\51\36\27\24\5c\2a\30\12\d9\c1\48\9a\8c\36\d0\d9"
  "\b7\0c\33\d7\84\09\e1\59\16\a9\a6\33\97\2a\c5\00\86\64\6d\43\76\5a\47\7a"
  "\62\f5\ce\c1\bc\59\53\93\63\54\15\ef\65\f1\07\88\fe\07\d8\2a\bc\27\a4\3f"
  "\77\d8\93\84\c6\0d\86\c9\b4\ba\6e\f7\53\91\0b\6f\95\ae\31\c5\1d\d6\82\95"
  "\ec\67\b1\0f\59\ff\41\15\e4\fe\02\6a\6d\48\14\41\b9\bb\ab\55\4a\b9\a1\42"
  "\2d\cf\68\f3\bc\a4\c8\c8\51\2e\20\1c\0d\ed\a5\1b\c4\51\e0\b7\3a\e0\9f\17"
  "\36\39\c6\f4\85\47\59\60\ee\15\3b\ad\71\ac\18\cf\a5\3d\56\93\3c\ae\2c\69"
  "\75\21\90\56\1e\31\4f\c9\92\8c\1f\33\23\d5\de\ca\29\10\72\1f\07\80\67\bb"
  "\8b\60\dc\6a\a2\e6\c4\04\7a\b5\8d\52\db\85\75\97\d3\61\3b\38\79\7e\7e\61"
  "\56\72\d9\f7\66\a2\4c\f3\8a\b3\9b\ed\8c\af\eb\bc\10\9e\fb\a7\f8\2c\8a\af"
  "\82\f8\5e\b9\fe\6e\fa\68\bd\6c\a5\b0\23\15\aa\f0\c3\92\25\0f\8a\cd\ea\04"
  "\65\e2\c1\b4\0f\a1\24\4e\1d\ca\ed\5e\73\e9\a2\68\52\b1\65\78\a4\3a\b3\62"
  "\61\ae\87\db\26\42\b3\42\d4\b9\d8\70\7b\dd\d9\d2\56\dd\12\5d\27\5f\e8\f4"
  "\03\20\93\e3\20\6e\51\66\54\13\7d\7d\d9\b4\8f\3f\7b\a0\c3\43\a0\bd\ff\05"
  "\d7\3f\00\37\fa\bf\70\41\b0\87\37\34\5b\1c\06\1e\92\3f\51\10\b8\09\2b\49"
  "\bb\2f\81\0b\ae\a6\98\d0\55\0a\7d\9d\96\0f\f2\ce\4b\7f\b2\95\a0\43\ff\e1"
  "\d6\bd\2a\1f\36\78\4f\f9\83\28\9e\6f\98\ba\69\96\25\a9\a2\7a\ee\1c\52\4c"
  "\c5\8a\58\00\a0\98\e8\07\d9\2a\a9\04\cd\cc\d5\5d\18\b8\9a\6b\31\e4\92\38"
  "\ba\08\d4\61\6e\39\75\fd\2e\5e\6d\3d\1f\51\cd\dd\63\6f\29\d2\68\5d\7d\17"
  "\f1\49\40\37\9a\2b\25\dd\8e\82\68\d1\a0\24\5d\fa\97\c4\53\44\b0\2f\c7\4b"
  "\39\5e\ae\92\04\d3\e2\26\09\86\28\49\5c\8c\4f\f5\58\c1\d9\32\af\3d\0a\1b"
  "\8e\c0\e6\2f\93\00\17\3f\e7\3f\00\05\f6\fa\c3\14\00\00"
)

(func $inflate (export "inflate")
  (local $bfinal i32)
  (local $state i32)
  (local $bit-idx i32)
  (local $read-bit-count i32)
  (local $read-bits i32)
  (local $i i32)
  (local $hlit i32)
  (local $hdist i32)
  (local $hclen i32)
  (local $huffman-len i32)
  (local $len i32)
  (local $addr i32)
  (local $val i32)

  (local.set $bit-idx (i32.shl (i32.const 1139) (i32.const 3)))
  (local.set $read-bit-count (i32.const 1))

  loop $main-loop
    block $inc-state
    block $dynamic-read-hlits
    block $build-huffman
    block $dynamic-read-codelen
    block $dynamic-hclen
    block $dynamic-hdist
    block $dynamic-hlit
    block $dynamic
    block $fixed
    block $stored
    block $btype
    block $bfinal

      ;; read n bits
      (local.set $read-bits
        (i32.and
          (i32.shr_u
            (i32.load (i32.shr_u (local.get $bit-idx) (i32.const 8)))
            (i32.and (local.get $bit-idx) (i32.const 7)))
          (local.get $read-bit-count)))
      (local.set $bit-idx (i32.add (local.get $bit-idx) (local.get $read-bit-count)))

      (br_table $bfinal                ;; 0
                $btype                 ;; 1
                $dynamic-hlit          ;; 2
                $dynamic-hdist         ;; 3
                $dynamic-hclen         ;; 4
                $dynamic-read-codelen  ;; 5
                $dynamic-read-hlits    ;; 6
        (local.get $state))

    end $bfinal  ;; state 0
      (local.set $bfinal (local.get $read-bits))
      (local.set $read-bit-count (i32.const 2))
      (br $inc-state)

    end $btype  ;; state 1
      ;; 0 => $stored, 1 => $fixed, 2 => $dynamic
      (br_table $stored $fixed $dynamic (local.get $read-bits))

    end $stored
      ;; TODO

    end $fixed
      (local.set $i (i32.const 0))
      loop $lens
        ;; Write [0,144) => 8  [144,256) => 7, [256,280) => 9, [280,288) => 8
        (i32.store8
          (local.get $i)
          (select
            (i32.const 8)
            (select
              (i32.const 7)
              (select
                (i32.const 9)
                (i32.const 8)
                (i32.lt_u (local.get $i) (i32.const 280)))
              (i32.lt_u (local.get $i) (i32.const 256)))
            (i32.lt_u (local.get $i) (i32.const 144))))

        (br_if $lens
          (i32.eq (local.tee $i (i32.add (local.get $i) (i32.const 1)))
                  (i32.const 288)))
      end
      ;; TODO: Set state so dist huffman is built afterward
      (local.set $huffman-len (i32.const 288))
      (br $build-huffman)

    end $dynamic
      (local.set $read-bit-count (i32.const 5))
      (br $inc-state)  ;; state 1->2

    end $dynamic-hlit  ;; state 2
      (local.set $hlit (i32.add (local.get $read-bits) (i32.const 257)))
      (local.set $read-bit-count (i32.const 4))
      (br $inc-state)

    end $dynamic-hdist  ;; state 3
      (local.set $hlit (i32.add (local.get $read-bits) (i32.const 1)))
      (br $inc-state)

    end $dynamic-hclen  ;; state 4
      (local.set $huffman-len
        (local.tee $hclen (i32.add (local.get $read-bits) (i32.const 4))))
      (local.set $read-bit-count (i32.const 3))
      (local.set $i (i32.const 0))
      (br $inc-state)

    end $dynamic-read-codelen  ;; state 5
      ;; write each length in the order specified by "codelen literals"
      (i32.store16 offset=0
        (i32.load8_u offset=972 (local.get $i)) (local.get $read-bits))
      (br_if $main-loop
        (i32.lt_u
          (local.tee $i (i32.add (local.get $i) (i32.const 1)))
          (local.get $hclen)))

      ;; fallthrough
    end $build-huffman
      (local.set $i (i32.const 0))
      loop $loop
        ;; count[len[i]] += 1
        (i32.store8 offset=304
          (local.tee $addr (i32.load8_u offset=0 (local.get $i)))
          (i32.add
            (i32.load8_u offset=304 (local.get $addr))
            (i32.const 1)))

        (br_if $loop
          (i32.eq (local.tee $i (i32.add (local.get $i) (i32.const 1)))
                  (local.get $huffman-len)))
      end

      ;; count[0] = 0
      ;; offs[0] = 0
      (i32.store8 offset=304 (i32.const 0) (i32.const 0))
      (i32.store16 offset=288 (i32.const 0) (i32.const 0))
      (local.set $i (i32.const 0))
      loop $loop
        ;; offs[i+1] = offs[i] + count[i]*2   // *2 because value is u16
        (i32.store16 offset=290
          (local.get $i)
          (i32.add
            (i32.load16_u offset=288 (local.get $i))
            (i32.shl
              (i32.load8_u offset=304 (i32.shr_u (local.get $i) (i32.const 1)))
              (i32.const 1))))

        (br_if $loop
          (i32.eq (local.tee $i (i32.add (local.get $i) (i32.const 2)))
                  (i32.const 32)))
      end

      (local.set $i (i32.const 0))
      loop $loop
        ;; skip if len == 0
        (if (local.tee $len (i32.load8_u offset=0 (local.get $i)))
          (then
            ;; syms[offs[val]] = i
            (i32.store16 offset=320
              (local.tee $val
                (i32.load16_u offset=288
                  (local.tee $addr (i32.shl (local.get $len) (i32.const 1)))))
              (local.get $i))

            ;; offs[val] += 1
            (i32.store16 offset=288
              (local.get $addr)
              (i32.add (local.get $val) (i32.const 1)))))

        (br_if $loop
          (i32.eq (local.tee $i (i32.add (local.get $i) (i32.const 1)))
                  (local.get $huffman-len)))
      end
      (local.set $read-bit-count (i32.const 1))
      (br $inc-state)

    end $dynamic-read-hlits  ;; state 6

    end $inc-state
      (local.set $state (i32.add (local.get $state) (i32.const 1)))
      (br $main-loop)
  end
)
