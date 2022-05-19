// source: https://github.com/rzhang2285/Coppelia/blob/master/include/constraints.h.basic


module or1200_assumptions(
    input clock,
    input reset,
    input [31:0] insn
);

wire [5:0] opcode    = insn[31:26];
wire [1:0] nop_op    = insn[25:24];
wire       movhi_op  = insn[16];
wire [9:0] sys_op    = insn[25:16];
wire [7:0] lv_op     = insn[7:0];
wire [1:0] shift_op  = insn[27:26];
wire [8:0] sf_op     = insn[19:11];
wire [1:0] mac_op    = insn[1:0];
wire [1:0] arith1_op = insn[9:8];
wire [1:0] arith2_op = insn[7:6];
wire [3:0] arith3_op = insn[3:0];
wire [4:0] usf_op    = insn[25:21];

wire is_valid_instruction =
// l.j N (00 0x0  NNNNN NNNNN NNNN NNNN NNNN NNNN)
(opcode == 0) |
// l.jal N (00 0x1  NNNNN NNNNN NNNN NNNN NNNN NNNN)
(opcode == 1) | 
// l.bnf N (00 0x3  NNNNN NNNNN NNNN NNNN NNNN NNNN)
(opcode == 3) |
// l.bf N (00 0x4  NNNNN NNNNN NNNN NNNN NNNN NNNN)
(opcode == 4) | 
// l.nop K (00 0x5  01--- ----- KKKK KKKK KKKK KKKK)
((opcode == 5) & (nop_op == 1)) | 
// l.movhi rD, K (00 0x6  DDDDD ----0 KKKK KKKK KKKK KKKK)
((opcode == 6) & (movhi_op == 0)) | 
// l.macrc rD (00 0x6  DDDDD ----1 0000 0000 0000 0000)
((opcode == 6) & (movhi_op == 1)) | 
// l.sys K (00 0x8  00000 00000 KKKK KKKK KKKK KKKK)
((opcode == 8) & (sys_op == 0)) |
// l.trap K (00 0x8  01000 00000 KKKK KKKK KKKK KKKK)
((opcode == 8) & (sys_op == 256)) | 
// l.msync (00 0x8  10000 00000 0000 0000 0000 0000)
((opcode == 8) & (sys_op == 512)) | 
// l.psync (00 0x8  10100 00000 0000 0000 0000 0000)
((opcode == 8) & (sys_op == 640)) |
// l.csync (00 0x8  11000 00000 0000 0000 0000 0000)
((opcode == 8) & (sys_op == 768)) | 
// l.rfe (00 0x9  ----- ----- ---- ---- ---- ----)
(opcode == 9) | 
/*      
// lv.all_eq.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0x0)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 16)) | 
// lv.all_eq.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0x1)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 17)) | 
// lv.all_ge.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0x2)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 18)) | 
// lv.all_ge.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0x3)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 19)) | 
// lv.all_gt.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0x4)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 20)) | 
// lv.all_gt.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0x5)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 21)) | 
// lv.all_le.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0x6)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 22)) | 
// lv.all_le.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0x7)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 23)) | 
// lv.all_lt.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0x8)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 24)) | 
// lv.all_lt.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0x9)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 25)) | 
// lv.all_ne.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0xA)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 26)) | 
// lv.all_ne.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x1 0xB)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 27)) | 
// lv.any_eq.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0x0)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 32)) | 
// lv.any_eq.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0x1)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 33)) | 
// lv.any_ge.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0x2)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 34)) | 
// lv.any_ge.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0x3)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 35)) | 
// lv.any_gt.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0x4) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 36)) | 
// lv.any_gt.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0x5) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 37)) | 
// lv.any_le.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0x6)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 38)) | 
// lv.any_le.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0x7)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 39)) | 
// lv.any_lt.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0x8)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 40)) | 
// lv.any_lt.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0x9) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 41)) | 
// lv.any_ne.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0xA)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 42)) | 
// lv.any_ne.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x2 0xB) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 43)) | 
// lv.add.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0x0) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 48)) | 
// lv.add.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0x1)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 49)) | 
// lv.adds.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0x2)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 50)) | 
// lv.adds.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0x3)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 51)) | 
// lv.addu.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0x4)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 52)) | 
// lv.addu.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0x5) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 53)) | 
// lv.addus.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0x6)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 54)) | 
// lv.addus.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0x7) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 55)) | 
// lv.and rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0x8) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 56)) | 
// lv.avg.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0x9)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 57)) | 
// lv.avg.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x3 0xA)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 58)) | 
// lv.cmp_eq.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0x0)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 64)) | 
// lv.cmp_eq.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0x1)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 65)) | 
// lv.cmp_ge.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0x2)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 66)) | 
// lv.cmp_ge.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0x3)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 67)) | 
// lv.cmp_gt.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0x4)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 68)) | 
// lv.cmp_gt.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0x5)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 69)) | 
// lv.cmp_le.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0x6) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 70)) | 
// lv.cmp_le.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0x7)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 71)) | 
// lv.cmp_lt.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0x8) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 72)) | 
// lv.cmp_lt.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0x9)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 73)) | 
// lv.cmp_ne.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0xA) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 74)) | 
// lv.cmp_ne.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x4 0xB) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 75)) | 
// lv.madds.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0x4)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 84)) | 
// lv.max.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0x5)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 85)) | 
// lv.max.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0x6)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 86)) | 
// lv.merge.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0x7) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 87)) | 
// lv.merge.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0x8)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 88)) | 
// lv.min.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0x9) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 89)) | 
// lv.min.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0xA) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 90)) | 
// lv.msubs.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0xB) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 91)) | 
// lv.muls.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0xC)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 92)) | 
// lv.nand rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0xC)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 93)) | 
// lv.nor rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0xE) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 94)) | 
// lv.or rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x5 0xF)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 95)) | 
// lv.pack.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0x0)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 96)) | 
// lv.pack.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0x1)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 97)) | 
// lv.packs.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0x2)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 98)) | 
// lv.packs.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0x3)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 99)) | 
// lv.packus.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0x4)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 100)) | 
// lv.packus.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0x5)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 101)) | 
// lv.perm.n rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0x6)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 102)) | 
// lv.rl.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0x7) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 103)) | 
// lv.rl.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0x8) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 104)) | 
// lv.sll.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0x9) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 105)) | 
// lv.sll.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0xA) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 106)) | 
// lv.sll rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0xB) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 107)) | 
// lv.srl.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0xC)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 108)) | 
// lv.srl.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0xD)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 109)) | 
// lv.sra.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0xE)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 110)) | 
// lv.sra.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x6 0xF)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 111)) | 
// lv.srl rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0x0)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 112)) | 
// lv.sub.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0x1)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 113)) | 
// lv.sub.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0x2)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 114)) | 
// lv.subs.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0x3)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 115)) | 
// lv.subs.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0x4)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 116)) | 
// lv.subu.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0x5)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 117)) | 
// lv.subu.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0x6)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 118)) | 
// lv.subus.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0x7)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 119)) | 
// lv.subus.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0x8)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 120)) | 
// lv.unpack.b rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0x9)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 121)) | 
// lv.unpack.h rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0xA)
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 122)) | 
// lv.xor rD, rA, rB (00 0xA  DDDDD AAAAA BBBB B--- 0x7 0xB) 
((opcode == 10) & 
    ((insn & lv_op_mask) >> lv_op_offset == 123)) | 
// lv.cust1 (00 0xA  ----- ----- ---- ---- 0xC ----)
((opcode == 10) & 
    ((insn & lvcust_op_mask) >> lvcust_op_offset == 12)) | 
// lv.cust2 (00 0xA  ----- ----- ---- ---- 0xD ----)
((opcode == 10) & 
    ((insn & lvcust_op_mask) >> lvcust_op_offset == 13)) | 
// lv.cust3 (00 0xA  ----- ----- ---- ---- 0xE ----)
((opcode == 10) & 
    ((insn & lvcust_op_mask) >> lvcust_op_offset == 14)) | 
// lv.cust4 (00 0xA  ----- ----- ---- ---- 0xF ----)
((opcode == 10) & 
    ((insn & lvcust_op_mask) >> lvcust_op_offset == 15)) |
*/      
// l.jr rB (01 0x1  ----- ----- BBBB B--- ---- ----)
(opcode == 17) | 
// l.jalr rB (01 0x2  ----- ----- BBBB B--- ---- ----) 
(opcode == 18) | 
// l.maci rA, I (01 0x3  ----- AAAAA IIII IIII IIII IIII) 
(opcode == 19) | 
// l.lwa rD, I(rA) (01 0xB  DDDDD AAAAA IIII IIII IIII IIII)
(opcode == 27) | 
/*
// l.cust1 (01 0xC  ----- ----- ---- ---- ---- ----)
(opcode == 28) | 
// l.cust2 (01 0xD  ----- ----- ---- ---- ---- ----)
(opcode == 29) | 
// l.cust3 (01 0xE  ----- ----- ---- ---- ---- ----)
(opcode == 30) | 
// l.cust4 (01 0xF  ----- ----- ---- ---- ---- ----)
(opcode == 31) |
*/
// l.ld rD, I(rA) (10 0x0  DDDDD AAAAA IIII IIII IIII IIII)
(opcode == 32) | 
// l.lwz rD, I(rA) (10 0x1  DDDDD AAAAA IIII IIII IIII IIII)
(opcode == 33) | 
// l.lws rD, I(rA) (10 0x2  DDDDD AAAAA IIII IIII IIII IIII)
(opcode == 34) | 
// l.lbz rD, I(rA) (10 0x3  DDDDD AAAAA IIII IIII IIII IIII)
(opcode == 35) | 
// l.lbs rD, I(rA) (10 0x4  DDDDD AAAAA IIII IIII IIII IIII)
(opcode == 36) | 
// l.lhz rD, I(rA) (10 0x5  DDDDD AAAAA IIII IIII IIII IIII)
(opcode == 37) | 
// l.lhs rD, I(rA) (10 0x6  DDDDD AAAAA IIII IIII IIII IIII) 
(opcode == 38) | 
// l.addi rD, rA, I (10 0x7  DDDDD AAAAA IIII IIII IIII IIII)
(opcode == 39) | 
// l.addic rD, rA, I (10 0x8  DDDDD AAAAA IIII IIII IIII IIII) 
(opcode == 40) |  
// l.andi rD, rA, K (10 0x9  DDDDD AAAAA KKKK KKKK KKKK KKKK)
(opcode == 41) | 
// l.ori rD, rA, K (10 0xA  DDDDD AAAAA KKKK KKKK KKKK KKKK) 
(opcode == 42) | 
// l.xori rD, rA, I (10 0xB  DDDDD AAAAA IIII IIII IIII IIII) 
(opcode == 43) | 
// l.muli rD, rA, I (10 0xC  DDDDD AAAAA IIII IIII IIII IIII) 
(opcode == 44) | 
// l.mfspr rD, rA, K (10 0xD  DDDDD AAAAA KKKK KKKK KKKK KKKK) 
(opcode == 45) | 
// l.slli rD, rA, L (10 0xE  DDDDD AAAAA ---- ---- 00LL LLLL) 
((opcode == 46) & 
    (shift_op == 0)) |
// l.srli rD, rA, L (10 0xE  DDDDD AAAAA ---- ---- 01LL LLLL) 
((opcode == 46) & 
    (shift_op == 1)) | 
// l.srai rD, rA, L (10 0xE  DDDDD AAAAA ---- ---- 10LL LLLL) 
((opcode == 46) & 
    (shift_op == 2)) | 
// l.rori rD, rA, L (10 0xE  DDDDD AAAAA ---- ---- 11LL LLLL) 
((opcode == 46) & 
    (shift_op == 3)) | 
// l.sfeqi rA, I (10 0xF  00000 AAAAA IIII IIII IIII IIII) 
((opcode == 47) & 
    (sf_op == 0)) |
// l.sfnei rA, I (10 0xF  00001 AAAAA IIII IIII IIII IIII) 
((opcode == 47) & 
    (sf_op == 1)) | 
// l.sfgtui rA, I (10 0xF  00010 AAAAA IIII IIII IIII IIII)
((opcode == 47) & 
    (sf_op == 2)) | 
// l.sfgeui rA, I (10 0xF  00011 AAAAA IIII IIII IIII IIII) 
((opcode == 47) & 
    (sf_op == 3)) | 
// l.sfltui rA, I (10 0xF  00100 AAAAA IIII IIII IIII IIII) 
((opcode == 47) & 
    (sf_op == 4)) | 
// l.sfleui rA, I (10 0xF  00101 AAAAA IIII IIII IIII IIII) 
((opcode == 47) & 
    (sf_op == 5)) | 
// l.sfgtsi rA, I (10 0xF  01010 AAAAA IIII IIII IIII IIII) 
((opcode == 47) & 
    (sf_op == 10)) | 
// l.sfgesi rA, I (10 0xF  01011 AAAAA IIII IIII IIII IIII) 
((opcode == 47) & 
    (sf_op == 11)) | 
// l.sfltsi rA, I (10 0xF  01100 AAAAA IIII IIII IIII IIII)
((opcode == 47) & 
    (sf_op == 12)) | 
// l.sflesi rA, I (10 0xF  01101 AAAAA IIII IIII IIII IIII) 
((opcode == 47) & 
    (sf_op == 13)) | 
// l.mtspr rA, rB, K (11 0x0  KKKKK AAAAA BBBB BKKK KKKK KKKK) 
(opcode == 48) | 
// l.mac rA, rB (11 0x1  ----- AAAAA BBBB B--- ---- 0x1)
((opcode == 49) & 
    (mac_op == 1)) | 
// l.msb rA, rB (11 0x1  ----- AAAAA BBBB B--- ---- 0x2) 
((opcode == 49) & 
    (mac_op == 2)) | 
/*
// lf.add.s rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x0 0x0)
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 0)) |
// lf.sub.s rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x0 0x1) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 1)) | 
// lf.mul.s rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x0 0x2) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 2)) | 
// lf.div.s rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x0 0x3) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 3)) | 
// lf.itof.s rD, rA (11 0x2  DDDDD AAAAA 0000 0--- 0x0 0x4) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 4)) | 
// lf.ftoi.s rD, rA (11 0x2  DDDDD AAAAA 0000 0--- 0x0 0x5) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 5)) |
// lf.rem.s rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x0 0x6) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 6)) |
// lf.madd.s rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x0 0x7) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 7)) | 
// lf.sfeq.s rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x0 0x8) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 8)) | 
// lf.sfne.s rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x0 0x9) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 9)) | 
// lf.sfgt.s rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x0 0xA) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 10)) | 
// lf.sfge.s rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x0 0xB) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 11)) | 
// lf.sflt.s rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x0 0xC) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 12)) | 
// lf.sfle.s rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x0 0xD) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 13)) | 
// lf.cust1.s rA, rB (11 0x2  ----- AAAAA BBBB B--- 0xD ----)
((opcode == 50) & 
    ((insn & lfcust_op_mask) >> lfcust_op_offset == 13)) | 
// lf.add.d rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x1 0x0) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 16)) | 
// lf.sub.d rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x1 0x1) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 17)) | 
// lf.mul.d rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x1 0x2) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 18)) | 
// lf.div.d rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x1 0x3) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 19)) | 
// lf.itof.d rD, rA (11 0x2  DDDDD AAAAA 0000 0--- 0x1 0x4) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 20)) | 
// lf.ftoi.d rD, rA (11 0x2  DDDDD AAAAA 0000 0--- 0x1 0x5) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 21)) | 
// lf.rem.d rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x1 0x6) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 22)) | 
// lf.madd.d rD, rA, rB (11 0x2  DDDDD AAAAA BBBB B--- 0x1 0x7) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 23)) | 
// lf.sfeq.d rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x1 0x8) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 24)) | 
// lf.sfne.d rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x1 0x9)
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 25)) | 
// lf.sfgt.d rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x1 0xA) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 26)) | 
// lf.sfge.d rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x1 0xB) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 27)) | 
// lf.sflt.d rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x1 0xC) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 28)) | 
// lf.sfle.d rA, rB (11 0x2  ----- AAAAA BBBB B--- 0x1 0xD) 
((opcode == 50) & 
    ((insn & lf_op_mask) >> lf_op_offset == 29)) | 
// lf.cust1.d rA, rB (11 0x2  ----- AAAAA BBBB B--- 0xE ----) 
((opcode == 50) & 
    ((insn & lfcust_op_mask) >> lfcust_op_offset == 14)) |
*/
// l.swa I(rA), rB (11 0x3  IIIII AAAAA BBBB BIII IIII IIII) 
(opcode == 51) | 
// l.sd I(rA), rB (11 0x4  IIIII AAAAA BBBB BIII IIII IIII) 
(opcode == 52) | 
// l.sw I(rA), rB (11 0x5  IIIII AAAAA BBBB BIII IIII IIII) 
(opcode == 53) | 
// l.sb I(rA), rB (11 0x6  IIIII AAAAA BBBB BIII IIII IIII) 
(opcode == 54) | 
// l.sh I(rA), rB (11 0x7  IIIII AAAAA BBBB BIII IIII IIII) 
(opcode == 55) | 
// l.add rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 ---- 0x0) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith3_op == 0)) | 
// l.addc rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 ---- 0x1) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith3_op == 1)) | 
// l.sub rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 ---- 0x2) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith3_op == 2)) | 
// l.and rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 ---- 0x3) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith3_op == 3)) | 
// l.or rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 ---- 0x4) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith3_op == 4)) | 
// l.xor rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 ---- 0x5)
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith3_op == 5)) | 
// l.mul rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-11 ---- 0x6) 
((opcode == 56) & 
    (arith1_op == 3) & 
    (arith3_op == 6)) | 
// l.sll rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 00-- 0x8) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith2_op == 0) & 
    (arith3_op == 8)) | 
// l.srl rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 01-- 0x8) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith2_op == 1) & 
    (arith3_op == 8)) | 
// l.sra rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 10-- 0x8) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith2_op == 2) & 
    (arith3_op == 8)) | 
// l.ror rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 11-- 0x8) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith2_op == 3) & 
    (arith3_op == 8)) | 
// l.div rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-11 ---- 0x9) 
((opcode == 56) & 
    (arith1_op == 3) & 
    (arith3_op == 9)) | 
// l.divu rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-11 ---- 0xA) 
((opcode == 56) & 
    (arith1_op == 3) & 
    (arith3_op == 10)) | 
// l.mulu rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-11 ---- 0xB) 
((opcode == 56) & 
    (arith1_op == 3) & 
    (arith3_op == 11)) | 
// l.extbs rD, rA (11 0x8  DDDDD AAAAA ---- --00 01-- 0xC) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith2_op == 1) & 
    (arith3_op == 12)) | 
// l.exths rD, rA (11 0x8  DDDDD AAAAA ---- --00 00-- 0xC) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith2_op == 0) & 
    (arith3_op == 12)) | 
// l.extws rD, rA (11 0x8  DDDDD AAAAA ---- --00 00-- 0xD) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith2_op == 0) & 
    (arith3_op == 13)) | 
// l.extbz rD, rA (11 0x8  DDDDD AAAAA ---- --00 11-- 0xC) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith2_op == 3) & 
    (arith3_op == 12)) | 
// l.extbz rD, rA (11 0x8  DDDDD AAAAA ---- --00 10-- 0xC) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith2_op == 2) & 
    (arith3_op == 12)) | 
// l.extwz rD, rA (11 0x8  DDDDD AAAAA ---- --00 01-- 0xD) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith2_op == 1) & 
    (arith3_op == 13)) | 
// l.cmov rD, rA, rB (11 0x8  DDDDD AAAAA BBBB B-00 ---- 0xE) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith3_op == 14)) | 
// l.ff1 rD, rA (11 0x8  DDDDD AAAAA ---- --00 ---- 0xF) 
((opcode == 56) & 
    (arith1_op == 0) & 
    (arith3_op == 15)) | 
// l.fl1 rD, rA (11 0x8  DDDDD AAAAA ---- --01 ---- 0xF) 
((opcode == 56) & 
    (arith1_op == 1) & 
    (arith3_op == 15)) | 
// l.sfeq rA, rB (11 0x9  00000 AAAAA BBBB B--- ---- ----) 
((opcode == 57) & 
    (usf_op == 0)) | 
// l.sfne rA, rB (11 0x9  00001 AAAAA BBBB B--- ---- ----) 
((opcode == 57) & 
    (usf_op == 1)) | 
// l.sfgtu rA, rB (11 0x9  00010 AAAAA BBBB B--- ---- ----) 
((opcode == 57) & 
    (usf_op == 2)) | 
// l.sfgeu rA, rB (11 0x9  00011 AAAAA BBBB B--- ---- ----) 
((opcode == 57) & 
    (usf_op == 3)) | 
// l.sfltu rA, rB (11 0x9  00100 AAAAA BBBB B--- ---- ----)
((opcode == 57) & 
    (usf_op == 4)) | 
// l.sfleu rA, rB (11 0x9  00101 AAAAA BBBB B--- ---- ----)
((opcode == 57) & 
    (usf_op == 5)) | 
// l.sfgts rA, rB (11 0x9  01010 AAAAA BBBB B--- ---- ----)
((opcode == 57) & 
    (usf_op == 10)) | 
// l.sfges rA, rB (11 0x9  01011 AAAAA BBBB B--- ---- ----)
((opcode == 57) & 
    (usf_op == 11)) |
// l.sflts rA, rB (11 0x9  01100 AAAAA BBBB B--- ---- ----) 
((opcode == 57) & 
    (usf_op == 12)) | 
// l.sfles rA, rB (11 0x9  01101 AAAAA BBBB B--- ---- ----) 
((opcode == 57) & 
    (usf_op == 13)) 
/*
// l.cust5 (11 0xC  DDDDD AAAAA BBBB BLLL LLLK KKKK)
(opcode == 60) | 
// l.cust6 (11 0xD  ----- ----- ---- ---- ---- ----) 
(opcode == 61) | 
// l.cust7 (11 0xE  ----- ----- ---- ---- ---- ----) 
(opcode == 62) | 
// l.cust8 (11 0xF  ----- ----- ---- ---- ---- ----) 
(opcode == 63)
*/;


always @(posedge clock) if (!reset) assume(is_valid_instruction);

endmodule