module TileAndMemTop(
  input   clock
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg  _resetCount = 1'h0;
  wire [1:0] _GEN_0 = _resetCount + 1'h1;
  wire  reset = _resetCount < 1'h1;
  wire  dut_clock; // @[TileAndMemTop.scala 15:19]
  wire  dut_reset; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_aw_ready; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_aw_valid; // @[TileAndMemTop.scala 15:19]
  wire [31:0] dut_io_nasti_aw_bits_addr; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_w_ready; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_w_valid; // @[TileAndMemTop.scala 15:19]
  wire [63:0] dut_io_nasti_w_bits_data; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_b_ready; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_b_valid; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_ar_ready; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_ar_valid; // @[TileAndMemTop.scala 15:19]
  wire [31:0] dut_io_nasti_ar_bits_addr; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_r_ready; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_r_valid; // @[TileAndMemTop.scala 15:19]
  wire [63:0] dut_io_nasti_r_bits_data; // @[TileAndMemTop.scala 15:19]
  wire  dut_io_nasti_r_bits_last; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_29_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__isInstRet_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_10_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_7_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_33_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_23_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_25_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_6_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_31_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___wdata_T_3_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__privInst_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_16_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__isEret_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_41_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_53_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__iaddrInvalid_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_27_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_43_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_35_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_3_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_18_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__privValid_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_expt_T_6_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___isInstRet_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_3_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_7_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__io_expt_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_24_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___wen_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_21_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__wen_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_13_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_8_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_47_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_19_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_12_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_9_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___csrRO_T_4_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___isEcall_T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___wdata_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___laddrInvalid_T_6_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_17_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___laddrInvalid_T_8_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_45_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_17_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_13_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_11_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_20_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_14_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_55_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_39_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_51_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__laddrInvalid_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_23_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___isInstRet_T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_expt_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___isEcall_T_4_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___csrRO_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___saddrInvalid_T_3_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__isEcall_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__isEbreak_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_49_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_11_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___wdata_T_7_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___isInstRet_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_37_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___saddrInvalid_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_22_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_57_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___laddrInvalid_T_4_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_9_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_15_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__saddrInvalid_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___T_19_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_21_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr___io_out_T_15_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__regFile___T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__regFile___io_rdata2_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__regFile___io_rdata1_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___cmp_T_4_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_10_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_12_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___shin_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_9_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_4_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_3_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_14_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_6_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_7_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_8_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___cmp_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___sum_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__alu___out_T_16_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__immGen___io_out_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__immGen___io_out_T_4_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__immGen___io_out_T_6_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__immGen___io_out_T_12_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__immGen___io_out_T_8_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__immGen___io_out_T_10_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__brCond__isSameSign_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__brCond__eq_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__brCond___io_taken_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__brCond___io_taken_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__brCond___io_taken_T_11_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__brCond___io_taken_T_8_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__brCond___io_taken_T_14_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__brCond___io_taken_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__brCond__geu_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__brCond__ge_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___io_dcache_req_bits_mask_T_7_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___npc_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___inst_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___rs1_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___T_6_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__io_ctrl_A_sel_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___npc_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___io_icache_req_valid_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__io_ctrl_B_sel_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___regWrite_T_9_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___stall_T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__csr__io_expt; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___regWrite_T_7_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___stall_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___rs1hazard_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___load_T_13_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___load_T_11_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___rs1_T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath__stall_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___io_dcache_req_bits_mask_T_9_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___load_T_15_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___io_dcache_req_bits_mask_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___rs2hazard_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___csr_in_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___npc_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___regWrite_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___npc_T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___rs2_T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___load_T_9_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___T_4_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__dpath___T_7_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_31_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_93_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_87_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_81_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_15_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_49_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_41_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_11_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_19_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_95_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_21_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_47_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_35_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_75_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_25_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_55_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_71_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_27_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_59_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_29_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_39_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_63_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_97_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_23_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_65_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_89_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_51_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_83_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_77_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_85_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_37_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_67_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_91_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_43_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_17_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_9_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_79_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_33_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_45_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_13_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_53_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_69_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_3_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_7_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_73_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_57_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_core__ctrl___ctrlSignals_T_61_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___wmask_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_18_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__io_cpu_req_valid_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_25_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_33_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__wen_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__is_alloc_reg_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__read_wrap_out_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_21_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_11_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_16_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__ren_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___hit_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_6_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___io_nasti_ar_valid_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___wen_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__is_idle_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_8_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__is_write_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_43_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_20_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___is_alloc_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__read_count_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_13_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__io_cpu_resp_valid_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___ren_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_3_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__ren_reg_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_19_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_51_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_28_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_9_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_14_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_4_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_47_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_15_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_40_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__is_alloc_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__hit_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_30_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache__is_read_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_icache___T_10_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___io_cpu_resp_valid_T_3_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___wmask_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___state_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__wen_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_33_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_44_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__read_wrap_out_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_21_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_16_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___ren_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__ren_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___hit_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_6_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___io_nasti_ar_valid_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_29_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__write_count_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_8_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__is_write_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_20_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___is_alloc_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__read_count_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__io_cpu_resp_valid_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_51_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_4_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_15_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_40_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__is_alloc_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__hit_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_30_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__is_read_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_35_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_10_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_18_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__io_cpu_req_valid_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_25_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__is_alloc_reg_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_11_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___io_cpu_resp_valid_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___wen_T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__is_idle_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_43_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_13_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__write_wrap_out_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_3_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache__ren_reg_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_19_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_28_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_9_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_14_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_dcache___T_47_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_2_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_13_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_24_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb__io_dcache_ar_valid_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___io_nasti_ar_valid_T_1_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_20_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_8_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___io_dcache_b_valid_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_5_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_4_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___io_icache_ar_ready_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_10_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_18_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___io_nasti_aw_valid_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_3_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___io_icache_r_valid_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___io_dcache_r_valid_T_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___T_23_0; // @[TileAndMemTop.scala 15:19]
  wire  dut_arb___io_nasti_w_valid_T_0; // @[TileAndMemTop.scala 15:19]
  reg [63:0] _mem [0:1048575]; // @[TileAndMemTop.scala 22:17]
  wire  _mem_write_MPORT_en; // @[TileAndMemTop.scala 22:17]
  wire [19:0] _mem_write_MPORT_addr; // @[TileAndMemTop.scala 22:17]
  wire [63:0] _mem_write_MPORT_data; // @[TileAndMemTop.scala 22:17]
  wire  _mem_write_MPORT_1_en; // @[TileAndMemTop.scala 22:17]
  wire [19:0] _mem_write_MPORT_1_addr; // @[TileAndMemTop.scala 22:17]
  wire [63:0] _mem_write_MPORT_1_data; // @[TileAndMemTop.scala 22:17]
  wire  _mem_write_MPORT_2_en; // @[TileAndMemTop.scala 22:17]
  wire [19:0] _mem_write_MPORT_2_addr; // @[TileAndMemTop.scala 22:17]
  wire [63:0] _mem_write_MPORT_2_data; // @[TileAndMemTop.scala 22:17]
  wire  _mem_write_MPORT_3_en; // @[TileAndMemTop.scala 22:17]
  wire [19:0] _mem_write_MPORT_3_addr; // @[TileAndMemTop.scala 22:17]
  wire [63:0] _mem_write_MPORT_3_data; // @[TileAndMemTop.scala 22:17]
  wire  _mem_write_MPORT_4_en; // @[TileAndMemTop.scala 22:17]
  wire [19:0] _mem_write_MPORT_4_addr; // @[TileAndMemTop.scala 22:17]
  wire [63:0] _mem_write_MPORT_4_data; // @[TileAndMemTop.scala 22:17]
  wire  _mem_write_MPORT_5_en; // @[TileAndMemTop.scala 22:17]
  wire [19:0] _mem_write_MPORT_5_addr; // @[TileAndMemTop.scala 22:17]
  wire [63:0] _mem_write_MPORT_5_data; // @[TileAndMemTop.scala 22:17]
  wire  _mem_write_MPORT_6_en; // @[TileAndMemTop.scala 22:17]
  wire [19:0] _mem_write_MPORT_6_addr; // @[TileAndMemTop.scala 22:17]
  wire [63:0] _mem_write_MPORT_6_data; // @[TileAndMemTop.scala 22:17]
  wire  _mem_write_MPORT_7_en; // @[TileAndMemTop.scala 22:17]
  wire [19:0] _mem_write_MPORT_7_addr; // @[TileAndMemTop.scala 22:17]
  wire [63:0] _mem_write_MPORT_7_data; // @[TileAndMemTop.scala 22:17]
  wire  _mem_dut_io_nasti_r_bits_x6_en; // @[TileAndMemTop.scala 22:17]
  wire [19:0] _mem_dut_io_nasti_r_bits_x6_addr; // @[TileAndMemTop.scala 22:17]
  wire [63:0] _mem_dut_io_nasti_r_bits_x6_data; // @[TileAndMemTop.scala 22:17]
  wire [63:0] _mem_MPORT_data; // @[TileAndMemTop.scala 22:17]
  wire [19:0] _mem_MPORT_addr; // @[TileAndMemTop.scala 22:17]
  wire  _mem_MPORT_mask; // @[TileAndMemTop.scala 22:17]
  wire  _mem_MPORT_en; // @[TileAndMemTop.scala 22:17]
  reg [1:0] state = 2'h0; // @[TileAndMemTop.scala 24:22]
  reg [31:0] addr = 32'h0; // @[TileAndMemTop.scala 28:17]
  reg [7:0] off = 8'h0; // @[TileAndMemTop.scala 30:16]
  wire [63:0] _write_T_2 = dut_io_nasti_w_bits_data; // @[TileAndMemTop.scala 33:11]
  wire [8:0] _write_T_4 = {{1'd0}, _write_T_2[7:0]}; // @[TileAndMemTop.scala 36:9]
  wire [63:0] _write_T_5 = {{55'd0}, _write_T_4}; // @[TileAndMemTop.scala 32:11]
  wire [15:0] _GEN_2 = {_write_T_2[15:8], 8'h0}; // @[TileAndMemTop.scala 36:9]
  wire [22:0] _write_T_10 = {{7'd0}, _GEN_2}; // @[TileAndMemTop.scala 36:9]
  wire [63:0] _GEN_3 = {{41'd0}, _write_T_10}; // @[TileAndMemTop.scala 32:11]
  wire [63:0] _write_T_11 = _write_T_5 | _GEN_3; // @[TileAndMemTop.scala 32:11]
  wire [23:0] _GEN_7 = {_write_T_2[23:16], 16'h0}; // @[TileAndMemTop.scala 36:9]
  wire [38:0] _write_T_16 = {{15'd0}, _GEN_7}; // @[TileAndMemTop.scala 36:9]
  wire [63:0] _GEN_8 = {{25'd0}, _write_T_16}; // @[TileAndMemTop.scala 32:11]
  wire [63:0] _write_T_17 = _write_T_11 | _GEN_8; // @[TileAndMemTop.scala 32:11]
  wire [31:0] _GEN_13 = {_write_T_2[31:24], 24'h0}; // @[TileAndMemTop.scala 36:9]
  wire [38:0] _write_T_22 = {{7'd0}, _GEN_13}; // @[TileAndMemTop.scala 36:9]
  wire [63:0] _GEN_14 = {{25'd0}, _write_T_22}; // @[TileAndMemTop.scala 32:11]
  wire [63:0] _write_T_23 = _write_T_17 | _GEN_14; // @[TileAndMemTop.scala 32:11]
  wire [39:0] _GEN_16 = {_write_T_2[39:32], 32'h0}; // @[TileAndMemTop.scala 36:9]
  wire [70:0] _write_T_28 = {{31'd0}, _GEN_16}; // @[TileAndMemTop.scala 36:9]
  wire [70:0] _GEN_17 = {{7'd0}, _write_T_23}; // @[TileAndMemTop.scala 32:11]
  wire [70:0] _write_T_29 = _GEN_17 | _write_T_28; // @[TileAndMemTop.scala 32:11]
  wire [47:0] _GEN_22 = {_write_T_2[47:40], 40'h0}; // @[TileAndMemTop.scala 36:9]
  wire [70:0] _write_T_34 = {{23'd0}, _GEN_22}; // @[TileAndMemTop.scala 36:9]
  wire [70:0] _write_T_35 = _write_T_29 | _write_T_34; // @[TileAndMemTop.scala 32:11]
  wire [55:0] _GEN_29 = {_write_T_2[55:48], 48'h0}; // @[TileAndMemTop.scala 36:9]
  wire [70:0] _write_T_40 = {{15'd0}, _GEN_29}; // @[TileAndMemTop.scala 36:9]
  wire [70:0] _write_T_41 = _write_T_35 | _write_T_40; // @[TileAndMemTop.scala 32:11]
  wire [63:0] _GEN_30 = {_write_T_2[63:56], 56'h0}; // @[TileAndMemTop.scala 36:9]
  wire [70:0] _write_T_46 = {{7'd0}, _GEN_30}; // @[TileAndMemTop.scala 36:9]
  wire [70:0] write = _write_T_41 | _write_T_46; // @[TileAndMemTop.scala 32:11]
  wire [31:0] _GEN_32 = {{24'd0}, off}; // @[TileAndMemTop.scala 45:67]
  wire [31:0] _dut_io_nasti_r_bits_x6_T_1 = addr + _GEN_32; // @[TileAndMemTop.scala 45:67]
  wire  dut_io_nasti_r_bits_x7 = off == 8'h1; // @[TileAndMemTop.scala 45:79]
  wire  _T_3 = 2'h0 == state; // @[TileAndMemTop.scala 63:17]
  wire [31:0] _addr_T = dut_io_nasti_aw_bits_addr / 4'h8; // @[TileAndMemTop.scala 67:43]
  wire [31:0] _addr_T_1 = dut_io_nasti_ar_bits_addr / 4'h8; // @[TileAndMemTop.scala 74:43]
  wire [7:0] _off_T_1 = off + 8'h1; // @[TileAndMemTop.scala 89:22]
  wire [1:0] _GEN_11 = dut_io_nasti_r_bits_x7 ? 2'h2 : state; // @[TileAndMemTop.scala 85:27 87:17 24:22]
  wire [7:0] _GEN_12 = dut_io_nasti_r_bits_x7 ? off : _off_T_1; // @[TileAndMemTop.scala 30:16 85:27 89:15]
  wire  _GEN_15 = dut_io_nasti_w_valid; // @[TileAndMemTop.scala 82:34 83:13 22:17]
  wire  _T_14 = dut_io_nasti_b_ready & dut_io_nasti_b_valid; // @[Decoupled.scala 50:35]
  wire [1:0] _GEN_20 = _T_14 ? 2'h0 : state; // @[TileAndMemTop.scala 94:33 95:15 24:22]
  wire  _T_18 = dut_io_nasti_r_ready & dut_io_nasti_r_valid; // @[Decoupled.scala 50:35]
  wire [1:0] _GEN_21 = dut_io_nasti_r_bits_x7 ? 2'h0 : state; // @[TileAndMemTop.scala 100:27 101:17 24:22]
  wire [1:0] _GEN_23 = _T_18 ? _GEN_21 : state; // @[TileAndMemTop.scala 24:22 99:33]
  wire [7:0] _GEN_24 = _T_18 ? _GEN_12 : off; // @[TileAndMemTop.scala 30:16 99:33]
  wire [1:0] _GEN_25 = 2'h3 == state ? _GEN_23 : state; // @[TileAndMemTop.scala 63:17 24:22]
  wire  _GEN_31 = 2'h1 == state & _GEN_15; // @[TileAndMemTop.scala 22:17 63:17]
  wire  tracker_clock;
  wire  tracker_reset;
  wire  tracker_dut__core__dpath__csr___io_out_T_29_0;
  wire  tracker_dut__core__dpath__csr___T_0;
  wire  tracker_dut__core__dpath__csr__isInstRet_0;
  wire  tracker_dut__core__dpath__csr___T_10_0;
  wire  tracker_dut__core__dpath__csr___T_7_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_33_0;
  wire  tracker_dut__core__dpath__csr___T_23_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_25_0;
  wire  tracker_dut__core__dpath__csr___T_6_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_31_0;
  wire  tracker_dut__core__dpath__csr___wdata_T_3_0;
  wire  tracker_dut__core__dpath__csr__privInst_0;
  wire  tracker_dut__core__dpath__csr___T_16_0;
  wire  tracker_dut__core__dpath__csr__isEret_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_41_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_1_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_53_0;
  wire  tracker_dut__core__dpath__csr__iaddrInvalid_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_27_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_43_0;
  wire  tracker_dut__core__dpath__csr___T_1_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_35_0;
  wire  tracker_dut__core__dpath__csr___T_3_0;
  wire  tracker_dut__core__dpath__csr___T_18_0;
  wire  tracker_dut__core__dpath__csr__privValid_0;
  wire  tracker_dut__core__dpath__csr___io_expt_T_6_0;
  wire  tracker_dut__core__dpath__csr___isInstRet_T_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_3_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_7_0;
  wire  tracker_dut__core__dpath__csr__io_expt_0;
  wire  tracker_dut__core__dpath__csr___T_24_0;
  wire  tracker_dut__core__dpath__csr___wen_T_0;
  wire  tracker_dut__core__dpath__csr___T_21_0;
  wire  tracker_dut__core__dpath__csr__wen_0;
  wire  tracker_dut__core__dpath__csr___T_13_0;
  wire  tracker_dut__core__dpath__csr___T_8_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_47_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_19_0;
  wire  tracker_dut__core__dpath__csr___T_12_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_9_0;
  wire  tracker_dut__core__dpath__csr___csrRO_T_4_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_5_0;
  wire  tracker_dut__core__dpath__csr___isEcall_T_1_0;
  wire  tracker_dut__core__dpath__csr___wdata_T_5_0;
  wire  tracker_dut__core__dpath__csr___laddrInvalid_T_6_0;
  wire  tracker_dut__core__dpath__csr___T_17_0;
  wire  tracker_dut__core__dpath__csr___laddrInvalid_T_8_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_45_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_17_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_13_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_11_0;
  wire  tracker_dut__core__dpath__csr___T_20_0;
  wire  tracker_dut__core__dpath__csr___T_14_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_55_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_39_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_51_0;
  wire  tracker_dut__core__dpath__csr__laddrInvalid_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_23_0;
  wire  tracker_dut__core__dpath__csr___isInstRet_T_1_0;
  wire  tracker_dut__core__dpath__csr___io_expt_T_5_0;
  wire  tracker_dut__core__dpath__csr___isEcall_T_4_0;
  wire  tracker_dut__core__dpath__csr___csrRO_T_2_0;
  wire  tracker_dut__core__dpath__csr___saddrInvalid_T_3_0;
  wire  tracker_dut__core__dpath__csr__isEcall_0;
  wire  tracker_dut__core__dpath__csr__isEbreak_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_49_0;
  wire  tracker_dut__core__dpath__csr___T_11_0;
  wire  tracker_dut__core__dpath__csr___wdata_T_7_0;
  wire  tracker_dut__core__dpath__csr___isInstRet_T_5_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_37_0;
  wire  tracker_dut__core__dpath__csr___saddrInvalid_T_5_0;
  wire  tracker_dut__core__dpath__csr___T_22_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_57_0;
  wire  tracker_dut__core__dpath__csr___laddrInvalid_T_4_0;
  wire  tracker_dut__core__dpath__csr___T_9_0;
  wire  tracker_dut__core__dpath__csr___T_15_0;
  wire  tracker_dut__core__dpath__csr__saddrInvalid_0;
  wire  tracker_dut__core__dpath__csr___T_19_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_21_0;
  wire  tracker_dut__core__dpath__csr___io_out_T_15_0;
  wire  tracker_dut__core__dpath__regFile___T_1_0;
  wire  tracker_dut__core__dpath__regFile___io_rdata2_T_0;
  wire  tracker_dut__core__dpath__regFile___io_rdata1_T_0;
  wire  tracker_dut__core__dpath__alu___out_T_1_0;
  wire  tracker_dut__core__dpath__alu___cmp_T_4_0;
  wire  tracker_dut__core__dpath__alu___out_T_0;
  wire  tracker_dut__core__dpath__alu___out_T_10_0;
  wire  tracker_dut__core__dpath__alu___out_T_12_0;
  wire  tracker_dut__core__dpath__alu___shin_T_0;
  wire  tracker_dut__core__dpath__alu___out_T_9_0;
  wire  tracker_dut__core__dpath__alu___out_T_4_0;
  wire  tracker_dut__core__dpath__alu___out_T_3_0;
  wire  tracker_dut__core__dpath__alu___out_T_14_0;
  wire  tracker_dut__core__dpath__alu___out_T_6_0;
  wire  tracker_dut__core__dpath__alu___out_T_7_0;
  wire  tracker_dut__core__dpath__alu___out_T_8_0;
  wire  tracker_dut__core__dpath__alu___cmp_T_2_0;
  wire  tracker_dut__core__dpath__alu___sum_T_0;
  wire  tracker_dut__core__dpath__alu___out_T_5_0;
  wire  tracker_dut__core__dpath__alu___out_T_2_0;
  wire  tracker_dut__core__dpath__alu___out_T_16_0;
  wire  tracker_dut__core__dpath__immGen___io_out_T_2_0;
  wire  tracker_dut__core__dpath__immGen___io_out_T_4_0;
  wire  tracker_dut__core__dpath__immGen___io_out_T_6_0;
  wire  tracker_dut__core__dpath__immGen___io_out_T_12_0;
  wire  tracker_dut__core__dpath__immGen___io_out_T_8_0;
  wire  tracker_dut__core__dpath__immGen___io_out_T_10_0;
  wire  tracker_dut__core__dpath__brCond__isSameSign_0;
  wire  tracker_dut__core__dpath__brCond__eq_0;
  wire  tracker_dut__core__dpath__brCond___io_taken_T_5_0;
  wire  tracker_dut__core__dpath__brCond___io_taken_T_0;
  wire  tracker_dut__core__dpath__brCond___io_taken_T_11_0;
  wire  tracker_dut__core__dpath__brCond___io_taken_T_8_0;
  wire  tracker_dut__core__dpath__brCond___io_taken_T_14_0;
  wire  tracker_dut__core__dpath__brCond___io_taken_T_2_0;
  wire  tracker_dut__core__dpath__brCond__geu_0;
  wire  tracker_dut__core__dpath__brCond__ge_0;
  wire  tracker_dut__core__dpath___io_dcache_req_bits_mask_T_7_0;
  wire  tracker_dut__core__dpath___npc_T_2_0;
  wire  tracker_dut__core__dpath___inst_T_2_0;
  wire  tracker_dut__core__dpath___rs1_T_0;
  wire  tracker_dut__core__dpath___T_6_0;
  wire  tracker_dut__core__dpath__io_ctrl_A_sel_0;
  wire  tracker_dut__core__dpath___npc_T_5_0;
  wire  tracker_dut__core__dpath___io_icache_req_valid_T_0;
  wire  tracker_dut__core__dpath__io_ctrl_B_sel_0;
  wire  tracker_dut__core__dpath___regWrite_T_9_0;
  wire  tracker_dut__core__dpath___stall_T_1_0;
  wire  tracker_dut__core__dpath__csr__io_expt;
  wire  tracker_dut__core__dpath___regWrite_T_7_0;
  wire  tracker_dut__core__dpath___stall_T_0;
  wire  tracker_dut__core__dpath___rs1hazard_T_2_0;
  wire  tracker_dut__core__dpath___load_T_13_0;
  wire  tracker_dut__core__dpath___load_T_11_0;
  wire  tracker_dut__core__dpath___rs1_T_1_0;
  wire  tracker_dut__core__dpath__stall_0;
  wire  tracker_dut__core__dpath___io_dcache_req_bits_mask_T_9_0;
  wire  tracker_dut__core__dpath___load_T_15_0;
  wire  tracker_dut__core__dpath___io_dcache_req_bits_mask_T_5_0;
  wire  tracker_dut__core__dpath___rs2hazard_T_2_0;
  wire  tracker_dut__core__dpath___csr_in_T_0;
  wire  tracker_dut__core__dpath___npc_T_0;
  wire  tracker_dut__core__dpath___regWrite_T_5_0;
  wire  tracker_dut__core__dpath___npc_T_1_0;
  wire  tracker_dut__core__dpath___rs2_T_1_0;
  wire  tracker_dut__core__dpath___load_T_9_0;
  wire  tracker_dut__core__dpath___T_4_0;
  wire  tracker_dut__core__dpath___T_7_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_31_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_93_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_87_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_81_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_15_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_49_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_5_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_41_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_11_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_19_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_95_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_21_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_47_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_35_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_75_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_25_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_55_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_71_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_27_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_59_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_29_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_39_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_1_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_63_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_97_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_23_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_65_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_89_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_51_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_83_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_77_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_85_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_37_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_67_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_91_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_43_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_17_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_9_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_79_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_33_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_45_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_13_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_53_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_69_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_3_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_7_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_73_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_57_0;
  wire  tracker_dut__core__ctrl___ctrlSignals_T_61_0;
  wire  tracker_dut__icache___T_5_0;
  wire  tracker_dut__icache___wmask_T_0;
  wire  tracker_dut__icache___T_18_0;
  wire  tracker_dut__icache__io_cpu_req_valid_0;
  wire  tracker_dut__icache___T_25_0;
  wire  tracker_dut__icache___T_33_0;
  wire  tracker_dut__icache__wen_0;
  wire  tracker_dut__icache__is_alloc_reg_0;
  wire  tracker_dut__icache__read_wrap_out_0;
  wire  tracker_dut__icache___T_21_0;
  wire  tracker_dut__icache___T_11_0;
  wire  tracker_dut__icache___T_16_0;
  wire  tracker_dut__icache___T_0;
  wire  tracker_dut__icache__ren_0;
  wire  tracker_dut__icache___hit_T_2_0;
  wire  tracker_dut__icache___T_6_0;
  wire  tracker_dut__icache___io_nasti_ar_valid_T_0;
  wire  tracker_dut__icache___wen_T_0;
  wire  tracker_dut__icache__is_idle_0;
  wire  tracker_dut__icache___T_8_0;
  wire  tracker_dut__icache__is_write_0;
  wire  tracker_dut__icache___T_43_0;
  wire  tracker_dut__icache___T_20_0;
  wire  tracker_dut__icache___is_alloc_T_0;
  wire  tracker_dut__icache__read_count_0;
  wire  tracker_dut__icache___T_13_0;
  wire  tracker_dut__icache__io_cpu_resp_valid_0;
  wire  tracker_dut__icache___ren_T_0;
  wire  tracker_dut__icache___T_3_0;
  wire  tracker_dut__icache__ren_reg_0;
  wire  tracker_dut__icache___T_19_0;
  wire  tracker_dut__icache___T_51_0;
  wire  tracker_dut__icache___T_28_0;
  wire  tracker_dut__icache___T_9_0;
  wire  tracker_dut__icache___T_14_0;
  wire  tracker_dut__icache___T_4_0;
  wire  tracker_dut__icache___T_47_0;
  wire  tracker_dut__icache___T_15_0;
  wire  tracker_dut__icache___T_40_0;
  wire  tracker_dut__icache__is_alloc_0;
  wire  tracker_dut__icache__hit_0;
  wire  tracker_dut__icache___T_30_0;
  wire  tracker_dut__icache__is_read_0;
  wire  tracker_dut__icache___T_10_0;
  wire  tracker_dut__dcache___T_5_0;
  wire  tracker_dut__dcache___io_cpu_resp_valid_T_3_0;
  wire  tracker_dut__dcache___wmask_T_0;
  wire  tracker_dut__dcache___state_T_0;
  wire  tracker_dut__dcache__wen_0;
  wire  tracker_dut__dcache___T_33_0;
  wire  tracker_dut__dcache___T_44_0;
  wire  tracker_dut__dcache__read_wrap_out_0;
  wire  tracker_dut__dcache___T_21_0;
  wire  tracker_dut__dcache___T_16_0;
  wire  tracker_dut__dcache___ren_T_0;
  wire  tracker_dut__dcache__ren_0;
  wire  tracker_dut__dcache___hit_T_2_0;
  wire  tracker_dut__dcache___T_6_0;
  wire  tracker_dut__dcache___io_nasti_ar_valid_T_0;
  wire  tracker_dut__dcache___T_1_0;
  wire  tracker_dut__dcache___T_29_0;
  wire  tracker_dut__dcache__write_count_0;
  wire  tracker_dut__dcache___T_8_0;
  wire  tracker_dut__dcache__is_write_0;
  wire  tracker_dut__dcache___T_20_0;
  wire  tracker_dut__dcache___is_alloc_T_0;
  wire  tracker_dut__dcache__read_count_0;
  wire  tracker_dut__dcache__io_cpu_resp_valid_0;
  wire  tracker_dut__dcache___T_51_0;
  wire  tracker_dut__dcache___T_4_0;
  wire  tracker_dut__dcache___T_15_0;
  wire  tracker_dut__dcache___T_40_0;
  wire  tracker_dut__dcache__is_alloc_0;
  wire  tracker_dut__dcache__hit_0;
  wire  tracker_dut__dcache___T_30_0;
  wire  tracker_dut__dcache__is_read_0;
  wire  tracker_dut__dcache___T_35_0;
  wire  tracker_dut__dcache___T_10_0;
  wire  tracker_dut__dcache___T_18_0;
  wire  tracker_dut__dcache__io_cpu_req_valid_0;
  wire  tracker_dut__dcache___T_25_0;
  wire  tracker_dut__dcache__is_alloc_reg_0;
  wire  tracker_dut__dcache___T_11_0;
  wire  tracker_dut__dcache___T_0;
  wire  tracker_dut__dcache___io_cpu_resp_valid_T_2_0;
  wire  tracker_dut__dcache___wen_T_2_0;
  wire  tracker_dut__dcache__is_idle_0;
  wire  tracker_dut__dcache___T_43_0;
  wire  tracker_dut__dcache___T_13_0;
  wire  tracker_dut__dcache__write_wrap_out_0;
  wire  tracker_dut__dcache___T_3_0;
  wire  tracker_dut__dcache__ren_reg_0;
  wire  tracker_dut__dcache___T_19_0;
  wire  tracker_dut__dcache___T_28_0;
  wire  tracker_dut__dcache___T_9_0;
  wire  tracker_dut__dcache___T_14_0;
  wire  tracker_dut__dcache___T_47_0;
  wire  tracker_dut__arb___T_2_0;
  wire  tracker_dut__arb___T_13_0;
  wire  tracker_dut__arb___T_24_0;
  wire  tracker_dut__arb__io_dcache_ar_valid_0;
  wire  tracker_dut__arb___io_nasti_ar_valid_T_1_0;
  wire  tracker_dut__arb___T_20_0;
  wire  tracker_dut__arb___T_8_0;
  wire  tracker_dut__arb___io_dcache_b_valid_T_0;
  wire  tracker_dut__arb___T_5_0;
  wire  tracker_dut__arb___T_4_0;
  wire  tracker_dut__arb___io_icache_ar_ready_T_0;
  wire  tracker_dut__arb___T_10_0;
  wire  tracker_dut__arb___T_18_0;
  wire  tracker_dut__arb___io_nasti_aw_valid_T_0;
  wire  tracker_dut__arb___T_3_0;
  wire  tracker_dut__arb___io_icache_r_valid_T_0;
  wire  tracker_dut__arb___io_dcache_r_valid_T_0;
  wire  tracker_dut__arb___T_23_0;
  wire  tracker_dut__arb___io_nasti_w_valid_T_0;
  Tile dut ( // @[TileAndMemTop.scala 15:19]
    .clock(dut_clock),
    .reset(dut_reset),
    .io_nasti_aw_ready(dut_io_nasti_aw_ready),
    .io_nasti_aw_valid(dut_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(dut_io_nasti_aw_bits_addr),
    .io_nasti_w_ready(dut_io_nasti_w_ready),
    .io_nasti_w_valid(dut_io_nasti_w_valid),
    .io_nasti_w_bits_data(dut_io_nasti_w_bits_data),
    .io_nasti_b_ready(dut_io_nasti_b_ready),
    .io_nasti_b_valid(dut_io_nasti_b_valid),
    .io_nasti_ar_ready(dut_io_nasti_ar_ready),
    .io_nasti_ar_valid(dut_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(dut_io_nasti_ar_bits_addr),
    .io_nasti_r_ready(dut_io_nasti_r_ready),
    .io_nasti_r_valid(dut_io_nasti_r_valid),
    .io_nasti_r_bits_data(dut_io_nasti_r_bits_data),
    .io_nasti_r_bits_last(dut_io_nasti_r_bits_last),
    .core__dpath__csr___io_out_T_29_0(dut_core__dpath__csr___io_out_T_29_0),
    .core__dpath__csr___T_0(dut_core__dpath__csr___T_0),
    .core__dpath__csr__isInstRet_0(dut_core__dpath__csr__isInstRet_0),
    .core__dpath__csr___T_10_0(dut_core__dpath__csr___T_10_0),
    .core__dpath__csr___T_7_0(dut_core__dpath__csr___T_7_0),
    .core__dpath__csr___io_out_T_33_0(dut_core__dpath__csr___io_out_T_33_0),
    .core__dpath__csr___T_23_0(dut_core__dpath__csr___T_23_0),
    .core__dpath__csr___io_out_T_25_0(dut_core__dpath__csr___io_out_T_25_0),
    .core__dpath__csr___T_6_0(dut_core__dpath__csr___T_6_0),
    .core__dpath__csr___io_out_T_31_0(dut_core__dpath__csr___io_out_T_31_0),
    .core__dpath__csr___wdata_T_3_0(dut_core__dpath__csr___wdata_T_3_0),
    .core__dpath__csr__privInst_0(dut_core__dpath__csr__privInst_0),
    .core__dpath__csr___T_16_0(dut_core__dpath__csr___T_16_0),
    .core__dpath__csr__isEret_0(dut_core__dpath__csr__isEret_0),
    .core__dpath__csr___io_out_T_41_0(dut_core__dpath__csr___io_out_T_41_0),
    .core__dpath__csr___io_out_T_1_0(dut_core__dpath__csr___io_out_T_1_0),
    .core__dpath__csr___io_out_T_53_0(dut_core__dpath__csr___io_out_T_53_0),
    .core__dpath__csr__iaddrInvalid_0(dut_core__dpath__csr__iaddrInvalid_0),
    .core__dpath__csr___io_out_T_27_0(dut_core__dpath__csr___io_out_T_27_0),
    .core__dpath__csr___io_out_T_43_0(dut_core__dpath__csr___io_out_T_43_0),
    .core__dpath__csr___T_1_0(dut_core__dpath__csr___T_1_0),
    .core__dpath__csr___io_out_T_35_0(dut_core__dpath__csr___io_out_T_35_0),
    .core__dpath__csr___T_3_0(dut_core__dpath__csr___T_3_0),
    .core__dpath__csr___T_18_0(dut_core__dpath__csr___T_18_0),
    .core__dpath__csr__privValid_0(dut_core__dpath__csr__privValid_0),
    .core__dpath__csr___io_expt_T_6_0(dut_core__dpath__csr___io_expt_T_6_0),
    .core__dpath__csr___isInstRet_T_0(dut_core__dpath__csr___isInstRet_T_0),
    .core__dpath__csr___io_out_T_3_0(dut_core__dpath__csr___io_out_T_3_0),
    .core__dpath__csr___io_out_T_7_0(dut_core__dpath__csr___io_out_T_7_0),
    .core__dpath__csr__io_expt_0(dut_core__dpath__csr__io_expt_0),
    .core__dpath__csr___T_24_0(dut_core__dpath__csr___T_24_0),
    .core__dpath__csr___wen_T_0(dut_core__dpath__csr___wen_T_0),
    .core__dpath__csr___T_21_0(dut_core__dpath__csr___T_21_0),
    .core__dpath__csr__wen_0(dut_core__dpath__csr__wen_0),
    .core__dpath__csr___T_13_0(dut_core__dpath__csr___T_13_0),
    .core__dpath__csr___T_8_0(dut_core__dpath__csr___T_8_0),
    .core__dpath__csr___io_out_T_47_0(dut_core__dpath__csr___io_out_T_47_0),
    .core__dpath__csr___io_out_T_19_0(dut_core__dpath__csr___io_out_T_19_0),
    .core__dpath__csr___T_12_0(dut_core__dpath__csr___T_12_0),
    .core__dpath__csr___io_out_T_9_0(dut_core__dpath__csr___io_out_T_9_0),
    .core__dpath__csr___csrRO_T_4_0(dut_core__dpath__csr___csrRO_T_4_0),
    .core__dpath__csr___io_out_T_5_0(dut_core__dpath__csr___io_out_T_5_0),
    .core__dpath__csr___isEcall_T_1_0(dut_core__dpath__csr___isEcall_T_1_0),
    .core__dpath__csr___wdata_T_5_0(dut_core__dpath__csr___wdata_T_5_0),
    .core__dpath__csr___laddrInvalid_T_6_0(dut_core__dpath__csr___laddrInvalid_T_6_0),
    .core__dpath__csr___T_17_0(dut_core__dpath__csr___T_17_0),
    .core__dpath__csr___laddrInvalid_T_8_0(dut_core__dpath__csr___laddrInvalid_T_8_0),
    .core__dpath__csr___io_out_T_45_0(dut_core__dpath__csr___io_out_T_45_0),
    .core__dpath__csr___io_out_T_17_0(dut_core__dpath__csr___io_out_T_17_0),
    .core__dpath__csr___io_out_T_13_0(dut_core__dpath__csr___io_out_T_13_0),
    .core__dpath__csr___io_out_T_11_0(dut_core__dpath__csr___io_out_T_11_0),
    .core__dpath__csr___T_20_0(dut_core__dpath__csr___T_20_0),
    .core__dpath__csr___T_14_0(dut_core__dpath__csr___T_14_0),
    .core__dpath__csr___io_out_T_55_0(dut_core__dpath__csr___io_out_T_55_0),
    .core__dpath__csr___io_out_T_39_0(dut_core__dpath__csr___io_out_T_39_0),
    .core__dpath__csr___io_out_T_51_0(dut_core__dpath__csr___io_out_T_51_0),
    .core__dpath__csr__laddrInvalid_0(dut_core__dpath__csr__laddrInvalid_0),
    .core__dpath__csr___io_out_T_23_0(dut_core__dpath__csr___io_out_T_23_0),
    .core__dpath__csr___isInstRet_T_1_0(dut_core__dpath__csr___isInstRet_T_1_0),
    .core__dpath__csr___io_expt_T_5_0(dut_core__dpath__csr___io_expt_T_5_0),
    .core__dpath__csr___isEcall_T_4_0(dut_core__dpath__csr___isEcall_T_4_0),
    .core__dpath__csr___csrRO_T_2_0(dut_core__dpath__csr___csrRO_T_2_0),
    .core__dpath__csr___saddrInvalid_T_3_0(dut_core__dpath__csr___saddrInvalid_T_3_0),
    .core__dpath__csr__isEcall_0(dut_core__dpath__csr__isEcall_0),
    .core__dpath__csr__isEbreak_0(dut_core__dpath__csr__isEbreak_0),
    .core__dpath__csr___io_out_T_49_0(dut_core__dpath__csr___io_out_T_49_0),
    .core__dpath__csr___T_11_0(dut_core__dpath__csr___T_11_0),
    .core__dpath__csr___wdata_T_7_0(dut_core__dpath__csr___wdata_T_7_0),
    .core__dpath__csr___isInstRet_T_5_0(dut_core__dpath__csr___isInstRet_T_5_0),
    .core__dpath__csr___io_out_T_37_0(dut_core__dpath__csr___io_out_T_37_0),
    .core__dpath__csr___saddrInvalid_T_5_0(dut_core__dpath__csr___saddrInvalid_T_5_0),
    .core__dpath__csr___T_22_0(dut_core__dpath__csr___T_22_0),
    .core__dpath__csr___io_out_T_57_0(dut_core__dpath__csr___io_out_T_57_0),
    .core__dpath__csr___laddrInvalid_T_4_0(dut_core__dpath__csr___laddrInvalid_T_4_0),
    .core__dpath__csr___T_9_0(dut_core__dpath__csr___T_9_0),
    .core__dpath__csr___T_15_0(dut_core__dpath__csr___T_15_0),
    .core__dpath__csr__saddrInvalid_0(dut_core__dpath__csr__saddrInvalid_0),
    .core__dpath__csr___T_19_0(dut_core__dpath__csr___T_19_0),
    .core__dpath__csr___io_out_T_21_0(dut_core__dpath__csr___io_out_T_21_0),
    .core__dpath__csr___io_out_T_15_0(dut_core__dpath__csr___io_out_T_15_0),
    .core__dpath__regFile___T_1_0(dut_core__dpath__regFile___T_1_0),
    .core__dpath__regFile___io_rdata2_T_0(dut_core__dpath__regFile___io_rdata2_T_0),
    .core__dpath__regFile___io_rdata1_T_0(dut_core__dpath__regFile___io_rdata1_T_0),
    .core__dpath__alu___out_T_1_0(dut_core__dpath__alu___out_T_1_0),
    .core__dpath__alu___cmp_T_4_0(dut_core__dpath__alu___cmp_T_4_0),
    .core__dpath__alu___out_T_0(dut_core__dpath__alu___out_T_0),
    .core__dpath__alu___out_T_10_0(dut_core__dpath__alu___out_T_10_0),
    .core__dpath__alu___out_T_12_0(dut_core__dpath__alu___out_T_12_0),
    .core__dpath__alu___shin_T_0(dut_core__dpath__alu___shin_T_0),
    .core__dpath__alu___out_T_9_0(dut_core__dpath__alu___out_T_9_0),
    .core__dpath__alu___out_T_4_0(dut_core__dpath__alu___out_T_4_0),
    .core__dpath__alu___out_T_3_0(dut_core__dpath__alu___out_T_3_0),
    .core__dpath__alu___out_T_14_0(dut_core__dpath__alu___out_T_14_0),
    .core__dpath__alu___out_T_6_0(dut_core__dpath__alu___out_T_6_0),
    .core__dpath__alu___out_T_7_0(dut_core__dpath__alu___out_T_7_0),
    .core__dpath__alu___out_T_8_0(dut_core__dpath__alu___out_T_8_0),
    .core__dpath__alu___cmp_T_2_0(dut_core__dpath__alu___cmp_T_2_0),
    .core__dpath__alu___sum_T_0(dut_core__dpath__alu___sum_T_0),
    .core__dpath__alu___out_T_5_0(dut_core__dpath__alu___out_T_5_0),
    .core__dpath__alu___out_T_2_0(dut_core__dpath__alu___out_T_2_0),
    .core__dpath__alu___out_T_16_0(dut_core__dpath__alu___out_T_16_0),
    .core__dpath__immGen___io_out_T_2_0(dut_core__dpath__immGen___io_out_T_2_0),
    .core__dpath__immGen___io_out_T_4_0(dut_core__dpath__immGen___io_out_T_4_0),
    .core__dpath__immGen___io_out_T_6_0(dut_core__dpath__immGen___io_out_T_6_0),
    .core__dpath__immGen___io_out_T_12_0(dut_core__dpath__immGen___io_out_T_12_0),
    .core__dpath__immGen___io_out_T_8_0(dut_core__dpath__immGen___io_out_T_8_0),
    .core__dpath__immGen___io_out_T_10_0(dut_core__dpath__immGen___io_out_T_10_0),
    .core__dpath__brCond__isSameSign_0(dut_core__dpath__brCond__isSameSign_0),
    .core__dpath__brCond__eq_0(dut_core__dpath__brCond__eq_0),
    .core__dpath__brCond___io_taken_T_5_0(dut_core__dpath__brCond___io_taken_T_5_0),
    .core__dpath__brCond___io_taken_T_0(dut_core__dpath__brCond___io_taken_T_0),
    .core__dpath__brCond___io_taken_T_11_0(dut_core__dpath__brCond___io_taken_T_11_0),
    .core__dpath__brCond___io_taken_T_8_0(dut_core__dpath__brCond___io_taken_T_8_0),
    .core__dpath__brCond___io_taken_T_14_0(dut_core__dpath__brCond___io_taken_T_14_0),
    .core__dpath__brCond___io_taken_T_2_0(dut_core__dpath__brCond___io_taken_T_2_0),
    .core__dpath__brCond__geu_0(dut_core__dpath__brCond__geu_0),
    .core__dpath__brCond__ge_0(dut_core__dpath__brCond__ge_0),
    .core__dpath___io_dcache_req_bits_mask_T_7_0(dut_core__dpath___io_dcache_req_bits_mask_T_7_0),
    .core__dpath___npc_T_2_0(dut_core__dpath___npc_T_2_0),
    .core__dpath___inst_T_2_0(dut_core__dpath___inst_T_2_0),
    .core__dpath___rs1_T_0(dut_core__dpath___rs1_T_0),
    .core__dpath___T_6_0(dut_core__dpath___T_6_0),
    .core__dpath__io_ctrl_A_sel_0(dut_core__dpath__io_ctrl_A_sel_0),
    .core__dpath___npc_T_5_0(dut_core__dpath___npc_T_5_0),
    .core__dpath___io_icache_req_valid_T_0(dut_core__dpath___io_icache_req_valid_T_0),
    .core__dpath__io_ctrl_B_sel_0(dut_core__dpath__io_ctrl_B_sel_0),
    .core__dpath___regWrite_T_9_0(dut_core__dpath___regWrite_T_9_0),
    .core__dpath___stall_T_1_0(dut_core__dpath___stall_T_1_0),
    .core__dpath__csr__io_expt(dut_core__dpath__csr__io_expt),
    .core__dpath___regWrite_T_7_0(dut_core__dpath___regWrite_T_7_0),
    .core__dpath___stall_T_0(dut_core__dpath___stall_T_0),
    .core__dpath___rs1hazard_T_2_0(dut_core__dpath___rs1hazard_T_2_0),
    .core__dpath___load_T_13_0(dut_core__dpath___load_T_13_0),
    .core__dpath___load_T_11_0(dut_core__dpath___load_T_11_0),
    .core__dpath___rs1_T_1_0(dut_core__dpath___rs1_T_1_0),
    .core__dpath__stall_0(dut_core__dpath__stall_0),
    .core__dpath___io_dcache_req_bits_mask_T_9_0(dut_core__dpath___io_dcache_req_bits_mask_T_9_0),
    .core__dpath___load_T_15_0(dut_core__dpath___load_T_15_0),
    .core__dpath___io_dcache_req_bits_mask_T_5_0(dut_core__dpath___io_dcache_req_bits_mask_T_5_0),
    .core__dpath___rs2hazard_T_2_0(dut_core__dpath___rs2hazard_T_2_0),
    .core__dpath___csr_in_T_0(dut_core__dpath___csr_in_T_0),
    .core__dpath___npc_T_0(dut_core__dpath___npc_T_0),
    .core__dpath___regWrite_T_5_0(dut_core__dpath___regWrite_T_5_0),
    .core__dpath___npc_T_1_0(dut_core__dpath___npc_T_1_0),
    .core__dpath___rs2_T_1_0(dut_core__dpath___rs2_T_1_0),
    .core__dpath___load_T_9_0(dut_core__dpath___load_T_9_0),
    .core__dpath___T_4_0(dut_core__dpath___T_4_0),
    .core__dpath___T_7_0(dut_core__dpath___T_7_0),
    .core__ctrl___ctrlSignals_T_31_0(dut_core__ctrl___ctrlSignals_T_31_0),
    .core__ctrl___ctrlSignals_T_93_0(dut_core__ctrl___ctrlSignals_T_93_0),
    .core__ctrl___ctrlSignals_T_87_0(dut_core__ctrl___ctrlSignals_T_87_0),
    .core__ctrl___ctrlSignals_T_81_0(dut_core__ctrl___ctrlSignals_T_81_0),
    .core__ctrl___ctrlSignals_T_15_0(dut_core__ctrl___ctrlSignals_T_15_0),
    .core__ctrl___ctrlSignals_T_49_0(dut_core__ctrl___ctrlSignals_T_49_0),
    .core__ctrl___ctrlSignals_T_5_0(dut_core__ctrl___ctrlSignals_T_5_0),
    .core__ctrl___ctrlSignals_T_41_0(dut_core__ctrl___ctrlSignals_T_41_0),
    .core__ctrl___ctrlSignals_T_11_0(dut_core__ctrl___ctrlSignals_T_11_0),
    .core__ctrl___ctrlSignals_T_19_0(dut_core__ctrl___ctrlSignals_T_19_0),
    .core__ctrl___ctrlSignals_T_95_0(dut_core__ctrl___ctrlSignals_T_95_0),
    .core__ctrl___ctrlSignals_T_21_0(dut_core__ctrl___ctrlSignals_T_21_0),
    .core__ctrl___ctrlSignals_T_47_0(dut_core__ctrl___ctrlSignals_T_47_0),
    .core__ctrl___ctrlSignals_T_35_0(dut_core__ctrl___ctrlSignals_T_35_0),
    .core__ctrl___ctrlSignals_T_75_0(dut_core__ctrl___ctrlSignals_T_75_0),
    .core__ctrl___ctrlSignals_T_25_0(dut_core__ctrl___ctrlSignals_T_25_0),
    .core__ctrl___ctrlSignals_T_55_0(dut_core__ctrl___ctrlSignals_T_55_0),
    .core__ctrl___ctrlSignals_T_71_0(dut_core__ctrl___ctrlSignals_T_71_0),
    .core__ctrl___ctrlSignals_T_27_0(dut_core__ctrl___ctrlSignals_T_27_0),
    .core__ctrl___ctrlSignals_T_59_0(dut_core__ctrl___ctrlSignals_T_59_0),
    .core__ctrl___ctrlSignals_T_29_0(dut_core__ctrl___ctrlSignals_T_29_0),
    .core__ctrl___ctrlSignals_T_39_0(dut_core__ctrl___ctrlSignals_T_39_0),
    .core__ctrl___ctrlSignals_T_1_0(dut_core__ctrl___ctrlSignals_T_1_0),
    .core__ctrl___ctrlSignals_T_63_0(dut_core__ctrl___ctrlSignals_T_63_0),
    .core__ctrl___ctrlSignals_T_97_0(dut_core__ctrl___ctrlSignals_T_97_0),
    .core__ctrl___ctrlSignals_T_23_0(dut_core__ctrl___ctrlSignals_T_23_0),
    .core__ctrl___ctrlSignals_T_65_0(dut_core__ctrl___ctrlSignals_T_65_0),
    .core__ctrl___ctrlSignals_T_89_0(dut_core__ctrl___ctrlSignals_T_89_0),
    .core__ctrl___ctrlSignals_T_51_0(dut_core__ctrl___ctrlSignals_T_51_0),
    .core__ctrl___ctrlSignals_T_83_0(dut_core__ctrl___ctrlSignals_T_83_0),
    .core__ctrl___ctrlSignals_T_77_0(dut_core__ctrl___ctrlSignals_T_77_0),
    .core__ctrl___ctrlSignals_T_85_0(dut_core__ctrl___ctrlSignals_T_85_0),
    .core__ctrl___ctrlSignals_T_37_0(dut_core__ctrl___ctrlSignals_T_37_0),
    .core__ctrl___ctrlSignals_T_67_0(dut_core__ctrl___ctrlSignals_T_67_0),
    .core__ctrl___ctrlSignals_T_91_0(dut_core__ctrl___ctrlSignals_T_91_0),
    .core__ctrl___ctrlSignals_T_43_0(dut_core__ctrl___ctrlSignals_T_43_0),
    .core__ctrl___ctrlSignals_T_17_0(dut_core__ctrl___ctrlSignals_T_17_0),
    .core__ctrl___ctrlSignals_T_9_0(dut_core__ctrl___ctrlSignals_T_9_0),
    .core__ctrl___ctrlSignals_T_79_0(dut_core__ctrl___ctrlSignals_T_79_0),
    .core__ctrl___ctrlSignals_T_33_0(dut_core__ctrl___ctrlSignals_T_33_0),
    .core__ctrl___ctrlSignals_T_45_0(dut_core__ctrl___ctrlSignals_T_45_0),
    .core__ctrl___ctrlSignals_T_13_0(dut_core__ctrl___ctrlSignals_T_13_0),
    .core__ctrl___ctrlSignals_T_53_0(dut_core__ctrl___ctrlSignals_T_53_0),
    .core__ctrl___ctrlSignals_T_69_0(dut_core__ctrl___ctrlSignals_T_69_0),
    .core__ctrl___ctrlSignals_T_3_0(dut_core__ctrl___ctrlSignals_T_3_0),
    .core__ctrl___ctrlSignals_T_7_0(dut_core__ctrl___ctrlSignals_T_7_0),
    .core__ctrl___ctrlSignals_T_73_0(dut_core__ctrl___ctrlSignals_T_73_0),
    .core__ctrl___ctrlSignals_T_57_0(dut_core__ctrl___ctrlSignals_T_57_0),
    .core__ctrl___ctrlSignals_T_61_0(dut_core__ctrl___ctrlSignals_T_61_0),
    .icache___T_5_0(dut_icache___T_5_0),
    .icache___wmask_T_0(dut_icache___wmask_T_0),
    .icache___T_18_0(dut_icache___T_18_0),
    .icache__io_cpu_req_valid_0(dut_icache__io_cpu_req_valid_0),
    .icache___T_25_0(dut_icache___T_25_0),
    .icache___T_33_0(dut_icache___T_33_0),
    .icache__wen_0(dut_icache__wen_0),
    .icache__is_alloc_reg_0(dut_icache__is_alloc_reg_0),
    .icache__read_wrap_out_0(dut_icache__read_wrap_out_0),
    .icache___T_21_0(dut_icache___T_21_0),
    .icache___T_11_0(dut_icache___T_11_0),
    .icache___T_16_0(dut_icache___T_16_0),
    .icache___T_0(dut_icache___T_0),
    .icache__ren_0(dut_icache__ren_0),
    .icache___hit_T_2_0(dut_icache___hit_T_2_0),
    .icache___T_6_0(dut_icache___T_6_0),
    .icache___io_nasti_ar_valid_T_0(dut_icache___io_nasti_ar_valid_T_0),
    .icache___wen_T_0(dut_icache___wen_T_0),
    .icache__is_idle_0(dut_icache__is_idle_0),
    .icache___T_8_0(dut_icache___T_8_0),
    .icache__is_write_0(dut_icache__is_write_0),
    .icache___T_43_0(dut_icache___T_43_0),
    .icache___T_20_0(dut_icache___T_20_0),
    .icache___is_alloc_T_0(dut_icache___is_alloc_T_0),
    .icache__read_count_0(dut_icache__read_count_0),
    .icache___T_13_0(dut_icache___T_13_0),
    .icache__io_cpu_resp_valid_0(dut_icache__io_cpu_resp_valid_0),
    .icache___ren_T_0(dut_icache___ren_T_0),
    .icache___T_3_0(dut_icache___T_3_0),
    .icache__ren_reg_0(dut_icache__ren_reg_0),
    .icache___T_19_0(dut_icache___T_19_0),
    .icache___T_51_0(dut_icache___T_51_0),
    .icache___T_28_0(dut_icache___T_28_0),
    .icache___T_9_0(dut_icache___T_9_0),
    .icache___T_14_0(dut_icache___T_14_0),
    .icache___T_4_0(dut_icache___T_4_0),
    .icache___T_47_0(dut_icache___T_47_0),
    .icache___T_15_0(dut_icache___T_15_0),
    .icache___T_40_0(dut_icache___T_40_0),
    .icache__is_alloc_0(dut_icache__is_alloc_0),
    .icache__hit_0(dut_icache__hit_0),
    .icache___T_30_0(dut_icache___T_30_0),
    .icache__is_read_0(dut_icache__is_read_0),
    .icache___T_10_0(dut_icache___T_10_0),
    .dcache___T_5_0(dut_dcache___T_5_0),
    .dcache___io_cpu_resp_valid_T_3_0(dut_dcache___io_cpu_resp_valid_T_3_0),
    .dcache___wmask_T_0(dut_dcache___wmask_T_0),
    .dcache___state_T_0(dut_dcache___state_T_0),
    .dcache__wen_0(dut_dcache__wen_0),
    .dcache___T_33_0(dut_dcache___T_33_0),
    .dcache___T_44_0(dut_dcache___T_44_0),
    .dcache__read_wrap_out_0(dut_dcache__read_wrap_out_0),
    .dcache___T_21_0(dut_dcache___T_21_0),
    .dcache___T_16_0(dut_dcache___T_16_0),
    .dcache___ren_T_0(dut_dcache___ren_T_0),
    .dcache__ren_0(dut_dcache__ren_0),
    .dcache___hit_T_2_0(dut_dcache___hit_T_2_0),
    .dcache___T_6_0(dut_dcache___T_6_0),
    .dcache___io_nasti_ar_valid_T_0(dut_dcache___io_nasti_ar_valid_T_0),
    .dcache___T_1_0(dut_dcache___T_1_0),
    .dcache___T_29_0(dut_dcache___T_29_0),
    .dcache__write_count_0(dut_dcache__write_count_0),
    .dcache___T_8_0(dut_dcache___T_8_0),
    .dcache__is_write_0(dut_dcache__is_write_0),
    .dcache___T_20_0(dut_dcache___T_20_0),
    .dcache___is_alloc_T_0(dut_dcache___is_alloc_T_0),
    .dcache__read_count_0(dut_dcache__read_count_0),
    .dcache__io_cpu_resp_valid_0(dut_dcache__io_cpu_resp_valid_0),
    .dcache___T_51_0(dut_dcache___T_51_0),
    .dcache___T_4_0(dut_dcache___T_4_0),
    .dcache___T_15_0(dut_dcache___T_15_0),
    .dcache___T_40_0(dut_dcache___T_40_0),
    .dcache__is_alloc_0(dut_dcache__is_alloc_0),
    .dcache__hit_0(dut_dcache__hit_0),
    .dcache___T_30_0(dut_dcache___T_30_0),
    .dcache__is_read_0(dut_dcache__is_read_0),
    .dcache___T_35_0(dut_dcache___T_35_0),
    .dcache___T_10_0(dut_dcache___T_10_0),
    .dcache___T_18_0(dut_dcache___T_18_0),
    .dcache__io_cpu_req_valid_0(dut_dcache__io_cpu_req_valid_0),
    .dcache___T_25_0(dut_dcache___T_25_0),
    .dcache__is_alloc_reg_0(dut_dcache__is_alloc_reg_0),
    .dcache___T_11_0(dut_dcache___T_11_0),
    .dcache___T_0(dut_dcache___T_0),
    .dcache___io_cpu_resp_valid_T_2_0(dut_dcache___io_cpu_resp_valid_T_2_0),
    .dcache___wen_T_2_0(dut_dcache___wen_T_2_0),
    .dcache__is_idle_0(dut_dcache__is_idle_0),
    .dcache___T_43_0(dut_dcache___T_43_0),
    .dcache___T_13_0(dut_dcache___T_13_0),
    .dcache__write_wrap_out_0(dut_dcache__write_wrap_out_0),
    .dcache___T_3_0(dut_dcache___T_3_0),
    .dcache__ren_reg_0(dut_dcache__ren_reg_0),
    .dcache___T_19_0(dut_dcache___T_19_0),
    .dcache___T_28_0(dut_dcache___T_28_0),
    .dcache___T_9_0(dut_dcache___T_9_0),
    .dcache___T_14_0(dut_dcache___T_14_0),
    .dcache___T_47_0(dut_dcache___T_47_0),
    .arb___T_2_0(dut_arb___T_2_0),
    .arb___T_13_0(dut_arb___T_13_0),
    .arb___T_24_0(dut_arb___T_24_0),
    .arb__io_dcache_ar_valid_0(dut_arb__io_dcache_ar_valid_0),
    .arb___io_nasti_ar_valid_T_1_0(dut_arb___io_nasti_ar_valid_T_1_0),
    .arb___T_20_0(dut_arb___T_20_0),
    .arb___T_8_0(dut_arb___T_8_0),
    .arb___io_dcache_b_valid_T_0(dut_arb___io_dcache_b_valid_T_0),
    .arb___T_5_0(dut_arb___T_5_0),
    .arb___T_4_0(dut_arb___T_4_0),
    .arb___io_icache_ar_ready_T_0(dut_arb___io_icache_ar_ready_T_0),
    .arb___T_10_0(dut_arb___T_10_0),
    .arb___T_18_0(dut_arb___T_18_0),
    .arb___io_nasti_aw_valid_T_0(dut_arb___io_nasti_aw_valid_T_0),
    .arb___T_3_0(dut_arb___T_3_0),
    .arb___io_icache_r_valid_T_0(dut_arb___io_icache_r_valid_T_0),
    .arb___io_dcache_r_valid_T_0(dut_arb___io_dcache_r_valid_T_0),
    .arb___T_23_0(dut_arb___T_23_0),
    .arb___io_nasti_w_valid_T_0(dut_arb___io_nasti_w_valid_T_0)
  );
  SignalTracker tracker (
    .clock(tracker_clock),
    .reset(tracker_reset),
    .dut__core__dpath__csr___io_out_T_29_0(tracker_dut__core__dpath__csr___io_out_T_29_0),
    .dut__core__dpath__csr___T_0(tracker_dut__core__dpath__csr___T_0),
    .dut__core__dpath__csr__isInstRet_0(tracker_dut__core__dpath__csr__isInstRet_0),
    .dut__core__dpath__csr___T_10_0(tracker_dut__core__dpath__csr___T_10_0),
    .dut__core__dpath__csr___T_7_0(tracker_dut__core__dpath__csr___T_7_0),
    .dut__core__dpath__csr___io_out_T_33_0(tracker_dut__core__dpath__csr___io_out_T_33_0),
    .dut__core__dpath__csr___T_23_0(tracker_dut__core__dpath__csr___T_23_0),
    .dut__core__dpath__csr___io_out_T_25_0(tracker_dut__core__dpath__csr___io_out_T_25_0),
    .dut__core__dpath__csr___T_6_0(tracker_dut__core__dpath__csr___T_6_0),
    .dut__core__dpath__csr___io_out_T_31_0(tracker_dut__core__dpath__csr___io_out_T_31_0),
    .dut__core__dpath__csr___wdata_T_3_0(tracker_dut__core__dpath__csr___wdata_T_3_0),
    .dut__core__dpath__csr__privInst_0(tracker_dut__core__dpath__csr__privInst_0),
    .dut__core__dpath__csr___T_16_0(tracker_dut__core__dpath__csr___T_16_0),
    .dut__core__dpath__csr__isEret_0(tracker_dut__core__dpath__csr__isEret_0),
    .dut__core__dpath__csr___io_out_T_41_0(tracker_dut__core__dpath__csr___io_out_T_41_0),
    .dut__core__dpath__csr___io_out_T_1_0(tracker_dut__core__dpath__csr___io_out_T_1_0),
    .dut__core__dpath__csr___io_out_T_53_0(tracker_dut__core__dpath__csr___io_out_T_53_0),
    .dut__core__dpath__csr__iaddrInvalid_0(tracker_dut__core__dpath__csr__iaddrInvalid_0),
    .dut__core__dpath__csr___io_out_T_27_0(tracker_dut__core__dpath__csr___io_out_T_27_0),
    .dut__core__dpath__csr___io_out_T_43_0(tracker_dut__core__dpath__csr___io_out_T_43_0),
    .dut__core__dpath__csr___T_1_0(tracker_dut__core__dpath__csr___T_1_0),
    .dut__core__dpath__csr___io_out_T_35_0(tracker_dut__core__dpath__csr___io_out_T_35_0),
    .dut__core__dpath__csr___T_3_0(tracker_dut__core__dpath__csr___T_3_0),
    .dut__core__dpath__csr___T_18_0(tracker_dut__core__dpath__csr___T_18_0),
    .dut__core__dpath__csr__privValid_0(tracker_dut__core__dpath__csr__privValid_0),
    .dut__core__dpath__csr___io_expt_T_6_0(tracker_dut__core__dpath__csr___io_expt_T_6_0),
    .dut__core__dpath__csr___isInstRet_T_0(tracker_dut__core__dpath__csr___isInstRet_T_0),
    .dut__core__dpath__csr___io_out_T_3_0(tracker_dut__core__dpath__csr___io_out_T_3_0),
    .dut__core__dpath__csr___io_out_T_7_0(tracker_dut__core__dpath__csr___io_out_T_7_0),
    .dut__core__dpath__csr__io_expt_0(tracker_dut__core__dpath__csr__io_expt_0),
    .dut__core__dpath__csr___T_24_0(tracker_dut__core__dpath__csr___T_24_0),
    .dut__core__dpath__csr___wen_T_0(tracker_dut__core__dpath__csr___wen_T_0),
    .dut__core__dpath__csr___T_21_0(tracker_dut__core__dpath__csr___T_21_0),
    .dut__core__dpath__csr__wen_0(tracker_dut__core__dpath__csr__wen_0),
    .dut__core__dpath__csr___T_13_0(tracker_dut__core__dpath__csr___T_13_0),
    .dut__core__dpath__csr___T_8_0(tracker_dut__core__dpath__csr___T_8_0),
    .dut__core__dpath__csr___io_out_T_47_0(tracker_dut__core__dpath__csr___io_out_T_47_0),
    .dut__core__dpath__csr___io_out_T_19_0(tracker_dut__core__dpath__csr___io_out_T_19_0),
    .dut__core__dpath__csr___T_12_0(tracker_dut__core__dpath__csr___T_12_0),
    .dut__core__dpath__csr___io_out_T_9_0(tracker_dut__core__dpath__csr___io_out_T_9_0),
    .dut__core__dpath__csr___csrRO_T_4_0(tracker_dut__core__dpath__csr___csrRO_T_4_0),
    .dut__core__dpath__csr___io_out_T_5_0(tracker_dut__core__dpath__csr___io_out_T_5_0),
    .dut__core__dpath__csr___isEcall_T_1_0(tracker_dut__core__dpath__csr___isEcall_T_1_0),
    .dut__core__dpath__csr___wdata_T_5_0(tracker_dut__core__dpath__csr___wdata_T_5_0),
    .dut__core__dpath__csr___laddrInvalid_T_6_0(tracker_dut__core__dpath__csr___laddrInvalid_T_6_0),
    .dut__core__dpath__csr___T_17_0(tracker_dut__core__dpath__csr___T_17_0),
    .dut__core__dpath__csr___laddrInvalid_T_8_0(tracker_dut__core__dpath__csr___laddrInvalid_T_8_0),
    .dut__core__dpath__csr___io_out_T_45_0(tracker_dut__core__dpath__csr___io_out_T_45_0),
    .dut__core__dpath__csr___io_out_T_17_0(tracker_dut__core__dpath__csr___io_out_T_17_0),
    .dut__core__dpath__csr___io_out_T_13_0(tracker_dut__core__dpath__csr___io_out_T_13_0),
    .dut__core__dpath__csr___io_out_T_11_0(tracker_dut__core__dpath__csr___io_out_T_11_0),
    .dut__core__dpath__csr___T_20_0(tracker_dut__core__dpath__csr___T_20_0),
    .dut__core__dpath__csr___T_14_0(tracker_dut__core__dpath__csr___T_14_0),
    .dut__core__dpath__csr___io_out_T_55_0(tracker_dut__core__dpath__csr___io_out_T_55_0),
    .dut__core__dpath__csr___io_out_T_39_0(tracker_dut__core__dpath__csr___io_out_T_39_0),
    .dut__core__dpath__csr___io_out_T_51_0(tracker_dut__core__dpath__csr___io_out_T_51_0),
    .dut__core__dpath__csr__laddrInvalid_0(tracker_dut__core__dpath__csr__laddrInvalid_0),
    .dut__core__dpath__csr___io_out_T_23_0(tracker_dut__core__dpath__csr___io_out_T_23_0),
    .dut__core__dpath__csr___isInstRet_T_1_0(tracker_dut__core__dpath__csr___isInstRet_T_1_0),
    .dut__core__dpath__csr___io_expt_T_5_0(tracker_dut__core__dpath__csr___io_expt_T_5_0),
    .dut__core__dpath__csr___isEcall_T_4_0(tracker_dut__core__dpath__csr___isEcall_T_4_0),
    .dut__core__dpath__csr___csrRO_T_2_0(tracker_dut__core__dpath__csr___csrRO_T_2_0),
    .dut__core__dpath__csr___saddrInvalid_T_3_0(tracker_dut__core__dpath__csr___saddrInvalid_T_3_0),
    .dut__core__dpath__csr__isEcall_0(tracker_dut__core__dpath__csr__isEcall_0),
    .dut__core__dpath__csr__isEbreak_0(tracker_dut__core__dpath__csr__isEbreak_0),
    .dut__core__dpath__csr___io_out_T_49_0(tracker_dut__core__dpath__csr___io_out_T_49_0),
    .dut__core__dpath__csr___T_11_0(tracker_dut__core__dpath__csr___T_11_0),
    .dut__core__dpath__csr___wdata_T_7_0(tracker_dut__core__dpath__csr___wdata_T_7_0),
    .dut__core__dpath__csr___isInstRet_T_5_0(tracker_dut__core__dpath__csr___isInstRet_T_5_0),
    .dut__core__dpath__csr___io_out_T_37_0(tracker_dut__core__dpath__csr___io_out_T_37_0),
    .dut__core__dpath__csr___saddrInvalid_T_5_0(tracker_dut__core__dpath__csr___saddrInvalid_T_5_0),
    .dut__core__dpath__csr___T_22_0(tracker_dut__core__dpath__csr___T_22_0),
    .dut__core__dpath__csr___io_out_T_57_0(tracker_dut__core__dpath__csr___io_out_T_57_0),
    .dut__core__dpath__csr___laddrInvalid_T_4_0(tracker_dut__core__dpath__csr___laddrInvalid_T_4_0),
    .dut__core__dpath__csr___T_9_0(tracker_dut__core__dpath__csr___T_9_0),
    .dut__core__dpath__csr___T_15_0(tracker_dut__core__dpath__csr___T_15_0),
    .dut__core__dpath__csr__saddrInvalid_0(tracker_dut__core__dpath__csr__saddrInvalid_0),
    .dut__core__dpath__csr___T_19_0(tracker_dut__core__dpath__csr___T_19_0),
    .dut__core__dpath__csr___io_out_T_21_0(tracker_dut__core__dpath__csr___io_out_T_21_0),
    .dut__core__dpath__csr___io_out_T_15_0(tracker_dut__core__dpath__csr___io_out_T_15_0),
    .dut__core__dpath__regFile___T_1_0(tracker_dut__core__dpath__regFile___T_1_0),
    .dut__core__dpath__regFile___io_rdata2_T_0(tracker_dut__core__dpath__regFile___io_rdata2_T_0),
    .dut__core__dpath__regFile___io_rdata1_T_0(tracker_dut__core__dpath__regFile___io_rdata1_T_0),
    .dut__core__dpath__alu___out_T_1_0(tracker_dut__core__dpath__alu___out_T_1_0),
    .dut__core__dpath__alu___cmp_T_4_0(tracker_dut__core__dpath__alu___cmp_T_4_0),
    .dut__core__dpath__alu___out_T_0(tracker_dut__core__dpath__alu___out_T_0),
    .dut__core__dpath__alu___out_T_10_0(tracker_dut__core__dpath__alu___out_T_10_0),
    .dut__core__dpath__alu___out_T_12_0(tracker_dut__core__dpath__alu___out_T_12_0),
    .dut__core__dpath__alu___shin_T_0(tracker_dut__core__dpath__alu___shin_T_0),
    .dut__core__dpath__alu___out_T_9_0(tracker_dut__core__dpath__alu___out_T_9_0),
    .dut__core__dpath__alu___out_T_4_0(tracker_dut__core__dpath__alu___out_T_4_0),
    .dut__core__dpath__alu___out_T_3_0(tracker_dut__core__dpath__alu___out_T_3_0),
    .dut__core__dpath__alu___out_T_14_0(tracker_dut__core__dpath__alu___out_T_14_0),
    .dut__core__dpath__alu___out_T_6_0(tracker_dut__core__dpath__alu___out_T_6_0),
    .dut__core__dpath__alu___out_T_7_0(tracker_dut__core__dpath__alu___out_T_7_0),
    .dut__core__dpath__alu___out_T_8_0(tracker_dut__core__dpath__alu___out_T_8_0),
    .dut__core__dpath__alu___cmp_T_2_0(tracker_dut__core__dpath__alu___cmp_T_2_0),
    .dut__core__dpath__alu___sum_T_0(tracker_dut__core__dpath__alu___sum_T_0),
    .dut__core__dpath__alu___out_T_5_0(tracker_dut__core__dpath__alu___out_T_5_0),
    .dut__core__dpath__alu___out_T_2_0(tracker_dut__core__dpath__alu___out_T_2_0),
    .dut__core__dpath__alu___out_T_16_0(tracker_dut__core__dpath__alu___out_T_16_0),
    .dut__core__dpath__immGen___io_out_T_2_0(tracker_dut__core__dpath__immGen___io_out_T_2_0),
    .dut__core__dpath__immGen___io_out_T_4_0(tracker_dut__core__dpath__immGen___io_out_T_4_0),
    .dut__core__dpath__immGen___io_out_T_6_0(tracker_dut__core__dpath__immGen___io_out_T_6_0),
    .dut__core__dpath__immGen___io_out_T_12_0(tracker_dut__core__dpath__immGen___io_out_T_12_0),
    .dut__core__dpath__immGen___io_out_T_8_0(tracker_dut__core__dpath__immGen___io_out_T_8_0),
    .dut__core__dpath__immGen___io_out_T_10_0(tracker_dut__core__dpath__immGen___io_out_T_10_0),
    .dut__core__dpath__brCond__isSameSign_0(tracker_dut__core__dpath__brCond__isSameSign_0),
    .dut__core__dpath__brCond__eq_0(tracker_dut__core__dpath__brCond__eq_0),
    .dut__core__dpath__brCond___io_taken_T_5_0(tracker_dut__core__dpath__brCond___io_taken_T_5_0),
    .dut__core__dpath__brCond___io_taken_T_0(tracker_dut__core__dpath__brCond___io_taken_T_0),
    .dut__core__dpath__brCond___io_taken_T_11_0(tracker_dut__core__dpath__brCond___io_taken_T_11_0),
    .dut__core__dpath__brCond___io_taken_T_8_0(tracker_dut__core__dpath__brCond___io_taken_T_8_0),
    .dut__core__dpath__brCond___io_taken_T_14_0(tracker_dut__core__dpath__brCond___io_taken_T_14_0),
    .dut__core__dpath__brCond___io_taken_T_2_0(tracker_dut__core__dpath__brCond___io_taken_T_2_0),
    .dut__core__dpath__brCond__geu_0(tracker_dut__core__dpath__brCond__geu_0),
    .dut__core__dpath__brCond__ge_0(tracker_dut__core__dpath__brCond__ge_0),
    .dut__core__dpath___io_dcache_req_bits_mask_T_7_0(tracker_dut__core__dpath___io_dcache_req_bits_mask_T_7_0),
    .dut__core__dpath___npc_T_2_0(tracker_dut__core__dpath___npc_T_2_0),
    .dut__core__dpath___inst_T_2_0(tracker_dut__core__dpath___inst_T_2_0),
    .dut__core__dpath___rs1_T_0(tracker_dut__core__dpath___rs1_T_0),
    .dut__core__dpath___T_6_0(tracker_dut__core__dpath___T_6_0),
    .dut__core__dpath__io_ctrl_A_sel_0(tracker_dut__core__dpath__io_ctrl_A_sel_0),
    .dut__core__dpath___npc_T_5_0(tracker_dut__core__dpath___npc_T_5_0),
    .dut__core__dpath___io_icache_req_valid_T_0(tracker_dut__core__dpath___io_icache_req_valid_T_0),
    .dut__core__dpath__io_ctrl_B_sel_0(tracker_dut__core__dpath__io_ctrl_B_sel_0),
    .dut__core__dpath___regWrite_T_9_0(tracker_dut__core__dpath___regWrite_T_9_0),
    .dut__core__dpath___stall_T_1_0(tracker_dut__core__dpath___stall_T_1_0),
    .dut__core__dpath__csr__io_expt(tracker_dut__core__dpath__csr__io_expt),
    .dut__core__dpath___regWrite_T_7_0(tracker_dut__core__dpath___regWrite_T_7_0),
    .dut__core__dpath___stall_T_0(tracker_dut__core__dpath___stall_T_0),
    .dut__core__dpath___rs1hazard_T_2_0(tracker_dut__core__dpath___rs1hazard_T_2_0),
    .dut__core__dpath___load_T_13_0(tracker_dut__core__dpath___load_T_13_0),
    .dut__core__dpath___load_T_11_0(tracker_dut__core__dpath___load_T_11_0),
    .dut__core__dpath___rs1_T_1_0(tracker_dut__core__dpath___rs1_T_1_0),
    .dut__core__dpath__stall_0(tracker_dut__core__dpath__stall_0),
    .dut__core__dpath___io_dcache_req_bits_mask_T_9_0(tracker_dut__core__dpath___io_dcache_req_bits_mask_T_9_0),
    .dut__core__dpath___load_T_15_0(tracker_dut__core__dpath___load_T_15_0),
    .dut__core__dpath___io_dcache_req_bits_mask_T_5_0(tracker_dut__core__dpath___io_dcache_req_bits_mask_T_5_0),
    .dut__core__dpath___rs2hazard_T_2_0(tracker_dut__core__dpath___rs2hazard_T_2_0),
    .dut__core__dpath___csr_in_T_0(tracker_dut__core__dpath___csr_in_T_0),
    .dut__core__dpath___npc_T_0(tracker_dut__core__dpath___npc_T_0),
    .dut__core__dpath___regWrite_T_5_0(tracker_dut__core__dpath___regWrite_T_5_0),
    .dut__core__dpath___npc_T_1_0(tracker_dut__core__dpath___npc_T_1_0),
    .dut__core__dpath___rs2_T_1_0(tracker_dut__core__dpath___rs2_T_1_0),
    .dut__core__dpath___load_T_9_0(tracker_dut__core__dpath___load_T_9_0),
    .dut__core__dpath___T_4_0(tracker_dut__core__dpath___T_4_0),
    .dut__core__dpath___T_7_0(tracker_dut__core__dpath___T_7_0),
    .dut__core__ctrl___ctrlSignals_T_31_0(tracker_dut__core__ctrl___ctrlSignals_T_31_0),
    .dut__core__ctrl___ctrlSignals_T_93_0(tracker_dut__core__ctrl___ctrlSignals_T_93_0),
    .dut__core__ctrl___ctrlSignals_T_87_0(tracker_dut__core__ctrl___ctrlSignals_T_87_0),
    .dut__core__ctrl___ctrlSignals_T_81_0(tracker_dut__core__ctrl___ctrlSignals_T_81_0),
    .dut__core__ctrl___ctrlSignals_T_15_0(tracker_dut__core__ctrl___ctrlSignals_T_15_0),
    .dut__core__ctrl___ctrlSignals_T_49_0(tracker_dut__core__ctrl___ctrlSignals_T_49_0),
    .dut__core__ctrl___ctrlSignals_T_5_0(tracker_dut__core__ctrl___ctrlSignals_T_5_0),
    .dut__core__ctrl___ctrlSignals_T_41_0(tracker_dut__core__ctrl___ctrlSignals_T_41_0),
    .dut__core__ctrl___ctrlSignals_T_11_0(tracker_dut__core__ctrl___ctrlSignals_T_11_0),
    .dut__core__ctrl___ctrlSignals_T_19_0(tracker_dut__core__ctrl___ctrlSignals_T_19_0),
    .dut__core__ctrl___ctrlSignals_T_95_0(tracker_dut__core__ctrl___ctrlSignals_T_95_0),
    .dut__core__ctrl___ctrlSignals_T_21_0(tracker_dut__core__ctrl___ctrlSignals_T_21_0),
    .dut__core__ctrl___ctrlSignals_T_47_0(tracker_dut__core__ctrl___ctrlSignals_T_47_0),
    .dut__core__ctrl___ctrlSignals_T_35_0(tracker_dut__core__ctrl___ctrlSignals_T_35_0),
    .dut__core__ctrl___ctrlSignals_T_75_0(tracker_dut__core__ctrl___ctrlSignals_T_75_0),
    .dut__core__ctrl___ctrlSignals_T_25_0(tracker_dut__core__ctrl___ctrlSignals_T_25_0),
    .dut__core__ctrl___ctrlSignals_T_55_0(tracker_dut__core__ctrl___ctrlSignals_T_55_0),
    .dut__core__ctrl___ctrlSignals_T_71_0(tracker_dut__core__ctrl___ctrlSignals_T_71_0),
    .dut__core__ctrl___ctrlSignals_T_27_0(tracker_dut__core__ctrl___ctrlSignals_T_27_0),
    .dut__core__ctrl___ctrlSignals_T_59_0(tracker_dut__core__ctrl___ctrlSignals_T_59_0),
    .dut__core__ctrl___ctrlSignals_T_29_0(tracker_dut__core__ctrl___ctrlSignals_T_29_0),
    .dut__core__ctrl___ctrlSignals_T_39_0(tracker_dut__core__ctrl___ctrlSignals_T_39_0),
    .dut__core__ctrl___ctrlSignals_T_1_0(tracker_dut__core__ctrl___ctrlSignals_T_1_0),
    .dut__core__ctrl___ctrlSignals_T_63_0(tracker_dut__core__ctrl___ctrlSignals_T_63_0),
    .dut__core__ctrl___ctrlSignals_T_97_0(tracker_dut__core__ctrl___ctrlSignals_T_97_0),
    .dut__core__ctrl___ctrlSignals_T_23_0(tracker_dut__core__ctrl___ctrlSignals_T_23_0),
    .dut__core__ctrl___ctrlSignals_T_65_0(tracker_dut__core__ctrl___ctrlSignals_T_65_0),
    .dut__core__ctrl___ctrlSignals_T_89_0(tracker_dut__core__ctrl___ctrlSignals_T_89_0),
    .dut__core__ctrl___ctrlSignals_T_51_0(tracker_dut__core__ctrl___ctrlSignals_T_51_0),
    .dut__core__ctrl___ctrlSignals_T_83_0(tracker_dut__core__ctrl___ctrlSignals_T_83_0),
    .dut__core__ctrl___ctrlSignals_T_77_0(tracker_dut__core__ctrl___ctrlSignals_T_77_0),
    .dut__core__ctrl___ctrlSignals_T_85_0(tracker_dut__core__ctrl___ctrlSignals_T_85_0),
    .dut__core__ctrl___ctrlSignals_T_37_0(tracker_dut__core__ctrl___ctrlSignals_T_37_0),
    .dut__core__ctrl___ctrlSignals_T_67_0(tracker_dut__core__ctrl___ctrlSignals_T_67_0),
    .dut__core__ctrl___ctrlSignals_T_91_0(tracker_dut__core__ctrl___ctrlSignals_T_91_0),
    .dut__core__ctrl___ctrlSignals_T_43_0(tracker_dut__core__ctrl___ctrlSignals_T_43_0),
    .dut__core__ctrl___ctrlSignals_T_17_0(tracker_dut__core__ctrl___ctrlSignals_T_17_0),
    .dut__core__ctrl___ctrlSignals_T_9_0(tracker_dut__core__ctrl___ctrlSignals_T_9_0),
    .dut__core__ctrl___ctrlSignals_T_79_0(tracker_dut__core__ctrl___ctrlSignals_T_79_0),
    .dut__core__ctrl___ctrlSignals_T_33_0(tracker_dut__core__ctrl___ctrlSignals_T_33_0),
    .dut__core__ctrl___ctrlSignals_T_45_0(tracker_dut__core__ctrl___ctrlSignals_T_45_0),
    .dut__core__ctrl___ctrlSignals_T_13_0(tracker_dut__core__ctrl___ctrlSignals_T_13_0),
    .dut__core__ctrl___ctrlSignals_T_53_0(tracker_dut__core__ctrl___ctrlSignals_T_53_0),
    .dut__core__ctrl___ctrlSignals_T_69_0(tracker_dut__core__ctrl___ctrlSignals_T_69_0),
    .dut__core__ctrl___ctrlSignals_T_3_0(tracker_dut__core__ctrl___ctrlSignals_T_3_0),
    .dut__core__ctrl___ctrlSignals_T_7_0(tracker_dut__core__ctrl___ctrlSignals_T_7_0),
    .dut__core__ctrl___ctrlSignals_T_73_0(tracker_dut__core__ctrl___ctrlSignals_T_73_0),
    .dut__core__ctrl___ctrlSignals_T_57_0(tracker_dut__core__ctrl___ctrlSignals_T_57_0),
    .dut__core__ctrl___ctrlSignals_T_61_0(tracker_dut__core__ctrl___ctrlSignals_T_61_0),
    .dut__icache___T_5_0(tracker_dut__icache___T_5_0),
    .dut__icache___wmask_T_0(tracker_dut__icache___wmask_T_0),
    .dut__icache___T_18_0(tracker_dut__icache___T_18_0),
    .dut__icache__io_cpu_req_valid_0(tracker_dut__icache__io_cpu_req_valid_0),
    .dut__icache___T_25_0(tracker_dut__icache___T_25_0),
    .dut__icache___T_33_0(tracker_dut__icache___T_33_0),
    .dut__icache__wen_0(tracker_dut__icache__wen_0),
    .dut__icache__is_alloc_reg_0(tracker_dut__icache__is_alloc_reg_0),
    .dut__icache__read_wrap_out_0(tracker_dut__icache__read_wrap_out_0),
    .dut__icache___T_21_0(tracker_dut__icache___T_21_0),
    .dut__icache___T_11_0(tracker_dut__icache___T_11_0),
    .dut__icache___T_16_0(tracker_dut__icache___T_16_0),
    .dut__icache___T_0(tracker_dut__icache___T_0),
    .dut__icache__ren_0(tracker_dut__icache__ren_0),
    .dut__icache___hit_T_2_0(tracker_dut__icache___hit_T_2_0),
    .dut__icache___T_6_0(tracker_dut__icache___T_6_0),
    .dut__icache___io_nasti_ar_valid_T_0(tracker_dut__icache___io_nasti_ar_valid_T_0),
    .dut__icache___wen_T_0(tracker_dut__icache___wen_T_0),
    .dut__icache__is_idle_0(tracker_dut__icache__is_idle_0),
    .dut__icache___T_8_0(tracker_dut__icache___T_8_0),
    .dut__icache__is_write_0(tracker_dut__icache__is_write_0),
    .dut__icache___T_43_0(tracker_dut__icache___T_43_0),
    .dut__icache___T_20_0(tracker_dut__icache___T_20_0),
    .dut__icache___is_alloc_T_0(tracker_dut__icache___is_alloc_T_0),
    .dut__icache__read_count_0(tracker_dut__icache__read_count_0),
    .dut__icache___T_13_0(tracker_dut__icache___T_13_0),
    .dut__icache__io_cpu_resp_valid_0(tracker_dut__icache__io_cpu_resp_valid_0),
    .dut__icache___ren_T_0(tracker_dut__icache___ren_T_0),
    .dut__icache___T_3_0(tracker_dut__icache___T_3_0),
    .dut__icache__ren_reg_0(tracker_dut__icache__ren_reg_0),
    .dut__icache___T_19_0(tracker_dut__icache___T_19_0),
    .dut__icache___T_51_0(tracker_dut__icache___T_51_0),
    .dut__icache___T_28_0(tracker_dut__icache___T_28_0),
    .dut__icache___T_9_0(tracker_dut__icache___T_9_0),
    .dut__icache___T_14_0(tracker_dut__icache___T_14_0),
    .dut__icache___T_4_0(tracker_dut__icache___T_4_0),
    .dut__icache___T_47_0(tracker_dut__icache___T_47_0),
    .dut__icache___T_15_0(tracker_dut__icache___T_15_0),
    .dut__icache___T_40_0(tracker_dut__icache___T_40_0),
    .dut__icache__is_alloc_0(tracker_dut__icache__is_alloc_0),
    .dut__icache__hit_0(tracker_dut__icache__hit_0),
    .dut__icache___T_30_0(tracker_dut__icache___T_30_0),
    .dut__icache__is_read_0(tracker_dut__icache__is_read_0),
    .dut__icache___T_10_0(tracker_dut__icache___T_10_0),
    .dut__dcache___T_5_0(tracker_dut__dcache___T_5_0),
    .dut__dcache___io_cpu_resp_valid_T_3_0(tracker_dut__dcache___io_cpu_resp_valid_T_3_0),
    .dut__dcache___wmask_T_0(tracker_dut__dcache___wmask_T_0),
    .dut__dcache___state_T_0(tracker_dut__dcache___state_T_0),
    .dut__dcache__wen_0(tracker_dut__dcache__wen_0),
    .dut__dcache___T_33_0(tracker_dut__dcache___T_33_0),
    .dut__dcache___T_44_0(tracker_dut__dcache___T_44_0),
    .dut__dcache__read_wrap_out_0(tracker_dut__dcache__read_wrap_out_0),
    .dut__dcache___T_21_0(tracker_dut__dcache___T_21_0),
    .dut__dcache___T_16_0(tracker_dut__dcache___T_16_0),
    .dut__dcache___ren_T_0(tracker_dut__dcache___ren_T_0),
    .dut__dcache__ren_0(tracker_dut__dcache__ren_0),
    .dut__dcache___hit_T_2_0(tracker_dut__dcache___hit_T_2_0),
    .dut__dcache___T_6_0(tracker_dut__dcache___T_6_0),
    .dut__dcache___io_nasti_ar_valid_T_0(tracker_dut__dcache___io_nasti_ar_valid_T_0),
    .dut__dcache___T_1_0(tracker_dut__dcache___T_1_0),
    .dut__dcache___T_29_0(tracker_dut__dcache___T_29_0),
    .dut__dcache__write_count_0(tracker_dut__dcache__write_count_0),
    .dut__dcache___T_8_0(tracker_dut__dcache___T_8_0),
    .dut__dcache__is_write_0(tracker_dut__dcache__is_write_0),
    .dut__dcache___T_20_0(tracker_dut__dcache___T_20_0),
    .dut__dcache___is_alloc_T_0(tracker_dut__dcache___is_alloc_T_0),
    .dut__dcache__read_count_0(tracker_dut__dcache__read_count_0),
    .dut__dcache__io_cpu_resp_valid_0(tracker_dut__dcache__io_cpu_resp_valid_0),
    .dut__dcache___T_51_0(tracker_dut__dcache___T_51_0),
    .dut__dcache___T_4_0(tracker_dut__dcache___T_4_0),
    .dut__dcache___T_15_0(tracker_dut__dcache___T_15_0),
    .dut__dcache___T_40_0(tracker_dut__dcache___T_40_0),
    .dut__dcache__is_alloc_0(tracker_dut__dcache__is_alloc_0),
    .dut__dcache__hit_0(tracker_dut__dcache__hit_0),
    .dut__dcache___T_30_0(tracker_dut__dcache___T_30_0),
    .dut__dcache__is_read_0(tracker_dut__dcache__is_read_0),
    .dut__dcache___T_35_0(tracker_dut__dcache___T_35_0),
    .dut__dcache___T_10_0(tracker_dut__dcache___T_10_0),
    .dut__dcache___T_18_0(tracker_dut__dcache___T_18_0),
    .dut__dcache__io_cpu_req_valid_0(tracker_dut__dcache__io_cpu_req_valid_0),
    .dut__dcache___T_25_0(tracker_dut__dcache___T_25_0),
    .dut__dcache__is_alloc_reg_0(tracker_dut__dcache__is_alloc_reg_0),
    .dut__dcache___T_11_0(tracker_dut__dcache___T_11_0),
    .dut__dcache___T_0(tracker_dut__dcache___T_0),
    .dut__dcache___io_cpu_resp_valid_T_2_0(tracker_dut__dcache___io_cpu_resp_valid_T_2_0),
    .dut__dcache___wen_T_2_0(tracker_dut__dcache___wen_T_2_0),
    .dut__dcache__is_idle_0(tracker_dut__dcache__is_idle_0),
    .dut__dcache___T_43_0(tracker_dut__dcache___T_43_0),
    .dut__dcache___T_13_0(tracker_dut__dcache___T_13_0),
    .dut__dcache__write_wrap_out_0(tracker_dut__dcache__write_wrap_out_0),
    .dut__dcache___T_3_0(tracker_dut__dcache___T_3_0),
    .dut__dcache__ren_reg_0(tracker_dut__dcache__ren_reg_0),
    .dut__dcache___T_19_0(tracker_dut__dcache___T_19_0),
    .dut__dcache___T_28_0(tracker_dut__dcache___T_28_0),
    .dut__dcache___T_9_0(tracker_dut__dcache___T_9_0),
    .dut__dcache___T_14_0(tracker_dut__dcache___T_14_0),
    .dut__dcache___T_47_0(tracker_dut__dcache___T_47_0),
    .dut__arb___T_2_0(tracker_dut__arb___T_2_0),
    .dut__arb___T_13_0(tracker_dut__arb___T_13_0),
    .dut__arb___T_24_0(tracker_dut__arb___T_24_0),
    .dut__arb__io_dcache_ar_valid_0(tracker_dut__arb__io_dcache_ar_valid_0),
    .dut__arb___io_nasti_ar_valid_T_1_0(tracker_dut__arb___io_nasti_ar_valid_T_1_0),
    .dut__arb___T_20_0(tracker_dut__arb___T_20_0),
    .dut__arb___T_8_0(tracker_dut__arb___T_8_0),
    .dut__arb___io_dcache_b_valid_T_0(tracker_dut__arb___io_dcache_b_valid_T_0),
    .dut__arb___T_5_0(tracker_dut__arb___T_5_0),
    .dut__arb___T_4_0(tracker_dut__arb___T_4_0),
    .dut__arb___io_icache_ar_ready_T_0(tracker_dut__arb___io_icache_ar_ready_T_0),
    .dut__arb___T_10_0(tracker_dut__arb___T_10_0),
    .dut__arb___T_18_0(tracker_dut__arb___T_18_0),
    .dut__arb___io_nasti_aw_valid_T_0(tracker_dut__arb___io_nasti_aw_valid_T_0),
    .dut__arb___T_3_0(tracker_dut__arb___T_3_0),
    .dut__arb___io_icache_r_valid_T_0(tracker_dut__arb___io_icache_r_valid_T_0),
    .dut__arb___io_dcache_r_valid_T_0(tracker_dut__arb___io_dcache_r_valid_T_0),
    .dut__arb___T_23_0(tracker_dut__arb___T_23_0),
    .dut__arb___io_nasti_w_valid_T_0(tracker_dut__arb___io_nasti_w_valid_T_0)
  );
  assign _mem_write_MPORT_en = 1'h1;
  assign _mem_write_MPORT_addr = addr[19:0];
  assign _mem_write_MPORT_data = _mem[_mem_write_MPORT_addr]; // @[TileAndMemTop.scala 22:17]
  assign _mem_write_MPORT_1_en = 1'h1;
  assign _mem_write_MPORT_1_addr = addr[19:0];
  assign _mem_write_MPORT_1_data = _mem[_mem_write_MPORT_1_addr]; // @[TileAndMemTop.scala 22:17]
  assign _mem_write_MPORT_2_en = 1'h1;
  assign _mem_write_MPORT_2_addr = addr[19:0];
  assign _mem_write_MPORT_2_data = _mem[_mem_write_MPORT_2_addr]; // @[TileAndMemTop.scala 22:17]
  assign _mem_write_MPORT_3_en = 1'h1;
  assign _mem_write_MPORT_3_addr = addr[19:0];
  assign _mem_write_MPORT_3_data = _mem[_mem_write_MPORT_3_addr]; // @[TileAndMemTop.scala 22:17]
  assign _mem_write_MPORT_4_en = 1'h1;
  assign _mem_write_MPORT_4_addr = addr[19:0];
  assign _mem_write_MPORT_4_data = _mem[_mem_write_MPORT_4_addr]; // @[TileAndMemTop.scala 22:17]
  assign _mem_write_MPORT_5_en = 1'h1;
  assign _mem_write_MPORT_5_addr = addr[19:0];
  assign _mem_write_MPORT_5_data = _mem[_mem_write_MPORT_5_addr]; // @[TileAndMemTop.scala 22:17]
  assign _mem_write_MPORT_6_en = 1'h1;
  assign _mem_write_MPORT_6_addr = addr[19:0];
  assign _mem_write_MPORT_6_data = _mem[_mem_write_MPORT_6_addr]; // @[TileAndMemTop.scala 22:17]
  assign _mem_write_MPORT_7_en = 1'h1;
  assign _mem_write_MPORT_7_addr = addr[19:0];
  assign _mem_write_MPORT_7_data = _mem[_mem_write_MPORT_7_addr]; // @[TileAndMemTop.scala 22:17]
  assign _mem_dut_io_nasti_r_bits_x6_en = 1'h1;
  assign _mem_dut_io_nasti_r_bits_x6_addr = _dut_io_nasti_r_bits_x6_T_1[19:0];
  assign _mem_dut_io_nasti_r_bits_x6_data = _mem[_mem_dut_io_nasti_r_bits_x6_addr]; // @[TileAndMemTop.scala 22:17]
  assign _mem_MPORT_data = write[63:0];
  assign _mem_MPORT_addr = _dut_io_nasti_r_bits_x6_T_1[19:0];
  assign _mem_MPORT_mask = 1'h1;
  assign _mem_MPORT_en = _T_3 ? 1'h0 : _GEN_31;
  assign dut_clock = clock;
  assign dut_reset = reset; // @[TileAndMemTop.scala 39:22]
  assign dut_io_nasti_aw_ready = state == 2'h0; // @[TileAndMemTop.scala 40:34]
  assign dut_io_nasti_w_ready = state == 2'h1; // @[TileAndMemTop.scala 42:33]
  assign dut_io_nasti_b_valid = state == 2'h2; // @[TileAndMemTop.scala 44:33]
  assign dut_io_nasti_ar_ready = state == 2'h0; // @[TileAndMemTop.scala 41:34]
  assign dut_io_nasti_r_valid = state == 2'h3; // @[TileAndMemTop.scala 46:33]
  assign dut_io_nasti_r_bits_data = _mem_dut_io_nasti_r_bits_x6_data; // @[nasti.scala 116:17 118:12]
  assign dut_io_nasti_r_bits_last = off == 8'h1; // @[TileAndMemTop.scala 45:79]
  assign tracker_clock = clock;
  assign tracker_reset = reset;
  assign tracker_dut__core__dpath__csr___io_out_T_29_0 = dut_core__dpath__csr___io_out_T_29_0;
  assign tracker_dut__core__dpath__csr___T_0 = dut_core__dpath__csr___T_0;
  assign tracker_dut__core__dpath__csr__isInstRet_0 = dut_core__dpath__csr__isInstRet_0;
  assign tracker_dut__core__dpath__csr___T_10_0 = dut_core__dpath__csr___T_10_0;
  assign tracker_dut__core__dpath__csr___T_7_0 = dut_core__dpath__csr___T_7_0;
  assign tracker_dut__core__dpath__csr___io_out_T_33_0 = dut_core__dpath__csr___io_out_T_33_0;
  assign tracker_dut__core__dpath__csr___T_23_0 = dut_core__dpath__csr___T_23_0;
  assign tracker_dut__core__dpath__csr___io_out_T_25_0 = dut_core__dpath__csr___io_out_T_25_0;
  assign tracker_dut__core__dpath__csr___T_6_0 = dut_core__dpath__csr___T_6_0;
  assign tracker_dut__core__dpath__csr___io_out_T_31_0 = dut_core__dpath__csr___io_out_T_31_0;
  assign tracker_dut__core__dpath__csr___wdata_T_3_0 = dut_core__dpath__csr___wdata_T_3_0;
  assign tracker_dut__core__dpath__csr__privInst_0 = dut_core__dpath__csr__privInst_0;
  assign tracker_dut__core__dpath__csr___T_16_0 = dut_core__dpath__csr___T_16_0;
  assign tracker_dut__core__dpath__csr__isEret_0 = dut_core__dpath__csr__isEret_0;
  assign tracker_dut__core__dpath__csr___io_out_T_41_0 = dut_core__dpath__csr___io_out_T_41_0;
  assign tracker_dut__core__dpath__csr___io_out_T_1_0 = dut_core__dpath__csr___io_out_T_1_0;
  assign tracker_dut__core__dpath__csr___io_out_T_53_0 = dut_core__dpath__csr___io_out_T_53_0;
  assign tracker_dut__core__dpath__csr__iaddrInvalid_0 = dut_core__dpath__csr__iaddrInvalid_0;
  assign tracker_dut__core__dpath__csr___io_out_T_27_0 = dut_core__dpath__csr___io_out_T_27_0;
  assign tracker_dut__core__dpath__csr___io_out_T_43_0 = dut_core__dpath__csr___io_out_T_43_0;
  assign tracker_dut__core__dpath__csr___T_1_0 = dut_core__dpath__csr___T_1_0;
  assign tracker_dut__core__dpath__csr___io_out_T_35_0 = dut_core__dpath__csr___io_out_T_35_0;
  assign tracker_dut__core__dpath__csr___T_3_0 = dut_core__dpath__csr___T_3_0;
  assign tracker_dut__core__dpath__csr___T_18_0 = dut_core__dpath__csr___T_18_0;
  assign tracker_dut__core__dpath__csr__privValid_0 = dut_core__dpath__csr__privValid_0;
  assign tracker_dut__core__dpath__csr___io_expt_T_6_0 = dut_core__dpath__csr___io_expt_T_6_0;
  assign tracker_dut__core__dpath__csr___isInstRet_T_0 = dut_core__dpath__csr___isInstRet_T_0;
  assign tracker_dut__core__dpath__csr___io_out_T_3_0 = dut_core__dpath__csr___io_out_T_3_0;
  assign tracker_dut__core__dpath__csr___io_out_T_7_0 = dut_core__dpath__csr___io_out_T_7_0;
  assign tracker_dut__core__dpath__csr__io_expt_0 = dut_core__dpath__csr__io_expt_0;
  assign tracker_dut__core__dpath__csr___T_24_0 = dut_core__dpath__csr___T_24_0;
  assign tracker_dut__core__dpath__csr___wen_T_0 = dut_core__dpath__csr___wen_T_0;
  assign tracker_dut__core__dpath__csr___T_21_0 = dut_core__dpath__csr___T_21_0;
  assign tracker_dut__core__dpath__csr__wen_0 = dut_core__dpath__csr__wen_0;
  assign tracker_dut__core__dpath__csr___T_13_0 = dut_core__dpath__csr___T_13_0;
  assign tracker_dut__core__dpath__csr___T_8_0 = dut_core__dpath__csr___T_8_0;
  assign tracker_dut__core__dpath__csr___io_out_T_47_0 = dut_core__dpath__csr___io_out_T_47_0;
  assign tracker_dut__core__dpath__csr___io_out_T_19_0 = dut_core__dpath__csr___io_out_T_19_0;
  assign tracker_dut__core__dpath__csr___T_12_0 = dut_core__dpath__csr___T_12_0;
  assign tracker_dut__core__dpath__csr___io_out_T_9_0 = dut_core__dpath__csr___io_out_T_9_0;
  assign tracker_dut__core__dpath__csr___csrRO_T_4_0 = dut_core__dpath__csr___csrRO_T_4_0;
  assign tracker_dut__core__dpath__csr___io_out_T_5_0 = dut_core__dpath__csr___io_out_T_5_0;
  assign tracker_dut__core__dpath__csr___isEcall_T_1_0 = dut_core__dpath__csr___isEcall_T_1_0;
  assign tracker_dut__core__dpath__csr___wdata_T_5_0 = dut_core__dpath__csr___wdata_T_5_0;
  assign tracker_dut__core__dpath__csr___laddrInvalid_T_6_0 = dut_core__dpath__csr___laddrInvalid_T_6_0;
  assign tracker_dut__core__dpath__csr___T_17_0 = dut_core__dpath__csr___T_17_0;
  assign tracker_dut__core__dpath__csr___laddrInvalid_T_8_0 = dut_core__dpath__csr___laddrInvalid_T_8_0;
  assign tracker_dut__core__dpath__csr___io_out_T_45_0 = dut_core__dpath__csr___io_out_T_45_0;
  assign tracker_dut__core__dpath__csr___io_out_T_17_0 = dut_core__dpath__csr___io_out_T_17_0;
  assign tracker_dut__core__dpath__csr___io_out_T_13_0 = dut_core__dpath__csr___io_out_T_13_0;
  assign tracker_dut__core__dpath__csr___io_out_T_11_0 = dut_core__dpath__csr___io_out_T_11_0;
  assign tracker_dut__core__dpath__csr___T_20_0 = dut_core__dpath__csr___T_20_0;
  assign tracker_dut__core__dpath__csr___T_14_0 = dut_core__dpath__csr___T_14_0;
  assign tracker_dut__core__dpath__csr___io_out_T_55_0 = dut_core__dpath__csr___io_out_T_55_0;
  assign tracker_dut__core__dpath__csr___io_out_T_39_0 = dut_core__dpath__csr___io_out_T_39_0;
  assign tracker_dut__core__dpath__csr___io_out_T_51_0 = dut_core__dpath__csr___io_out_T_51_0;
  assign tracker_dut__core__dpath__csr__laddrInvalid_0 = dut_core__dpath__csr__laddrInvalid_0;
  assign tracker_dut__core__dpath__csr___io_out_T_23_0 = dut_core__dpath__csr___io_out_T_23_0;
  assign tracker_dut__core__dpath__csr___isInstRet_T_1_0 = dut_core__dpath__csr___isInstRet_T_1_0;
  assign tracker_dut__core__dpath__csr___io_expt_T_5_0 = dut_core__dpath__csr___io_expt_T_5_0;
  assign tracker_dut__core__dpath__csr___isEcall_T_4_0 = dut_core__dpath__csr___isEcall_T_4_0;
  assign tracker_dut__core__dpath__csr___csrRO_T_2_0 = dut_core__dpath__csr___csrRO_T_2_0;
  assign tracker_dut__core__dpath__csr___saddrInvalid_T_3_0 = dut_core__dpath__csr___saddrInvalid_T_3_0;
  assign tracker_dut__core__dpath__csr__isEcall_0 = dut_core__dpath__csr__isEcall_0;
  assign tracker_dut__core__dpath__csr__isEbreak_0 = dut_core__dpath__csr__isEbreak_0;
  assign tracker_dut__core__dpath__csr___io_out_T_49_0 = dut_core__dpath__csr___io_out_T_49_0;
  assign tracker_dut__core__dpath__csr___T_11_0 = dut_core__dpath__csr___T_11_0;
  assign tracker_dut__core__dpath__csr___wdata_T_7_0 = dut_core__dpath__csr___wdata_T_7_0;
  assign tracker_dut__core__dpath__csr___isInstRet_T_5_0 = dut_core__dpath__csr___isInstRet_T_5_0;
  assign tracker_dut__core__dpath__csr___io_out_T_37_0 = dut_core__dpath__csr___io_out_T_37_0;
  assign tracker_dut__core__dpath__csr___saddrInvalid_T_5_0 = dut_core__dpath__csr___saddrInvalid_T_5_0;
  assign tracker_dut__core__dpath__csr___T_22_0 = dut_core__dpath__csr___T_22_0;
  assign tracker_dut__core__dpath__csr___io_out_T_57_0 = dut_core__dpath__csr___io_out_T_57_0;
  assign tracker_dut__core__dpath__csr___laddrInvalid_T_4_0 = dut_core__dpath__csr___laddrInvalid_T_4_0;
  assign tracker_dut__core__dpath__csr___T_9_0 = dut_core__dpath__csr___T_9_0;
  assign tracker_dut__core__dpath__csr___T_15_0 = dut_core__dpath__csr___T_15_0;
  assign tracker_dut__core__dpath__csr__saddrInvalid_0 = dut_core__dpath__csr__saddrInvalid_0;
  assign tracker_dut__core__dpath__csr___T_19_0 = dut_core__dpath__csr___T_19_0;
  assign tracker_dut__core__dpath__csr___io_out_T_21_0 = dut_core__dpath__csr___io_out_T_21_0;
  assign tracker_dut__core__dpath__csr___io_out_T_15_0 = dut_core__dpath__csr___io_out_T_15_0;
  assign tracker_dut__core__dpath__regFile___T_1_0 = dut_core__dpath__regFile___T_1_0;
  assign tracker_dut__core__dpath__regFile___io_rdata2_T_0 = dut_core__dpath__regFile___io_rdata2_T_0;
  assign tracker_dut__core__dpath__regFile___io_rdata1_T_0 = dut_core__dpath__regFile___io_rdata1_T_0;
  assign tracker_dut__core__dpath__alu___out_T_1_0 = dut_core__dpath__alu___out_T_1_0;
  assign tracker_dut__core__dpath__alu___cmp_T_4_0 = dut_core__dpath__alu___cmp_T_4_0;
  assign tracker_dut__core__dpath__alu___out_T_0 = dut_core__dpath__alu___out_T_0;
  assign tracker_dut__core__dpath__alu___out_T_10_0 = dut_core__dpath__alu___out_T_10_0;
  assign tracker_dut__core__dpath__alu___out_T_12_0 = dut_core__dpath__alu___out_T_12_0;
  assign tracker_dut__core__dpath__alu___shin_T_0 = dut_core__dpath__alu___shin_T_0;
  assign tracker_dut__core__dpath__alu___out_T_9_0 = dut_core__dpath__alu___out_T_9_0;
  assign tracker_dut__core__dpath__alu___out_T_4_0 = dut_core__dpath__alu___out_T_4_0;
  assign tracker_dut__core__dpath__alu___out_T_3_0 = dut_core__dpath__alu___out_T_3_0;
  assign tracker_dut__core__dpath__alu___out_T_14_0 = dut_core__dpath__alu___out_T_14_0;
  assign tracker_dut__core__dpath__alu___out_T_6_0 = dut_core__dpath__alu___out_T_6_0;
  assign tracker_dut__core__dpath__alu___out_T_7_0 = dut_core__dpath__alu___out_T_7_0;
  assign tracker_dut__core__dpath__alu___out_T_8_0 = dut_core__dpath__alu___out_T_8_0;
  assign tracker_dut__core__dpath__alu___cmp_T_2_0 = dut_core__dpath__alu___cmp_T_2_0;
  assign tracker_dut__core__dpath__alu___sum_T_0 = dut_core__dpath__alu___sum_T_0;
  assign tracker_dut__core__dpath__alu___out_T_5_0 = dut_core__dpath__alu___out_T_5_0;
  assign tracker_dut__core__dpath__alu___out_T_2_0 = dut_core__dpath__alu___out_T_2_0;
  assign tracker_dut__core__dpath__alu___out_T_16_0 = dut_core__dpath__alu___out_T_16_0;
  assign tracker_dut__core__dpath__immGen___io_out_T_2_0 = dut_core__dpath__immGen___io_out_T_2_0;
  assign tracker_dut__core__dpath__immGen___io_out_T_4_0 = dut_core__dpath__immGen___io_out_T_4_0;
  assign tracker_dut__core__dpath__immGen___io_out_T_6_0 = dut_core__dpath__immGen___io_out_T_6_0;
  assign tracker_dut__core__dpath__immGen___io_out_T_12_0 = dut_core__dpath__immGen___io_out_T_12_0;
  assign tracker_dut__core__dpath__immGen___io_out_T_8_0 = dut_core__dpath__immGen___io_out_T_8_0;
  assign tracker_dut__core__dpath__immGen___io_out_T_10_0 = dut_core__dpath__immGen___io_out_T_10_0;
  assign tracker_dut__core__dpath__brCond__isSameSign_0 = dut_core__dpath__brCond__isSameSign_0;
  assign tracker_dut__core__dpath__brCond__eq_0 = dut_core__dpath__brCond__eq_0;
  assign tracker_dut__core__dpath__brCond___io_taken_T_5_0 = dut_core__dpath__brCond___io_taken_T_5_0;
  assign tracker_dut__core__dpath__brCond___io_taken_T_0 = dut_core__dpath__brCond___io_taken_T_0;
  assign tracker_dut__core__dpath__brCond___io_taken_T_11_0 = dut_core__dpath__brCond___io_taken_T_11_0;
  assign tracker_dut__core__dpath__brCond___io_taken_T_8_0 = dut_core__dpath__brCond___io_taken_T_8_0;
  assign tracker_dut__core__dpath__brCond___io_taken_T_14_0 = dut_core__dpath__brCond___io_taken_T_14_0;
  assign tracker_dut__core__dpath__brCond___io_taken_T_2_0 = dut_core__dpath__brCond___io_taken_T_2_0;
  assign tracker_dut__core__dpath__brCond__geu_0 = dut_core__dpath__brCond__geu_0;
  assign tracker_dut__core__dpath__brCond__ge_0 = dut_core__dpath__brCond__ge_0;
  assign tracker_dut__core__dpath___io_dcache_req_bits_mask_T_7_0 = dut_core__dpath___io_dcache_req_bits_mask_T_7_0;
  assign tracker_dut__core__dpath___npc_T_2_0 = dut_core__dpath___npc_T_2_0;
  assign tracker_dut__core__dpath___inst_T_2_0 = dut_core__dpath___inst_T_2_0;
  assign tracker_dut__core__dpath___rs1_T_0 = dut_core__dpath___rs1_T_0;
  assign tracker_dut__core__dpath___T_6_0 = dut_core__dpath___T_6_0;
  assign tracker_dut__core__dpath__io_ctrl_A_sel_0 = dut_core__dpath__io_ctrl_A_sel_0;
  assign tracker_dut__core__dpath___npc_T_5_0 = dut_core__dpath___npc_T_5_0;
  assign tracker_dut__core__dpath___io_icache_req_valid_T_0 = dut_core__dpath___io_icache_req_valid_T_0;
  assign tracker_dut__core__dpath__io_ctrl_B_sel_0 = dut_core__dpath__io_ctrl_B_sel_0;
  assign tracker_dut__core__dpath___regWrite_T_9_0 = dut_core__dpath___regWrite_T_9_0;
  assign tracker_dut__core__dpath___stall_T_1_0 = dut_core__dpath___stall_T_1_0;
  assign tracker_dut__core__dpath__csr__io_expt = dut_core__dpath__csr__io_expt;
  assign tracker_dut__core__dpath___regWrite_T_7_0 = dut_core__dpath___regWrite_T_7_0;
  assign tracker_dut__core__dpath___stall_T_0 = dut_core__dpath___stall_T_0;
  assign tracker_dut__core__dpath___rs1hazard_T_2_0 = dut_core__dpath___rs1hazard_T_2_0;
  assign tracker_dut__core__dpath___load_T_13_0 = dut_core__dpath___load_T_13_0;
  assign tracker_dut__core__dpath___load_T_11_0 = dut_core__dpath___load_T_11_0;
  assign tracker_dut__core__dpath___rs1_T_1_0 = dut_core__dpath___rs1_T_1_0;
  assign tracker_dut__core__dpath__stall_0 = dut_core__dpath__stall_0;
  assign tracker_dut__core__dpath___io_dcache_req_bits_mask_T_9_0 = dut_core__dpath___io_dcache_req_bits_mask_T_9_0;
  assign tracker_dut__core__dpath___load_T_15_0 = dut_core__dpath___load_T_15_0;
  assign tracker_dut__core__dpath___io_dcache_req_bits_mask_T_5_0 = dut_core__dpath___io_dcache_req_bits_mask_T_5_0;
  assign tracker_dut__core__dpath___rs2hazard_T_2_0 = dut_core__dpath___rs2hazard_T_2_0;
  assign tracker_dut__core__dpath___csr_in_T_0 = dut_core__dpath___csr_in_T_0;
  assign tracker_dut__core__dpath___npc_T_0 = dut_core__dpath___npc_T_0;
  assign tracker_dut__core__dpath___regWrite_T_5_0 = dut_core__dpath___regWrite_T_5_0;
  assign tracker_dut__core__dpath___npc_T_1_0 = dut_core__dpath___npc_T_1_0;
  assign tracker_dut__core__dpath___rs2_T_1_0 = dut_core__dpath___rs2_T_1_0;
  assign tracker_dut__core__dpath___load_T_9_0 = dut_core__dpath___load_T_9_0;
  assign tracker_dut__core__dpath___T_4_0 = dut_core__dpath___T_4_0;
  assign tracker_dut__core__dpath___T_7_0 = dut_core__dpath___T_7_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_31_0 = dut_core__ctrl___ctrlSignals_T_31_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_93_0 = dut_core__ctrl___ctrlSignals_T_93_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_87_0 = dut_core__ctrl___ctrlSignals_T_87_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_81_0 = dut_core__ctrl___ctrlSignals_T_81_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_15_0 = dut_core__ctrl___ctrlSignals_T_15_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_49_0 = dut_core__ctrl___ctrlSignals_T_49_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_5_0 = dut_core__ctrl___ctrlSignals_T_5_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_41_0 = dut_core__ctrl___ctrlSignals_T_41_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_11_0 = dut_core__ctrl___ctrlSignals_T_11_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_19_0 = dut_core__ctrl___ctrlSignals_T_19_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_95_0 = dut_core__ctrl___ctrlSignals_T_95_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_21_0 = dut_core__ctrl___ctrlSignals_T_21_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_47_0 = dut_core__ctrl___ctrlSignals_T_47_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_35_0 = dut_core__ctrl___ctrlSignals_T_35_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_75_0 = dut_core__ctrl___ctrlSignals_T_75_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_25_0 = dut_core__ctrl___ctrlSignals_T_25_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_55_0 = dut_core__ctrl___ctrlSignals_T_55_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_71_0 = dut_core__ctrl___ctrlSignals_T_71_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_27_0 = dut_core__ctrl___ctrlSignals_T_27_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_59_0 = dut_core__ctrl___ctrlSignals_T_59_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_29_0 = dut_core__ctrl___ctrlSignals_T_29_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_39_0 = dut_core__ctrl___ctrlSignals_T_39_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_1_0 = dut_core__ctrl___ctrlSignals_T_1_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_63_0 = dut_core__ctrl___ctrlSignals_T_63_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_97_0 = dut_core__ctrl___ctrlSignals_T_97_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_23_0 = dut_core__ctrl___ctrlSignals_T_23_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_65_0 = dut_core__ctrl___ctrlSignals_T_65_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_89_0 = dut_core__ctrl___ctrlSignals_T_89_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_51_0 = dut_core__ctrl___ctrlSignals_T_51_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_83_0 = dut_core__ctrl___ctrlSignals_T_83_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_77_0 = dut_core__ctrl___ctrlSignals_T_77_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_85_0 = dut_core__ctrl___ctrlSignals_T_85_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_37_0 = dut_core__ctrl___ctrlSignals_T_37_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_67_0 = dut_core__ctrl___ctrlSignals_T_67_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_91_0 = dut_core__ctrl___ctrlSignals_T_91_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_43_0 = dut_core__ctrl___ctrlSignals_T_43_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_17_0 = dut_core__ctrl___ctrlSignals_T_17_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_9_0 = dut_core__ctrl___ctrlSignals_T_9_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_79_0 = dut_core__ctrl___ctrlSignals_T_79_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_33_0 = dut_core__ctrl___ctrlSignals_T_33_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_45_0 = dut_core__ctrl___ctrlSignals_T_45_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_13_0 = dut_core__ctrl___ctrlSignals_T_13_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_53_0 = dut_core__ctrl___ctrlSignals_T_53_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_69_0 = dut_core__ctrl___ctrlSignals_T_69_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_3_0 = dut_core__ctrl___ctrlSignals_T_3_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_7_0 = dut_core__ctrl___ctrlSignals_T_7_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_73_0 = dut_core__ctrl___ctrlSignals_T_73_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_57_0 = dut_core__ctrl___ctrlSignals_T_57_0;
  assign tracker_dut__core__ctrl___ctrlSignals_T_61_0 = dut_core__ctrl___ctrlSignals_T_61_0;
  assign tracker_dut__icache___T_5_0 = dut_icache___T_5_0;
  assign tracker_dut__icache___wmask_T_0 = dut_icache___wmask_T_0;
  assign tracker_dut__icache___T_18_0 = dut_icache___T_18_0;
  assign tracker_dut__icache__io_cpu_req_valid_0 = dut_icache__io_cpu_req_valid_0;
  assign tracker_dut__icache___T_25_0 = dut_icache___T_25_0;
  assign tracker_dut__icache___T_33_0 = dut_icache___T_33_0;
  assign tracker_dut__icache__wen_0 = dut_icache__wen_0;
  assign tracker_dut__icache__is_alloc_reg_0 = dut_icache__is_alloc_reg_0;
  assign tracker_dut__icache__read_wrap_out_0 = dut_icache__read_wrap_out_0;
  assign tracker_dut__icache___T_21_0 = dut_icache___T_21_0;
  assign tracker_dut__icache___T_11_0 = dut_icache___T_11_0;
  assign tracker_dut__icache___T_16_0 = dut_icache___T_16_0;
  assign tracker_dut__icache___T_0 = dut_icache___T_0;
  assign tracker_dut__icache__ren_0 = dut_icache__ren_0;
  assign tracker_dut__icache___hit_T_2_0 = dut_icache___hit_T_2_0;
  assign tracker_dut__icache___T_6_0 = dut_icache___T_6_0;
  assign tracker_dut__icache___io_nasti_ar_valid_T_0 = dut_icache___io_nasti_ar_valid_T_0;
  assign tracker_dut__icache___wen_T_0 = dut_icache___wen_T_0;
  assign tracker_dut__icache__is_idle_0 = dut_icache__is_idle_0;
  assign tracker_dut__icache___T_8_0 = dut_icache___T_8_0;
  assign tracker_dut__icache__is_write_0 = dut_icache__is_write_0;
  assign tracker_dut__icache___T_43_0 = dut_icache___T_43_0;
  assign tracker_dut__icache___T_20_0 = dut_icache___T_20_0;
  assign tracker_dut__icache___is_alloc_T_0 = dut_icache___is_alloc_T_0;
  assign tracker_dut__icache__read_count_0 = dut_icache__read_count_0;
  assign tracker_dut__icache___T_13_0 = dut_icache___T_13_0;
  assign tracker_dut__icache__io_cpu_resp_valid_0 = dut_icache__io_cpu_resp_valid_0;
  assign tracker_dut__icache___ren_T_0 = dut_icache___ren_T_0;
  assign tracker_dut__icache___T_3_0 = dut_icache___T_3_0;
  assign tracker_dut__icache__ren_reg_0 = dut_icache__ren_reg_0;
  assign tracker_dut__icache___T_19_0 = dut_icache___T_19_0;
  assign tracker_dut__icache___T_51_0 = dut_icache___T_51_0;
  assign tracker_dut__icache___T_28_0 = dut_icache___T_28_0;
  assign tracker_dut__icache___T_9_0 = dut_icache___T_9_0;
  assign tracker_dut__icache___T_14_0 = dut_icache___T_14_0;
  assign tracker_dut__icache___T_4_0 = dut_icache___T_4_0;
  assign tracker_dut__icache___T_47_0 = dut_icache___T_47_0;
  assign tracker_dut__icache___T_15_0 = dut_icache___T_15_0;
  assign tracker_dut__icache___T_40_0 = dut_icache___T_40_0;
  assign tracker_dut__icache__is_alloc_0 = dut_icache__is_alloc_0;
  assign tracker_dut__icache__hit_0 = dut_icache__hit_0;
  assign tracker_dut__icache___T_30_0 = dut_icache___T_30_0;
  assign tracker_dut__icache__is_read_0 = dut_icache__is_read_0;
  assign tracker_dut__icache___T_10_0 = dut_icache___T_10_0;
  assign tracker_dut__dcache___T_5_0 = dut_dcache___T_5_0;
  assign tracker_dut__dcache___io_cpu_resp_valid_T_3_0 = dut_dcache___io_cpu_resp_valid_T_3_0;
  assign tracker_dut__dcache___wmask_T_0 = dut_dcache___wmask_T_0;
  assign tracker_dut__dcache___state_T_0 = dut_dcache___state_T_0;
  assign tracker_dut__dcache__wen_0 = dut_dcache__wen_0;
  assign tracker_dut__dcache___T_33_0 = dut_dcache___T_33_0;
  assign tracker_dut__dcache___T_44_0 = dut_dcache___T_44_0;
  assign tracker_dut__dcache__read_wrap_out_0 = dut_dcache__read_wrap_out_0;
  assign tracker_dut__dcache___T_21_0 = dut_dcache___T_21_0;
  assign tracker_dut__dcache___T_16_0 = dut_dcache___T_16_0;
  assign tracker_dut__dcache___ren_T_0 = dut_dcache___ren_T_0;
  assign tracker_dut__dcache__ren_0 = dut_dcache__ren_0;
  assign tracker_dut__dcache___hit_T_2_0 = dut_dcache___hit_T_2_0;
  assign tracker_dut__dcache___T_6_0 = dut_dcache___T_6_0;
  assign tracker_dut__dcache___io_nasti_ar_valid_T_0 = dut_dcache___io_nasti_ar_valid_T_0;
  assign tracker_dut__dcache___T_1_0 = dut_dcache___T_1_0;
  assign tracker_dut__dcache___T_29_0 = dut_dcache___T_29_0;
  assign tracker_dut__dcache__write_count_0 = dut_dcache__write_count_0;
  assign tracker_dut__dcache___T_8_0 = dut_dcache___T_8_0;
  assign tracker_dut__dcache__is_write_0 = dut_dcache__is_write_0;
  assign tracker_dut__dcache___T_20_0 = dut_dcache___T_20_0;
  assign tracker_dut__dcache___is_alloc_T_0 = dut_dcache___is_alloc_T_0;
  assign tracker_dut__dcache__read_count_0 = dut_dcache__read_count_0;
  assign tracker_dut__dcache__io_cpu_resp_valid_0 = dut_dcache__io_cpu_resp_valid_0;
  assign tracker_dut__dcache___T_51_0 = dut_dcache___T_51_0;
  assign tracker_dut__dcache___T_4_0 = dut_dcache___T_4_0;
  assign tracker_dut__dcache___T_15_0 = dut_dcache___T_15_0;
  assign tracker_dut__dcache___T_40_0 = dut_dcache___T_40_0;
  assign tracker_dut__dcache__is_alloc_0 = dut_dcache__is_alloc_0;
  assign tracker_dut__dcache__hit_0 = dut_dcache__hit_0;
  assign tracker_dut__dcache___T_30_0 = dut_dcache___T_30_0;
  assign tracker_dut__dcache__is_read_0 = dut_dcache__is_read_0;
  assign tracker_dut__dcache___T_35_0 = dut_dcache___T_35_0;
  assign tracker_dut__dcache___T_10_0 = dut_dcache___T_10_0;
  assign tracker_dut__dcache___T_18_0 = dut_dcache___T_18_0;
  assign tracker_dut__dcache__io_cpu_req_valid_0 = dut_dcache__io_cpu_req_valid_0;
  assign tracker_dut__dcache___T_25_0 = dut_dcache___T_25_0;
  assign tracker_dut__dcache__is_alloc_reg_0 = dut_dcache__is_alloc_reg_0;
  assign tracker_dut__dcache___T_11_0 = dut_dcache___T_11_0;
  assign tracker_dut__dcache___T_0 = dut_dcache___T_0;
  assign tracker_dut__dcache___io_cpu_resp_valid_T_2_0 = dut_dcache___io_cpu_resp_valid_T_2_0;
  assign tracker_dut__dcache___wen_T_2_0 = dut_dcache___wen_T_2_0;
  assign tracker_dut__dcache__is_idle_0 = dut_dcache__is_idle_0;
  assign tracker_dut__dcache___T_43_0 = dut_dcache___T_43_0;
  assign tracker_dut__dcache___T_13_0 = dut_dcache___T_13_0;
  assign tracker_dut__dcache__write_wrap_out_0 = dut_dcache__write_wrap_out_0;
  assign tracker_dut__dcache___T_3_0 = dut_dcache___T_3_0;
  assign tracker_dut__dcache__ren_reg_0 = dut_dcache__ren_reg_0;
  assign tracker_dut__dcache___T_19_0 = dut_dcache___T_19_0;
  assign tracker_dut__dcache___T_28_0 = dut_dcache___T_28_0;
  assign tracker_dut__dcache___T_9_0 = dut_dcache___T_9_0;
  assign tracker_dut__dcache___T_14_0 = dut_dcache___T_14_0;
  assign tracker_dut__dcache___T_47_0 = dut_dcache___T_47_0;
  assign tracker_dut__arb___T_2_0 = dut_arb___T_2_0;
  assign tracker_dut__arb___T_13_0 = dut_arb___T_13_0;
  assign tracker_dut__arb___T_24_0 = dut_arb___T_24_0;
  assign tracker_dut__arb__io_dcache_ar_valid_0 = dut_arb__io_dcache_ar_valid_0;
  assign tracker_dut__arb___io_nasti_ar_valid_T_1_0 = dut_arb___io_nasti_ar_valid_T_1_0;
  assign tracker_dut__arb___T_20_0 = dut_arb___T_20_0;
  assign tracker_dut__arb___T_8_0 = dut_arb___T_8_0;
  assign tracker_dut__arb___io_dcache_b_valid_T_0 = dut_arb___io_dcache_b_valid_T_0;
  assign tracker_dut__arb___T_5_0 = dut_arb___T_5_0;
  assign tracker_dut__arb___T_4_0 = dut_arb___T_4_0;
  assign tracker_dut__arb___io_icache_ar_ready_T_0 = dut_arb___io_icache_ar_ready_T_0;
  assign tracker_dut__arb___T_10_0 = dut_arb___T_10_0;
  assign tracker_dut__arb___T_18_0 = dut_arb___T_18_0;
  assign tracker_dut__arb___io_nasti_aw_valid_T_0 = dut_arb___io_nasti_aw_valid_T_0;
  assign tracker_dut__arb___T_3_0 = dut_arb___T_3_0;
  assign tracker_dut__arb___io_icache_r_valid_T_0 = dut_arb___io_icache_r_valid_T_0;
  assign tracker_dut__arb___io_dcache_r_valid_T_0 = dut_arb___io_dcache_r_valid_T_0;
  assign tracker_dut__arb___T_23_0 = dut_arb___T_23_0;
  assign tracker_dut__arb___io_nasti_w_valid_T_0 = dut_arb___io_nasti_w_valid_T_0;
  always @(posedge clock) begin
    if (_resetCount < 1'h1) begin
      _resetCount <= _GEN_0[0];
    end
    if (_mem_MPORT_en & _mem_MPORT_mask) begin
      _mem[_mem_MPORT_addr] <= _mem_MPORT_data; // @[TileAndMemTop.scala 22:17]
    end
    if (reset) begin // @[TileAndMemTop.scala 24:22]
      state <= 2'h0; // @[TileAndMemTop.scala 24:22]
    end else if (2'h0 == state) begin // @[TileAndMemTop.scala 63:17]
      if (dut_io_nasti_aw_valid) begin // @[TileAndMemTop.scala 65:35]
        state <= 2'h1; // @[TileAndMemTop.scala 71:15]
      end else if (dut_io_nasti_ar_valid) begin // @[TileAndMemTop.scala 72:41]
        state <= 2'h3; // @[TileAndMemTop.scala 78:15]
      end
    end else if (2'h1 == state) begin // @[TileAndMemTop.scala 63:17]
      if (dut_io_nasti_w_valid) begin // @[TileAndMemTop.scala 82:34]
        state <= _GEN_11;
      end
    end else if (2'h2 == state) begin // @[TileAndMemTop.scala 63:17]
      state <= _GEN_20;
    end else begin
      state <= _GEN_25;
    end
    if (2'h0 == state) begin // @[TileAndMemTop.scala 63:17]
      if (dut_io_nasti_aw_valid) begin // @[TileAndMemTop.scala 65:35]
        addr <= _addr_T; // @[TileAndMemTop.scala 67:14]
      end else if (dut_io_nasti_ar_valid) begin // @[TileAndMemTop.scala 72:41]
        addr <= _addr_T_1; // @[TileAndMemTop.scala 74:14]
      end
    end
    if (2'h0 == state) begin // @[TileAndMemTop.scala 63:17]
      if (dut_io_nasti_aw_valid) begin // @[TileAndMemTop.scala 65:35]
        off <= 8'h0; // @[TileAndMemTop.scala 70:13]
      end else if (dut_io_nasti_ar_valid) begin // @[TileAndMemTop.scala 72:41]
        off <= 8'h0; // @[TileAndMemTop.scala 77:13]
      end
    end else if (2'h1 == state) begin // @[TileAndMemTop.scala 63:17]
      if (dut_io_nasti_w_valid) begin // @[TileAndMemTop.scala 82:34]
        if (!(dut_io_nasti_r_bits_x7)) begin // @[TileAndMemTop.scala 85:27]
          off <= _off_T_1; // @[TileAndMemTop.scala 89:15]
        end
      end
    end else if (!(2'h2 == state)) begin // @[TileAndMemTop.scala 63:17]
      if (2'h3 == state) begin // @[TileAndMemTop.scala 63:17]
        off <= _GEN_24;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1048576; initvar = initvar+1)
    _mem[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CSR(
  input         clock,
  input         reset,
  input         io_stall,
  input  [2:0]  io_cmd,
  input  [31:0] io_in,
  output [31:0] io_out,
  input  [31:0] io_pc,
  input  [31:0] io_addr,
  input  [31:0] io_inst,
  input         io_illegal,
  input  [1:0]  io_st_type,
  input  [2:0]  io_ld_type,
  input         io_pc_check,
  output        io_expt,
  output [31:0] io_evec,
  output [31:0] io_epc,
  output        _io_out_T_29_0,
  output        _T_0,
  output        isInstRet_0,
  output        _T_10_0,
  output        _T_7_0,
  output        _io_out_T_33_0,
  output        _T_23_0,
  output        _io_out_T_25_0,
  output        _T_6_0,
  output        _io_out_T_31_0,
  output        _wdata_T_3_0,
  output        privInst_0,
  output        _T_16_0,
  output        isEret_0,
  output        _io_out_T_41_0,
  output        _io_out_T_1_0,
  output        _io_out_T_53_0,
  output        iaddrInvalid_0,
  output        _io_out_T_27_0,
  output        _io_out_T_43_0,
  output        _T_1_0,
  output        _io_out_T_35_0,
  output        _T_3_0,
  output        _T_18_0,
  output        privValid_0,
  output        _io_expt_T_6_0,
  output        _isInstRet_T_0,
  output        _io_out_T_3_0,
  output        _io_out_T_7_0,
  output        io_expt_0,
  output        _T_24_0,
  output        _wen_T_0,
  output        _T_21_0,
  output        wen_0,
  output        _T_13_0,
  output        _T_8_0,
  output        _io_out_T_47_0,
  output        _io_out_T_19_0,
  output        _T_12_0,
  output        _io_out_T_9_0,
  output        _csrRO_T_4_0,
  output        _io_out_T_5_0,
  output        _isEcall_T_1_0,
  output        _wdata_T_5_0,
  output        _laddrInvalid_T_6_0,
  output        _T_17_0,
  output        _laddrInvalid_T_8_0,
  output        _io_out_T_45_0,
  output        _io_out_T_17_0,
  output        _io_out_T_13_0,
  output        _io_out_T_11_0,
  output        _T_20_0,
  output        _T_14_0,
  output        _io_out_T_55_0,
  output        _io_out_T_39_0,
  output        _io_out_T_51_0,
  output        laddrInvalid_0,
  output        _io_out_T_23_0,
  output        _isInstRet_T_1_0,
  output        _io_expt_T_5_0,
  output        _isEcall_T_4_0,
  output        _csrRO_T_2_0,
  output        _saddrInvalid_T_3_0,
  output        isEcall_0,
  output        isEbreak_0,
  output        _io_out_T_49_0,
  output        _T_11_0,
  output        _wdata_T_7_0,
  output        _isInstRet_T_5_0,
  output        _io_out_T_37_0,
  output        _saddrInvalid_T_5_0,
  output        _T_22_0,
  output        _io_out_T_57_0,
  output        _laddrInvalid_T_4_0,
  output        _T_9_0,
  output        _T_15_0,
  output        saddrInvalid_0,
  output        _T_19_0,
  output        _io_out_T_21_0,
  output        _io_out_T_15_0
);
  wire [11:0] csr_addr = io_inst[31:20]; // @[CSR.scala 124:25]
  wire [4:0] rs1_addr = io_inst[19:15]; // @[CSR.scala 125:25]
  reg [31:0] time_ = 32'h0; // @[CSR.scala 128:21]
  reg [31:0] timeh = 32'h0; // @[CSR.scala 129:22]
  reg [31:0] cycle = 32'h0; // @[CSR.scala 130:22]
  reg [31:0] cycleh = 32'h0; // @[CSR.scala 131:23]
  reg [31:0] instret = 32'h0; // @[CSR.scala 132:24]
  reg [31:0] instreth = 32'h0; // @[CSR.scala 133:25]
  reg [1:0] PRV = 2'h0; // @[CSR.scala 145:20]
  reg [1:0] PRV1 = 2'h0; // @[CSR.scala 146:21]
  reg  IE = 1'h0; // @[CSR.scala 149:19]
  reg  IE1 = 1'h0; // @[CSR.scala 150:20]
  wire [31:0] mstatus = {22'h0,3'h0,1'h0,PRV1,IE1,PRV,IE}; // @[Cat.scala 31:58]
  reg  MTIP = 1'h0; // @[CSR.scala 166:21]
  reg  MTIE = 1'h0; // @[CSR.scala 169:21]
  reg  MSIP = 1'h0; // @[CSR.scala 172:21]
  reg  MSIE = 1'h0; // @[CSR.scala 175:21]
  wire [31:0] mip = {24'h0,MTIP,1'h0,2'h0,MSIP,1'h0,2'h0}; // @[Cat.scala 31:58]
  wire [31:0] mie = {24'h0,MTIE,1'h0,2'h0,MSIE,1'h0,2'h0}; // @[Cat.scala 31:58]
  reg [31:0] mtimecmp = 32'h0; // @[CSR.scala 181:21]
  reg [31:0] mscratch = 32'h0; // @[CSR.scala 183:21]
  reg [31:0] mepc = 32'h0; // @[CSR.scala 185:17]
  reg [31:0] mcause = 32'h0; // @[CSR.scala 186:19]
  reg [31:0] mbadaddr = 32'h0; // @[CSR.scala 187:21]
  reg [31:0] mtohost = 32'h0; // @[CSR.scala 189:24]
  reg [31:0] mfromhost = 32'h0; // @[CSR.scala 190:22]
  wire  _io_out_T_1 = 12'hc00 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_3 = 12'hc01 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_5 = 12'hc02 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_7 = 12'hc80 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_9 = 12'hc81 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_11 = 12'hc82 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_13 = 12'h900 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_15 = 12'h901 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_17 = 12'h902 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_19 = 12'h980 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_21 = 12'h981 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_23 = 12'h982 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_25 = 12'hf00 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_27 = 12'hf01 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_29 = 12'hf10 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_31 = 12'h301 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_33 = 12'h302 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_35 = 12'h304 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_37 = 12'h321 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_39 = 12'h701 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_41 = 12'h741 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_43 = 12'h340 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_45 = 12'h341 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_47 = 12'h342 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_49 = 12'h343 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_51 = 12'h344 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_53 = 12'h780 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_55 = 12'h781 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_57 = 12'h300 == csr_addr; // @[Lookup.scala 31:38]
  wire [31:0] _io_out_T_58 = _io_out_T_57 ? mstatus : 32'h0; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_59 = _io_out_T_55 ? mfromhost : _io_out_T_58; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_60 = _io_out_T_53 ? mtohost : _io_out_T_59; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_61 = _io_out_T_51 ? mip : _io_out_T_60; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_62 = _io_out_T_49 ? mbadaddr : _io_out_T_61; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_63 = _io_out_T_47 ? mcause : _io_out_T_62; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_64 = _io_out_T_45 ? mepc : _io_out_T_63; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_65 = _io_out_T_43 ? mscratch : _io_out_T_64; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_66 = _io_out_T_41 ? timeh : _io_out_T_65; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_67 = _io_out_T_39 ? time_ : _io_out_T_66; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_68 = _io_out_T_37 ? mtimecmp : _io_out_T_67; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_69 = _io_out_T_35 ? mie : _io_out_T_68; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_70 = _io_out_T_33 ? 32'h0 : _io_out_T_69; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_71 = _io_out_T_31 ? 32'h100 : _io_out_T_70; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_72 = _io_out_T_29 ? 32'h0 : _io_out_T_71; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_73 = _io_out_T_27 ? 32'h0 : _io_out_T_72; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_74 = _io_out_T_25 ? 32'h100100 : _io_out_T_73; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_75 = _io_out_T_23 ? instreth : _io_out_T_74; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_76 = _io_out_T_21 ? timeh : _io_out_T_75; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_77 = _io_out_T_19 ? cycleh : _io_out_T_76; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_78 = _io_out_T_17 ? instret : _io_out_T_77; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_79 = _io_out_T_15 ? time_ : _io_out_T_78; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_80 = _io_out_T_13 ? cycle : _io_out_T_79; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_81 = _io_out_T_11 ? instreth : _io_out_T_80; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_82 = _io_out_T_9 ? timeh : _io_out_T_81; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_83 = _io_out_T_7 ? cycleh : _io_out_T_82; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_84 = _io_out_T_5 ? instret : _io_out_T_83; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_85 = _io_out_T_3 ? time_ : _io_out_T_84; // @[Lookup.scala 34:39]
  wire  privValid = csr_addr[9:8] <= PRV; // @[CSR.scala 230:34]
  wire  privInst = io_cmd == 3'h4; // @[CSR.scala 231:25]
  wire  _isEcall_T_1 = ~csr_addr[0]; // @[CSR.scala 232:29]
  wire  _isEcall_T_2 = privInst & ~csr_addr[0]; // @[CSR.scala 232:26]
  wire  _isEcall_T_4 = ~csr_addr[8]; // @[CSR.scala 232:45]
  wire  isEcall = privInst & ~csr_addr[0] & ~csr_addr[8]; // @[CSR.scala 232:42]
  wire  isEbreak = privInst & csr_addr[0] & _isEcall_T_4; // @[CSR.scala 233:42]
  wire  isEret = _isEcall_T_2 & csr_addr[8]; // @[CSR.scala 234:41]
  wire  csrValid = _io_out_T_1 | _io_out_T_3 | _io_out_T_5 | _io_out_T_7 | _io_out_T_9 | _io_out_T_11 | _io_out_T_13 |
    _io_out_T_15 | _io_out_T_17 | _io_out_T_19 | _io_out_T_21 | _io_out_T_23 | _io_out_T_25 | _io_out_T_27 |
    _io_out_T_29 | _io_out_T_31 | _io_out_T_33 | _io_out_T_35 | _io_out_T_37 | _io_out_T_39 | _io_out_T_41 |
    _io_out_T_43 | _io_out_T_45 | _io_out_T_47 | _io_out_T_49 | _io_out_T_51 | _io_out_T_53 | _io_out_T_55 |
    _io_out_T_57; // @[CSR.scala 235:58]
  wire  _csrRO_T_2 = csr_addr == 12'h301; // @[CSR.scala 236:49]
  wire  _csrRO_T_4 = csr_addr == 12'h302; // @[CSR.scala 236:75]
  wire  csrRO = &csr_addr[11:10] | csr_addr == 12'h301 | csr_addr == 12'h302; // @[CSR.scala 236:63]
  wire  _wen_T = io_cmd == 3'h1; // @[CSR.scala 237:20]
  wire  wen = io_cmd == 3'h1 | io_cmd[1] & |rs1_addr; // @[CSR.scala 237:30]
  wire [31:0] _wdata_T = io_out | io_in; // @[CSR.scala 243:24]
  wire [31:0] _wdata_T_1 = ~io_in; // @[CSR.scala 244:26]
  wire [31:0] _wdata_T_2 = io_out & _wdata_T_1; // @[CSR.scala 244:24]
  wire  _wdata_T_3 = 3'h1 == io_cmd; // @[Mux.scala 81:61]
  wire [31:0] _wdata_T_4 = 3'h1 == io_cmd ? io_in : 32'h0; // @[Mux.scala 81:58]
  wire  _wdata_T_5 = 3'h2 == io_cmd; // @[Mux.scala 81:61]
  wire [31:0] _wdata_T_6 = 3'h2 == io_cmd ? _wdata_T : _wdata_T_4; // @[Mux.scala 81:58]
  wire  _wdata_T_7 = 3'h3 == io_cmd; // @[Mux.scala 81:61]
  wire [31:0] wdata = 3'h3 == io_cmd ? _wdata_T_2 : _wdata_T_6; // @[Mux.scala 81:58]
  wire  iaddrInvalid = io_pc_check & io_addr[1]; // @[CSR.scala 247:34]
  wire  _laddrInvalid_T_1 = |io_addr[1:0]; // @[CSR.scala 251:40]
  wire  _laddrInvalid_T_4 = 3'h1 == io_ld_type; // @[Mux.scala 81:61]
  wire  _laddrInvalid_T_6 = 3'h2 == io_ld_type; // @[Mux.scala 81:61]
  wire  _laddrInvalid_T_7 = 3'h2 == io_ld_type ? io_addr[0] : 3'h1 == io_ld_type & _laddrInvalid_T_1; // @[Mux.scala 81:58]
  wire  _laddrInvalid_T_8 = 3'h4 == io_ld_type; // @[Mux.scala 81:61]
  wire  laddrInvalid = 3'h4 == io_ld_type ? io_addr[0] : _laddrInvalid_T_7; // @[Mux.scala 81:58]
  wire  _saddrInvalid_T_3 = 2'h1 == io_st_type; // @[Mux.scala 81:61]
  wire  _saddrInvalid_T_5 = 2'h2 == io_st_type; // @[Mux.scala 81:61]
  wire  saddrInvalid = 2'h2 == io_st_type ? io_addr[0] : 2'h1 == io_st_type & _laddrInvalid_T_1; // @[Mux.scala 81:58]
  wire  _io_expt_T_5 = ~csrValid; // @[CSR.scala 256:26]
  wire  _io_expt_T_6 = ~privValid; // @[CSR.scala 256:39]
  wire  _io_expt_T_8 = |io_cmd[1:0] & (~csrValid | ~privValid); // @[CSR.scala 256:22]
  wire  _io_expt_T_9 = io_illegal | iaddrInvalid | laddrInvalid | saddrInvalid | _io_expt_T_8; // @[CSR.scala 255:73]
  wire  _io_expt_T_13 = privInst & _io_expt_T_6; // @[CSR.scala 257:15]
  wire  _io_expt_T_14 = _io_expt_T_9 | wen & csrRO | _io_expt_T_13; // @[CSR.scala 256:67]
  wire [7:0] _io_evec_T = {PRV, 6'h0}; // @[CSR.scala 258:27]
  wire [31:0] _GEN_0 = {{24'd0}, _io_evec_T}; // @[CSR.scala 258:20]
  wire [31:0] _time_T_1 = time_ + 32'h1; // @[CSR.scala 262:16]
  wire  _T = &time_; // @[CSR.scala 263:13]
  wire [31:0] _timeh_T_1 = timeh + 32'h1; // @[CSR.scala 263:36]
  wire [31:0] _GEN_1 = &time_ ? _timeh_T_1 : timeh; // @[CSR.scala 263:19 129:22 263:27]
  wire [31:0] _cycle_T_1 = cycle + 32'h1; // @[CSR.scala 264:18]
  wire  _T_1 = &cycle; // @[CSR.scala 265:14]
  wire [31:0] _cycleh_T_1 = cycleh + 32'h1; // @[CSR.scala 265:39]
  wire [31:0] _GEN_2 = &cycle ? _cycleh_T_1 : cycleh; // @[CSR.scala 265:20 131:23 265:29]
  wire  _isInstRet_T = io_inst != 32'h13; // @[CSR.scala 266:27]
  wire  _isInstRet_T_1 = ~io_expt; // @[CSR.scala 266:52]
  wire  _isInstRet_T_5 = ~io_stall; // @[CSR.scala 266:88]
  wire  isInstRet = io_inst != 32'h13 & (~io_expt | isEcall | isEbreak) & ~io_stall; // @[CSR.scala 266:85]
  wire [31:0] _instret_T_1 = instret + 32'h1; // @[CSR.scala 267:40]
  wire [31:0] _GEN_3 = isInstRet ? _instret_T_1 : instret; // @[CSR.scala 267:19 132:24 267:29]
  wire  _T_3 = isInstRet & &instret; // @[CSR.scala 268:18]
  wire [31:0] _instreth_T_1 = instreth + 32'h1; // @[CSR.scala 268:58]
  wire [31:0] _GEN_4 = isInstRet & &instret ? _instreth_T_1 : instreth; // @[CSR.scala 133:25 268:{35,46}]
  wire [31:0] _mepc_T_1 = {io_pc[31:2], 2'h0}; // @[CSR.scala 272:26]
  wire [3:0] _GEN_240 = {{2'd0}, PRV}; // @[CSR.scala 282:38]
  wire [3:0] _mcause_T_1 = 4'h8 + _GEN_240; // @[CSR.scala 282:38]
  wire [1:0] _mcause_T_2 = isEbreak ? 2'h3 : 2'h2; // @[CSR.scala 282:48]
  wire [3:0] _mcause_T_3 = isEcall ? _mcause_T_1 : {{2'd0}, _mcause_T_2}; // @[CSR.scala 282:16]
  wire [3:0] _mcause_T_4 = saddrInvalid ? 4'h6 : _mcause_T_3; // @[CSR.scala 279:14]
  wire [3:0] _mcause_T_5 = laddrInvalid ? 4'h4 : _mcause_T_4; // @[CSR.scala 276:12]
  wire [3:0] _mcause_T_6 = iaddrInvalid ? 4'h0 : _mcause_T_5; // @[CSR.scala 273:20]
  wire  _T_6 = iaddrInvalid | laddrInvalid | saddrInvalid; // @[CSR.scala 290:41]
  wire  _T_7 = csr_addr == 12'h300; // @[CSR.scala 297:21]
  wire  _T_8 = csr_addr == 12'h344; // @[CSR.scala 303:28]
  wire  _T_9 = csr_addr == 12'h304; // @[CSR.scala 307:28]
  wire  _T_10 = csr_addr == 12'h701; // @[CSR.scala 311:28]
  wire  _T_11 = csr_addr == 12'h741; // @[CSR.scala 312:28]
  wire  _T_12 = csr_addr == 12'h321; // @[CSR.scala 313:28]
  wire  _T_13 = csr_addr == 12'h340; // @[CSR.scala 314:28]
  wire  _T_14 = csr_addr == 12'h341; // @[CSR.scala 315:28]
  wire [31:0] _mepc_T_2 = {{2'd0}, wdata[31:2]}; // @[CSR.scala 315:58]
  wire [33:0] _GEN_252 = {_mepc_T_2, 2'h0}; // @[CSR.scala 315:65]
  wire [34:0] _mepc_T_3 = {{1'd0}, _GEN_252}; // @[CSR.scala 315:65]
  wire  _T_15 = csr_addr == 12'h342; // @[CSR.scala 316:28]
  wire [31:0] _mcause_T_7 = wdata & 32'h8000000f; // @[CSR.scala 316:62]
  wire  _T_16 = csr_addr == 12'h343; // @[CSR.scala 317:28]
  wire  _T_17 = csr_addr == 12'h780; // @[CSR.scala 318:28]
  wire  _T_18 = csr_addr == 12'h781; // @[CSR.scala 319:28]
  wire  _T_19 = csr_addr == 12'h900; // @[CSR.scala 320:28]
  wire  _T_20 = csr_addr == 12'h901; // @[CSR.scala 321:28]
  wire  _T_21 = csr_addr == 12'h902; // @[CSR.scala 322:28]
  wire  _T_22 = csr_addr == 12'h980; // @[CSR.scala 323:28]
  wire  _T_23 = csr_addr == 12'h981; // @[CSR.scala 324:28]
  wire  _T_24 = csr_addr == 12'h982; // @[CSR.scala 325:28]
  wire [31:0] _GEN_6 = csr_addr == 12'h982 ? wdata : _GEN_4; // @[CSR.scala 325:{47,58}]
  wire [31:0] _GEN_7 = csr_addr == 12'h981 ? wdata : _GEN_1; // @[CSR.scala 324:{44,52}]
  wire [31:0] _GEN_8 = csr_addr == 12'h981 ? _GEN_4 : _GEN_6; // @[CSR.scala 324:44]
  wire [31:0] _GEN_9 = csr_addr == 12'h980 ? wdata : _GEN_2; // @[CSR.scala 323:{45,54}]
  wire [31:0] _GEN_10 = csr_addr == 12'h980 ? _GEN_1 : _GEN_7; // @[CSR.scala 323:45]
  wire [31:0] _GEN_11 = csr_addr == 12'h980 ? _GEN_4 : _GEN_8; // @[CSR.scala 323:45]
  wire [31:0] _GEN_12 = csr_addr == 12'h902 ? wdata : _GEN_3; // @[CSR.scala 322:{46,56}]
  wire [31:0] _GEN_13 = csr_addr == 12'h902 ? _GEN_2 : _GEN_9; // @[CSR.scala 322:46]
  wire [31:0] _GEN_14 = csr_addr == 12'h902 ? _GEN_1 : _GEN_10; // @[CSR.scala 322:46]
  wire [31:0] _GEN_15 = csr_addr == 12'h902 ? _GEN_4 : _GEN_11; // @[CSR.scala 322:46]
  wire [31:0] _GEN_16 = csr_addr == 12'h901 ? wdata : _time_T_1; // @[CSR.scala 321:{43,50} 262:8]
  wire [31:0] _GEN_17 = csr_addr == 12'h901 ? _GEN_3 : _GEN_12; // @[CSR.scala 321:43]
  wire [31:0] _GEN_18 = csr_addr == 12'h901 ? _GEN_2 : _GEN_13; // @[CSR.scala 321:43]
  wire [31:0] _GEN_19 = csr_addr == 12'h901 ? _GEN_1 : _GEN_14; // @[CSR.scala 321:43]
  wire [31:0] _GEN_20 = csr_addr == 12'h901 ? _GEN_4 : _GEN_15; // @[CSR.scala 321:43]
  wire [31:0] _GEN_21 = csr_addr == 12'h900 ? wdata : _cycle_T_1; // @[CSR.scala 320:{44,52} 264:9]
  wire [31:0] _GEN_22 = csr_addr == 12'h900 ? _time_T_1 : _GEN_16; // @[CSR.scala 320:44 262:8]
  wire [31:0] _GEN_23 = csr_addr == 12'h900 ? _GEN_3 : _GEN_17; // @[CSR.scala 320:44]
  wire [31:0] _GEN_24 = csr_addr == 12'h900 ? _GEN_2 : _GEN_18; // @[CSR.scala 320:44]
  wire [31:0] _GEN_25 = csr_addr == 12'h900 ? _GEN_1 : _GEN_19; // @[CSR.scala 320:44]
  wire [31:0] _GEN_26 = csr_addr == 12'h900 ? _GEN_4 : _GEN_20; // @[CSR.scala 320:44]
  wire [31:0] _GEN_27 = csr_addr == 12'h781 ? wdata : mfromhost; // @[CSR.scala 319:{47,59}]
  wire [31:0] _GEN_28 = csr_addr == 12'h781 ? _cycle_T_1 : _GEN_21; // @[CSR.scala 319:47 264:9]
  wire [31:0] _GEN_29 = csr_addr == 12'h781 ? _time_T_1 : _GEN_22; // @[CSR.scala 319:47 262:8]
  wire [31:0] _GEN_30 = csr_addr == 12'h781 ? _GEN_3 : _GEN_23; // @[CSR.scala 319:47]
  wire [31:0] _GEN_31 = csr_addr == 12'h781 ? _GEN_2 : _GEN_24; // @[CSR.scala 319:47]
  wire [31:0] _GEN_32 = csr_addr == 12'h781 ? _GEN_1 : _GEN_25; // @[CSR.scala 319:47]
  wire [31:0] _GEN_33 = csr_addr == 12'h781 ? _GEN_4 : _GEN_26; // @[CSR.scala 319:47]
  wire [31:0] _GEN_34 = csr_addr == 12'h780 ? wdata : mtohost; // @[CSR.scala 189:24 318:{45,55}]
  wire [31:0] _GEN_35 = csr_addr == 12'h780 ? mfromhost : _GEN_27; // @[CSR.scala 318:45]
  wire [31:0] _GEN_36 = csr_addr == 12'h780 ? _cycle_T_1 : _GEN_28; // @[CSR.scala 318:45 264:9]
  wire [31:0] _GEN_37 = csr_addr == 12'h780 ? _time_T_1 : _GEN_29; // @[CSR.scala 318:45 262:8]
  wire [31:0] _GEN_38 = csr_addr == 12'h780 ? _GEN_3 : _GEN_30; // @[CSR.scala 318:45]
  wire [31:0] _GEN_39 = csr_addr == 12'h780 ? _GEN_2 : _GEN_31; // @[CSR.scala 318:45]
  wire [31:0] _GEN_40 = csr_addr == 12'h780 ? _GEN_1 : _GEN_32; // @[CSR.scala 318:45]
  wire [31:0] _GEN_41 = csr_addr == 12'h780 ? _GEN_4 : _GEN_33; // @[CSR.scala 318:45]
  wire [31:0] _GEN_42 = csr_addr == 12'h343 ? wdata : mbadaddr; // @[CSR.scala 187:21 317:{46,57}]
  wire [31:0] _GEN_43 = csr_addr == 12'h343 ? mtohost : _GEN_34; // @[CSR.scala 189:24 317:46]
  wire [31:0] _GEN_44 = csr_addr == 12'h343 ? mfromhost : _GEN_35; // @[CSR.scala 317:46]
  wire [31:0] _GEN_45 = csr_addr == 12'h343 ? _cycle_T_1 : _GEN_36; // @[CSR.scala 317:46 264:9]
  wire [31:0] _GEN_46 = csr_addr == 12'h343 ? _time_T_1 : _GEN_37; // @[CSR.scala 317:46 262:8]
  wire [31:0] _GEN_47 = csr_addr == 12'h343 ? _GEN_3 : _GEN_38; // @[CSR.scala 317:46]
  wire [31:0] _GEN_48 = csr_addr == 12'h343 ? _GEN_2 : _GEN_39; // @[CSR.scala 317:46]
  wire [31:0] _GEN_49 = csr_addr == 12'h343 ? _GEN_1 : _GEN_40; // @[CSR.scala 317:46]
  wire [31:0] _GEN_50 = csr_addr == 12'h343 ? _GEN_4 : _GEN_41; // @[CSR.scala 317:46]
  wire [31:0] _GEN_51 = csr_addr == 12'h342 ? _mcause_T_7 : mcause; // @[CSR.scala 186:19 316:{44,53}]
  wire [31:0] _GEN_52 = csr_addr == 12'h342 ? mbadaddr : _GEN_42; // @[CSR.scala 187:21 316:44]
  wire [31:0] _GEN_53 = csr_addr == 12'h342 ? mtohost : _GEN_43; // @[CSR.scala 189:24 316:44]
  wire [31:0] _GEN_54 = csr_addr == 12'h342 ? mfromhost : _GEN_44; // @[CSR.scala 316:44]
  wire [31:0] _GEN_55 = csr_addr == 12'h342 ? _cycle_T_1 : _GEN_45; // @[CSR.scala 316:44 264:9]
  wire [31:0] _GEN_56 = csr_addr == 12'h342 ? _time_T_1 : _GEN_46; // @[CSR.scala 316:44 262:8]
  wire [31:0] _GEN_57 = csr_addr == 12'h342 ? _GEN_3 : _GEN_47; // @[CSR.scala 316:44]
  wire [31:0] _GEN_58 = csr_addr == 12'h342 ? _GEN_2 : _GEN_48; // @[CSR.scala 316:44]
  wire [31:0] _GEN_59 = csr_addr == 12'h342 ? _GEN_1 : _GEN_49; // @[CSR.scala 316:44]
  wire [31:0] _GEN_60 = csr_addr == 12'h342 ? _GEN_4 : _GEN_50; // @[CSR.scala 316:44]
  wire [34:0] _GEN_61 = csr_addr == 12'h341 ? _mepc_T_3 : {{3'd0}, mepc}; // @[CSR.scala 185:17 315:{42,49}]
  wire [31:0] _GEN_62 = csr_addr == 12'h341 ? mcause : _GEN_51; // @[CSR.scala 186:19 315:42]
  wire [31:0] _GEN_63 = csr_addr == 12'h341 ? mbadaddr : _GEN_52; // @[CSR.scala 187:21 315:42]
  wire [31:0] _GEN_64 = csr_addr == 12'h341 ? mtohost : _GEN_53; // @[CSR.scala 189:24 315:42]
  wire [31:0] _GEN_65 = csr_addr == 12'h341 ? mfromhost : _GEN_54; // @[CSR.scala 315:42]
  wire [31:0] _GEN_66 = csr_addr == 12'h341 ? _cycle_T_1 : _GEN_55; // @[CSR.scala 315:42 264:9]
  wire [31:0] _GEN_67 = csr_addr == 12'h341 ? _time_T_1 : _GEN_56; // @[CSR.scala 315:42 262:8]
  wire [31:0] _GEN_68 = csr_addr == 12'h341 ? _GEN_3 : _GEN_57; // @[CSR.scala 315:42]
  wire [31:0] _GEN_69 = csr_addr == 12'h341 ? _GEN_2 : _GEN_58; // @[CSR.scala 315:42]
  wire [31:0] _GEN_70 = csr_addr == 12'h341 ? _GEN_1 : _GEN_59; // @[CSR.scala 315:42]
  wire [31:0] _GEN_71 = csr_addr == 12'h341 ? _GEN_4 : _GEN_60; // @[CSR.scala 315:42]
  wire [31:0] _GEN_72 = csr_addr == 12'h340 ? wdata : mscratch; // @[CSR.scala 183:21 314:{46,57}]
  wire [34:0] _GEN_73 = csr_addr == 12'h340 ? {{3'd0}, mepc} : _GEN_61; // @[CSR.scala 185:17 314:46]
  wire [31:0] _GEN_74 = csr_addr == 12'h340 ? mcause : _GEN_62; // @[CSR.scala 186:19 314:46]
  wire [31:0] _GEN_75 = csr_addr == 12'h340 ? mbadaddr : _GEN_63; // @[CSR.scala 187:21 314:46]
  wire [31:0] _GEN_76 = csr_addr == 12'h340 ? mtohost : _GEN_64; // @[CSR.scala 189:24 314:46]
  wire [31:0] _GEN_77 = csr_addr == 12'h340 ? mfromhost : _GEN_65; // @[CSR.scala 314:46]
  wire [31:0] _GEN_78 = csr_addr == 12'h340 ? _cycle_T_1 : _GEN_66; // @[CSR.scala 314:46 264:9]
  wire [31:0] _GEN_79 = csr_addr == 12'h340 ? _time_T_1 : _GEN_67; // @[CSR.scala 314:46 262:8]
  wire [31:0] _GEN_80 = csr_addr == 12'h340 ? _GEN_3 : _GEN_68; // @[CSR.scala 314:46]
  wire [31:0] _GEN_81 = csr_addr == 12'h340 ? _GEN_2 : _GEN_69; // @[CSR.scala 314:46]
  wire [31:0] _GEN_82 = csr_addr == 12'h340 ? _GEN_1 : _GEN_70; // @[CSR.scala 314:46]
  wire [31:0] _GEN_83 = csr_addr == 12'h340 ? _GEN_4 : _GEN_71; // @[CSR.scala 314:46]
  wire [31:0] _GEN_84 = csr_addr == 12'h321 ? wdata : mtimecmp; // @[CSR.scala 181:21 313:{46,57}]
  wire [31:0] _GEN_85 = csr_addr == 12'h321 ? mscratch : _GEN_72; // @[CSR.scala 183:21 313:46]
  wire [34:0] _GEN_86 = csr_addr == 12'h321 ? {{3'd0}, mepc} : _GEN_73; // @[CSR.scala 185:17 313:46]
  wire [31:0] _GEN_87 = csr_addr == 12'h321 ? mcause : _GEN_74; // @[CSR.scala 186:19 313:46]
  wire [31:0] _GEN_88 = csr_addr == 12'h321 ? mbadaddr : _GEN_75; // @[CSR.scala 187:21 313:46]
  wire [31:0] _GEN_89 = csr_addr == 12'h321 ? mtohost : _GEN_76; // @[CSR.scala 189:24 313:46]
  wire [31:0] _GEN_90 = csr_addr == 12'h321 ? mfromhost : _GEN_77; // @[CSR.scala 313:46]
  wire [31:0] _GEN_91 = csr_addr == 12'h321 ? _cycle_T_1 : _GEN_78; // @[CSR.scala 313:46 264:9]
  wire [31:0] _GEN_92 = csr_addr == 12'h321 ? _time_T_1 : _GEN_79; // @[CSR.scala 313:46 262:8]
  wire [31:0] _GEN_93 = csr_addr == 12'h321 ? _GEN_3 : _GEN_80; // @[CSR.scala 313:46]
  wire [31:0] _GEN_94 = csr_addr == 12'h321 ? _GEN_2 : _GEN_81; // @[CSR.scala 313:46]
  wire [31:0] _GEN_95 = csr_addr == 12'h321 ? _GEN_1 : _GEN_82; // @[CSR.scala 313:46]
  wire [31:0] _GEN_96 = csr_addr == 12'h321 ? _GEN_4 : _GEN_83; // @[CSR.scala 313:46]
  wire [31:0] _GEN_97 = csr_addr == 12'h741 ? wdata : _GEN_95; // @[CSR.scala 312:{44,52}]
  wire [31:0] _GEN_98 = csr_addr == 12'h741 ? mtimecmp : _GEN_84; // @[CSR.scala 181:21 312:44]
  wire [31:0] _GEN_99 = csr_addr == 12'h741 ? mscratch : _GEN_85; // @[CSR.scala 183:21 312:44]
  wire [34:0] _GEN_100 = csr_addr == 12'h741 ? {{3'd0}, mepc} : _GEN_86; // @[CSR.scala 185:17 312:44]
  wire [31:0] _GEN_101 = csr_addr == 12'h741 ? mcause : _GEN_87; // @[CSR.scala 186:19 312:44]
  wire [31:0] _GEN_102 = csr_addr == 12'h741 ? mbadaddr : _GEN_88; // @[CSR.scala 187:21 312:44]
  wire [31:0] _GEN_103 = csr_addr == 12'h741 ? mtohost : _GEN_89; // @[CSR.scala 189:24 312:44]
  wire [31:0] _GEN_104 = csr_addr == 12'h741 ? mfromhost : _GEN_90; // @[CSR.scala 312:44]
  wire [31:0] _GEN_105 = csr_addr == 12'h741 ? _cycle_T_1 : _GEN_91; // @[CSR.scala 312:44 264:9]
  wire [31:0] _GEN_106 = csr_addr == 12'h741 ? _time_T_1 : _GEN_92; // @[CSR.scala 312:44 262:8]
  wire [31:0] _GEN_107 = csr_addr == 12'h741 ? _GEN_3 : _GEN_93; // @[CSR.scala 312:44]
  wire [31:0] _GEN_108 = csr_addr == 12'h741 ? _GEN_2 : _GEN_94; // @[CSR.scala 312:44]
  wire [31:0] _GEN_109 = csr_addr == 12'h741 ? _GEN_4 : _GEN_96; // @[CSR.scala 312:44]
  wire [31:0] _GEN_110 = csr_addr == 12'h701 ? wdata : _GEN_106; // @[CSR.scala 311:{43,50}]
  wire [31:0] _GEN_111 = csr_addr == 12'h701 ? _GEN_1 : _GEN_97; // @[CSR.scala 311:43]
  wire [31:0] _GEN_112 = csr_addr == 12'h701 ? mtimecmp : _GEN_98; // @[CSR.scala 181:21 311:43]
  wire [31:0] _GEN_113 = csr_addr == 12'h701 ? mscratch : _GEN_99; // @[CSR.scala 183:21 311:43]
  wire [34:0] _GEN_114 = csr_addr == 12'h701 ? {{3'd0}, mepc} : _GEN_100; // @[CSR.scala 185:17 311:43]
  wire [31:0] _GEN_115 = csr_addr == 12'h701 ? mcause : _GEN_101; // @[CSR.scala 186:19 311:43]
  wire [31:0] _GEN_116 = csr_addr == 12'h701 ? mbadaddr : _GEN_102; // @[CSR.scala 187:21 311:43]
  wire [31:0] _GEN_117 = csr_addr == 12'h701 ? mtohost : _GEN_103; // @[CSR.scala 189:24 311:43]
  wire [31:0] _GEN_118 = csr_addr == 12'h701 ? mfromhost : _GEN_104; // @[CSR.scala 311:43]
  wire [31:0] _GEN_119 = csr_addr == 12'h701 ? _cycle_T_1 : _GEN_105; // @[CSR.scala 311:43 264:9]
  wire [31:0] _GEN_120 = csr_addr == 12'h701 ? _GEN_3 : _GEN_107; // @[CSR.scala 311:43]
  wire [31:0] _GEN_121 = csr_addr == 12'h701 ? _GEN_2 : _GEN_108; // @[CSR.scala 311:43]
  wire [31:0] _GEN_122 = csr_addr == 12'h701 ? _GEN_4 : _GEN_109; // @[CSR.scala 311:43]
  wire  _GEN_123 = csr_addr == 12'h304 ? wdata[7] : MTIE; // @[CSR.scala 307:41 308:16 169:21]
  wire  _GEN_124 = csr_addr == 12'h304 ? wdata[3] : MSIE; // @[CSR.scala 307:41 309:16 175:21]
  wire [31:0] _GEN_125 = csr_addr == 12'h304 ? _time_T_1 : _GEN_110; // @[CSR.scala 307:41 262:8]
  wire [31:0] _GEN_126 = csr_addr == 12'h304 ? _GEN_1 : _GEN_111; // @[CSR.scala 307:41]
  wire [31:0] _GEN_127 = csr_addr == 12'h304 ? mtimecmp : _GEN_112; // @[CSR.scala 181:21 307:41]
  wire [31:0] _GEN_128 = csr_addr == 12'h304 ? mscratch : _GEN_113; // @[CSR.scala 183:21 307:41]
  wire [34:0] _GEN_129 = csr_addr == 12'h304 ? {{3'd0}, mepc} : _GEN_114; // @[CSR.scala 185:17 307:41]
  wire [31:0] _GEN_130 = csr_addr == 12'h304 ? mcause : _GEN_115; // @[CSR.scala 186:19 307:41]
  wire [31:0] _GEN_131 = csr_addr == 12'h304 ? mbadaddr : _GEN_116; // @[CSR.scala 187:21 307:41]
  wire [31:0] _GEN_132 = csr_addr == 12'h304 ? mtohost : _GEN_117; // @[CSR.scala 189:24 307:41]
  wire [31:0] _GEN_133 = csr_addr == 12'h304 ? mfromhost : _GEN_118; // @[CSR.scala 307:41]
  wire [31:0] _GEN_134 = csr_addr == 12'h304 ? _cycle_T_1 : _GEN_119; // @[CSR.scala 307:41 264:9]
  wire [31:0] _GEN_135 = csr_addr == 12'h304 ? _GEN_3 : _GEN_120; // @[CSR.scala 307:41]
  wire [31:0] _GEN_136 = csr_addr == 12'h304 ? _GEN_2 : _GEN_121; // @[CSR.scala 307:41]
  wire [31:0] _GEN_137 = csr_addr == 12'h304 ? _GEN_4 : _GEN_122; // @[CSR.scala 307:41]
  wire  _GEN_138 = csr_addr == 12'h344 ? wdata[7] : MTIP; // @[CSR.scala 303:41 304:16 166:21]
  wire  _GEN_139 = csr_addr == 12'h344 ? wdata[3] : MSIP; // @[CSR.scala 303:41 305:16 172:21]
  wire  _GEN_140 = csr_addr == 12'h344 ? MTIE : _GEN_123; // @[CSR.scala 169:21 303:41]
  wire  _GEN_141 = csr_addr == 12'h344 ? MSIE : _GEN_124; // @[CSR.scala 175:21 303:41]
  wire [31:0] _GEN_142 = csr_addr == 12'h344 ? _time_T_1 : _GEN_125; // @[CSR.scala 303:41 262:8]
  wire [31:0] _GEN_143 = csr_addr == 12'h344 ? _GEN_1 : _GEN_126; // @[CSR.scala 303:41]
  wire [31:0] _GEN_144 = csr_addr == 12'h344 ? mtimecmp : _GEN_127; // @[CSR.scala 181:21 303:41]
  wire [31:0] _GEN_145 = csr_addr == 12'h344 ? mscratch : _GEN_128; // @[CSR.scala 183:21 303:41]
  wire [34:0] _GEN_146 = csr_addr == 12'h344 ? {{3'd0}, mepc} : _GEN_129; // @[CSR.scala 185:17 303:41]
  wire [31:0] _GEN_147 = csr_addr == 12'h344 ? mcause : _GEN_130; // @[CSR.scala 186:19 303:41]
  wire [31:0] _GEN_148 = csr_addr == 12'h344 ? mbadaddr : _GEN_131; // @[CSR.scala 187:21 303:41]
  wire [31:0] _GEN_149 = csr_addr == 12'h344 ? mtohost : _GEN_132; // @[CSR.scala 189:24 303:41]
  wire [31:0] _GEN_150 = csr_addr == 12'h344 ? mfromhost : _GEN_133; // @[CSR.scala 303:41]
  wire [31:0] _GEN_151 = csr_addr == 12'h344 ? _cycle_T_1 : _GEN_134; // @[CSR.scala 303:41 264:9]
  wire [31:0] _GEN_152 = csr_addr == 12'h344 ? _GEN_3 : _GEN_135; // @[CSR.scala 303:41]
  wire [31:0] _GEN_153 = csr_addr == 12'h344 ? _GEN_2 : _GEN_136; // @[CSR.scala 303:41]
  wire [31:0] _GEN_154 = csr_addr == 12'h344 ? _GEN_4 : _GEN_137; // @[CSR.scala 303:41]
  wire [1:0] _GEN_155 = csr_addr == 12'h300 ? wdata[5:4] : PRV1; // @[CSR.scala 297:38 298:14 146:21]
  wire  _GEN_156 = csr_addr == 12'h300 ? wdata[3] : IE1; // @[CSR.scala 297:38 299:13 150:20]
  wire [1:0] _GEN_157 = csr_addr == 12'h300 ? wdata[2:1] : PRV; // @[CSR.scala 297:38 300:13 145:20]
  wire  _GEN_158 = csr_addr == 12'h300 ? wdata[0] : IE; // @[CSR.scala 297:38 301:12 149:19]
  wire  _GEN_159 = csr_addr == 12'h300 ? MTIP : _GEN_138; // @[CSR.scala 166:21 297:38]
  wire  _GEN_160 = csr_addr == 12'h300 ? MSIP : _GEN_139; // @[CSR.scala 172:21 297:38]
  wire  _GEN_161 = csr_addr == 12'h300 ? MTIE : _GEN_140; // @[CSR.scala 169:21 297:38]
  wire  _GEN_162 = csr_addr == 12'h300 ? MSIE : _GEN_141; // @[CSR.scala 175:21 297:38]
  wire [31:0] _GEN_163 = csr_addr == 12'h300 ? _time_T_1 : _GEN_142; // @[CSR.scala 297:38 262:8]
  wire [31:0] _GEN_164 = csr_addr == 12'h300 ? _GEN_1 : _GEN_143; // @[CSR.scala 297:38]
  wire [31:0] _GEN_165 = csr_addr == 12'h300 ? mtimecmp : _GEN_144; // @[CSR.scala 181:21 297:38]
  wire [31:0] _GEN_166 = csr_addr == 12'h300 ? mscratch : _GEN_145; // @[CSR.scala 183:21 297:38]
  wire [34:0] _GEN_167 = csr_addr == 12'h300 ? {{3'd0}, mepc} : _GEN_146; // @[CSR.scala 185:17 297:38]
  wire [31:0] _GEN_168 = csr_addr == 12'h300 ? mcause : _GEN_147; // @[CSR.scala 186:19 297:38]
  wire [31:0] _GEN_169 = csr_addr == 12'h300 ? mbadaddr : _GEN_148; // @[CSR.scala 187:21 297:38]
  wire [31:0] _GEN_170 = csr_addr == 12'h300 ? mtohost : _GEN_149; // @[CSR.scala 189:24 297:38]
  wire [31:0] _GEN_171 = csr_addr == 12'h300 ? mfromhost : _GEN_150; // @[CSR.scala 297:38]
  wire [31:0] _GEN_172 = csr_addr == 12'h300 ? _cycle_T_1 : _GEN_151; // @[CSR.scala 297:38 264:9]
  wire [31:0] _GEN_173 = csr_addr == 12'h300 ? _GEN_3 : _GEN_152; // @[CSR.scala 297:38]
  wire [31:0] _GEN_174 = csr_addr == 12'h300 ? _GEN_2 : _GEN_153; // @[CSR.scala 297:38]
  wire [31:0] _GEN_175 = csr_addr == 12'h300 ? _GEN_4 : _GEN_154; // @[CSR.scala 297:38]
  wire [1:0] _GEN_176 = wen ? _GEN_155 : PRV1; // @[CSR.scala 146:21 296:21]
  wire  _GEN_177 = wen ? _GEN_156 : IE1; // @[CSR.scala 150:20 296:21]
  wire [1:0] _GEN_178 = wen ? _GEN_157 : PRV; // @[CSR.scala 145:20 296:21]
  wire  _GEN_179 = wen ? _GEN_158 : IE; // @[CSR.scala 149:19 296:21]
  wire  _GEN_180 = wen ? _GEN_159 : MTIP; // @[CSR.scala 166:21 296:21]
  wire  _GEN_181 = wen ? _GEN_160 : MSIP; // @[CSR.scala 172:21 296:21]
  wire  _GEN_182 = wen ? _GEN_161 : MTIE; // @[CSR.scala 169:21 296:21]
  wire  _GEN_183 = wen ? _GEN_162 : MSIE; // @[CSR.scala 175:21 296:21]
  wire [31:0] _GEN_184 = wen ? _GEN_163 : _time_T_1; // @[CSR.scala 296:21 262:8]
  wire [31:0] _GEN_185 = wen ? _GEN_164 : _GEN_1; // @[CSR.scala 296:21]
  wire [34:0] _GEN_188 = wen ? _GEN_167 : {{3'd0}, mepc}; // @[CSR.scala 185:17 296:21]
  wire [31:0] _GEN_191 = wen ? _GEN_170 : mtohost; // @[CSR.scala 296:21 189:24]
  wire [31:0] _GEN_193 = wen ? _GEN_172 : _cycle_T_1; // @[CSR.scala 296:21 264:9]
  wire [31:0] _GEN_194 = wen ? _GEN_173 : _GEN_3; // @[CSR.scala 296:21]
  wire [31:0] _GEN_195 = wen ? _GEN_174 : _GEN_2; // @[CSR.scala 296:21]
  wire [31:0] _GEN_196 = wen ? _GEN_175 : _GEN_4; // @[CSR.scala 296:21]
  wire  _GEN_200 = isEret | _GEN_177; // @[CSR.scala 291:24 295:11]
  wire [34:0] _GEN_209 = isEret ? {{3'd0}, mepc} : _GEN_188; // @[CSR.scala 185:17 291:24]
  wire [34:0] _GEN_218 = io_expt ? {{3'd0}, _mepc_T_1} : _GEN_209; // @[CSR.scala 271:19 272:12]
  wire [34:0] _GEN_239 = _isInstRet_T_5 ? _GEN_218 : {{3'd0}, mepc}; // @[CSR.scala 185:17 270:19]
  assign io_out = _io_out_T_1 ? cycle : _io_out_T_85; // @[Lookup.scala 34:39]
  assign io_expt = _io_expt_T_14 | isEcall | isEbreak; // @[CSR.scala 257:41]
  assign io_evec = 32'h100 + _GEN_0; // @[CSR.scala 258:20]
  assign io_epc = mepc; // @[CSR.scala 259:10]
  assign _io_out_T_29_0 = _io_out_T_29;
  assign _T_0 = _T;
  assign isInstRet_0 = isInstRet;
  assign _T_10_0 = _T_10;
  assign _T_7_0 = _T_7;
  assign _io_out_T_33_0 = _io_out_T_33;
  assign _T_23_0 = _T_23;
  assign _io_out_T_25_0 = _io_out_T_25;
  assign _T_6_0 = _T_6;
  assign _io_out_T_31_0 = _io_out_T_31;
  assign _wdata_T_3_0 = _wdata_T_3;
  assign privInst_0 = privInst;
  assign _T_16_0 = _T_16;
  assign isEret_0 = isEret;
  assign _io_out_T_41_0 = _io_out_T_41;
  assign _io_out_T_1_0 = _io_out_T_1;
  assign _io_out_T_53_0 = _io_out_T_53;
  assign iaddrInvalid_0 = iaddrInvalid;
  assign _io_out_T_27_0 = _io_out_T_27;
  assign _io_out_T_43_0 = _io_out_T_43;
  assign _T_1_0 = _T_1;
  assign _io_out_T_35_0 = _io_out_T_35;
  assign _T_3_0 = _T_3;
  assign _T_18_0 = _T_18;
  assign privValid_0 = privValid;
  assign _io_expt_T_6_0 = _io_expt_T_6;
  assign _isInstRet_T_0 = _isInstRet_T;
  assign _io_out_T_3_0 = _io_out_T_3;
  assign _io_out_T_7_0 = _io_out_T_7;
  assign io_expt_0 = io_expt;
  assign _T_24_0 = _T_24;
  assign _wen_T_0 = _wen_T;
  assign _T_21_0 = _T_21;
  assign wen_0 = wen;
  assign _T_13_0 = _T_13;
  assign _T_8_0 = _T_8;
  assign _io_out_T_47_0 = _io_out_T_47;
  assign _io_out_T_19_0 = _io_out_T_19;
  assign _T_12_0 = _T_12;
  assign _io_out_T_9_0 = _io_out_T_9;
  assign _csrRO_T_4_0 = _csrRO_T_4;
  assign _io_out_T_5_0 = _io_out_T_5;
  assign _isEcall_T_1_0 = _isEcall_T_1;
  assign _wdata_T_5_0 = _wdata_T_5;
  assign _laddrInvalid_T_6_0 = _laddrInvalid_T_6;
  assign _T_17_0 = _T_17;
  assign _laddrInvalid_T_8_0 = _laddrInvalid_T_8;
  assign _io_out_T_45_0 = _io_out_T_45;
  assign _io_out_T_17_0 = _io_out_T_17;
  assign _io_out_T_13_0 = _io_out_T_13;
  assign _io_out_T_11_0 = _io_out_T_11;
  assign _T_20_0 = _T_20;
  assign _T_14_0 = _T_14;
  assign _io_out_T_55_0 = _io_out_T_55;
  assign _io_out_T_39_0 = _io_out_T_39;
  assign _io_out_T_51_0 = _io_out_T_51;
  assign laddrInvalid_0 = laddrInvalid;
  assign _io_out_T_23_0 = _io_out_T_23;
  assign _isInstRet_T_1_0 = _isInstRet_T_1;
  assign _io_expt_T_5_0 = _io_expt_T_5;
  assign _isEcall_T_4_0 = _isEcall_T_4;
  assign _csrRO_T_2_0 = _csrRO_T_2;
  assign _saddrInvalid_T_3_0 = _saddrInvalid_T_3;
  assign isEcall_0 = isEcall;
  assign isEbreak_0 = isEbreak;
  assign _io_out_T_49_0 = _io_out_T_49;
  assign _T_11_0 = _T_11;
  assign _wdata_T_7_0 = _wdata_T_7;
  assign _isInstRet_T_5_0 = _isInstRet_T_5;
  assign _io_out_T_37_0 = _io_out_T_37;
  assign _saddrInvalid_T_5_0 = _saddrInvalid_T_5;
  assign _T_22_0 = _T_22;
  assign _io_out_T_57_0 = _io_out_T_57;
  assign _laddrInvalid_T_4_0 = _laddrInvalid_T_4;
  assign _T_9_0 = _T_9;
  assign _T_15_0 = _T_15;
  assign saddrInvalid_0 = saddrInvalid;
  assign _T_19_0 = _T_19;
  assign _io_out_T_21_0 = _io_out_T_21;
  assign _io_out_T_15_0 = _io_out_T_15;
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 128:21]
      time_ <= 32'h0; // @[CSR.scala 128:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        time_ <= _time_T_1; // @[CSR.scala 262:8]
      end else if (isEret) begin // @[CSR.scala 291:24]
        time_ <= _time_T_1; // @[CSR.scala 262:8]
      end else begin
        time_ <= _GEN_184;
      end
    end else begin
      time_ <= _time_T_1; // @[CSR.scala 262:8]
    end
    if (reset) begin // @[CSR.scala 129:22]
      timeh <= 32'h0; // @[CSR.scala 129:22]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        timeh <= _GEN_1;
      end else if (isEret) begin // @[CSR.scala 291:24]
        timeh <= _GEN_1;
      end else begin
        timeh <= _GEN_185;
      end
    end else begin
      timeh <= _GEN_1;
    end
    if (reset) begin // @[CSR.scala 130:22]
      cycle <= 32'h0; // @[CSR.scala 130:22]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        cycle <= _cycle_T_1; // @[CSR.scala 264:9]
      end else if (isEret) begin // @[CSR.scala 291:24]
        cycle <= _cycle_T_1; // @[CSR.scala 264:9]
      end else begin
        cycle <= _GEN_193;
      end
    end else begin
      cycle <= _cycle_T_1; // @[CSR.scala 264:9]
    end
    if (reset) begin // @[CSR.scala 131:23]
      cycleh <= 32'h0; // @[CSR.scala 131:23]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        cycleh <= _GEN_2;
      end else if (isEret) begin // @[CSR.scala 291:24]
        cycleh <= _GEN_2;
      end else begin
        cycleh <= _GEN_195;
      end
    end else begin
      cycleh <= _GEN_2;
    end
    if (reset) begin // @[CSR.scala 132:24]
      instret <= 32'h0; // @[CSR.scala 132:24]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        instret <= _GEN_3;
      end else if (isEret) begin // @[CSR.scala 291:24]
        instret <= _GEN_3;
      end else begin
        instret <= _GEN_194;
      end
    end else begin
      instret <= _GEN_3;
    end
    if (reset) begin // @[CSR.scala 133:25]
      instreth <= 32'h0; // @[CSR.scala 133:25]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        instreth <= _GEN_4;
      end else if (isEret) begin // @[CSR.scala 291:24]
        instreth <= _GEN_4;
      end else begin
        instreth <= _GEN_196;
      end
    end else begin
      instreth <= _GEN_4;
    end
    if (reset) begin // @[CSR.scala 145:20]
      PRV <= 2'h3; // @[CSR.scala 145:20]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        PRV <= 2'h3; // @[CSR.scala 286:11]
      end else if (isEret) begin // @[CSR.scala 291:24]
        PRV <= PRV1; // @[CSR.scala 292:11]
      end else begin
        PRV <= _GEN_178;
      end
    end
    if (reset) begin // @[CSR.scala 146:21]
      PRV1 <= 2'h3; // @[CSR.scala 146:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        PRV1 <= PRV; // @[CSR.scala 288:12]
      end else if (isEret) begin // @[CSR.scala 291:24]
        PRV1 <= 2'h0; // @[CSR.scala 294:12]
      end else begin
        PRV1 <= _GEN_176;
      end
    end
    if (reset) begin // @[CSR.scala 149:19]
      IE <= 1'h0; // @[CSR.scala 149:19]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        IE <= 1'h0; // @[CSR.scala 287:10]
      end else if (isEret) begin // @[CSR.scala 291:24]
        IE <= IE1; // @[CSR.scala 293:10]
      end else begin
        IE <= _GEN_179;
      end
    end
    if (reset) begin // @[CSR.scala 150:20]
      IE1 <= 1'h0; // @[CSR.scala 150:20]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        IE1 <= IE; // @[CSR.scala 289:11]
      end else begin
        IE1 <= _GEN_200;
      end
    end
    if (reset) begin // @[CSR.scala 166:21]
      MTIP <= 1'h0; // @[CSR.scala 166:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (!(io_expt)) begin // @[CSR.scala 271:19]
        if (!(isEret)) begin // @[CSR.scala 291:24]
          MTIP <= _GEN_180;
        end
      end
    end
    if (reset) begin // @[CSR.scala 169:21]
      MTIE <= 1'h0; // @[CSR.scala 169:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (!(io_expt)) begin // @[CSR.scala 271:19]
        if (!(isEret)) begin // @[CSR.scala 291:24]
          MTIE <= _GEN_182;
        end
      end
    end
    if (reset) begin // @[CSR.scala 172:21]
      MSIP <= 1'h0; // @[CSR.scala 172:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (!(io_expt)) begin // @[CSR.scala 271:19]
        if (!(isEret)) begin // @[CSR.scala 291:24]
          MSIP <= _GEN_181;
        end
      end
    end
    if (reset) begin // @[CSR.scala 175:21]
      MSIE <= 1'h0; // @[CSR.scala 175:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (!(io_expt)) begin // @[CSR.scala 271:19]
        if (!(isEret)) begin // @[CSR.scala 291:24]
          MSIE <= _GEN_183;
        end
      end
    end
    if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (!(io_expt)) begin // @[CSR.scala 271:19]
        if (!(isEret)) begin // @[CSR.scala 291:24]
          if (wen) begin // @[CSR.scala 296:21]
            mtimecmp <= _GEN_165;
          end
        end
      end
    end
    if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (!(io_expt)) begin // @[CSR.scala 271:19]
        if (!(isEret)) begin // @[CSR.scala 291:24]
          if (wen) begin // @[CSR.scala 296:21]
            mscratch <= _GEN_166;
          end
        end
      end
    end
    mepc <= _GEN_239[31:0];
    if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        mcause <= {{28'd0}, _mcause_T_6}; // @[CSR.scala 273:14]
      end else if (!(isEret)) begin // @[CSR.scala 291:24]
        if (wen) begin // @[CSR.scala 296:21]
          mcause <= _GEN_168;
        end
      end
    end
    if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (io_expt) begin // @[CSR.scala 271:19]
        if (iaddrInvalid | laddrInvalid | saddrInvalid) begin // @[CSR.scala 290:58]
          mbadaddr <= io_addr; // @[CSR.scala 290:69]
        end
      end else if (!(isEret)) begin // @[CSR.scala 291:24]
        if (wen) begin // @[CSR.scala 296:21]
          mbadaddr <= _GEN_169;
        end
      end
    end
    if (reset) begin // @[CSR.scala 189:24]
      mtohost <= 32'h0; // @[CSR.scala 189:24]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (!(io_expt)) begin // @[CSR.scala 271:19]
        if (!(isEret)) begin // @[CSR.scala 291:24]
          mtohost <= _GEN_191;
        end
      end
    end
    if (_isInstRet_T_5) begin // @[CSR.scala 270:19]
      if (!(io_expt)) begin // @[CSR.scala 271:19]
        if (!(isEret)) begin // @[CSR.scala 291:24]
          if (wen) begin // @[CSR.scala 296:21]
            mfromhost <= _GEN_171;
          end
        end
      end
    end
  end
endmodule
module RegFile(
  input         clock,
  input  [4:0]  io_raddr1,
  input  [4:0]  io_raddr2,
  output [31:0] io_rdata1,
  output [31:0] io_rdata2,
  input         io_wen,
  input  [4:0]  io_waddr,
  input  [31:0] io_wdata,
  output        _T_1_0,
  output        _io_rdata2_T_0,
  output        _io_rdata1_T_0
);
  reg [31:0] regs [0:31]; // @[RegFile.scala 19:17]
  wire  regs_io_rdata1_MPORT_en; // @[RegFile.scala 19:17]
  wire [4:0] regs_io_rdata1_MPORT_addr; // @[RegFile.scala 19:17]
  wire [31:0] regs_io_rdata1_MPORT_data; // @[RegFile.scala 19:17]
  wire  regs_io_rdata2_MPORT_en; // @[RegFile.scala 19:17]
  wire [4:0] regs_io_rdata2_MPORT_addr; // @[RegFile.scala 19:17]
  wire [31:0] regs_io_rdata2_MPORT_data; // @[RegFile.scala 19:17]
  wire [31:0] regs_MPORT_data; // @[RegFile.scala 19:17]
  wire [4:0] regs_MPORT_addr; // @[RegFile.scala 19:17]
  wire  regs_MPORT_mask; // @[RegFile.scala 19:17]
  wire  regs_MPORT_en; // @[RegFile.scala 19:17]
  wire  _io_rdata1_T = |io_raddr1; // @[RegFile.scala 20:30]
  wire  _io_rdata2_T = |io_raddr2; // @[RegFile.scala 21:30]
  wire  _T = |io_waddr; // @[RegFile.scala 22:26]
  wire  _T_1 = io_wen & |io_waddr; // @[RegFile.scala 22:15]
  assign regs_io_rdata1_MPORT_en = 1'h1;
  assign regs_io_rdata1_MPORT_addr = io_raddr1;
  assign regs_io_rdata1_MPORT_data = regs[regs_io_rdata1_MPORT_addr]; // @[RegFile.scala 19:17]
  assign regs_io_rdata2_MPORT_en = 1'h1;
  assign regs_io_rdata2_MPORT_addr = io_raddr2;
  assign regs_io_rdata2_MPORT_data = regs[regs_io_rdata2_MPORT_addr]; // @[RegFile.scala 19:17]
  assign regs_MPORT_data = io_wdata;
  assign regs_MPORT_addr = io_waddr;
  assign regs_MPORT_mask = 1'h1;
  assign regs_MPORT_en = io_wen & _T;
  assign io_rdata1 = |io_raddr1 ? regs_io_rdata1_MPORT_data : 32'h0; // @[RegFile.scala 20:19]
  assign io_rdata2 = |io_raddr2 ? regs_io_rdata2_MPORT_data : 32'h0; // @[RegFile.scala 21:19]
  assign _T_1_0 = _T_1;
  assign _io_rdata2_T_0 = _io_rdata2_T;
  assign _io_rdata1_T_0 = _io_rdata1_T;
  always @(posedge clock) begin
    if (regs_MPORT_en & regs_MPORT_mask) begin
      regs[regs_MPORT_addr] <= regs_MPORT_data; // @[RegFile.scala 19:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
  integer initvar;
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `endif // RANDOMIZE
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regs[initvar] = 0;
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AluArea(
  input  [31:0] io_A,
  input  [31:0] io_B,
  input  [3:0]  io_alu_op,
  output [31:0] io_out,
  output [31:0] io_sum,
  output        _out_T_1_0,
  output        _cmp_T_4_0,
  output        _out_T_0,
  output        _out_T_10_0,
  output        _out_T_12_0,
  output        _shin_T_0,
  output        _out_T_9_0,
  output        _out_T_4_0,
  output        _out_T_3_0,
  output        _out_T_14_0,
  output        _out_T_6_0,
  output        _out_T_7_0,
  output        _out_T_8_0,
  output        _cmp_T_2_0,
  output        _sum_T_0,
  output        _out_T_5_0,
  output        _out_T_2_0,
  output        _out_T_16_0
);
  wire [31:0] _sum_T_2 = 32'h0 - io_B; // @[Alu.scala 67:38]
  wire [31:0] _sum_T_3 = io_alu_op[0] ? _sum_T_2 : io_B; // @[Alu.scala 67:23]
  wire [31:0] sum = io_A + _sum_T_3; // @[Alu.scala 67:18]
  wire  _cmp_T_2 = io_A[31] == io_B[31]; // @[Alu.scala 69:25]
  wire  _cmp_T_7 = io_alu_op[1] ? io_B[31] : io_A[31]; // @[Alu.scala 69:65]
  wire  cmp = io_A[31] == io_B[31] ? sum[31] : _cmp_T_7; // @[Alu.scala 69:8]
  wire [4:0] shamt = io_B[4:0]; // @[Alu.scala 70:19]
  wire [31:0] _GEN_0 = {{16'd0}, io_A[31:16]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_4 = _GEN_0 & 32'hffff; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_6 = {io_A[15:0], 16'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_8 = _shin_T_6 & 32'hffff0000; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_9 = _shin_T_4 | _shin_T_8; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_1 = {{8'd0}, _shin_T_9[31:8]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_14 = _GEN_1 & 32'hff00ff; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_16 = {_shin_T_9[23:0], 8'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_18 = _shin_T_16 & 32'hff00ff00; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_19 = _shin_T_14 | _shin_T_18; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_2 = {{4'd0}, _shin_T_19[31:4]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_24 = _GEN_2 & 32'hf0f0f0f; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_26 = {_shin_T_19[27:0], 4'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_28 = _shin_T_26 & 32'hf0f0f0f0; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_29 = _shin_T_24 | _shin_T_28; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_3 = {{2'd0}, _shin_T_29[31:2]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_34 = _GEN_3 & 32'h33333333; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_36 = {_shin_T_29[29:0], 2'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_38 = _shin_T_36 & 32'hcccccccc; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_39 = _shin_T_34 | _shin_T_38; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_4 = {{1'd0}, _shin_T_39[31:1]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_44 = _GEN_4 & 32'h55555555; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_46 = {_shin_T_39[30:0], 1'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_48 = _shin_T_46 & 32'haaaaaaaa; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_49 = _shin_T_44 | _shin_T_48; // @[Bitwise.scala 105:39]
  wire [31:0] shin = io_alu_op[3] ? io_A : _shin_T_49; // @[Alu.scala 71:17]
  wire  _shiftr_T_2 = io_alu_op[0] & shin[31]; // @[Alu.scala 72:34]
  wire [32:0] _shiftr_T_4 = {_shiftr_T_2,shin}; // @[Alu.scala 72:60]
  wire [32:0] _shiftr_T_5 = $signed(_shiftr_T_4) >>> shamt; // @[Alu.scala 72:67]
  wire [31:0] shiftr = _shiftr_T_5[31:0]; // @[Alu.scala 72:76]
  wire [31:0] _GEN_5 = {{16'd0}, shiftr[31:16]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_3 = _GEN_5 & 32'hffff; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_5 = {shiftr[15:0], 16'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shiftl_T_7 = _shiftl_T_5 & 32'hffff0000; // @[Bitwise.scala 105:80]
  wire [31:0] _shiftl_T_8 = _shiftl_T_3 | _shiftl_T_7; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_6 = {{8'd0}, _shiftl_T_8[31:8]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_13 = _GEN_6 & 32'hff00ff; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_15 = {_shiftl_T_8[23:0], 8'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shiftl_T_17 = _shiftl_T_15 & 32'hff00ff00; // @[Bitwise.scala 105:80]
  wire [31:0] _shiftl_T_18 = _shiftl_T_13 | _shiftl_T_17; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_7 = {{4'd0}, _shiftl_T_18[31:4]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_23 = _GEN_7 & 32'hf0f0f0f; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_25 = {_shiftl_T_18[27:0], 4'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shiftl_T_27 = _shiftl_T_25 & 32'hf0f0f0f0; // @[Bitwise.scala 105:80]
  wire [31:0] _shiftl_T_28 = _shiftl_T_23 | _shiftl_T_27; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_8 = {{2'd0}, _shiftl_T_28[31:2]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_33 = _GEN_8 & 32'h33333333; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_35 = {_shiftl_T_28[29:0], 2'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shiftl_T_37 = _shiftl_T_35 & 32'hcccccccc; // @[Bitwise.scala 105:80]
  wire [31:0] _shiftl_T_38 = _shiftl_T_33 | _shiftl_T_37; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_9 = {{1'd0}, _shiftl_T_38[31:1]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_43 = _GEN_9 & 32'h55555555; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_45 = {_shiftl_T_38[30:0], 1'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shiftl_T_47 = _shiftl_T_45 & 32'haaaaaaaa; // @[Bitwise.scala 105:80]
  wire [31:0] shiftl = _shiftl_T_43 | _shiftl_T_47; // @[Bitwise.scala 105:39]
  wire  _out_T = io_alu_op == 4'h0; // @[Alu.scala 77:17]
  wire  _out_T_1 = io_alu_op == 4'h1; // @[Alu.scala 77:42]
  wire  _out_T_2 = io_alu_op == 4'h0 | io_alu_op == 4'h1; // @[Alu.scala 77:29]
  wire  _out_T_3 = io_alu_op == 4'h5; // @[Alu.scala 80:19]
  wire  _out_T_4 = io_alu_op == 4'h7; // @[Alu.scala 80:44]
  wire  _out_T_5 = io_alu_op == 4'h5 | io_alu_op == 4'h7; // @[Alu.scala 80:31]
  wire  _out_T_6 = io_alu_op == 4'h9; // @[Alu.scala 83:21]
  wire  _out_T_7 = io_alu_op == 4'h8; // @[Alu.scala 83:46]
  wire  _out_T_8 = io_alu_op == 4'h9 | io_alu_op == 4'h8; // @[Alu.scala 83:33]
  wire  _out_T_9 = io_alu_op == 4'h6; // @[Alu.scala 86:23]
  wire  _out_T_10 = io_alu_op == 4'h2; // @[Alu.scala 89:25]
  wire [31:0] _out_T_11 = io_A & io_B; // @[Alu.scala 90:20]
  wire  _out_T_12 = io_alu_op == 4'h3; // @[Alu.scala 92:27]
  wire [31:0] _out_T_13 = io_A | io_B; // @[Alu.scala 93:22]
  wire  _out_T_14 = io_alu_op == 4'h4; // @[Alu.scala 94:31]
  wire [31:0] _out_T_15 = io_A ^ io_B; // @[Alu.scala 94:49]
  wire  _out_T_16 = io_alu_op == 4'ha; // @[Alu.scala 94:71]
  wire [31:0] _out_T_17 = io_alu_op == 4'ha ? io_A : io_B; // @[Alu.scala 94:60]
  wire [31:0] _out_T_18 = io_alu_op == 4'h4 ? _out_T_15 : _out_T_17; // @[Alu.scala 94:20]
  wire [31:0] _out_T_19 = _out_T_12 ? _out_T_13 : _out_T_18; // @[Alu.scala 91:18]
  wire [31:0] _out_T_20 = _out_T_10 ? _out_T_11 : _out_T_19; // @[Alu.scala 88:16]
  wire [31:0] _out_T_21 = _out_T_9 ? shiftl : _out_T_20; // @[Alu.scala 85:14]
  wire [31:0] _out_T_22 = _out_T_8 ? shiftr : _out_T_21; // @[Alu.scala 82:12]
  wire [31:0] _out_T_23 = _out_T_5 ? {{31'd0}, cmp} : _out_T_22; // @[Alu.scala 79:10]
  assign io_out = _out_T_2 ? sum : _out_T_23; // @[Alu.scala 76:8]
  assign io_sum = io_A + _sum_T_3; // @[Alu.scala 67:18]
  assign _out_T_1_0 = _out_T_1;
  assign _cmp_T_4_0 = io_alu_op[1];
  assign _out_T_0 = _out_T;
  assign _out_T_10_0 = _out_T_10;
  assign _out_T_12_0 = _out_T_12;
  assign _shin_T_0 = io_alu_op[3];
  assign _out_T_9_0 = _out_T_9;
  assign _out_T_4_0 = _out_T_4;
  assign _out_T_3_0 = _out_T_3;
  assign _out_T_14_0 = _out_T_14;
  assign _out_T_6_0 = _out_T_6;
  assign _out_T_7_0 = _out_T_7;
  assign _out_T_8_0 = _out_T_8;
  assign _cmp_T_2_0 = _cmp_T_2;
  assign _sum_T_0 = io_alu_op[0];
  assign _out_T_5_0 = _out_T_5;
  assign _out_T_2_0 = _out_T_2;
  assign _out_T_16_0 = _out_T_16;
endmodule
module ImmGenWire(
  input  [31:0] io_inst,
  input  [2:0]  io_sel,
  output [31:0] io_out,
  output        _io_out_T_2_0,
  output        _io_out_T_4_0,
  output        _io_out_T_6_0,
  output        _io_out_T_12_0,
  output        _io_out_T_8_0,
  output        _io_out_T_10_0
);
  wire [11:0] Iimm = io_inst[31:20]; // @[ImmGen.scala 22:30]
  wire [11:0] Simm = {io_inst[31:25],io_inst[11:7]}; // @[ImmGen.scala 23:51]
  wire [12:0] Bimm = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[ImmGen.scala 24:86]
  wire [31:0] Uimm = {io_inst[31:12],12'h0}; // @[ImmGen.scala 25:46]
  wire [20:0] Jimm = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:25],io_inst[24:21],1'h0}; // @[ImmGen.scala 26:105]
  wire [5:0] Zimm = {1'b0,$signed(io_inst[19:15])}; // @[ImmGen.scala 27:30]
  wire [11:0] _io_out_T_1 = $signed(Iimm) & -12'sh2; // @[ImmGen.scala 31:10]
  wire  _io_out_T_2 = 3'h1 == io_sel; // @[Mux.scala 81:61]
  wire [11:0] _io_out_T_3 = 3'h1 == io_sel ? $signed(Iimm) : $signed(_io_out_T_1); // @[Mux.scala 81:58]
  wire  _io_out_T_4 = 3'h2 == io_sel; // @[Mux.scala 81:61]
  wire [11:0] _io_out_T_5 = 3'h2 == io_sel ? $signed(Simm) : $signed(_io_out_T_3); // @[Mux.scala 81:58]
  wire  _io_out_T_6 = 3'h5 == io_sel; // @[Mux.scala 81:61]
  wire [12:0] _io_out_T_7 = 3'h5 == io_sel ? $signed(Bimm) : $signed({{1{_io_out_T_5[11]}},_io_out_T_5}); // @[Mux.scala 81:58]
  wire  _io_out_T_8 = 3'h3 == io_sel; // @[Mux.scala 81:61]
  wire [31:0] _io_out_T_9 = 3'h3 == io_sel ? $signed(Uimm) : $signed({{19{_io_out_T_7[12]}},_io_out_T_7}); // @[Mux.scala 81:58]
  wire  _io_out_T_10 = 3'h4 == io_sel; // @[Mux.scala 81:61]
  wire [31:0] _io_out_T_11 = 3'h4 == io_sel ? $signed({{11{Jimm[20]}},Jimm}) : $signed(_io_out_T_9); // @[Mux.scala 81:58]
  wire  _io_out_T_12 = 3'h6 == io_sel; // @[Mux.scala 81:61]
  assign io_out = 3'h6 == io_sel ? $signed({{26{Zimm[5]}},Zimm}) : $signed(_io_out_T_11); // @[ImmGen.scala 33:5]
  assign _io_out_T_2_0 = _io_out_T_2;
  assign _io_out_T_4_0 = _io_out_T_4;
  assign _io_out_T_6_0 = _io_out_T_6;
  assign _io_out_T_12_0 = _io_out_T_12;
  assign _io_out_T_8_0 = _io_out_T_8;
  assign _io_out_T_10_0 = _io_out_T_10;
endmodule
module BrCondArea(
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  input  [2:0]  io_br_type,
  output        io_taken,
  output        isSameSign_0,
  output        eq_0,
  output        _io_taken_T_5_0,
  output        _io_taken_T_0,
  output        _io_taken_T_11_0,
  output        _io_taken_T_8_0,
  output        _io_taken_T_14_0,
  output        _io_taken_T_2_0,
  output        geu_0,
  output        ge_0
);
  wire [31:0] diff = io_rs1 - io_rs2; // @[BrCond.scala 39:21]
  wire  neq = |diff; // @[BrCond.scala 40:18]
  wire  eq = ~neq; // @[BrCond.scala 41:12]
  wire  isSameSign = io_rs1[31] == io_rs2[31]; // @[BrCond.scala 42:37]
  wire  lt = isSameSign ? diff[31] : io_rs1[31]; // @[BrCond.scala 43:15]
  wire  ltu = isSameSign ? diff[31] : io_rs2[31]; // @[BrCond.scala 44:16]
  wire  ge = ~lt; // @[BrCond.scala 45:12]
  wire  geu = ~ltu; // @[BrCond.scala 46:13]
  wire  _io_taken_T = io_br_type == 3'h3; // @[BrCond.scala 48:18]
  wire  _io_taken_T_2 = io_br_type == 3'h6; // @[BrCond.scala 49:20]
  wire  _io_taken_T_3 = io_br_type == 3'h6 & neq; // @[BrCond.scala 49:31]
  wire  _io_taken_T_4 = io_br_type == 3'h3 & eq | _io_taken_T_3; // @[BrCond.scala 48:36]
  wire  _io_taken_T_5 = io_br_type == 3'h2; // @[BrCond.scala 50:20]
  wire  _io_taken_T_6 = io_br_type == 3'h2 & lt; // @[BrCond.scala 50:31]
  wire  _io_taken_T_7 = _io_taken_T_4 | _io_taken_T_6; // @[BrCond.scala 49:39]
  wire  _io_taken_T_8 = io_br_type == 3'h5; // @[BrCond.scala 51:20]
  wire  _io_taken_T_9 = io_br_type == 3'h5 & ge; // @[BrCond.scala 51:31]
  wire  _io_taken_T_10 = _io_taken_T_7 | _io_taken_T_9; // @[BrCond.scala 50:38]
  wire  _io_taken_T_11 = io_br_type == 3'h1; // @[BrCond.scala 52:20]
  wire  _io_taken_T_12 = io_br_type == 3'h1 & ltu; // @[BrCond.scala 52:32]
  wire  _io_taken_T_13 = _io_taken_T_10 | _io_taken_T_12; // @[BrCond.scala 51:38]
  wire  _io_taken_T_14 = io_br_type == 3'h4; // @[BrCond.scala 53:20]
  wire  _io_taken_T_15 = io_br_type == 3'h4 & geu; // @[BrCond.scala 53:32]
  assign io_taken = _io_taken_T_13 | _io_taken_T_15; // @[BrCond.scala 52:40]
  assign isSameSign_0 = isSameSign;
  assign eq_0 = eq;
  assign _io_taken_T_5_0 = _io_taken_T_5;
  assign _io_taken_T_0 = _io_taken_T;
  assign _io_taken_T_11_0 = _io_taken_T_11;
  assign _io_taken_T_8_0 = _io_taken_T_8;
  assign _io_taken_T_14_0 = _io_taken_T_14;
  assign _io_taken_T_2_0 = _io_taken_T_2;
  assign geu_0 = geu;
  assign ge_0 = ge;
endmodule
module Datapath(
  input         clock,
  input         reset,
  output        io_icache_req_valid,
  output [31:0] io_icache_req_bits_addr,
  input         io_icache_resp_valid,
  input  [31:0] io_icache_resp_bits_data,
  output        io_dcache_abort,
  output        io_dcache_req_valid,
  output [31:0] io_dcache_req_bits_addr,
  output [31:0] io_dcache_req_bits_data,
  output [3:0]  io_dcache_req_bits_mask,
  input         io_dcache_resp_valid,
  input  [31:0] io_dcache_resp_bits_data,
  output [31:0] io_ctrl_inst,
  input  [1:0]  io_ctrl_pc_sel,
  input         io_ctrl_inst_kill,
  input         io_ctrl_A_sel,
  input         io_ctrl_B_sel,
  input  [2:0]  io_ctrl_imm_sel,
  input  [3:0]  io_ctrl_alu_op,
  input  [2:0]  io_ctrl_br_type,
  input  [1:0]  io_ctrl_st_type,
  input  [2:0]  io_ctrl_ld_type,
  input  [1:0]  io_ctrl_wb_sel,
  input         io_ctrl_wb_en,
  input  [2:0]  io_ctrl_csr_cmd,
  input         io_ctrl_illegal,
  output        csr___io_out_T_29_0,
  output        csr___T_0,
  output        csr__isInstRet_0,
  output        csr___T_10_0,
  output        csr___T_7_0,
  output        csr___io_out_T_33_0,
  output        csr___T_23_0,
  output        csr___io_out_T_25_0,
  output        csr___T_6_0,
  output        csr___io_out_T_31_0,
  output        csr___wdata_T_3_0,
  output        csr__privInst_0,
  output        csr___T_16_0,
  output        csr__isEret_0,
  output        csr___io_out_T_41_0,
  output        csr___io_out_T_1_0,
  output        csr___io_out_T_53_0,
  output        csr__iaddrInvalid_0,
  output        csr___io_out_T_27_0,
  output        csr___io_out_T_43_0,
  output        csr___T_1_0,
  output        csr___io_out_T_35_0,
  output        csr___T_3_0,
  output        csr___T_18_0,
  output        csr__privValid_0,
  output        csr___io_expt_T_6_0,
  output        csr___isInstRet_T_0,
  output        csr___io_out_T_3_0,
  output        csr___io_out_T_7_0,
  output        csr__io_expt_0,
  output        csr___T_24_0,
  output        csr___wen_T_0,
  output        csr___T_21_0,
  output        csr__wen_0,
  output        csr___T_13_0,
  output        csr___T_8_0,
  output        csr___io_out_T_47_0,
  output        csr___io_out_T_19_0,
  output        csr___T_12_0,
  output        csr___io_out_T_9_0,
  output        csr___csrRO_T_4_0,
  output        csr___io_out_T_5_0,
  output        csr___isEcall_T_1_0,
  output        csr___wdata_T_5_0,
  output        csr___laddrInvalid_T_6_0,
  output        csr___T_17_0,
  output        csr___laddrInvalid_T_8_0,
  output        csr___io_out_T_45_0,
  output        csr___io_out_T_17_0,
  output        csr___io_out_T_13_0,
  output        csr___io_out_T_11_0,
  output        csr___T_20_0,
  output        csr___T_14_0,
  output        csr___io_out_T_55_0,
  output        csr___io_out_T_39_0,
  output        csr___io_out_T_51_0,
  output        csr__laddrInvalid_0,
  output        csr___io_out_T_23_0,
  output        csr___isInstRet_T_1_0,
  output        csr___io_expt_T_5_0,
  output        csr___isEcall_T_4_0,
  output        csr___csrRO_T_2_0,
  output        csr___saddrInvalid_T_3_0,
  output        csr__isEcall_0,
  output        csr__isEbreak_0,
  output        csr___io_out_T_49_0,
  output        csr___T_11_0,
  output        csr___wdata_T_7_0,
  output        csr___isInstRet_T_5_0,
  output        csr___io_out_T_37_0,
  output        csr___saddrInvalid_T_5_0,
  output        csr___T_22_0,
  output        csr___io_out_T_57_0,
  output        csr___laddrInvalid_T_4_0,
  output        csr___T_9_0,
  output        csr___T_15_0,
  output        csr__saddrInvalid_0,
  output        csr___T_19_0,
  output        csr___io_out_T_21_0,
  output        csr___io_out_T_15_0,
  output        regFile___T_1_0,
  output        regFile___io_rdata2_T_0,
  output        regFile___io_rdata1_T_0,
  output        alu___out_T_1_0,
  output        alu___cmp_T_4_0,
  output        alu___out_T_0,
  output        alu___out_T_10_0,
  output        alu___out_T_12_0,
  output        alu___shin_T_0,
  output        alu___out_T_9_0,
  output        alu___out_T_4_0,
  output        alu___out_T_3_0,
  output        alu___out_T_14_0,
  output        alu___out_T_6_0,
  output        alu___out_T_7_0,
  output        alu___out_T_8_0,
  output        alu___cmp_T_2_0,
  output        alu___sum_T_0,
  output        alu___out_T_5_0,
  output        alu___out_T_2_0,
  output        alu___out_T_16_0,
  output        immGen___io_out_T_2_0,
  output        immGen___io_out_T_4_0,
  output        immGen___io_out_T_6_0,
  output        immGen___io_out_T_12_0,
  output        immGen___io_out_T_8_0,
  output        immGen___io_out_T_10_0,
  output        brCond__isSameSign_0,
  output        brCond__eq_0,
  output        brCond___io_taken_T_5_0,
  output        brCond___io_taken_T_0,
  output        brCond___io_taken_T_11_0,
  output        brCond___io_taken_T_8_0,
  output        brCond___io_taken_T_14_0,
  output        brCond___io_taken_T_2_0,
  output        brCond__geu_0,
  output        brCond__ge_0,
  output        _io_dcache_req_bits_mask_T_7_0,
  output        _npc_T_2_0,
  output        _inst_T_2_0,
  output        _rs1_T_0,
  output        _T_6_0,
  output        io_ctrl_A_sel_0,
  output        _npc_T_5_0,
  output        _io_icache_req_valid_T_0,
  output        io_ctrl_B_sel_0,
  output        _regWrite_T_9_0,
  output        _stall_T_1_0,
  output        csr__io_expt,
  output        _regWrite_T_7_0,
  output        _stall_T_0,
  output        _rs1hazard_T_2_0,
  output        _load_T_13_0,
  output        _load_T_11_0,
  output        _rs1_T_1_0,
  output        stall_0,
  output        _io_dcache_req_bits_mask_T_9_0,
  output        _load_T_15_0,
  output        _io_dcache_req_bits_mask_T_5_0,
  output        _rs2hazard_T_2_0,
  output        _csr_in_T_0,
  output        _npc_T_0,
  output        _regWrite_T_5_0,
  output        _npc_T_1_0,
  output        _rs2_T_1_0,
  output        _load_T_9_0,
  output        _T_4_0,
  output        _T_7_0
);
  wire  csr_clock; // @[Datapath.scala 22:19]
  wire  csr_reset; // @[Datapath.scala 22:19]
  wire  csr_io_stall; // @[Datapath.scala 22:19]
  wire [2:0] csr_io_cmd; // @[Datapath.scala 22:19]
  wire [31:0] csr_io_in; // @[Datapath.scala 22:19]
  wire [31:0] csr_io_out; // @[Datapath.scala 22:19]
  wire [31:0] csr_io_pc; // @[Datapath.scala 22:19]
  wire [31:0] csr_io_addr; // @[Datapath.scala 22:19]
  wire [31:0] csr_io_inst; // @[Datapath.scala 22:19]
  wire  csr_io_illegal; // @[Datapath.scala 22:19]
  wire [1:0] csr_io_st_type; // @[Datapath.scala 22:19]
  wire [2:0] csr_io_ld_type; // @[Datapath.scala 22:19]
  wire  csr_io_pc_check; // @[Datapath.scala 22:19]
  wire  csr_io_expt; // @[Datapath.scala 22:19]
  wire [31:0] csr_io_evec; // @[Datapath.scala 22:19]
  wire [31:0] csr_io_epc; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_29_0; // @[Datapath.scala 22:19]
  wire  csr__T_0; // @[Datapath.scala 22:19]
  wire  csr_isInstRet_0; // @[Datapath.scala 22:19]
  wire  csr__T_10_0; // @[Datapath.scala 22:19]
  wire  csr__T_7_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_33_0; // @[Datapath.scala 22:19]
  wire  csr__T_23_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_25_0; // @[Datapath.scala 22:19]
  wire  csr__T_6_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_31_0; // @[Datapath.scala 22:19]
  wire  csr__wdata_T_3_0; // @[Datapath.scala 22:19]
  wire  csr_privInst_0; // @[Datapath.scala 22:19]
  wire  csr__T_16_0; // @[Datapath.scala 22:19]
  wire  csr_isEret_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_41_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_1_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_53_0; // @[Datapath.scala 22:19]
  wire  csr_iaddrInvalid_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_27_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_43_0; // @[Datapath.scala 22:19]
  wire  csr__T_1_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_35_0; // @[Datapath.scala 22:19]
  wire  csr__T_3_0; // @[Datapath.scala 22:19]
  wire  csr__T_18_0; // @[Datapath.scala 22:19]
  wire  csr_privValid_0; // @[Datapath.scala 22:19]
  wire  csr__io_expt_T_6_0; // @[Datapath.scala 22:19]
  wire  csr__isInstRet_T_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_3_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_7_0; // @[Datapath.scala 22:19]
  wire  csr_io_expt_0; // @[Datapath.scala 22:19]
  wire  csr__T_24_0; // @[Datapath.scala 22:19]
  wire  csr__wen_T_0; // @[Datapath.scala 22:19]
  wire  csr__T_21_0; // @[Datapath.scala 22:19]
  wire  csr_wen_0; // @[Datapath.scala 22:19]
  wire  csr__T_13_0; // @[Datapath.scala 22:19]
  wire  csr__T_8_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_47_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_19_0; // @[Datapath.scala 22:19]
  wire  csr__T_12_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_9_0; // @[Datapath.scala 22:19]
  wire  csr__csrRO_T_4_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_5_0; // @[Datapath.scala 22:19]
  wire  csr__isEcall_T_1_0; // @[Datapath.scala 22:19]
  wire  csr__wdata_T_5_0; // @[Datapath.scala 22:19]
  wire  csr__laddrInvalid_T_6_0; // @[Datapath.scala 22:19]
  wire  csr__T_17_0; // @[Datapath.scala 22:19]
  wire  csr__laddrInvalid_T_8_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_45_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_17_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_13_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_11_0; // @[Datapath.scala 22:19]
  wire  csr__T_20_0; // @[Datapath.scala 22:19]
  wire  csr__T_14_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_55_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_39_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_51_0; // @[Datapath.scala 22:19]
  wire  csr_laddrInvalid_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_23_0; // @[Datapath.scala 22:19]
  wire  csr__isInstRet_T_1_0; // @[Datapath.scala 22:19]
  wire  csr__io_expt_T_5_0; // @[Datapath.scala 22:19]
  wire  csr__isEcall_T_4_0; // @[Datapath.scala 22:19]
  wire  csr__csrRO_T_2_0; // @[Datapath.scala 22:19]
  wire  csr__saddrInvalid_T_3_0; // @[Datapath.scala 22:19]
  wire  csr_isEcall_0; // @[Datapath.scala 22:19]
  wire  csr_isEbreak_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_49_0; // @[Datapath.scala 22:19]
  wire  csr__T_11_0; // @[Datapath.scala 22:19]
  wire  csr__wdata_T_7_0; // @[Datapath.scala 22:19]
  wire  csr__isInstRet_T_5_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_37_0; // @[Datapath.scala 22:19]
  wire  csr__saddrInvalid_T_5_0; // @[Datapath.scala 22:19]
  wire  csr__T_22_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_57_0; // @[Datapath.scala 22:19]
  wire  csr__laddrInvalid_T_4_0; // @[Datapath.scala 22:19]
  wire  csr__T_9_0; // @[Datapath.scala 22:19]
  wire  csr__T_15_0; // @[Datapath.scala 22:19]
  wire  csr_saddrInvalid_0; // @[Datapath.scala 22:19]
  wire  csr__T_19_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_21_0; // @[Datapath.scala 22:19]
  wire  csr__io_out_T_15_0; // @[Datapath.scala 22:19]
  wire  regFile_clock; // @[Datapath.scala 23:23]
  wire [4:0] regFile_io_raddr1; // @[Datapath.scala 23:23]
  wire [4:0] regFile_io_raddr2; // @[Datapath.scala 23:23]
  wire [31:0] regFile_io_rdata1; // @[Datapath.scala 23:23]
  wire [31:0] regFile_io_rdata2; // @[Datapath.scala 23:23]
  wire  regFile_io_wen; // @[Datapath.scala 23:23]
  wire [4:0] regFile_io_waddr; // @[Datapath.scala 23:23]
  wire [31:0] regFile_io_wdata; // @[Datapath.scala 23:23]
  wire  regFile__T_1_0; // @[Datapath.scala 23:23]
  wire  regFile__io_rdata2_T_0; // @[Datapath.scala 23:23]
  wire  regFile__io_rdata1_T_0; // @[Datapath.scala 23:23]
  wire [31:0] alu_io_A; // @[Datapath.scala 24:19]
  wire [31:0] alu_io_B; // @[Datapath.scala 24:19]
  wire [3:0] alu_io_alu_op; // @[Datapath.scala 24:19]
  wire [31:0] alu_io_out; // @[Datapath.scala 24:19]
  wire [31:0] alu_io_sum; // @[Datapath.scala 24:19]
  wire  alu__out_T_1_0; // @[Datapath.scala 24:19]
  wire  alu__cmp_T_4_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_10_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_12_0; // @[Datapath.scala 24:19]
  wire  alu__shin_T_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_9_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_4_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_3_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_14_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_6_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_7_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_8_0; // @[Datapath.scala 24:19]
  wire  alu__cmp_T_2_0; // @[Datapath.scala 24:19]
  wire  alu__sum_T_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_5_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_2_0; // @[Datapath.scala 24:19]
  wire  alu__out_T_16_0; // @[Datapath.scala 24:19]
  wire [31:0] immGen_io_inst; // @[Datapath.scala 25:22]
  wire [2:0] immGen_io_sel; // @[Datapath.scala 25:22]
  wire [31:0] immGen_io_out; // @[Datapath.scala 25:22]
  wire  immGen__io_out_T_2_0; // @[Datapath.scala 25:22]
  wire  immGen__io_out_T_4_0; // @[Datapath.scala 25:22]
  wire  immGen__io_out_T_6_0; // @[Datapath.scala 25:22]
  wire  immGen__io_out_T_12_0; // @[Datapath.scala 25:22]
  wire  immGen__io_out_T_8_0; // @[Datapath.scala 25:22]
  wire  immGen__io_out_T_10_0; // @[Datapath.scala 25:22]
  wire [31:0] brCond_io_rs1; // @[Datapath.scala 26:22]
  wire [31:0] brCond_io_rs2; // @[Datapath.scala 26:22]
  wire [2:0] brCond_io_br_type; // @[Datapath.scala 26:22]
  wire  brCond_io_taken; // @[Datapath.scala 26:22]
  wire  brCond_isSameSign_0; // @[Datapath.scala 26:22]
  wire  brCond_eq_0; // @[Datapath.scala 26:22]
  wire  brCond__io_taken_T_5_0; // @[Datapath.scala 26:22]
  wire  brCond__io_taken_T_0; // @[Datapath.scala 26:22]
  wire  brCond__io_taken_T_11_0; // @[Datapath.scala 26:22]
  wire  brCond__io_taken_T_8_0; // @[Datapath.scala 26:22]
  wire  brCond__io_taken_T_14_0; // @[Datapath.scala 26:22]
  wire  brCond__io_taken_T_2_0; // @[Datapath.scala 26:22]
  wire  brCond_geu_0; // @[Datapath.scala 26:22]
  wire  brCond_ge_0; // @[Datapath.scala 26:22]
  reg [31:0] fe_inst = 32'h0; // @[Datapath.scala 32:24]
  reg [32:0] fe_pc = 33'h0; // @[Datapath.scala 33:18]
  reg [31:0] ew_inst = 32'h0; // @[Datapath.scala 37:24]
  reg [32:0] ew_pc = 33'h0; // @[Datapath.scala 38:18]
  reg [31:0] ew_alu = 32'h0; // @[Datapath.scala 39:19]
  reg [31:0] csr_in = 32'h0; // @[Datapath.scala 40:19]
  reg [1:0] st_type = 2'h0; // @[Datapath.scala 44:20]
  reg [2:0] ld_type = 3'h0; // @[Datapath.scala 45:20]
  reg [1:0] wb_sel = 2'h0; // @[Datapath.scala 46:19]
  reg  wb_en = 1'h0; // @[Datapath.scala 47:18]
  reg [2:0] csr_cmd = 3'h0; // @[Datapath.scala 48:20]
  reg  illegal = 1'h0; // @[Datapath.scala 49:20]
  reg  pc_check = 1'h0; // @[Datapath.scala 50:21]
  reg  started = 1'h0; // @[Datapath.scala 54:24]
  wire  _stall_T = ~io_icache_resp_valid; // @[Datapath.scala 55:15]
  wire  _stall_T_1 = ~io_dcache_resp_valid; // @[Datapath.scala 55:40]
  wire  stall = ~io_icache_resp_valid | ~io_dcache_resp_valid; // @[Datapath.scala 55:37]
  wire [31:0] _pc_T_1 = 32'h200 - 32'h4; // @[Datapath.scala 56:50]
  reg [32:0] pc = 33'h0; // @[Datapath.scala 56:19]
  wire  _npc_T = io_ctrl_pc_sel == 2'h3; // @[Datapath.scala 64:24]
  wire  _npc_T_1 = io_ctrl_pc_sel == 2'h1; // @[Datapath.scala 67:26]
  wire  _npc_T_2 = io_ctrl_pc_sel == 2'h1 | brCond_io_taken; // @[Datapath.scala 67:37]
  wire [31:0] _npc_T_3 = {{1'd0}, alu_io_sum[31:1]}; // @[Datapath.scala 68:22]
  wire [32:0] _npc_T_4 = {_npc_T_3, 1'h0}; // @[Datapath.scala 68:29]
  wire  _npc_T_5 = io_ctrl_pc_sel == 2'h2; // @[Datapath.scala 69:30]
  wire [32:0] _npc_T_7 = pc + 33'h4; // @[Datapath.scala 69:47]
  wire [32:0] _npc_T_8 = io_ctrl_pc_sel == 2'h2 ? pc : _npc_T_7; // @[Datapath.scala 69:14]
  wire [32:0] _npc_T_9 = _npc_T_2 ? _npc_T_4 : _npc_T_8; // @[Datapath.scala 66:12]
  wire [32:0] _npc_T_10 = _npc_T ? {{1'd0}, csr_io_epc} : _npc_T_9; // @[Datapath.scala 63:10]
  wire [32:0] _npc_T_11 = csr_io_expt ? {{1'd0}, csr_io_evec} : _npc_T_10; // @[Datapath.scala 60:8]
  wire [32:0] npc = stall ? pc : _npc_T_11; // @[Datapath.scala 57:16]
  wire  _inst_T_2 = started | io_ctrl_inst_kill | brCond_io_taken | csr_io_expt; // @[Datapath.scala 75:57]
  wire  _io_icache_req_valid_T = ~stall; // @[Datapath.scala 80:26]
  wire [4:0] rs1_addr = fe_inst[19:15]; // @[Datapath.scala 96:25]
  wire [4:0] rs2_addr = fe_inst[24:20]; // @[Datapath.scala 97:25]
  wire [4:0] wb_rd_addr = ew_inst[11:7]; // @[Datapath.scala 106:27]
  wire  _rs1hazard_T_2 = rs1_addr == wb_rd_addr; // @[Datapath.scala 107:54]
  wire  rs1hazard = wb_en & |rs1_addr & rs1_addr == wb_rd_addr; // @[Datapath.scala 107:41]
  wire  _rs2hazard_T_2 = rs2_addr == wb_rd_addr; // @[Datapath.scala 108:54]
  wire  rs2hazard = wb_en & |rs2_addr & rs2_addr == wb_rd_addr; // @[Datapath.scala 108:41]
  wire  _rs1_T = wb_sel == 2'h0; // @[Datapath.scala 109:24]
  wire  _rs1_T_1 = wb_sel == 2'h0 & rs1hazard; // @[Datapath.scala 109:35]
  wire [31:0] rs1 = wb_sel == 2'h0 & rs1hazard ? ew_alu : regFile_io_rdata1; // @[Datapath.scala 109:16]
  wire  _rs2_T_1 = _rs1_T & rs2hazard; // @[Datapath.scala 110:35]
  wire [31:0] rs2 = _rs1_T & rs2hazard ? ew_alu : regFile_io_rdata2; // @[Datapath.scala 110:16]
  wire [32:0] _alu_io_A_T_1 = io_ctrl_A_sel ? {{1'd0}, rs1} : fe_pc; // @[Datapath.scala 113:18]
  wire [31:0] _daddr_T = stall ? ew_alu : alu_io_sum; // @[Datapath.scala 123:18]
  wire [31:0] _daddr_T_1 = {{2'd0}, _daddr_T[31:2]}; // @[Datapath.scala 123:46]
  wire [33:0] _GEN_14 = {_daddr_T_1, 2'h0}; // @[Datapath.scala 123:53]
  wire [34:0] daddr = {{1'd0}, _GEN_14}; // @[Datapath.scala 123:53]
  wire [4:0] _GEN_15 = {alu_io_sum[1], 4'h0}; // @[Datapath.scala 124:32]
  wire [7:0] _woffset_T_1 = {{3'd0}, _GEN_15}; // @[Datapath.scala 124:32]
  wire [3:0] _woffset_T_3 = {alu_io_sum[0], 3'h0}; // @[Datapath.scala 124:64]
  wire [7:0] _GEN_16 = {{4'd0}, _woffset_T_3}; // @[Datapath.scala 124:47]
  wire [7:0] woffset = _woffset_T_1 | _GEN_16; // @[Datapath.scala 124:47]
  wire [286:0] _GEN_19 = {{255'd0}, rs2}; // @[Datapath.scala 127:34]
  wire [286:0] _io_dcache_req_bits_data_T = _GEN_19 << woffset; // @[Datapath.scala 127:34]
  wire [1:0] _io_dcache_req_bits_mask_T = stall ? st_type : io_ctrl_st_type; // @[Datapath.scala 129:8]
  wire [4:0] _io_dcache_req_bits_mask_T_2 = 5'h3 << alu_io_sum[1:0]; // @[Datapath.scala 131:47]
  wire [3:0] _io_dcache_req_bits_mask_T_4 = 4'h1 << alu_io_sum[1:0]; // @[Datapath.scala 131:86]
  wire  _io_dcache_req_bits_mask_T_5 = 2'h1 == _io_dcache_req_bits_mask_T; // @[Mux.scala 81:61]
  wire [3:0] _io_dcache_req_bits_mask_T_6 = 2'h1 == _io_dcache_req_bits_mask_T ? 4'hf : 4'h0; // @[Mux.scala 81:58]
  wire  _io_dcache_req_bits_mask_T_7 = 2'h2 == _io_dcache_req_bits_mask_T; // @[Mux.scala 81:61]
  wire [4:0] _io_dcache_req_bits_mask_T_8 = 2'h2 == _io_dcache_req_bits_mask_T ? _io_dcache_req_bits_mask_T_2 : {{1
    'd0}, _io_dcache_req_bits_mask_T_6}; // @[Mux.scala 81:58]
  wire  _io_dcache_req_bits_mask_T_9 = 2'h3 == _io_dcache_req_bits_mask_T; // @[Mux.scala 81:61]
  wire [4:0] _io_dcache_req_bits_mask_T_10 = 2'h3 == _io_dcache_req_bits_mask_T ? {{1'd0}, _io_dcache_req_bits_mask_T_4}
     : _io_dcache_req_bits_mask_T_8; // @[Mux.scala 81:58]
  wire  _T_4 = reset | _io_icache_req_valid_T & csr_io_expt; // @[Datapath.scala 135:21]
  wire  _T_6 = ~csr_io_expt; // @[Datapath.scala 142:24]
  wire  _T_7 = _io_icache_req_valid_T & ~csr_io_expt; // @[Datapath.scala 142:21]
  wire  _csr_in_T = io_ctrl_imm_sel == 3'h6; // @[Datapath.scala 146:35]
  wire [4:0] _GEN_17 = {ew_alu[1], 4'h0}; // @[Datapath.scala 157:28]
  wire [7:0] _loffset_T_1 = {{3'd0}, _GEN_17}; // @[Datapath.scala 157:28]
  wire [3:0] _loffset_T_3 = {ew_alu[0], 3'h0}; // @[Datapath.scala 157:56]
  wire [7:0] _GEN_18 = {{4'd0}, _loffset_T_3}; // @[Datapath.scala 157:43]
  wire [7:0] loffset = _loffset_T_1 | _GEN_18; // @[Datapath.scala 157:43]
  wire [31:0] lshift = io_dcache_resp_bits_data >> loffset; // @[Datapath.scala 158:41]
  wire [32:0] _load_T = {1'b0,$signed(io_dcache_resp_bits_data)}; // @[Datapath.scala 161:30]
  wire [15:0] _load_T_2 = lshift[15:0]; // @[Datapath.scala 163:30]
  wire [7:0] _load_T_4 = lshift[7:0]; // @[Datapath.scala 164:29]
  wire [16:0] _load_T_6 = {1'b0,$signed(lshift[15:0])}; // @[Datapath.scala 165:31]
  wire [8:0] _load_T_8 = {1'b0,$signed(lshift[7:0])}; // @[Datapath.scala 166:30]
  wire  _load_T_9 = 3'h2 == ld_type; // @[Mux.scala 81:61]
  wire [32:0] _load_T_10 = 3'h2 == ld_type ? $signed({{17{_load_T_2[15]}},_load_T_2}) : $signed(_load_T); // @[Mux.scala 81:58]
  wire  _load_T_11 = 3'h3 == ld_type; // @[Mux.scala 81:61]
  wire [32:0] _load_T_12 = 3'h3 == ld_type ? $signed({{25{_load_T_4[7]}},_load_T_4}) : $signed(_load_T_10); // @[Mux.scala 81:58]
  wire  _load_T_13 = 3'h4 == ld_type; // @[Mux.scala 81:61]
  wire [32:0] _load_T_14 = 3'h4 == ld_type ? $signed({{16{_load_T_6[16]}},_load_T_6}) : $signed(_load_T_12); // @[Mux.scala 81:58]
  wire  _load_T_15 = 3'h5 == ld_type; // @[Mux.scala 81:61]
  wire [32:0] load = 3'h5 == ld_type ? $signed({{24{_load_T_8[8]}},_load_T_8}) : $signed(_load_T_14); // @[Mux.scala 81:58]
  wire [32:0] _regWrite_T = {1'b0,$signed(ew_alu)}; // @[Datapath.scala 185:30]
  wire [32:0] _regWrite_T_2 = ew_pc + 33'h4; // @[Datapath.scala 185:73]
  wire [33:0] _regWrite_T_3 = {1'b0,$signed(_regWrite_T_2)}; // @[Datapath.scala 185:80]
  wire [32:0] _regWrite_T_4 = {1'b0,$signed(csr_io_out)}; // @[Datapath.scala 185:107]
  wire  _regWrite_T_5 = 2'h1 == wb_sel; // @[Mux.scala 81:61]
  wire [32:0] _regWrite_T_6 = 2'h1 == wb_sel ? $signed(load) : $signed(_regWrite_T); // @[Mux.scala 81:58]
  wire  _regWrite_T_7 = 2'h2 == wb_sel; // @[Mux.scala 81:61]
  wire [33:0] _regWrite_T_8 = 2'h2 == wb_sel ? $signed(_regWrite_T_3) : $signed({{1{_regWrite_T_6[32]}},_regWrite_T_6}); // @[Mux.scala 81:58]
  wire  _regWrite_T_9 = 2'h3 == wb_sel; // @[Mux.scala 81:61]
  wire [33:0] regWrite = 2'h3 == wb_sel ? $signed({{1{_regWrite_T_4[32]}},_regWrite_T_4}) : $signed(_regWrite_T_8); // @[Datapath.scala 185:114]
  CSR csr ( // @[Datapath.scala 22:19]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_stall(csr_io_stall),
    .io_cmd(csr_io_cmd),
    .io_in(csr_io_in),
    .io_out(csr_io_out),
    .io_pc(csr_io_pc),
    .io_addr(csr_io_addr),
    .io_inst(csr_io_inst),
    .io_illegal(csr_io_illegal),
    .io_st_type(csr_io_st_type),
    .io_ld_type(csr_io_ld_type),
    .io_pc_check(csr_io_pc_check),
    .io_expt(csr_io_expt),
    .io_evec(csr_io_evec),
    .io_epc(csr_io_epc),
    ._io_out_T_29_0(csr__io_out_T_29_0),
    ._T_0(csr__T_0),
    .isInstRet_0(csr_isInstRet_0),
    ._T_10_0(csr__T_10_0),
    ._T_7_0(csr__T_7_0),
    ._io_out_T_33_0(csr__io_out_T_33_0),
    ._T_23_0(csr__T_23_0),
    ._io_out_T_25_0(csr__io_out_T_25_0),
    ._T_6_0(csr__T_6_0),
    ._io_out_T_31_0(csr__io_out_T_31_0),
    ._wdata_T_3_0(csr__wdata_T_3_0),
    .privInst_0(csr_privInst_0),
    ._T_16_0(csr__T_16_0),
    .isEret_0(csr_isEret_0),
    ._io_out_T_41_0(csr__io_out_T_41_0),
    ._io_out_T_1_0(csr__io_out_T_1_0),
    ._io_out_T_53_0(csr__io_out_T_53_0),
    .iaddrInvalid_0(csr_iaddrInvalid_0),
    ._io_out_T_27_0(csr__io_out_T_27_0),
    ._io_out_T_43_0(csr__io_out_T_43_0),
    ._T_1_0(csr__T_1_0),
    ._io_out_T_35_0(csr__io_out_T_35_0),
    ._T_3_0(csr__T_3_0),
    ._T_18_0(csr__T_18_0),
    .privValid_0(csr_privValid_0),
    ._io_expt_T_6_0(csr__io_expt_T_6_0),
    ._isInstRet_T_0(csr__isInstRet_T_0),
    ._io_out_T_3_0(csr__io_out_T_3_0),
    ._io_out_T_7_0(csr__io_out_T_7_0),
    .io_expt_0(csr_io_expt_0),
    ._T_24_0(csr__T_24_0),
    ._wen_T_0(csr__wen_T_0),
    ._T_21_0(csr__T_21_0),
    .wen_0(csr_wen_0),
    ._T_13_0(csr__T_13_0),
    ._T_8_0(csr__T_8_0),
    ._io_out_T_47_0(csr__io_out_T_47_0),
    ._io_out_T_19_0(csr__io_out_T_19_0),
    ._T_12_0(csr__T_12_0),
    ._io_out_T_9_0(csr__io_out_T_9_0),
    ._csrRO_T_4_0(csr__csrRO_T_4_0),
    ._io_out_T_5_0(csr__io_out_T_5_0),
    ._isEcall_T_1_0(csr__isEcall_T_1_0),
    ._wdata_T_5_0(csr__wdata_T_5_0),
    ._laddrInvalid_T_6_0(csr__laddrInvalid_T_6_0),
    ._T_17_0(csr__T_17_0),
    ._laddrInvalid_T_8_0(csr__laddrInvalid_T_8_0),
    ._io_out_T_45_0(csr__io_out_T_45_0),
    ._io_out_T_17_0(csr__io_out_T_17_0),
    ._io_out_T_13_0(csr__io_out_T_13_0),
    ._io_out_T_11_0(csr__io_out_T_11_0),
    ._T_20_0(csr__T_20_0),
    ._T_14_0(csr__T_14_0),
    ._io_out_T_55_0(csr__io_out_T_55_0),
    ._io_out_T_39_0(csr__io_out_T_39_0),
    ._io_out_T_51_0(csr__io_out_T_51_0),
    .laddrInvalid_0(csr_laddrInvalid_0),
    ._io_out_T_23_0(csr__io_out_T_23_0),
    ._isInstRet_T_1_0(csr__isInstRet_T_1_0),
    ._io_expt_T_5_0(csr__io_expt_T_5_0),
    ._isEcall_T_4_0(csr__isEcall_T_4_0),
    ._csrRO_T_2_0(csr__csrRO_T_2_0),
    ._saddrInvalid_T_3_0(csr__saddrInvalid_T_3_0),
    .isEcall_0(csr_isEcall_0),
    .isEbreak_0(csr_isEbreak_0),
    ._io_out_T_49_0(csr__io_out_T_49_0),
    ._T_11_0(csr__T_11_0),
    ._wdata_T_7_0(csr__wdata_T_7_0),
    ._isInstRet_T_5_0(csr__isInstRet_T_5_0),
    ._io_out_T_37_0(csr__io_out_T_37_0),
    ._saddrInvalid_T_5_0(csr__saddrInvalid_T_5_0),
    ._T_22_0(csr__T_22_0),
    ._io_out_T_57_0(csr__io_out_T_57_0),
    ._laddrInvalid_T_4_0(csr__laddrInvalid_T_4_0),
    ._T_9_0(csr__T_9_0),
    ._T_15_0(csr__T_15_0),
    .saddrInvalid_0(csr_saddrInvalid_0),
    ._T_19_0(csr__T_19_0),
    ._io_out_T_21_0(csr__io_out_T_21_0),
    ._io_out_T_15_0(csr__io_out_T_15_0)
  );
  RegFile regFile ( // @[Datapath.scala 23:23]
    .clock(regFile_clock),
    .io_raddr1(regFile_io_raddr1),
    .io_raddr2(regFile_io_raddr2),
    .io_rdata1(regFile_io_rdata1),
    .io_rdata2(regFile_io_rdata2),
    .io_wen(regFile_io_wen),
    .io_waddr(regFile_io_waddr),
    .io_wdata(regFile_io_wdata),
    ._T_1_0(regFile__T_1_0),
    ._io_rdata2_T_0(regFile__io_rdata2_T_0),
    ._io_rdata1_T_0(regFile__io_rdata1_T_0)
  );
  AluArea alu ( // @[Datapath.scala 24:19]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out),
    .io_sum(alu_io_sum),
    ._out_T_1_0(alu__out_T_1_0),
    ._cmp_T_4_0(alu__cmp_T_4_0),
    ._out_T_0(alu__out_T_0),
    ._out_T_10_0(alu__out_T_10_0),
    ._out_T_12_0(alu__out_T_12_0),
    ._shin_T_0(alu__shin_T_0),
    ._out_T_9_0(alu__out_T_9_0),
    ._out_T_4_0(alu__out_T_4_0),
    ._out_T_3_0(alu__out_T_3_0),
    ._out_T_14_0(alu__out_T_14_0),
    ._out_T_6_0(alu__out_T_6_0),
    ._out_T_7_0(alu__out_T_7_0),
    ._out_T_8_0(alu__out_T_8_0),
    ._cmp_T_2_0(alu__cmp_T_2_0),
    ._sum_T_0(alu__sum_T_0),
    ._out_T_5_0(alu__out_T_5_0),
    ._out_T_2_0(alu__out_T_2_0),
    ._out_T_16_0(alu__out_T_16_0)
  );
  ImmGenWire immGen ( // @[Datapath.scala 25:22]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out),
    ._io_out_T_2_0(immGen__io_out_T_2_0),
    ._io_out_T_4_0(immGen__io_out_T_4_0),
    ._io_out_T_6_0(immGen__io_out_T_6_0),
    ._io_out_T_12_0(immGen__io_out_T_12_0),
    ._io_out_T_8_0(immGen__io_out_T_8_0),
    ._io_out_T_10_0(immGen__io_out_T_10_0)
  );
  BrCondArea brCond ( // @[Datapath.scala 26:22]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken),
    .isSameSign_0(brCond_isSameSign_0),
    .eq_0(brCond_eq_0),
    ._io_taken_T_5_0(brCond__io_taken_T_5_0),
    ._io_taken_T_0(brCond__io_taken_T_0),
    ._io_taken_T_11_0(brCond__io_taken_T_11_0),
    ._io_taken_T_8_0(brCond__io_taken_T_8_0),
    ._io_taken_T_14_0(brCond__io_taken_T_14_0),
    ._io_taken_T_2_0(brCond__io_taken_T_2_0),
    .geu_0(brCond_geu_0),
    .ge_0(brCond_ge_0)
  );
  assign io_icache_req_valid = ~stall; // @[Datapath.scala 80:26]
  assign io_icache_req_bits_addr = npc[31:0]; // @[Datapath.scala 77:27]
  assign io_dcache_abort = csr_io_expt; // @[Datapath.scala 192:19]
  assign io_dcache_req_valid = _io_icache_req_valid_T & (|io_ctrl_st_type | |io_ctrl_ld_type); // @[Datapath.scala 125:33]
  assign io_dcache_req_bits_addr = daddr[31:0]; // @[Datapath.scala 126:27]
  assign io_dcache_req_bits_data = _io_dcache_req_bits_data_T[31:0]; // @[Datapath.scala 127:27]
  assign io_dcache_req_bits_mask = _io_dcache_req_bits_mask_T_10[3:0]; // @[Datapath.scala 128:27]
  assign io_ctrl_inst = fe_inst; // @[Datapath.scala 92:16]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_stall = ~io_icache_resp_valid | ~io_dcache_resp_valid; // @[Datapath.scala 55:37]
  assign csr_io_cmd = csr_cmd; // @[Datapath.scala 173:14]
  assign csr_io_in = csr_in; // @[Datapath.scala 172:13]
  assign csr_io_pc = ew_pc[31:0]; // @[Datapath.scala 175:13]
  assign csr_io_addr = ew_alu; // @[Datapath.scala 176:15]
  assign csr_io_inst = ew_inst; // @[Datapath.scala 174:15]
  assign csr_io_illegal = illegal; // @[Datapath.scala 177:18]
  assign csr_io_st_type = st_type; // @[Datapath.scala 180:18]
  assign csr_io_ld_type = ld_type; // @[Datapath.scala 179:18]
  assign csr_io_pc_check = pc_check; // @[Datapath.scala 178:19]
  assign regFile_clock = clock;
  assign regFile_io_raddr1 = fe_inst[19:15]; // @[Datapath.scala 96:25]
  assign regFile_io_raddr2 = fe_inst[24:20]; // @[Datapath.scala 97:25]
  assign regFile_io_wen = wb_en & _io_icache_req_valid_T & _T_6; // @[Datapath.scala 187:37]
  assign regFile_io_waddr = ew_inst[11:7]; // @[Datapath.scala 106:27]
  assign regFile_io_wdata = regWrite[31:0]; // @[Datapath.scala 189:20]
  assign alu_io_A = _alu_io_A_T_1[31:0]; // @[Datapath.scala 113:12]
  assign alu_io_B = io_ctrl_B_sel ? rs2 : immGen_io_out; // @[Datapath.scala 114:18]
  assign alu_io_alu_op = io_ctrl_alu_op; // @[Datapath.scala 115:17]
  assign immGen_io_inst = fe_inst; // @[Datapath.scala 102:18]
  assign immGen_io_sel = io_ctrl_imm_sel; // @[Datapath.scala 103:17]
  assign brCond_io_rs1 = wb_sel == 2'h0 & rs1hazard ? ew_alu : regFile_io_rdata1; // @[Datapath.scala 109:16]
  assign brCond_io_rs2 = _rs1_T & rs2hazard ? ew_alu : regFile_io_rdata2; // @[Datapath.scala 110:16]
  assign brCond_io_br_type = io_ctrl_br_type; // @[Datapath.scala 120:21]
  assign csr___io_out_T_29_0 = csr__io_out_T_29_0;
  assign csr___T_0 = csr__T_0;
  assign csr__isInstRet_0 = csr_isInstRet_0;
  assign csr___T_10_0 = csr__T_10_0;
  assign csr___T_7_0 = csr__T_7_0;
  assign csr___io_out_T_33_0 = csr__io_out_T_33_0;
  assign csr___T_23_0 = csr__T_23_0;
  assign csr___io_out_T_25_0 = csr__io_out_T_25_0;
  assign csr___T_6_0 = csr__T_6_0;
  assign csr___io_out_T_31_0 = csr__io_out_T_31_0;
  assign csr___wdata_T_3_0 = csr__wdata_T_3_0;
  assign csr__privInst_0 = csr_privInst_0;
  assign csr___T_16_0 = csr__T_16_0;
  assign csr__isEret_0 = csr_isEret_0;
  assign csr___io_out_T_41_0 = csr__io_out_T_41_0;
  assign csr___io_out_T_1_0 = csr__io_out_T_1_0;
  assign csr___io_out_T_53_0 = csr__io_out_T_53_0;
  assign csr__iaddrInvalid_0 = csr_iaddrInvalid_0;
  assign csr___io_out_T_27_0 = csr__io_out_T_27_0;
  assign csr___io_out_T_43_0 = csr__io_out_T_43_0;
  assign csr___T_1_0 = csr__T_1_0;
  assign csr___io_out_T_35_0 = csr__io_out_T_35_0;
  assign csr___T_3_0 = csr__T_3_0;
  assign csr___T_18_0 = csr__T_18_0;
  assign csr__privValid_0 = csr_privValid_0;
  assign csr___io_expt_T_6_0 = csr__io_expt_T_6_0;
  assign csr___isInstRet_T_0 = csr__isInstRet_T_0;
  assign csr___io_out_T_3_0 = csr__io_out_T_3_0;
  assign csr___io_out_T_7_0 = csr__io_out_T_7_0;
  assign csr__io_expt_0 = csr_io_expt_0;
  assign csr___T_24_0 = csr__T_24_0;
  assign csr___wen_T_0 = csr__wen_T_0;
  assign csr___T_21_0 = csr__T_21_0;
  assign csr__wen_0 = csr_wen_0;
  assign csr___T_13_0 = csr__T_13_0;
  assign csr___T_8_0 = csr__T_8_0;
  assign csr___io_out_T_47_0 = csr__io_out_T_47_0;
  assign csr___io_out_T_19_0 = csr__io_out_T_19_0;
  assign csr___T_12_0 = csr__T_12_0;
  assign csr___io_out_T_9_0 = csr__io_out_T_9_0;
  assign csr___csrRO_T_4_0 = csr__csrRO_T_4_0;
  assign csr___io_out_T_5_0 = csr__io_out_T_5_0;
  assign csr___isEcall_T_1_0 = csr__isEcall_T_1_0;
  assign csr___wdata_T_5_0 = csr__wdata_T_5_0;
  assign csr___laddrInvalid_T_6_0 = csr__laddrInvalid_T_6_0;
  assign csr___T_17_0 = csr__T_17_0;
  assign csr___laddrInvalid_T_8_0 = csr__laddrInvalid_T_8_0;
  assign csr___io_out_T_45_0 = csr__io_out_T_45_0;
  assign csr___io_out_T_17_0 = csr__io_out_T_17_0;
  assign csr___io_out_T_13_0 = csr__io_out_T_13_0;
  assign csr___io_out_T_11_0 = csr__io_out_T_11_0;
  assign csr___T_20_0 = csr__T_20_0;
  assign csr___T_14_0 = csr__T_14_0;
  assign csr___io_out_T_55_0 = csr__io_out_T_55_0;
  assign csr___io_out_T_39_0 = csr__io_out_T_39_0;
  assign csr___io_out_T_51_0 = csr__io_out_T_51_0;
  assign csr__laddrInvalid_0 = csr_laddrInvalid_0;
  assign csr___io_out_T_23_0 = csr__io_out_T_23_0;
  assign csr___isInstRet_T_1_0 = csr__isInstRet_T_1_0;
  assign csr___io_expt_T_5_0 = csr__io_expt_T_5_0;
  assign csr___isEcall_T_4_0 = csr__isEcall_T_4_0;
  assign csr___csrRO_T_2_0 = csr__csrRO_T_2_0;
  assign csr___saddrInvalid_T_3_0 = csr__saddrInvalid_T_3_0;
  assign csr__isEcall_0 = csr_isEcall_0;
  assign csr__isEbreak_0 = csr_isEbreak_0;
  assign csr___io_out_T_49_0 = csr__io_out_T_49_0;
  assign csr___T_11_0 = csr__T_11_0;
  assign csr___wdata_T_7_0 = csr__wdata_T_7_0;
  assign csr___isInstRet_T_5_0 = csr__isInstRet_T_5_0;
  assign csr___io_out_T_37_0 = csr__io_out_T_37_0;
  assign csr___saddrInvalid_T_5_0 = csr__saddrInvalid_T_5_0;
  assign csr___T_22_0 = csr__T_22_0;
  assign csr___io_out_T_57_0 = csr__io_out_T_57_0;
  assign csr___laddrInvalid_T_4_0 = csr__laddrInvalid_T_4_0;
  assign csr___T_9_0 = csr__T_9_0;
  assign csr___T_15_0 = csr__T_15_0;
  assign csr__saddrInvalid_0 = csr_saddrInvalid_0;
  assign csr___T_19_0 = csr__T_19_0;
  assign csr___io_out_T_21_0 = csr__io_out_T_21_0;
  assign csr___io_out_T_15_0 = csr__io_out_T_15_0;
  assign regFile___T_1_0 = regFile__T_1_0;
  assign regFile___io_rdata2_T_0 = regFile__io_rdata2_T_0;
  assign regFile___io_rdata1_T_0 = regFile__io_rdata1_T_0;
  assign alu___out_T_1_0 = alu__out_T_1_0;
  assign alu___cmp_T_4_0 = alu__cmp_T_4_0;
  assign alu___out_T_0 = alu__out_T_0;
  assign alu___out_T_10_0 = alu__out_T_10_0;
  assign alu___out_T_12_0 = alu__out_T_12_0;
  assign alu___shin_T_0 = alu__shin_T_0;
  assign alu___out_T_9_0 = alu__out_T_9_0;
  assign alu___out_T_4_0 = alu__out_T_4_0;
  assign alu___out_T_3_0 = alu__out_T_3_0;
  assign alu___out_T_14_0 = alu__out_T_14_0;
  assign alu___out_T_6_0 = alu__out_T_6_0;
  assign alu___out_T_7_0 = alu__out_T_7_0;
  assign alu___out_T_8_0 = alu__out_T_8_0;
  assign alu___cmp_T_2_0 = alu__cmp_T_2_0;
  assign alu___sum_T_0 = alu__sum_T_0;
  assign alu___out_T_5_0 = alu__out_T_5_0;
  assign alu___out_T_2_0 = alu__out_T_2_0;
  assign alu___out_T_16_0 = alu__out_T_16_0;
  assign immGen___io_out_T_2_0 = immGen__io_out_T_2_0;
  assign immGen___io_out_T_4_0 = immGen__io_out_T_4_0;
  assign immGen___io_out_T_6_0 = immGen__io_out_T_6_0;
  assign immGen___io_out_T_12_0 = immGen__io_out_T_12_0;
  assign immGen___io_out_T_8_0 = immGen__io_out_T_8_0;
  assign immGen___io_out_T_10_0 = immGen__io_out_T_10_0;
  assign brCond__isSameSign_0 = brCond_isSameSign_0;
  assign brCond__eq_0 = brCond_eq_0;
  assign brCond___io_taken_T_5_0 = brCond__io_taken_T_5_0;
  assign brCond___io_taken_T_0 = brCond__io_taken_T_0;
  assign brCond___io_taken_T_11_0 = brCond__io_taken_T_11_0;
  assign brCond___io_taken_T_8_0 = brCond__io_taken_T_8_0;
  assign brCond___io_taken_T_14_0 = brCond__io_taken_T_14_0;
  assign brCond___io_taken_T_2_0 = brCond__io_taken_T_2_0;
  assign brCond__geu_0 = brCond_geu_0;
  assign brCond__ge_0 = brCond_ge_0;
  assign _io_dcache_req_bits_mask_T_7_0 = _io_dcache_req_bits_mask_T_7;
  assign _npc_T_2_0 = _npc_T_2;
  assign _inst_T_2_0 = _inst_T_2;
  assign _rs1_T_0 = _rs1_T;
  assign _T_6_0 = _T_6;
  assign io_ctrl_A_sel_0 = io_ctrl_A_sel;
  assign _npc_T_5_0 = _npc_T_5;
  assign _io_icache_req_valid_T_0 = _io_icache_req_valid_T;
  assign io_ctrl_B_sel_0 = io_ctrl_B_sel;
  assign _regWrite_T_9_0 = _regWrite_T_9;
  assign _stall_T_1_0 = _stall_T_1;
  assign csr__io_expt = csr_io_expt;
  assign _regWrite_T_7_0 = _regWrite_T_7;
  assign _stall_T_0 = _stall_T;
  assign _rs1hazard_T_2_0 = _rs1hazard_T_2;
  assign _load_T_13_0 = _load_T_13;
  assign _load_T_11_0 = _load_T_11;
  assign _rs1_T_1_0 = _rs1_T_1;
  assign stall_0 = stall;
  assign _io_dcache_req_bits_mask_T_9_0 = _io_dcache_req_bits_mask_T_9;
  assign _load_T_15_0 = _load_T_15;
  assign _io_dcache_req_bits_mask_T_5_0 = _io_dcache_req_bits_mask_T_5;
  assign _rs2hazard_T_2_0 = _rs2hazard_T_2;
  assign _csr_in_T_0 = _csr_in_T;
  assign _npc_T_0 = _npc_T;
  assign _regWrite_T_5_0 = _regWrite_T_5;
  assign _npc_T_1_0 = _npc_T_1;
  assign _rs2_T_1_0 = _rs2_T_1;
  assign _load_T_9_0 = _load_T_9;
  assign _T_4_0 = _T_4;
  assign _T_7_0 = _T_7;
  always @(posedge clock) begin
    if (reset) begin // @[Datapath.scala 32:24]
      fe_inst <= 32'h13; // @[Datapath.scala 32:24]
    end else if (_io_icache_req_valid_T) begin // @[Datapath.scala 84:16]
      if (started | io_ctrl_inst_kill | brCond_io_taken | csr_io_expt) begin // @[Datapath.scala 75:8]
        fe_inst <= 32'h13;
      end else begin
        fe_inst <= io_icache_resp_bits_data;
      end
    end
    if (_io_icache_req_valid_T) begin // @[Datapath.scala 84:16]
      fe_pc <= pc; // @[Datapath.scala 85:11]
    end
    if (reset) begin // @[Datapath.scala 37:24]
      ew_inst <= 32'h13; // @[Datapath.scala 37:24]
    end else if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 135:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
        ew_inst <= fe_inst; // @[Datapath.scala 144:13]
      end
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 135:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
        ew_pc <= fe_pc; // @[Datapath.scala 143:11]
      end
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 135:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
        ew_alu <= alu_io_out; // @[Datapath.scala 145:12]
      end
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 135:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
        if (io_ctrl_imm_sel == 3'h6) begin // @[Datapath.scala 146:18]
          csr_in <= immGen_io_out;
        end else if (wb_sel == 2'h0 & rs1hazard) begin // @[Datapath.scala 109:16]
          csr_in <= ew_alu;
        end else begin
          csr_in <= regFile_io_rdata1;
        end
      end
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 135:47]
      st_type <= 2'h0; // @[Datapath.scala 136:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
      st_type <= io_ctrl_st_type; // @[Datapath.scala 147:13]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 135:47]
      ld_type <= 3'h0; // @[Datapath.scala 137:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
      ld_type <= io_ctrl_ld_type; // @[Datapath.scala 148:13]
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 135:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
        wb_sel <= io_ctrl_wb_sel; // @[Datapath.scala 149:12]
      end
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 135:47]
      wb_en <= 1'h0; // @[Datapath.scala 138:11]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
      wb_en <= io_ctrl_wb_en; // @[Datapath.scala 150:11]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 135:47]
      csr_cmd <= 3'h0; // @[Datapath.scala 139:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
      csr_cmd <= io_ctrl_csr_cmd; // @[Datapath.scala 151:13]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 135:47]
      illegal <= 1'h0; // @[Datapath.scala 140:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
      illegal <= io_ctrl_illegal; // @[Datapath.scala 152:13]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 135:47]
      pc_check <= 1'h0; // @[Datapath.scala 141:14]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 142:38]
      pc_check <= _npc_T_1; // @[Datapath.scala 153:14]
    end
    started <= reset; // @[Datapath.scala 54:31]
    if (reset) begin // @[Datapath.scala 56:19]
      pc <= {{1'd0}, _pc_T_1}; // @[Datapath.scala 56:19]
    end else if (!(stall)) begin // @[Datapath.scala 57:16]
      if (csr_io_expt) begin // @[Datapath.scala 60:8]
        pc <= {{1'd0}, csr_io_evec};
      end else if (_npc_T) begin // @[Datapath.scala 63:10]
        pc <= {{1'd0}, csr_io_epc};
      end else begin
        pc <= _npc_T_9;
      end
    end
  end
endmodule
module Control(
  input  [31:0] io_inst,
  output [1:0]  io_pc_sel,
  output        io_inst_kill,
  output        io_A_sel,
  output        io_B_sel,
  output [2:0]  io_imm_sel,
  output [3:0]  io_alu_op,
  output [2:0]  io_br_type,
  output [1:0]  io_st_type,
  output [2:0]  io_ld_type,
  output [1:0]  io_wb_sel,
  output        io_wb_en,
  output [2:0]  io_csr_cmd,
  output        io_illegal,
  output        _ctrlSignals_T_31_0,
  output        _ctrlSignals_T_93_0,
  output        _ctrlSignals_T_87_0,
  output        _ctrlSignals_T_81_0,
  output        _ctrlSignals_T_15_0,
  output        _ctrlSignals_T_49_0,
  output        _ctrlSignals_T_5_0,
  output        _ctrlSignals_T_41_0,
  output        _ctrlSignals_T_11_0,
  output        _ctrlSignals_T_19_0,
  output        _ctrlSignals_T_95_0,
  output        _ctrlSignals_T_21_0,
  output        _ctrlSignals_T_47_0,
  output        _ctrlSignals_T_35_0,
  output        _ctrlSignals_T_75_0,
  output        _ctrlSignals_T_25_0,
  output        _ctrlSignals_T_55_0,
  output        _ctrlSignals_T_71_0,
  output        _ctrlSignals_T_27_0,
  output        _ctrlSignals_T_59_0,
  output        _ctrlSignals_T_29_0,
  output        _ctrlSignals_T_39_0,
  output        _ctrlSignals_T_1_0,
  output        _ctrlSignals_T_63_0,
  output        _ctrlSignals_T_97_0,
  output        _ctrlSignals_T_23_0,
  output        _ctrlSignals_T_65_0,
  output        _ctrlSignals_T_89_0,
  output        _ctrlSignals_T_51_0,
  output        _ctrlSignals_T_83_0,
  output        _ctrlSignals_T_77_0,
  output        _ctrlSignals_T_85_0,
  output        _ctrlSignals_T_37_0,
  output        _ctrlSignals_T_67_0,
  output        _ctrlSignals_T_91_0,
  output        _ctrlSignals_T_43_0,
  output        _ctrlSignals_T_17_0,
  output        _ctrlSignals_T_9_0,
  output        _ctrlSignals_T_79_0,
  output        _ctrlSignals_T_33_0,
  output        _ctrlSignals_T_45_0,
  output        _ctrlSignals_T_13_0,
  output        _ctrlSignals_T_53_0,
  output        _ctrlSignals_T_69_0,
  output        _ctrlSignals_T_3_0,
  output        _ctrlSignals_T_7_0,
  output        _ctrlSignals_T_73_0,
  output        _ctrlSignals_T_57_0,
  output        _ctrlSignals_T_61_0
);
  wire [31:0] _ctrlSignals_T = io_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_1 = 32'h37 == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_3 = 32'h17 == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_5 = 32'h6f == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_6 = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_7 = 32'h67 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_9 = 32'h63 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_11 = 32'h1063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_13 = 32'h4063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_15 = 32'h5063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_17 = 32'h6063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_19 = 32'h7063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_21 = 32'h3 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_23 = 32'h1003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_25 = 32'h2003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_27 = 32'h4003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_29 = 32'h5003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_31 = 32'h23 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_33 = 32'h1023 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_35 = 32'h2023 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_37 = 32'h13 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_39 = 32'h2013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_41 = 32'h3013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_43 = 32'h4013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_45 = 32'h6013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_47 = 32'h7013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_48 = io_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_49 = 32'h1013 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_51 = 32'h5013 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_53 = 32'h40005013 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_55 = 32'h33 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_57 = 32'h40000033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_59 = 32'h1033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_61 = 32'h2033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_63 = 32'h3033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_65 = 32'h4033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_67 = 32'h5033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_69 = 32'h40005033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_71 = 32'h6033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_73 = 32'h7033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_74 = io_inst & 32'hf00fffff; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_75 = 32'hf == _ctrlSignals_T_74; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_77 = 32'h100f == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_79 = 32'h1073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_81 = 32'h2073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_83 = 32'h3073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_85 = 32'h5073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_87 = 32'h6073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_89 = 32'h7073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_91 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_93 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_95 = 32'h10000073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_97 = 32'h10200073 == io_inst; // @[Lookup.scala 31:38]
  wire [1:0] _ctrlSignals_T_99 = _ctrlSignals_T_95 ? 2'h3 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_100 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_99; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_101 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_100; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_102 = _ctrlSignals_T_89 ? 2'h2 : _ctrlSignals_T_101; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_103 = _ctrlSignals_T_87 ? 2'h2 : _ctrlSignals_T_102; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_104 = _ctrlSignals_T_85 ? 2'h2 : _ctrlSignals_T_103; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_105 = _ctrlSignals_T_83 ? 2'h2 : _ctrlSignals_T_104; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_106 = _ctrlSignals_T_81 ? 2'h2 : _ctrlSignals_T_105; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_107 = _ctrlSignals_T_79 ? 2'h2 : _ctrlSignals_T_106; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_108 = _ctrlSignals_T_77 ? 2'h2 : _ctrlSignals_T_107; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_109 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_108; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_110 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_109; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_111 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_110; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_112 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_111; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_113 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_112; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_114 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_113; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_115 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_114; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_116 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_115; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_117 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_116; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_118 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_117; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_119 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_118; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_120 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_119; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_121 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_120; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_122 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_121; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_123 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_122; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_124 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_123; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_125 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_124; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_126 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_125; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_127 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_126; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_128 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_127; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_129 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_128; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_130 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_129; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_131 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_130; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_132 = _ctrlSignals_T_29 ? 2'h2 : _ctrlSignals_T_131; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_133 = _ctrlSignals_T_27 ? 2'h2 : _ctrlSignals_T_132; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_134 = _ctrlSignals_T_25 ? 2'h2 : _ctrlSignals_T_133; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_135 = _ctrlSignals_T_23 ? 2'h2 : _ctrlSignals_T_134; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_136 = _ctrlSignals_T_21 ? 2'h2 : _ctrlSignals_T_135; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_137 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_136; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_138 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_137; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_139 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_138; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_140 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_139; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_141 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_140; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_142 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_141; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_143 = _ctrlSignals_T_7 ? 2'h1 : _ctrlSignals_T_142; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_144 = _ctrlSignals_T_5 ? 2'h1 : _ctrlSignals_T_143; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_145 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_144; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_156 = _ctrlSignals_T_77 ? 1'h0 : _ctrlSignals_T_79 | (_ctrlSignals_T_81 | _ctrlSignals_T_83); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_157 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_156; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_185 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | (_ctrlSignals_T_31 | (_ctrlSignals_T_33 | (_ctrlSignals_T_35 | (
    _ctrlSignals_T_37 | (_ctrlSignals_T_39 | (_ctrlSignals_T_41 | (_ctrlSignals_T_43 | (_ctrlSignals_T_45 | (
    _ctrlSignals_T_47 | (_ctrlSignals_T_49 | (_ctrlSignals_T_51 | (_ctrlSignals_T_53 | (_ctrlSignals_T_55 | (
    _ctrlSignals_T_57 | (_ctrlSignals_T_59 | (_ctrlSignals_T_61 | (_ctrlSignals_T_63 | (_ctrlSignals_T_65 | (
    _ctrlSignals_T_67 | (_ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | _ctrlSignals_T_157)))))))))))))))
    ))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_186 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_185; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_187 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_186; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_188 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_187; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_189 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_188; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_190 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_189; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_192 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_7 | _ctrlSignals_T_190; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_193 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_192; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_216 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_55 | (_ctrlSignals_T_57 | (_ctrlSignals_T_59 | (
    _ctrlSignals_T_61 | (_ctrlSignals_T_63 | (_ctrlSignals_T_65 | (_ctrlSignals_T_67 | (_ctrlSignals_T_69 | (
    _ctrlSignals_T_71 | _ctrlSignals_T_73)))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_217 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_216; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_218 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_217; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_219 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_218; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_220 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_219; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_221 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_220; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_222 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_221; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_223 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_222; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_224 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_223; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_225 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_224; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_226 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_225; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_227 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_226; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_228 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_227; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_229 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_228; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_230 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_229; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_231 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_230; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_232 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_231; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_233 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_232; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_234 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_233; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_235 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_234; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_236 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_235; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_237 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_236; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_238 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_237; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_239 = _ctrlSignals_T_7 ? 1'h0 : _ctrlSignals_T_238; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_240 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_239; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_241 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_240; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_246 = _ctrlSignals_T_89 ? 3'h6 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_247 = _ctrlSignals_T_87 ? 3'h6 : _ctrlSignals_T_246; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_248 = _ctrlSignals_T_85 ? 3'h6 : _ctrlSignals_T_247; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_249 = _ctrlSignals_T_83 ? 3'h0 : _ctrlSignals_T_248; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_250 = _ctrlSignals_T_81 ? 3'h0 : _ctrlSignals_T_249; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_251 = _ctrlSignals_T_79 ? 3'h0 : _ctrlSignals_T_250; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_252 = _ctrlSignals_T_77 ? 3'h0 : _ctrlSignals_T_251; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_253 = _ctrlSignals_T_75 ? 3'h0 : _ctrlSignals_T_252; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_254 = _ctrlSignals_T_73 ? 3'h0 : _ctrlSignals_T_253; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_255 = _ctrlSignals_T_71 ? 3'h0 : _ctrlSignals_T_254; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_256 = _ctrlSignals_T_69 ? 3'h0 : _ctrlSignals_T_255; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_257 = _ctrlSignals_T_67 ? 3'h0 : _ctrlSignals_T_256; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_258 = _ctrlSignals_T_65 ? 3'h0 : _ctrlSignals_T_257; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_259 = _ctrlSignals_T_63 ? 3'h0 : _ctrlSignals_T_258; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_260 = _ctrlSignals_T_61 ? 3'h0 : _ctrlSignals_T_259; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_261 = _ctrlSignals_T_59 ? 3'h0 : _ctrlSignals_T_260; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_262 = _ctrlSignals_T_57 ? 3'h0 : _ctrlSignals_T_261; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_263 = _ctrlSignals_T_55 ? 3'h0 : _ctrlSignals_T_262; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_264 = _ctrlSignals_T_53 ? 3'h1 : _ctrlSignals_T_263; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_265 = _ctrlSignals_T_51 ? 3'h1 : _ctrlSignals_T_264; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_266 = _ctrlSignals_T_49 ? 3'h1 : _ctrlSignals_T_265; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_267 = _ctrlSignals_T_47 ? 3'h1 : _ctrlSignals_T_266; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_268 = _ctrlSignals_T_45 ? 3'h1 : _ctrlSignals_T_267; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_269 = _ctrlSignals_T_43 ? 3'h1 : _ctrlSignals_T_268; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_270 = _ctrlSignals_T_41 ? 3'h1 : _ctrlSignals_T_269; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_271 = _ctrlSignals_T_39 ? 3'h1 : _ctrlSignals_T_270; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_272 = _ctrlSignals_T_37 ? 3'h1 : _ctrlSignals_T_271; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_273 = _ctrlSignals_T_35 ? 3'h2 : _ctrlSignals_T_272; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_274 = _ctrlSignals_T_33 ? 3'h2 : _ctrlSignals_T_273; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_275 = _ctrlSignals_T_31 ? 3'h2 : _ctrlSignals_T_274; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_276 = _ctrlSignals_T_29 ? 3'h1 : _ctrlSignals_T_275; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_277 = _ctrlSignals_T_27 ? 3'h1 : _ctrlSignals_T_276; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_278 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_277; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_279 = _ctrlSignals_T_23 ? 3'h1 : _ctrlSignals_T_278; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_280 = _ctrlSignals_T_21 ? 3'h1 : _ctrlSignals_T_279; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_281 = _ctrlSignals_T_19 ? 3'h5 : _ctrlSignals_T_280; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_282 = _ctrlSignals_T_17 ? 3'h5 : _ctrlSignals_T_281; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_283 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_282; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_284 = _ctrlSignals_T_13 ? 3'h5 : _ctrlSignals_T_283; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_285 = _ctrlSignals_T_11 ? 3'h5 : _ctrlSignals_T_284; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_286 = _ctrlSignals_T_9 ? 3'h5 : _ctrlSignals_T_285; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_287 = _ctrlSignals_T_7 ? 3'h1 : _ctrlSignals_T_286; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_288 = _ctrlSignals_T_5 ? 3'h4 : _ctrlSignals_T_287; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_289 = _ctrlSignals_T_3 ? 3'h3 : _ctrlSignals_T_288; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_297 = _ctrlSignals_T_83 ? 4'ha : 4'hf; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_298 = _ctrlSignals_T_81 ? 4'ha : _ctrlSignals_T_297; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_299 = _ctrlSignals_T_79 ? 4'ha : _ctrlSignals_T_298; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_300 = _ctrlSignals_T_77 ? 4'hf : _ctrlSignals_T_299; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_301 = _ctrlSignals_T_75 ? 4'hf : _ctrlSignals_T_300; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_302 = _ctrlSignals_T_73 ? 4'h2 : _ctrlSignals_T_301; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_303 = _ctrlSignals_T_71 ? 4'h3 : _ctrlSignals_T_302; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_304 = _ctrlSignals_T_69 ? 4'h9 : _ctrlSignals_T_303; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_305 = _ctrlSignals_T_67 ? 4'h8 : _ctrlSignals_T_304; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_306 = _ctrlSignals_T_65 ? 4'h4 : _ctrlSignals_T_305; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_307 = _ctrlSignals_T_63 ? 4'h7 : _ctrlSignals_T_306; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_308 = _ctrlSignals_T_61 ? 4'h5 : _ctrlSignals_T_307; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_309 = _ctrlSignals_T_59 ? 4'h6 : _ctrlSignals_T_308; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_310 = _ctrlSignals_T_57 ? 4'h1 : _ctrlSignals_T_309; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_311 = _ctrlSignals_T_55 ? 4'h0 : _ctrlSignals_T_310; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_312 = _ctrlSignals_T_53 ? 4'h9 : _ctrlSignals_T_311; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_313 = _ctrlSignals_T_51 ? 4'h8 : _ctrlSignals_T_312; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_314 = _ctrlSignals_T_49 ? 4'h6 : _ctrlSignals_T_313; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_315 = _ctrlSignals_T_47 ? 4'h2 : _ctrlSignals_T_314; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_316 = _ctrlSignals_T_45 ? 4'h3 : _ctrlSignals_T_315; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_317 = _ctrlSignals_T_43 ? 4'h4 : _ctrlSignals_T_316; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_318 = _ctrlSignals_T_41 ? 4'h7 : _ctrlSignals_T_317; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_319 = _ctrlSignals_T_39 ? 4'h5 : _ctrlSignals_T_318; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_320 = _ctrlSignals_T_37 ? 4'h0 : _ctrlSignals_T_319; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_321 = _ctrlSignals_T_35 ? 4'h0 : _ctrlSignals_T_320; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_322 = _ctrlSignals_T_33 ? 4'h0 : _ctrlSignals_T_321; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_323 = _ctrlSignals_T_31 ? 4'h0 : _ctrlSignals_T_322; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_324 = _ctrlSignals_T_29 ? 4'h0 : _ctrlSignals_T_323; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_325 = _ctrlSignals_T_27 ? 4'h0 : _ctrlSignals_T_324; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_326 = _ctrlSignals_T_25 ? 4'h0 : _ctrlSignals_T_325; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_327 = _ctrlSignals_T_23 ? 4'h0 : _ctrlSignals_T_326; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_328 = _ctrlSignals_T_21 ? 4'h0 : _ctrlSignals_T_327; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_329 = _ctrlSignals_T_19 ? 4'h0 : _ctrlSignals_T_328; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_330 = _ctrlSignals_T_17 ? 4'h0 : _ctrlSignals_T_329; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_331 = _ctrlSignals_T_15 ? 4'h0 : _ctrlSignals_T_330; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_332 = _ctrlSignals_T_13 ? 4'h0 : _ctrlSignals_T_331; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_333 = _ctrlSignals_T_11 ? 4'h0 : _ctrlSignals_T_332; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_334 = _ctrlSignals_T_9 ? 4'h0 : _ctrlSignals_T_333; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_335 = _ctrlSignals_T_7 ? 4'h0 : _ctrlSignals_T_334; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_336 = _ctrlSignals_T_5 ? 4'h0 : _ctrlSignals_T_335; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_337 = _ctrlSignals_T_3 ? 4'h0 : _ctrlSignals_T_336; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_377 = _ctrlSignals_T_19 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_378 = _ctrlSignals_T_17 ? 3'h1 : _ctrlSignals_T_377; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_379 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_378; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_380 = _ctrlSignals_T_13 ? 3'h2 : _ctrlSignals_T_379; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_381 = _ctrlSignals_T_11 ? 3'h6 : _ctrlSignals_T_380; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_382 = _ctrlSignals_T_9 ? 3'h3 : _ctrlSignals_T_381; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_383 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_382; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_384 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_383; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_385 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_384; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_388 = _ctrlSignals_T_93 ? 1'h0 : _ctrlSignals_T_95; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_389 = _ctrlSignals_T_91 ? 1'h0 : _ctrlSignals_T_388; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_397 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (
    _ctrlSignals_T_83 | (_ctrlSignals_T_85 | (_ctrlSignals_T_87 | (_ctrlSignals_T_89 | _ctrlSignals_T_389)))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_398 = _ctrlSignals_T_73 ? 1'h0 : _ctrlSignals_T_397; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_399 = _ctrlSignals_T_71 ? 1'h0 : _ctrlSignals_T_398; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_400 = _ctrlSignals_T_69 ? 1'h0 : _ctrlSignals_T_399; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_401 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_400; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_402 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_401; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_403 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_402; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_404 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_403; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_405 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_404; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_406 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_405; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_407 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_406; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_408 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_407; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_409 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_408; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_410 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_409; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_411 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_410; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_412 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_411; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_413 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_412; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_414 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_413; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_415 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_414; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_416 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_415; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_417 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_416; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_418 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_417; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_419 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_418; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_425 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | _ctrlSignals_T_419)))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_426 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_425; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_427 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_426; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_428 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_427; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_429 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_428; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_430 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_429; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_433 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_5 | (_ctrlSignals_T_7 | _ctrlSignals_T_430); // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_465 = _ctrlSignals_T_35 ? 2'h1 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_466 = _ctrlSignals_T_33 ? 2'h2 : _ctrlSignals_T_465; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_467 = _ctrlSignals_T_31 ? 2'h3 : _ctrlSignals_T_466; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_468 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_467; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_469 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_468; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_470 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_469; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_471 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_470; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_472 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_471; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_473 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_472; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_474 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_473; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_475 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_474; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_476 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_475; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_477 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_476; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_478 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_477; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_479 = _ctrlSignals_T_7 ? 2'h0 : _ctrlSignals_T_478; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_480 = _ctrlSignals_T_5 ? 2'h0 : _ctrlSignals_T_479; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_481 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_480; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_516 = _ctrlSignals_T_29 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_517 = _ctrlSignals_T_27 ? 3'h5 : _ctrlSignals_T_516; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_518 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_517; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_519 = _ctrlSignals_T_23 ? 3'h2 : _ctrlSignals_T_518; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_520 = _ctrlSignals_T_21 ? 3'h3 : _ctrlSignals_T_519; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_521 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_520; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_522 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_521; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_523 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_522; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_524 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_523; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_525 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_524; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_526 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_525; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_527 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_526; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_528 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_527; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_529 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_528; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_532 = _ctrlSignals_T_93 ? 2'h3 : _ctrlSignals_T_99; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_533 = _ctrlSignals_T_91 ? 2'h3 : _ctrlSignals_T_532; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_534 = _ctrlSignals_T_89 ? 2'h3 : _ctrlSignals_T_533; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_535 = _ctrlSignals_T_87 ? 2'h3 : _ctrlSignals_T_534; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_536 = _ctrlSignals_T_85 ? 2'h3 : _ctrlSignals_T_535; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_537 = _ctrlSignals_T_83 ? 2'h3 : _ctrlSignals_T_536; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_538 = _ctrlSignals_T_81 ? 2'h3 : _ctrlSignals_T_537; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_539 = _ctrlSignals_T_79 ? 2'h3 : _ctrlSignals_T_538; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_540 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_539; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_541 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_540; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_542 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_541; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_543 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_542; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_544 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_543; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_545 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_544; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_546 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_545; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_547 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_546; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_548 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_547; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_549 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_548; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_550 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_549; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_551 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_550; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_552 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_551; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_553 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_552; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_554 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_553; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_555 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_554; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_556 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_555; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_557 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_556; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_558 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_557; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_559 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_558; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_560 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_559; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_561 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_560; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_562 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_561; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_563 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_562; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_564 = _ctrlSignals_T_29 ? 2'h1 : _ctrlSignals_T_563; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_565 = _ctrlSignals_T_27 ? 2'h1 : _ctrlSignals_T_564; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_566 = _ctrlSignals_T_25 ? 2'h1 : _ctrlSignals_T_565; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_567 = _ctrlSignals_T_23 ? 2'h1 : _ctrlSignals_T_566; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_568 = _ctrlSignals_T_21 ? 2'h1 : _ctrlSignals_T_567; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_569 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_568; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_570 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_569; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_571 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_570; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_572 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_571; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_573 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_572; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_574 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_573; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_575 = _ctrlSignals_T_7 ? 2'h2 : _ctrlSignals_T_574; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_576 = _ctrlSignals_T_5 ? 2'h2 : _ctrlSignals_T_575; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_577 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_576; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_588 = _ctrlSignals_T_77 ? 1'h0 : _ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (
    _ctrlSignals_T_85 | (_ctrlSignals_T_87 | _ctrlSignals_T_89)))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_589 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_588; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_609 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_37 | (_ctrlSignals_T_39 | (_ctrlSignals_T_41 | (
    _ctrlSignals_T_43 | (_ctrlSignals_T_45 | (_ctrlSignals_T_47 | (_ctrlSignals_T_49 | (_ctrlSignals_T_51 | (
    _ctrlSignals_T_53 | (_ctrlSignals_T_55 | (_ctrlSignals_T_57 | (_ctrlSignals_T_59 | (_ctrlSignals_T_61 | (
    _ctrlSignals_T_63 | (_ctrlSignals_T_65 | (_ctrlSignals_T_67 | (_ctrlSignals_T_69 | (_ctrlSignals_T_71 | (
    _ctrlSignals_T_73 | _ctrlSignals_T_589)))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_610 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_609; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_611 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_610; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_617 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | _ctrlSignals_T_611)))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_618 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_617; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_619 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_618; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_620 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_619; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_621 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_620; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_622 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_621; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_627 = _ctrlSignals_T_95 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_628 = _ctrlSignals_T_93 ? 3'h4 : _ctrlSignals_T_627; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_629 = _ctrlSignals_T_91 ? 3'h4 : _ctrlSignals_T_628; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_630 = _ctrlSignals_T_89 ? 3'h3 : _ctrlSignals_T_629; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_631 = _ctrlSignals_T_87 ? 3'h2 : _ctrlSignals_T_630; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_632 = _ctrlSignals_T_85 ? 3'h1 : _ctrlSignals_T_631; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_633 = _ctrlSignals_T_83 ? 3'h3 : _ctrlSignals_T_632; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_634 = _ctrlSignals_T_81 ? 3'h2 : _ctrlSignals_T_633; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_635 = _ctrlSignals_T_79 ? 3'h1 : _ctrlSignals_T_634; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_636 = _ctrlSignals_T_77 ? 3'h0 : _ctrlSignals_T_635; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_637 = _ctrlSignals_T_75 ? 3'h0 : _ctrlSignals_T_636; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_638 = _ctrlSignals_T_73 ? 3'h0 : _ctrlSignals_T_637; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_639 = _ctrlSignals_T_71 ? 3'h0 : _ctrlSignals_T_638; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_640 = _ctrlSignals_T_69 ? 3'h0 : _ctrlSignals_T_639; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_641 = _ctrlSignals_T_67 ? 3'h0 : _ctrlSignals_T_640; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_642 = _ctrlSignals_T_65 ? 3'h0 : _ctrlSignals_T_641; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_643 = _ctrlSignals_T_63 ? 3'h0 : _ctrlSignals_T_642; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_644 = _ctrlSignals_T_61 ? 3'h0 : _ctrlSignals_T_643; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_645 = _ctrlSignals_T_59 ? 3'h0 : _ctrlSignals_T_644; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_646 = _ctrlSignals_T_57 ? 3'h0 : _ctrlSignals_T_645; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_647 = _ctrlSignals_T_55 ? 3'h0 : _ctrlSignals_T_646; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_648 = _ctrlSignals_T_53 ? 3'h0 : _ctrlSignals_T_647; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_649 = _ctrlSignals_T_51 ? 3'h0 : _ctrlSignals_T_648; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_650 = _ctrlSignals_T_49 ? 3'h0 : _ctrlSignals_T_649; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_651 = _ctrlSignals_T_47 ? 3'h0 : _ctrlSignals_T_650; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_652 = _ctrlSignals_T_45 ? 3'h0 : _ctrlSignals_T_651; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_653 = _ctrlSignals_T_43 ? 3'h0 : _ctrlSignals_T_652; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_654 = _ctrlSignals_T_41 ? 3'h0 : _ctrlSignals_T_653; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_655 = _ctrlSignals_T_39 ? 3'h0 : _ctrlSignals_T_654; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_656 = _ctrlSignals_T_37 ? 3'h0 : _ctrlSignals_T_655; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_657 = _ctrlSignals_T_35 ? 3'h0 : _ctrlSignals_T_656; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_658 = _ctrlSignals_T_33 ? 3'h0 : _ctrlSignals_T_657; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_659 = _ctrlSignals_T_31 ? 3'h0 : _ctrlSignals_T_658; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_660 = _ctrlSignals_T_29 ? 3'h0 : _ctrlSignals_T_659; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_661 = _ctrlSignals_T_27 ? 3'h0 : _ctrlSignals_T_660; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_662 = _ctrlSignals_T_25 ? 3'h0 : _ctrlSignals_T_661; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_663 = _ctrlSignals_T_23 ? 3'h0 : _ctrlSignals_T_662; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_664 = _ctrlSignals_T_21 ? 3'h0 : _ctrlSignals_T_663; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_665 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_664; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_666 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_665; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_667 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_666; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_668 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_667; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_669 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_668; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_670 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_669; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_671 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_670; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_672 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_671; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_673 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_672; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_674 = _ctrlSignals_T_97 ? 1'h0 : 1'h1; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_675 = _ctrlSignals_T_95 ? 1'h0 : _ctrlSignals_T_674; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_676 = _ctrlSignals_T_93 ? 1'h0 : _ctrlSignals_T_675; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_677 = _ctrlSignals_T_91 ? 1'h0 : _ctrlSignals_T_676; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_678 = _ctrlSignals_T_89 ? 1'h0 : _ctrlSignals_T_677; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_679 = _ctrlSignals_T_87 ? 1'h0 : _ctrlSignals_T_678; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_680 = _ctrlSignals_T_85 ? 1'h0 : _ctrlSignals_T_679; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_681 = _ctrlSignals_T_83 ? 1'h0 : _ctrlSignals_T_680; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_682 = _ctrlSignals_T_81 ? 1'h0 : _ctrlSignals_T_681; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_683 = _ctrlSignals_T_79 ? 1'h0 : _ctrlSignals_T_682; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_684 = _ctrlSignals_T_77 ? 1'h0 : _ctrlSignals_T_683; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_685 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_684; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_686 = _ctrlSignals_T_73 ? 1'h0 : _ctrlSignals_T_685; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_687 = _ctrlSignals_T_71 ? 1'h0 : _ctrlSignals_T_686; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_688 = _ctrlSignals_T_69 ? 1'h0 : _ctrlSignals_T_687; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_689 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_688; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_690 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_689; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_691 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_690; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_692 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_691; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_693 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_692; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_694 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_693; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_695 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_694; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_696 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_695; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_697 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_696; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_698 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_697; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_699 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_698; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_700 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_699; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_701 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_700; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_702 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_701; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_703 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_702; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_704 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_703; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_705 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_704; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_706 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_705; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_707 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_706; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_708 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_707; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_709 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_708; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_710 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_709; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_711 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_710; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_712 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_711; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_713 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_712; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_714 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_713; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_715 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_714; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_716 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_715; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_717 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_716; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_718 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_717; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_719 = _ctrlSignals_T_7 ? 1'h0 : _ctrlSignals_T_718; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_720 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_719; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_721 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_720; // @[Lookup.scala 34:39]
  assign io_pc_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_145; // @[Lookup.scala 34:39]
  assign io_inst_kill = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_433; // @[Lookup.scala 34:39]
  assign io_A_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_193; // @[Lookup.scala 34:39]
  assign io_B_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_241; // @[Lookup.scala 34:39]
  assign io_imm_sel = _ctrlSignals_T_1 ? 3'h3 : _ctrlSignals_T_289; // @[Lookup.scala 34:39]
  assign io_alu_op = _ctrlSignals_T_1 ? 4'hb : _ctrlSignals_T_337; // @[Lookup.scala 34:39]
  assign io_br_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_385; // @[Lookup.scala 34:39]
  assign io_st_type = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_481; // @[Lookup.scala 34:39]
  assign io_ld_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_529; // @[Lookup.scala 34:39]
  assign io_wb_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_577; // @[Lookup.scala 34:39]
  assign io_wb_en = _ctrlSignals_T_1 | (_ctrlSignals_T_3 | (_ctrlSignals_T_5 | (_ctrlSignals_T_7 | _ctrlSignals_T_622)))
    ; // @[Lookup.scala 34:39]
  assign io_csr_cmd = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_673; // @[Lookup.scala 34:39]
  assign io_illegal = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_721; // @[Lookup.scala 34:39]
  assign _ctrlSignals_T_31_0 = _ctrlSignals_T_31;
  assign _ctrlSignals_T_93_0 = _ctrlSignals_T_93;
  assign _ctrlSignals_T_87_0 = _ctrlSignals_T_87;
  assign _ctrlSignals_T_81_0 = _ctrlSignals_T_81;
  assign _ctrlSignals_T_15_0 = _ctrlSignals_T_15;
  assign _ctrlSignals_T_49_0 = _ctrlSignals_T_49;
  assign _ctrlSignals_T_5_0 = _ctrlSignals_T_5;
  assign _ctrlSignals_T_41_0 = _ctrlSignals_T_41;
  assign _ctrlSignals_T_11_0 = _ctrlSignals_T_11;
  assign _ctrlSignals_T_19_0 = _ctrlSignals_T_19;
  assign _ctrlSignals_T_95_0 = _ctrlSignals_T_95;
  assign _ctrlSignals_T_21_0 = _ctrlSignals_T_21;
  assign _ctrlSignals_T_47_0 = _ctrlSignals_T_47;
  assign _ctrlSignals_T_35_0 = _ctrlSignals_T_35;
  assign _ctrlSignals_T_75_0 = _ctrlSignals_T_75;
  assign _ctrlSignals_T_25_0 = _ctrlSignals_T_25;
  assign _ctrlSignals_T_55_0 = _ctrlSignals_T_55;
  assign _ctrlSignals_T_71_0 = _ctrlSignals_T_71;
  assign _ctrlSignals_T_27_0 = _ctrlSignals_T_27;
  assign _ctrlSignals_T_59_0 = _ctrlSignals_T_59;
  assign _ctrlSignals_T_29_0 = _ctrlSignals_T_29;
  assign _ctrlSignals_T_39_0 = _ctrlSignals_T_39;
  assign _ctrlSignals_T_1_0 = _ctrlSignals_T_1;
  assign _ctrlSignals_T_63_0 = _ctrlSignals_T_63;
  assign _ctrlSignals_T_97_0 = _ctrlSignals_T_97;
  assign _ctrlSignals_T_23_0 = _ctrlSignals_T_23;
  assign _ctrlSignals_T_65_0 = _ctrlSignals_T_65;
  assign _ctrlSignals_T_89_0 = _ctrlSignals_T_89;
  assign _ctrlSignals_T_51_0 = _ctrlSignals_T_51;
  assign _ctrlSignals_T_83_0 = _ctrlSignals_T_83;
  assign _ctrlSignals_T_77_0 = _ctrlSignals_T_77;
  assign _ctrlSignals_T_85_0 = _ctrlSignals_T_85;
  assign _ctrlSignals_T_37_0 = _ctrlSignals_T_37;
  assign _ctrlSignals_T_67_0 = _ctrlSignals_T_67;
  assign _ctrlSignals_T_91_0 = _ctrlSignals_T_91;
  assign _ctrlSignals_T_43_0 = _ctrlSignals_T_43;
  assign _ctrlSignals_T_17_0 = _ctrlSignals_T_17;
  assign _ctrlSignals_T_9_0 = _ctrlSignals_T_9;
  assign _ctrlSignals_T_79_0 = _ctrlSignals_T_79;
  assign _ctrlSignals_T_33_0 = _ctrlSignals_T_33;
  assign _ctrlSignals_T_45_0 = _ctrlSignals_T_45;
  assign _ctrlSignals_T_13_0 = _ctrlSignals_T_13;
  assign _ctrlSignals_T_53_0 = _ctrlSignals_T_53;
  assign _ctrlSignals_T_69_0 = _ctrlSignals_T_69;
  assign _ctrlSignals_T_3_0 = _ctrlSignals_T_3;
  assign _ctrlSignals_T_7_0 = _ctrlSignals_T_7;
  assign _ctrlSignals_T_73_0 = _ctrlSignals_T_73;
  assign _ctrlSignals_T_57_0 = _ctrlSignals_T_57;
  assign _ctrlSignals_T_61_0 = _ctrlSignals_T_61;
endmodule
module Core(
  input         clock,
  input         reset,
  output        io_icache_req_valid,
  output [31:0] io_icache_req_bits_addr,
  input         io_icache_resp_valid,
  input  [31:0] io_icache_resp_bits_data,
  output        io_dcache_abort,
  output        io_dcache_req_valid,
  output [31:0] io_dcache_req_bits_addr,
  output [31:0] io_dcache_req_bits_data,
  output [3:0]  io_dcache_req_bits_mask,
  input         io_dcache_resp_valid,
  input  [31:0] io_dcache_resp_bits_data,
  output        dpath__csr___io_out_T_29_0,
  output        dpath__csr___T_0,
  output        dpath__csr__isInstRet_0,
  output        dpath__csr___T_10_0,
  output        dpath__csr___T_7_0,
  output        dpath__csr___io_out_T_33_0,
  output        dpath__csr___T_23_0,
  output        dpath__csr___io_out_T_25_0,
  output        dpath__csr___T_6_0,
  output        dpath__csr___io_out_T_31_0,
  output        dpath__csr___wdata_T_3_0,
  output        dpath__csr__privInst_0,
  output        dpath__csr___T_16_0,
  output        dpath__csr__isEret_0,
  output        dpath__csr___io_out_T_41_0,
  output        dpath__csr___io_out_T_1_0,
  output        dpath__csr___io_out_T_53_0,
  output        dpath__csr__iaddrInvalid_0,
  output        dpath__csr___io_out_T_27_0,
  output        dpath__csr___io_out_T_43_0,
  output        dpath__csr___T_1_0,
  output        dpath__csr___io_out_T_35_0,
  output        dpath__csr___T_3_0,
  output        dpath__csr___T_18_0,
  output        dpath__csr__privValid_0,
  output        dpath__csr___io_expt_T_6_0,
  output        dpath__csr___isInstRet_T_0,
  output        dpath__csr___io_out_T_3_0,
  output        dpath__csr___io_out_T_7_0,
  output        dpath__csr__io_expt_0,
  output        dpath__csr___T_24_0,
  output        dpath__csr___wen_T_0,
  output        dpath__csr___T_21_0,
  output        dpath__csr__wen_0,
  output        dpath__csr___T_13_0,
  output        dpath__csr___T_8_0,
  output        dpath__csr___io_out_T_47_0,
  output        dpath__csr___io_out_T_19_0,
  output        dpath__csr___T_12_0,
  output        dpath__csr___io_out_T_9_0,
  output        dpath__csr___csrRO_T_4_0,
  output        dpath__csr___io_out_T_5_0,
  output        dpath__csr___isEcall_T_1_0,
  output        dpath__csr___wdata_T_5_0,
  output        dpath__csr___laddrInvalid_T_6_0,
  output        dpath__csr___T_17_0,
  output        dpath__csr___laddrInvalid_T_8_0,
  output        dpath__csr___io_out_T_45_0,
  output        dpath__csr___io_out_T_17_0,
  output        dpath__csr___io_out_T_13_0,
  output        dpath__csr___io_out_T_11_0,
  output        dpath__csr___T_20_0,
  output        dpath__csr___T_14_0,
  output        dpath__csr___io_out_T_55_0,
  output        dpath__csr___io_out_T_39_0,
  output        dpath__csr___io_out_T_51_0,
  output        dpath__csr__laddrInvalid_0,
  output        dpath__csr___io_out_T_23_0,
  output        dpath__csr___isInstRet_T_1_0,
  output        dpath__csr___io_expt_T_5_0,
  output        dpath__csr___isEcall_T_4_0,
  output        dpath__csr___csrRO_T_2_0,
  output        dpath__csr___saddrInvalid_T_3_0,
  output        dpath__csr__isEcall_0,
  output        dpath__csr__isEbreak_0,
  output        dpath__csr___io_out_T_49_0,
  output        dpath__csr___T_11_0,
  output        dpath__csr___wdata_T_7_0,
  output        dpath__csr___isInstRet_T_5_0,
  output        dpath__csr___io_out_T_37_0,
  output        dpath__csr___saddrInvalid_T_5_0,
  output        dpath__csr___T_22_0,
  output        dpath__csr___io_out_T_57_0,
  output        dpath__csr___laddrInvalid_T_4_0,
  output        dpath__csr___T_9_0,
  output        dpath__csr___T_15_0,
  output        dpath__csr__saddrInvalid_0,
  output        dpath__csr___T_19_0,
  output        dpath__csr___io_out_T_21_0,
  output        dpath__csr___io_out_T_15_0,
  output        dpath__regFile___T_1_0,
  output        dpath__regFile___io_rdata2_T_0,
  output        dpath__regFile___io_rdata1_T_0,
  output        dpath__alu___out_T_1_0,
  output        dpath__alu___cmp_T_4_0,
  output        dpath__alu___out_T_0,
  output        dpath__alu___out_T_10_0,
  output        dpath__alu___out_T_12_0,
  output        dpath__alu___shin_T_0,
  output        dpath__alu___out_T_9_0,
  output        dpath__alu___out_T_4_0,
  output        dpath__alu___out_T_3_0,
  output        dpath__alu___out_T_14_0,
  output        dpath__alu___out_T_6_0,
  output        dpath__alu___out_T_7_0,
  output        dpath__alu___out_T_8_0,
  output        dpath__alu___cmp_T_2_0,
  output        dpath__alu___sum_T_0,
  output        dpath__alu___out_T_5_0,
  output        dpath__alu___out_T_2_0,
  output        dpath__alu___out_T_16_0,
  output        dpath__immGen___io_out_T_2_0,
  output        dpath__immGen___io_out_T_4_0,
  output        dpath__immGen___io_out_T_6_0,
  output        dpath__immGen___io_out_T_12_0,
  output        dpath__immGen___io_out_T_8_0,
  output        dpath__immGen___io_out_T_10_0,
  output        dpath__brCond__isSameSign_0,
  output        dpath__brCond__eq_0,
  output        dpath__brCond___io_taken_T_5_0,
  output        dpath__brCond___io_taken_T_0,
  output        dpath__brCond___io_taken_T_11_0,
  output        dpath__brCond___io_taken_T_8_0,
  output        dpath__brCond___io_taken_T_14_0,
  output        dpath__brCond___io_taken_T_2_0,
  output        dpath__brCond__geu_0,
  output        dpath__brCond__ge_0,
  output        dpath___io_dcache_req_bits_mask_T_7_0,
  output        dpath___npc_T_2_0,
  output        dpath___inst_T_2_0,
  output        dpath___rs1_T_0,
  output        dpath___T_6_0,
  output        dpath__io_ctrl_A_sel_0,
  output        dpath___npc_T_5_0,
  output        dpath___io_icache_req_valid_T_0,
  output        dpath__io_ctrl_B_sel_0,
  output        dpath___regWrite_T_9_0,
  output        dpath___stall_T_1_0,
  output        dpath__csr__io_expt,
  output        dpath___regWrite_T_7_0,
  output        dpath___stall_T_0,
  output        dpath___rs1hazard_T_2_0,
  output        dpath___load_T_13_0,
  output        dpath___load_T_11_0,
  output        dpath___rs1_T_1_0,
  output        dpath__stall_0,
  output        dpath___io_dcache_req_bits_mask_T_9_0,
  output        dpath___load_T_15_0,
  output        dpath___io_dcache_req_bits_mask_T_5_0,
  output        dpath___rs2hazard_T_2_0,
  output        dpath___csr_in_T_0,
  output        dpath___npc_T_0,
  output        dpath___regWrite_T_5_0,
  output        dpath___npc_T_1_0,
  output        dpath___rs2_T_1_0,
  output        dpath___load_T_9_0,
  output        dpath___T_4_0,
  output        dpath___T_7_0,
  output        ctrl___ctrlSignals_T_31_0,
  output        ctrl___ctrlSignals_T_93_0,
  output        ctrl___ctrlSignals_T_87_0,
  output        ctrl___ctrlSignals_T_81_0,
  output        ctrl___ctrlSignals_T_15_0,
  output        ctrl___ctrlSignals_T_49_0,
  output        ctrl___ctrlSignals_T_5_0,
  output        ctrl___ctrlSignals_T_41_0,
  output        ctrl___ctrlSignals_T_11_0,
  output        ctrl___ctrlSignals_T_19_0,
  output        ctrl___ctrlSignals_T_95_0,
  output        ctrl___ctrlSignals_T_21_0,
  output        ctrl___ctrlSignals_T_47_0,
  output        ctrl___ctrlSignals_T_35_0,
  output        ctrl___ctrlSignals_T_75_0,
  output        ctrl___ctrlSignals_T_25_0,
  output        ctrl___ctrlSignals_T_55_0,
  output        ctrl___ctrlSignals_T_71_0,
  output        ctrl___ctrlSignals_T_27_0,
  output        ctrl___ctrlSignals_T_59_0,
  output        ctrl___ctrlSignals_T_29_0,
  output        ctrl___ctrlSignals_T_39_0,
  output        ctrl___ctrlSignals_T_1_0,
  output        ctrl___ctrlSignals_T_63_0,
  output        ctrl___ctrlSignals_T_97_0,
  output        ctrl___ctrlSignals_T_23_0,
  output        ctrl___ctrlSignals_T_65_0,
  output        ctrl___ctrlSignals_T_89_0,
  output        ctrl___ctrlSignals_T_51_0,
  output        ctrl___ctrlSignals_T_83_0,
  output        ctrl___ctrlSignals_T_77_0,
  output        ctrl___ctrlSignals_T_85_0,
  output        ctrl___ctrlSignals_T_37_0,
  output        ctrl___ctrlSignals_T_67_0,
  output        ctrl___ctrlSignals_T_91_0,
  output        ctrl___ctrlSignals_T_43_0,
  output        ctrl___ctrlSignals_T_17_0,
  output        ctrl___ctrlSignals_T_9_0,
  output        ctrl___ctrlSignals_T_79_0,
  output        ctrl___ctrlSignals_T_33_0,
  output        ctrl___ctrlSignals_T_45_0,
  output        ctrl___ctrlSignals_T_13_0,
  output        ctrl___ctrlSignals_T_53_0,
  output        ctrl___ctrlSignals_T_69_0,
  output        ctrl___ctrlSignals_T_3_0,
  output        ctrl___ctrlSignals_T_7_0,
  output        ctrl___ctrlSignals_T_73_0,
  output        ctrl___ctrlSignals_T_57_0,
  output        ctrl___ctrlSignals_T_61_0
);
  wire  dpath_clock; // @[Core.scala 27:21]
  wire  dpath_reset; // @[Core.scala 27:21]
  wire  dpath_io_icache_req_valid; // @[Core.scala 27:21]
  wire [31:0] dpath_io_icache_req_bits_addr; // @[Core.scala 27:21]
  wire  dpath_io_icache_resp_valid; // @[Core.scala 27:21]
  wire [31:0] dpath_io_icache_resp_bits_data; // @[Core.scala 27:21]
  wire  dpath_io_dcache_abort; // @[Core.scala 27:21]
  wire  dpath_io_dcache_req_valid; // @[Core.scala 27:21]
  wire [31:0] dpath_io_dcache_req_bits_addr; // @[Core.scala 27:21]
  wire [31:0] dpath_io_dcache_req_bits_data; // @[Core.scala 27:21]
  wire [3:0] dpath_io_dcache_req_bits_mask; // @[Core.scala 27:21]
  wire  dpath_io_dcache_resp_valid; // @[Core.scala 27:21]
  wire [31:0] dpath_io_dcache_resp_bits_data; // @[Core.scala 27:21]
  wire [31:0] dpath_io_ctrl_inst; // @[Core.scala 27:21]
  wire [1:0] dpath_io_ctrl_pc_sel; // @[Core.scala 27:21]
  wire  dpath_io_ctrl_inst_kill; // @[Core.scala 27:21]
  wire  dpath_io_ctrl_A_sel; // @[Core.scala 27:21]
  wire  dpath_io_ctrl_B_sel; // @[Core.scala 27:21]
  wire [2:0] dpath_io_ctrl_imm_sel; // @[Core.scala 27:21]
  wire [3:0] dpath_io_ctrl_alu_op; // @[Core.scala 27:21]
  wire [2:0] dpath_io_ctrl_br_type; // @[Core.scala 27:21]
  wire [1:0] dpath_io_ctrl_st_type; // @[Core.scala 27:21]
  wire [2:0] dpath_io_ctrl_ld_type; // @[Core.scala 27:21]
  wire [1:0] dpath_io_ctrl_wb_sel; // @[Core.scala 27:21]
  wire  dpath_io_ctrl_wb_en; // @[Core.scala 27:21]
  wire [2:0] dpath_io_ctrl_csr_cmd; // @[Core.scala 27:21]
  wire  dpath_io_ctrl_illegal; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_29_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_0; // @[Core.scala 27:21]
  wire  dpath_csr__isInstRet_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_10_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_7_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_33_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_23_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_25_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_6_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_31_0; // @[Core.scala 27:21]
  wire  dpath_csr___wdata_T_3_0; // @[Core.scala 27:21]
  wire  dpath_csr__privInst_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_16_0; // @[Core.scala 27:21]
  wire  dpath_csr__isEret_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_41_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_1_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_53_0; // @[Core.scala 27:21]
  wire  dpath_csr__iaddrInvalid_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_27_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_43_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_1_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_35_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_3_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_18_0; // @[Core.scala 27:21]
  wire  dpath_csr__privValid_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_expt_T_6_0; // @[Core.scala 27:21]
  wire  dpath_csr___isInstRet_T_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_3_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_7_0; // @[Core.scala 27:21]
  wire  dpath_csr__io_expt_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_24_0; // @[Core.scala 27:21]
  wire  dpath_csr___wen_T_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_21_0; // @[Core.scala 27:21]
  wire  dpath_csr__wen_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_13_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_8_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_47_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_19_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_12_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_9_0; // @[Core.scala 27:21]
  wire  dpath_csr___csrRO_T_4_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_5_0; // @[Core.scala 27:21]
  wire  dpath_csr___isEcall_T_1_0; // @[Core.scala 27:21]
  wire  dpath_csr___wdata_T_5_0; // @[Core.scala 27:21]
  wire  dpath_csr___laddrInvalid_T_6_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_17_0; // @[Core.scala 27:21]
  wire  dpath_csr___laddrInvalid_T_8_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_45_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_17_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_13_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_11_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_20_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_14_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_55_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_39_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_51_0; // @[Core.scala 27:21]
  wire  dpath_csr__laddrInvalid_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_23_0; // @[Core.scala 27:21]
  wire  dpath_csr___isInstRet_T_1_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_expt_T_5_0; // @[Core.scala 27:21]
  wire  dpath_csr___isEcall_T_4_0; // @[Core.scala 27:21]
  wire  dpath_csr___csrRO_T_2_0; // @[Core.scala 27:21]
  wire  dpath_csr___saddrInvalid_T_3_0; // @[Core.scala 27:21]
  wire  dpath_csr__isEcall_0; // @[Core.scala 27:21]
  wire  dpath_csr__isEbreak_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_49_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_11_0; // @[Core.scala 27:21]
  wire  dpath_csr___wdata_T_7_0; // @[Core.scala 27:21]
  wire  dpath_csr___isInstRet_T_5_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_37_0; // @[Core.scala 27:21]
  wire  dpath_csr___saddrInvalid_T_5_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_22_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_57_0; // @[Core.scala 27:21]
  wire  dpath_csr___laddrInvalid_T_4_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_9_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_15_0; // @[Core.scala 27:21]
  wire  dpath_csr__saddrInvalid_0; // @[Core.scala 27:21]
  wire  dpath_csr___T_19_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_21_0; // @[Core.scala 27:21]
  wire  dpath_csr___io_out_T_15_0; // @[Core.scala 27:21]
  wire  dpath_regFile___T_1_0; // @[Core.scala 27:21]
  wire  dpath_regFile___io_rdata2_T_0; // @[Core.scala 27:21]
  wire  dpath_regFile___io_rdata1_T_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_1_0; // @[Core.scala 27:21]
  wire  dpath_alu___cmp_T_4_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_10_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_12_0; // @[Core.scala 27:21]
  wire  dpath_alu___shin_T_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_9_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_4_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_3_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_14_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_6_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_7_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_8_0; // @[Core.scala 27:21]
  wire  dpath_alu___cmp_T_2_0; // @[Core.scala 27:21]
  wire  dpath_alu___sum_T_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_5_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_2_0; // @[Core.scala 27:21]
  wire  dpath_alu___out_T_16_0; // @[Core.scala 27:21]
  wire  dpath_immGen___io_out_T_2_0; // @[Core.scala 27:21]
  wire  dpath_immGen___io_out_T_4_0; // @[Core.scala 27:21]
  wire  dpath_immGen___io_out_T_6_0; // @[Core.scala 27:21]
  wire  dpath_immGen___io_out_T_12_0; // @[Core.scala 27:21]
  wire  dpath_immGen___io_out_T_8_0; // @[Core.scala 27:21]
  wire  dpath_immGen___io_out_T_10_0; // @[Core.scala 27:21]
  wire  dpath_brCond__isSameSign_0; // @[Core.scala 27:21]
  wire  dpath_brCond__eq_0; // @[Core.scala 27:21]
  wire  dpath_brCond___io_taken_T_5_0; // @[Core.scala 27:21]
  wire  dpath_brCond___io_taken_T_0; // @[Core.scala 27:21]
  wire  dpath_brCond___io_taken_T_11_0; // @[Core.scala 27:21]
  wire  dpath_brCond___io_taken_T_8_0; // @[Core.scala 27:21]
  wire  dpath_brCond___io_taken_T_14_0; // @[Core.scala 27:21]
  wire  dpath_brCond___io_taken_T_2_0; // @[Core.scala 27:21]
  wire  dpath_brCond__geu_0; // @[Core.scala 27:21]
  wire  dpath_brCond__ge_0; // @[Core.scala 27:21]
  wire  dpath__io_dcache_req_bits_mask_T_7_0; // @[Core.scala 27:21]
  wire  dpath__npc_T_2_0; // @[Core.scala 27:21]
  wire  dpath__inst_T_2_0; // @[Core.scala 27:21]
  wire  dpath__rs1_T_0; // @[Core.scala 27:21]
  wire  dpath__T_6_0; // @[Core.scala 27:21]
  wire  dpath_io_ctrl_A_sel_0; // @[Core.scala 27:21]
  wire  dpath__npc_T_5_0; // @[Core.scala 27:21]
  wire  dpath__io_icache_req_valid_T_0; // @[Core.scala 27:21]
  wire  dpath_io_ctrl_B_sel_0; // @[Core.scala 27:21]
  wire  dpath__regWrite_T_9_0; // @[Core.scala 27:21]
  wire  dpath__stall_T_1_0; // @[Core.scala 27:21]
  wire  dpath_csr__io_expt; // @[Core.scala 27:21]
  wire  dpath__regWrite_T_7_0; // @[Core.scala 27:21]
  wire  dpath__stall_T_0; // @[Core.scala 27:21]
  wire  dpath__rs1hazard_T_2_0; // @[Core.scala 27:21]
  wire  dpath__load_T_13_0; // @[Core.scala 27:21]
  wire  dpath__load_T_11_0; // @[Core.scala 27:21]
  wire  dpath__rs1_T_1_0; // @[Core.scala 27:21]
  wire  dpath_stall_0; // @[Core.scala 27:21]
  wire  dpath__io_dcache_req_bits_mask_T_9_0; // @[Core.scala 27:21]
  wire  dpath__load_T_15_0; // @[Core.scala 27:21]
  wire  dpath__io_dcache_req_bits_mask_T_5_0; // @[Core.scala 27:21]
  wire  dpath__rs2hazard_T_2_0; // @[Core.scala 27:21]
  wire  dpath__csr_in_T_0; // @[Core.scala 27:21]
  wire  dpath__npc_T_0; // @[Core.scala 27:21]
  wire  dpath__regWrite_T_5_0; // @[Core.scala 27:21]
  wire  dpath__npc_T_1_0; // @[Core.scala 27:21]
  wire  dpath__rs2_T_1_0; // @[Core.scala 27:21]
  wire  dpath__load_T_9_0; // @[Core.scala 27:21]
  wire  dpath__T_4_0; // @[Core.scala 27:21]
  wire  dpath__T_7_0; // @[Core.scala 27:21]
  wire [31:0] ctrl_io_inst; // @[Core.scala 28:20]
  wire [1:0] ctrl_io_pc_sel; // @[Core.scala 28:20]
  wire  ctrl_io_inst_kill; // @[Core.scala 28:20]
  wire  ctrl_io_A_sel; // @[Core.scala 28:20]
  wire  ctrl_io_B_sel; // @[Core.scala 28:20]
  wire [2:0] ctrl_io_imm_sel; // @[Core.scala 28:20]
  wire [3:0] ctrl_io_alu_op; // @[Core.scala 28:20]
  wire [2:0] ctrl_io_br_type; // @[Core.scala 28:20]
  wire [1:0] ctrl_io_st_type; // @[Core.scala 28:20]
  wire [2:0] ctrl_io_ld_type; // @[Core.scala 28:20]
  wire [1:0] ctrl_io_wb_sel; // @[Core.scala 28:20]
  wire  ctrl_io_wb_en; // @[Core.scala 28:20]
  wire [2:0] ctrl_io_csr_cmd; // @[Core.scala 28:20]
  wire  ctrl_io_illegal; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_31_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_93_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_87_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_81_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_15_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_49_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_5_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_41_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_11_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_19_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_95_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_21_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_47_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_35_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_75_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_25_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_55_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_71_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_27_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_59_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_29_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_39_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_1_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_63_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_97_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_23_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_65_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_89_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_51_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_83_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_77_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_85_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_37_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_67_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_91_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_43_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_17_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_9_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_79_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_33_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_45_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_13_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_53_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_69_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_3_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_7_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_73_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_57_0; // @[Core.scala 28:20]
  wire  ctrl__ctrlSignals_T_61_0; // @[Core.scala 28:20]
  Datapath dpath ( // @[Core.scala 27:21]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_icache_req_valid(dpath_io_icache_req_valid),
    .io_icache_req_bits_addr(dpath_io_icache_req_bits_addr),
    .io_icache_resp_valid(dpath_io_icache_resp_valid),
    .io_icache_resp_bits_data(dpath_io_icache_resp_bits_data),
    .io_dcache_abort(dpath_io_dcache_abort),
    .io_dcache_req_valid(dpath_io_dcache_req_valid),
    .io_dcache_req_bits_addr(dpath_io_dcache_req_bits_addr),
    .io_dcache_req_bits_data(dpath_io_dcache_req_bits_data),
    .io_dcache_req_bits_mask(dpath_io_dcache_req_bits_mask),
    .io_dcache_resp_valid(dpath_io_dcache_resp_valid),
    .io_dcache_resp_bits_data(dpath_io_dcache_resp_bits_data),
    .io_ctrl_inst(dpath_io_ctrl_inst),
    .io_ctrl_pc_sel(dpath_io_ctrl_pc_sel),
    .io_ctrl_inst_kill(dpath_io_ctrl_inst_kill),
    .io_ctrl_A_sel(dpath_io_ctrl_A_sel),
    .io_ctrl_B_sel(dpath_io_ctrl_B_sel),
    .io_ctrl_imm_sel(dpath_io_ctrl_imm_sel),
    .io_ctrl_alu_op(dpath_io_ctrl_alu_op),
    .io_ctrl_br_type(dpath_io_ctrl_br_type),
    .io_ctrl_st_type(dpath_io_ctrl_st_type),
    .io_ctrl_ld_type(dpath_io_ctrl_ld_type),
    .io_ctrl_wb_sel(dpath_io_ctrl_wb_sel),
    .io_ctrl_wb_en(dpath_io_ctrl_wb_en),
    .io_ctrl_csr_cmd(dpath_io_ctrl_csr_cmd),
    .io_ctrl_illegal(dpath_io_ctrl_illegal),
    .csr___io_out_T_29_0(dpath_csr___io_out_T_29_0),
    .csr___T_0(dpath_csr___T_0),
    .csr__isInstRet_0(dpath_csr__isInstRet_0),
    .csr___T_10_0(dpath_csr___T_10_0),
    .csr___T_7_0(dpath_csr___T_7_0),
    .csr___io_out_T_33_0(dpath_csr___io_out_T_33_0),
    .csr___T_23_0(dpath_csr___T_23_0),
    .csr___io_out_T_25_0(dpath_csr___io_out_T_25_0),
    .csr___T_6_0(dpath_csr___T_6_0),
    .csr___io_out_T_31_0(dpath_csr___io_out_T_31_0),
    .csr___wdata_T_3_0(dpath_csr___wdata_T_3_0),
    .csr__privInst_0(dpath_csr__privInst_0),
    .csr___T_16_0(dpath_csr___T_16_0),
    .csr__isEret_0(dpath_csr__isEret_0),
    .csr___io_out_T_41_0(dpath_csr___io_out_T_41_0),
    .csr___io_out_T_1_0(dpath_csr___io_out_T_1_0),
    .csr___io_out_T_53_0(dpath_csr___io_out_T_53_0),
    .csr__iaddrInvalid_0(dpath_csr__iaddrInvalid_0),
    .csr___io_out_T_27_0(dpath_csr___io_out_T_27_0),
    .csr___io_out_T_43_0(dpath_csr___io_out_T_43_0),
    .csr___T_1_0(dpath_csr___T_1_0),
    .csr___io_out_T_35_0(dpath_csr___io_out_T_35_0),
    .csr___T_3_0(dpath_csr___T_3_0),
    .csr___T_18_0(dpath_csr___T_18_0),
    .csr__privValid_0(dpath_csr__privValid_0),
    .csr___io_expt_T_6_0(dpath_csr___io_expt_T_6_0),
    .csr___isInstRet_T_0(dpath_csr___isInstRet_T_0),
    .csr___io_out_T_3_0(dpath_csr___io_out_T_3_0),
    .csr___io_out_T_7_0(dpath_csr___io_out_T_7_0),
    .csr__io_expt_0(dpath_csr__io_expt_0),
    .csr___T_24_0(dpath_csr___T_24_0),
    .csr___wen_T_0(dpath_csr___wen_T_0),
    .csr___T_21_0(dpath_csr___T_21_0),
    .csr__wen_0(dpath_csr__wen_0),
    .csr___T_13_0(dpath_csr___T_13_0),
    .csr___T_8_0(dpath_csr___T_8_0),
    .csr___io_out_T_47_0(dpath_csr___io_out_T_47_0),
    .csr___io_out_T_19_0(dpath_csr___io_out_T_19_0),
    .csr___T_12_0(dpath_csr___T_12_0),
    .csr___io_out_T_9_0(dpath_csr___io_out_T_9_0),
    .csr___csrRO_T_4_0(dpath_csr___csrRO_T_4_0),
    .csr___io_out_T_5_0(dpath_csr___io_out_T_5_0),
    .csr___isEcall_T_1_0(dpath_csr___isEcall_T_1_0),
    .csr___wdata_T_5_0(dpath_csr___wdata_T_5_0),
    .csr___laddrInvalid_T_6_0(dpath_csr___laddrInvalid_T_6_0),
    .csr___T_17_0(dpath_csr___T_17_0),
    .csr___laddrInvalid_T_8_0(dpath_csr___laddrInvalid_T_8_0),
    .csr___io_out_T_45_0(dpath_csr___io_out_T_45_0),
    .csr___io_out_T_17_0(dpath_csr___io_out_T_17_0),
    .csr___io_out_T_13_0(dpath_csr___io_out_T_13_0),
    .csr___io_out_T_11_0(dpath_csr___io_out_T_11_0),
    .csr___T_20_0(dpath_csr___T_20_0),
    .csr___T_14_0(dpath_csr___T_14_0),
    .csr___io_out_T_55_0(dpath_csr___io_out_T_55_0),
    .csr___io_out_T_39_0(dpath_csr___io_out_T_39_0),
    .csr___io_out_T_51_0(dpath_csr___io_out_T_51_0),
    .csr__laddrInvalid_0(dpath_csr__laddrInvalid_0),
    .csr___io_out_T_23_0(dpath_csr___io_out_T_23_0),
    .csr___isInstRet_T_1_0(dpath_csr___isInstRet_T_1_0),
    .csr___io_expt_T_5_0(dpath_csr___io_expt_T_5_0),
    .csr___isEcall_T_4_0(dpath_csr___isEcall_T_4_0),
    .csr___csrRO_T_2_0(dpath_csr___csrRO_T_2_0),
    .csr___saddrInvalid_T_3_0(dpath_csr___saddrInvalid_T_3_0),
    .csr__isEcall_0(dpath_csr__isEcall_0),
    .csr__isEbreak_0(dpath_csr__isEbreak_0),
    .csr___io_out_T_49_0(dpath_csr___io_out_T_49_0),
    .csr___T_11_0(dpath_csr___T_11_0),
    .csr___wdata_T_7_0(dpath_csr___wdata_T_7_0),
    .csr___isInstRet_T_5_0(dpath_csr___isInstRet_T_5_0),
    .csr___io_out_T_37_0(dpath_csr___io_out_T_37_0),
    .csr___saddrInvalid_T_5_0(dpath_csr___saddrInvalid_T_5_0),
    .csr___T_22_0(dpath_csr___T_22_0),
    .csr___io_out_T_57_0(dpath_csr___io_out_T_57_0),
    .csr___laddrInvalid_T_4_0(dpath_csr___laddrInvalid_T_4_0),
    .csr___T_9_0(dpath_csr___T_9_0),
    .csr___T_15_0(dpath_csr___T_15_0),
    .csr__saddrInvalid_0(dpath_csr__saddrInvalid_0),
    .csr___T_19_0(dpath_csr___T_19_0),
    .csr___io_out_T_21_0(dpath_csr___io_out_T_21_0),
    .csr___io_out_T_15_0(dpath_csr___io_out_T_15_0),
    .regFile___T_1_0(dpath_regFile___T_1_0),
    .regFile___io_rdata2_T_0(dpath_regFile___io_rdata2_T_0),
    .regFile___io_rdata1_T_0(dpath_regFile___io_rdata1_T_0),
    .alu___out_T_1_0(dpath_alu___out_T_1_0),
    .alu___cmp_T_4_0(dpath_alu___cmp_T_4_0),
    .alu___out_T_0(dpath_alu___out_T_0),
    .alu___out_T_10_0(dpath_alu___out_T_10_0),
    .alu___out_T_12_0(dpath_alu___out_T_12_0),
    .alu___shin_T_0(dpath_alu___shin_T_0),
    .alu___out_T_9_0(dpath_alu___out_T_9_0),
    .alu___out_T_4_0(dpath_alu___out_T_4_0),
    .alu___out_T_3_0(dpath_alu___out_T_3_0),
    .alu___out_T_14_0(dpath_alu___out_T_14_0),
    .alu___out_T_6_0(dpath_alu___out_T_6_0),
    .alu___out_T_7_0(dpath_alu___out_T_7_0),
    .alu___out_T_8_0(dpath_alu___out_T_8_0),
    .alu___cmp_T_2_0(dpath_alu___cmp_T_2_0),
    .alu___sum_T_0(dpath_alu___sum_T_0),
    .alu___out_T_5_0(dpath_alu___out_T_5_0),
    .alu___out_T_2_0(dpath_alu___out_T_2_0),
    .alu___out_T_16_0(dpath_alu___out_T_16_0),
    .immGen___io_out_T_2_0(dpath_immGen___io_out_T_2_0),
    .immGen___io_out_T_4_0(dpath_immGen___io_out_T_4_0),
    .immGen___io_out_T_6_0(dpath_immGen___io_out_T_6_0),
    .immGen___io_out_T_12_0(dpath_immGen___io_out_T_12_0),
    .immGen___io_out_T_8_0(dpath_immGen___io_out_T_8_0),
    .immGen___io_out_T_10_0(dpath_immGen___io_out_T_10_0),
    .brCond__isSameSign_0(dpath_brCond__isSameSign_0),
    .brCond__eq_0(dpath_brCond__eq_0),
    .brCond___io_taken_T_5_0(dpath_brCond___io_taken_T_5_0),
    .brCond___io_taken_T_0(dpath_brCond___io_taken_T_0),
    .brCond___io_taken_T_11_0(dpath_brCond___io_taken_T_11_0),
    .brCond___io_taken_T_8_0(dpath_brCond___io_taken_T_8_0),
    .brCond___io_taken_T_14_0(dpath_brCond___io_taken_T_14_0),
    .brCond___io_taken_T_2_0(dpath_brCond___io_taken_T_2_0),
    .brCond__geu_0(dpath_brCond__geu_0),
    .brCond__ge_0(dpath_brCond__ge_0),
    ._io_dcache_req_bits_mask_T_7_0(dpath__io_dcache_req_bits_mask_T_7_0),
    ._npc_T_2_0(dpath__npc_T_2_0),
    ._inst_T_2_0(dpath__inst_T_2_0),
    ._rs1_T_0(dpath__rs1_T_0),
    ._T_6_0(dpath__T_6_0),
    .io_ctrl_A_sel_0(dpath_io_ctrl_A_sel_0),
    ._npc_T_5_0(dpath__npc_T_5_0),
    ._io_icache_req_valid_T_0(dpath__io_icache_req_valid_T_0),
    .io_ctrl_B_sel_0(dpath_io_ctrl_B_sel_0),
    ._regWrite_T_9_0(dpath__regWrite_T_9_0),
    ._stall_T_1_0(dpath__stall_T_1_0),
    .csr__io_expt(dpath_csr__io_expt),
    ._regWrite_T_7_0(dpath__regWrite_T_7_0),
    ._stall_T_0(dpath__stall_T_0),
    ._rs1hazard_T_2_0(dpath__rs1hazard_T_2_0),
    ._load_T_13_0(dpath__load_T_13_0),
    ._load_T_11_0(dpath__load_T_11_0),
    ._rs1_T_1_0(dpath__rs1_T_1_0),
    .stall_0(dpath_stall_0),
    ._io_dcache_req_bits_mask_T_9_0(dpath__io_dcache_req_bits_mask_T_9_0),
    ._load_T_15_0(dpath__load_T_15_0),
    ._io_dcache_req_bits_mask_T_5_0(dpath__io_dcache_req_bits_mask_T_5_0),
    ._rs2hazard_T_2_0(dpath__rs2hazard_T_2_0),
    ._csr_in_T_0(dpath__csr_in_T_0),
    ._npc_T_0(dpath__npc_T_0),
    ._regWrite_T_5_0(dpath__regWrite_T_5_0),
    ._npc_T_1_0(dpath__npc_T_1_0),
    ._rs2_T_1_0(dpath__rs2_T_1_0),
    ._load_T_9_0(dpath__load_T_9_0),
    ._T_4_0(dpath__T_4_0),
    ._T_7_0(dpath__T_7_0)
  );
  Control ctrl ( // @[Core.scala 28:20]
    .io_inst(ctrl_io_inst),
    .io_pc_sel(ctrl_io_pc_sel),
    .io_inst_kill(ctrl_io_inst_kill),
    .io_A_sel(ctrl_io_A_sel),
    .io_B_sel(ctrl_io_B_sel),
    .io_imm_sel(ctrl_io_imm_sel),
    .io_alu_op(ctrl_io_alu_op),
    .io_br_type(ctrl_io_br_type),
    .io_st_type(ctrl_io_st_type),
    .io_ld_type(ctrl_io_ld_type),
    .io_wb_sel(ctrl_io_wb_sel),
    .io_wb_en(ctrl_io_wb_en),
    .io_csr_cmd(ctrl_io_csr_cmd),
    .io_illegal(ctrl_io_illegal),
    ._ctrlSignals_T_31_0(ctrl__ctrlSignals_T_31_0),
    ._ctrlSignals_T_93_0(ctrl__ctrlSignals_T_93_0),
    ._ctrlSignals_T_87_0(ctrl__ctrlSignals_T_87_0),
    ._ctrlSignals_T_81_0(ctrl__ctrlSignals_T_81_0),
    ._ctrlSignals_T_15_0(ctrl__ctrlSignals_T_15_0),
    ._ctrlSignals_T_49_0(ctrl__ctrlSignals_T_49_0),
    ._ctrlSignals_T_5_0(ctrl__ctrlSignals_T_5_0),
    ._ctrlSignals_T_41_0(ctrl__ctrlSignals_T_41_0),
    ._ctrlSignals_T_11_0(ctrl__ctrlSignals_T_11_0),
    ._ctrlSignals_T_19_0(ctrl__ctrlSignals_T_19_0),
    ._ctrlSignals_T_95_0(ctrl__ctrlSignals_T_95_0),
    ._ctrlSignals_T_21_0(ctrl__ctrlSignals_T_21_0),
    ._ctrlSignals_T_47_0(ctrl__ctrlSignals_T_47_0),
    ._ctrlSignals_T_35_0(ctrl__ctrlSignals_T_35_0),
    ._ctrlSignals_T_75_0(ctrl__ctrlSignals_T_75_0),
    ._ctrlSignals_T_25_0(ctrl__ctrlSignals_T_25_0),
    ._ctrlSignals_T_55_0(ctrl__ctrlSignals_T_55_0),
    ._ctrlSignals_T_71_0(ctrl__ctrlSignals_T_71_0),
    ._ctrlSignals_T_27_0(ctrl__ctrlSignals_T_27_0),
    ._ctrlSignals_T_59_0(ctrl__ctrlSignals_T_59_0),
    ._ctrlSignals_T_29_0(ctrl__ctrlSignals_T_29_0),
    ._ctrlSignals_T_39_0(ctrl__ctrlSignals_T_39_0),
    ._ctrlSignals_T_1_0(ctrl__ctrlSignals_T_1_0),
    ._ctrlSignals_T_63_0(ctrl__ctrlSignals_T_63_0),
    ._ctrlSignals_T_97_0(ctrl__ctrlSignals_T_97_0),
    ._ctrlSignals_T_23_0(ctrl__ctrlSignals_T_23_0),
    ._ctrlSignals_T_65_0(ctrl__ctrlSignals_T_65_0),
    ._ctrlSignals_T_89_0(ctrl__ctrlSignals_T_89_0),
    ._ctrlSignals_T_51_0(ctrl__ctrlSignals_T_51_0),
    ._ctrlSignals_T_83_0(ctrl__ctrlSignals_T_83_0),
    ._ctrlSignals_T_77_0(ctrl__ctrlSignals_T_77_0),
    ._ctrlSignals_T_85_0(ctrl__ctrlSignals_T_85_0),
    ._ctrlSignals_T_37_0(ctrl__ctrlSignals_T_37_0),
    ._ctrlSignals_T_67_0(ctrl__ctrlSignals_T_67_0),
    ._ctrlSignals_T_91_0(ctrl__ctrlSignals_T_91_0),
    ._ctrlSignals_T_43_0(ctrl__ctrlSignals_T_43_0),
    ._ctrlSignals_T_17_0(ctrl__ctrlSignals_T_17_0),
    ._ctrlSignals_T_9_0(ctrl__ctrlSignals_T_9_0),
    ._ctrlSignals_T_79_0(ctrl__ctrlSignals_T_79_0),
    ._ctrlSignals_T_33_0(ctrl__ctrlSignals_T_33_0),
    ._ctrlSignals_T_45_0(ctrl__ctrlSignals_T_45_0),
    ._ctrlSignals_T_13_0(ctrl__ctrlSignals_T_13_0),
    ._ctrlSignals_T_53_0(ctrl__ctrlSignals_T_53_0),
    ._ctrlSignals_T_69_0(ctrl__ctrlSignals_T_69_0),
    ._ctrlSignals_T_3_0(ctrl__ctrlSignals_T_3_0),
    ._ctrlSignals_T_7_0(ctrl__ctrlSignals_T_7_0),
    ._ctrlSignals_T_73_0(ctrl__ctrlSignals_T_73_0),
    ._ctrlSignals_T_57_0(ctrl__ctrlSignals_T_57_0),
    ._ctrlSignals_T_61_0(ctrl__ctrlSignals_T_61_0)
  );
  assign io_icache_req_valid = dpath_io_icache_req_valid; // @[Core.scala 31:19]
  assign io_icache_req_bits_addr = dpath_io_icache_req_bits_addr; // @[Core.scala 31:19]
  assign io_dcache_abort = dpath_io_dcache_abort; // @[Core.scala 32:19]
  assign io_dcache_req_valid = dpath_io_dcache_req_valid; // @[Core.scala 32:19]
  assign io_dcache_req_bits_addr = dpath_io_dcache_req_bits_addr; // @[Core.scala 32:19]
  assign io_dcache_req_bits_data = dpath_io_dcache_req_bits_data; // @[Core.scala 32:19]
  assign io_dcache_req_bits_mask = dpath_io_dcache_req_bits_mask; // @[Core.scala 32:19]
  assign dpath_clock = clock;
  assign dpath_reset = reset;
  assign dpath_io_icache_resp_valid = io_icache_resp_valid; // @[Core.scala 31:19]
  assign dpath_io_icache_resp_bits_data = io_icache_resp_bits_data; // @[Core.scala 31:19]
  assign dpath_io_dcache_resp_valid = io_dcache_resp_valid; // @[Core.scala 32:19]
  assign dpath_io_dcache_resp_bits_data = io_dcache_resp_bits_data; // @[Core.scala 32:19]
  assign dpath_io_ctrl_pc_sel = ctrl_io_pc_sel; // @[Core.scala 33:17]
  assign dpath_io_ctrl_inst_kill = ctrl_io_inst_kill; // @[Core.scala 33:17]
  assign dpath_io_ctrl_A_sel = ctrl_io_A_sel; // @[Core.scala 33:17]
  assign dpath_io_ctrl_B_sel = ctrl_io_B_sel; // @[Core.scala 33:17]
  assign dpath_io_ctrl_imm_sel = ctrl_io_imm_sel; // @[Core.scala 33:17]
  assign dpath_io_ctrl_alu_op = ctrl_io_alu_op; // @[Core.scala 33:17]
  assign dpath_io_ctrl_br_type = ctrl_io_br_type; // @[Core.scala 33:17]
  assign dpath_io_ctrl_st_type = ctrl_io_st_type; // @[Core.scala 33:17]
  assign dpath_io_ctrl_ld_type = ctrl_io_ld_type; // @[Core.scala 33:17]
  assign dpath_io_ctrl_wb_sel = ctrl_io_wb_sel; // @[Core.scala 33:17]
  assign dpath_io_ctrl_wb_en = ctrl_io_wb_en; // @[Core.scala 33:17]
  assign dpath_io_ctrl_csr_cmd = ctrl_io_csr_cmd; // @[Core.scala 33:17]
  assign dpath_io_ctrl_illegal = ctrl_io_illegal; // @[Core.scala 33:17]
  assign ctrl_io_inst = dpath_io_ctrl_inst; // @[Core.scala 33:17]
  assign dpath__csr___io_out_T_29_0 = dpath_csr___io_out_T_29_0;
  assign dpath__csr___T_0 = dpath_csr___T_0;
  assign dpath__csr__isInstRet_0 = dpath_csr__isInstRet_0;
  assign dpath__csr___T_10_0 = dpath_csr___T_10_0;
  assign dpath__csr___T_7_0 = dpath_csr___T_7_0;
  assign dpath__csr___io_out_T_33_0 = dpath_csr___io_out_T_33_0;
  assign dpath__csr___T_23_0 = dpath_csr___T_23_0;
  assign dpath__csr___io_out_T_25_0 = dpath_csr___io_out_T_25_0;
  assign dpath__csr___T_6_0 = dpath_csr___T_6_0;
  assign dpath__csr___io_out_T_31_0 = dpath_csr___io_out_T_31_0;
  assign dpath__csr___wdata_T_3_0 = dpath_csr___wdata_T_3_0;
  assign dpath__csr__privInst_0 = dpath_csr__privInst_0;
  assign dpath__csr___T_16_0 = dpath_csr___T_16_0;
  assign dpath__csr__isEret_0 = dpath_csr__isEret_0;
  assign dpath__csr___io_out_T_41_0 = dpath_csr___io_out_T_41_0;
  assign dpath__csr___io_out_T_1_0 = dpath_csr___io_out_T_1_0;
  assign dpath__csr___io_out_T_53_0 = dpath_csr___io_out_T_53_0;
  assign dpath__csr__iaddrInvalid_0 = dpath_csr__iaddrInvalid_0;
  assign dpath__csr___io_out_T_27_0 = dpath_csr___io_out_T_27_0;
  assign dpath__csr___io_out_T_43_0 = dpath_csr___io_out_T_43_0;
  assign dpath__csr___T_1_0 = dpath_csr___T_1_0;
  assign dpath__csr___io_out_T_35_0 = dpath_csr___io_out_T_35_0;
  assign dpath__csr___T_3_0 = dpath_csr___T_3_0;
  assign dpath__csr___T_18_0 = dpath_csr___T_18_0;
  assign dpath__csr__privValid_0 = dpath_csr__privValid_0;
  assign dpath__csr___io_expt_T_6_0 = dpath_csr___io_expt_T_6_0;
  assign dpath__csr___isInstRet_T_0 = dpath_csr___isInstRet_T_0;
  assign dpath__csr___io_out_T_3_0 = dpath_csr___io_out_T_3_0;
  assign dpath__csr___io_out_T_7_0 = dpath_csr___io_out_T_7_0;
  assign dpath__csr__io_expt_0 = dpath_csr__io_expt_0;
  assign dpath__csr___T_24_0 = dpath_csr___T_24_0;
  assign dpath__csr___wen_T_0 = dpath_csr___wen_T_0;
  assign dpath__csr___T_21_0 = dpath_csr___T_21_0;
  assign dpath__csr__wen_0 = dpath_csr__wen_0;
  assign dpath__csr___T_13_0 = dpath_csr___T_13_0;
  assign dpath__csr___T_8_0 = dpath_csr___T_8_0;
  assign dpath__csr___io_out_T_47_0 = dpath_csr___io_out_T_47_0;
  assign dpath__csr___io_out_T_19_0 = dpath_csr___io_out_T_19_0;
  assign dpath__csr___T_12_0 = dpath_csr___T_12_0;
  assign dpath__csr___io_out_T_9_0 = dpath_csr___io_out_T_9_0;
  assign dpath__csr___csrRO_T_4_0 = dpath_csr___csrRO_T_4_0;
  assign dpath__csr___io_out_T_5_0 = dpath_csr___io_out_T_5_0;
  assign dpath__csr___isEcall_T_1_0 = dpath_csr___isEcall_T_1_0;
  assign dpath__csr___wdata_T_5_0 = dpath_csr___wdata_T_5_0;
  assign dpath__csr___laddrInvalid_T_6_0 = dpath_csr___laddrInvalid_T_6_0;
  assign dpath__csr___T_17_0 = dpath_csr___T_17_0;
  assign dpath__csr___laddrInvalid_T_8_0 = dpath_csr___laddrInvalid_T_8_0;
  assign dpath__csr___io_out_T_45_0 = dpath_csr___io_out_T_45_0;
  assign dpath__csr___io_out_T_17_0 = dpath_csr___io_out_T_17_0;
  assign dpath__csr___io_out_T_13_0 = dpath_csr___io_out_T_13_0;
  assign dpath__csr___io_out_T_11_0 = dpath_csr___io_out_T_11_0;
  assign dpath__csr___T_20_0 = dpath_csr___T_20_0;
  assign dpath__csr___T_14_0 = dpath_csr___T_14_0;
  assign dpath__csr___io_out_T_55_0 = dpath_csr___io_out_T_55_0;
  assign dpath__csr___io_out_T_39_0 = dpath_csr___io_out_T_39_0;
  assign dpath__csr___io_out_T_51_0 = dpath_csr___io_out_T_51_0;
  assign dpath__csr__laddrInvalid_0 = dpath_csr__laddrInvalid_0;
  assign dpath__csr___io_out_T_23_0 = dpath_csr___io_out_T_23_0;
  assign dpath__csr___isInstRet_T_1_0 = dpath_csr___isInstRet_T_1_0;
  assign dpath__csr___io_expt_T_5_0 = dpath_csr___io_expt_T_5_0;
  assign dpath__csr___isEcall_T_4_0 = dpath_csr___isEcall_T_4_0;
  assign dpath__csr___csrRO_T_2_0 = dpath_csr___csrRO_T_2_0;
  assign dpath__csr___saddrInvalid_T_3_0 = dpath_csr___saddrInvalid_T_3_0;
  assign dpath__csr__isEcall_0 = dpath_csr__isEcall_0;
  assign dpath__csr__isEbreak_0 = dpath_csr__isEbreak_0;
  assign dpath__csr___io_out_T_49_0 = dpath_csr___io_out_T_49_0;
  assign dpath__csr___T_11_0 = dpath_csr___T_11_0;
  assign dpath__csr___wdata_T_7_0 = dpath_csr___wdata_T_7_0;
  assign dpath__csr___isInstRet_T_5_0 = dpath_csr___isInstRet_T_5_0;
  assign dpath__csr___io_out_T_37_0 = dpath_csr___io_out_T_37_0;
  assign dpath__csr___saddrInvalid_T_5_0 = dpath_csr___saddrInvalid_T_5_0;
  assign dpath__csr___T_22_0 = dpath_csr___T_22_0;
  assign dpath__csr___io_out_T_57_0 = dpath_csr___io_out_T_57_0;
  assign dpath__csr___laddrInvalid_T_4_0 = dpath_csr___laddrInvalid_T_4_0;
  assign dpath__csr___T_9_0 = dpath_csr___T_9_0;
  assign dpath__csr___T_15_0 = dpath_csr___T_15_0;
  assign dpath__csr__saddrInvalid_0 = dpath_csr__saddrInvalid_0;
  assign dpath__csr___T_19_0 = dpath_csr___T_19_0;
  assign dpath__csr___io_out_T_21_0 = dpath_csr___io_out_T_21_0;
  assign dpath__csr___io_out_T_15_0 = dpath_csr___io_out_T_15_0;
  assign dpath__regFile___T_1_0 = dpath_regFile___T_1_0;
  assign dpath__regFile___io_rdata2_T_0 = dpath_regFile___io_rdata2_T_0;
  assign dpath__regFile___io_rdata1_T_0 = dpath_regFile___io_rdata1_T_0;
  assign dpath__alu___out_T_1_0 = dpath_alu___out_T_1_0;
  assign dpath__alu___cmp_T_4_0 = dpath_alu___cmp_T_4_0;
  assign dpath__alu___out_T_0 = dpath_alu___out_T_0;
  assign dpath__alu___out_T_10_0 = dpath_alu___out_T_10_0;
  assign dpath__alu___out_T_12_0 = dpath_alu___out_T_12_0;
  assign dpath__alu___shin_T_0 = dpath_alu___shin_T_0;
  assign dpath__alu___out_T_9_0 = dpath_alu___out_T_9_0;
  assign dpath__alu___out_T_4_0 = dpath_alu___out_T_4_0;
  assign dpath__alu___out_T_3_0 = dpath_alu___out_T_3_0;
  assign dpath__alu___out_T_14_0 = dpath_alu___out_T_14_0;
  assign dpath__alu___out_T_6_0 = dpath_alu___out_T_6_0;
  assign dpath__alu___out_T_7_0 = dpath_alu___out_T_7_0;
  assign dpath__alu___out_T_8_0 = dpath_alu___out_T_8_0;
  assign dpath__alu___cmp_T_2_0 = dpath_alu___cmp_T_2_0;
  assign dpath__alu___sum_T_0 = dpath_alu___sum_T_0;
  assign dpath__alu___out_T_5_0 = dpath_alu___out_T_5_0;
  assign dpath__alu___out_T_2_0 = dpath_alu___out_T_2_0;
  assign dpath__alu___out_T_16_0 = dpath_alu___out_T_16_0;
  assign dpath__immGen___io_out_T_2_0 = dpath_immGen___io_out_T_2_0;
  assign dpath__immGen___io_out_T_4_0 = dpath_immGen___io_out_T_4_0;
  assign dpath__immGen___io_out_T_6_0 = dpath_immGen___io_out_T_6_0;
  assign dpath__immGen___io_out_T_12_0 = dpath_immGen___io_out_T_12_0;
  assign dpath__immGen___io_out_T_8_0 = dpath_immGen___io_out_T_8_0;
  assign dpath__immGen___io_out_T_10_0 = dpath_immGen___io_out_T_10_0;
  assign dpath__brCond__isSameSign_0 = dpath_brCond__isSameSign_0;
  assign dpath__brCond__eq_0 = dpath_brCond__eq_0;
  assign dpath__brCond___io_taken_T_5_0 = dpath_brCond___io_taken_T_5_0;
  assign dpath__brCond___io_taken_T_0 = dpath_brCond___io_taken_T_0;
  assign dpath__brCond___io_taken_T_11_0 = dpath_brCond___io_taken_T_11_0;
  assign dpath__brCond___io_taken_T_8_0 = dpath_brCond___io_taken_T_8_0;
  assign dpath__brCond___io_taken_T_14_0 = dpath_brCond___io_taken_T_14_0;
  assign dpath__brCond___io_taken_T_2_0 = dpath_brCond___io_taken_T_2_0;
  assign dpath__brCond__geu_0 = dpath_brCond__geu_0;
  assign dpath__brCond__ge_0 = dpath_brCond__ge_0;
  assign dpath___io_dcache_req_bits_mask_T_7_0 = dpath__io_dcache_req_bits_mask_T_7_0;
  assign dpath___npc_T_2_0 = dpath__npc_T_2_0;
  assign dpath___inst_T_2_0 = dpath__inst_T_2_0;
  assign dpath___rs1_T_0 = dpath__rs1_T_0;
  assign dpath___T_6_0 = dpath__T_6_0;
  assign dpath__io_ctrl_A_sel_0 = dpath_io_ctrl_A_sel_0;
  assign dpath___npc_T_5_0 = dpath__npc_T_5_0;
  assign dpath___io_icache_req_valid_T_0 = dpath__io_icache_req_valid_T_0;
  assign dpath__io_ctrl_B_sel_0 = dpath_io_ctrl_B_sel_0;
  assign dpath___regWrite_T_9_0 = dpath__regWrite_T_9_0;
  assign dpath___stall_T_1_0 = dpath__stall_T_1_0;
  assign dpath__csr__io_expt = dpath_csr__io_expt;
  assign dpath___regWrite_T_7_0 = dpath__regWrite_T_7_0;
  assign dpath___stall_T_0 = dpath__stall_T_0;
  assign dpath___rs1hazard_T_2_0 = dpath__rs1hazard_T_2_0;
  assign dpath___load_T_13_0 = dpath__load_T_13_0;
  assign dpath___load_T_11_0 = dpath__load_T_11_0;
  assign dpath___rs1_T_1_0 = dpath__rs1_T_1_0;
  assign dpath__stall_0 = dpath_stall_0;
  assign dpath___io_dcache_req_bits_mask_T_9_0 = dpath__io_dcache_req_bits_mask_T_9_0;
  assign dpath___load_T_15_0 = dpath__load_T_15_0;
  assign dpath___io_dcache_req_bits_mask_T_5_0 = dpath__io_dcache_req_bits_mask_T_5_0;
  assign dpath___rs2hazard_T_2_0 = dpath__rs2hazard_T_2_0;
  assign dpath___csr_in_T_0 = dpath__csr_in_T_0;
  assign dpath___npc_T_0 = dpath__npc_T_0;
  assign dpath___regWrite_T_5_0 = dpath__regWrite_T_5_0;
  assign dpath___npc_T_1_0 = dpath__npc_T_1_0;
  assign dpath___rs2_T_1_0 = dpath__rs2_T_1_0;
  assign dpath___load_T_9_0 = dpath__load_T_9_0;
  assign dpath___T_4_0 = dpath__T_4_0;
  assign dpath___T_7_0 = dpath__T_7_0;
  assign ctrl___ctrlSignals_T_31_0 = ctrl__ctrlSignals_T_31_0;
  assign ctrl___ctrlSignals_T_93_0 = ctrl__ctrlSignals_T_93_0;
  assign ctrl___ctrlSignals_T_87_0 = ctrl__ctrlSignals_T_87_0;
  assign ctrl___ctrlSignals_T_81_0 = ctrl__ctrlSignals_T_81_0;
  assign ctrl___ctrlSignals_T_15_0 = ctrl__ctrlSignals_T_15_0;
  assign ctrl___ctrlSignals_T_49_0 = ctrl__ctrlSignals_T_49_0;
  assign ctrl___ctrlSignals_T_5_0 = ctrl__ctrlSignals_T_5_0;
  assign ctrl___ctrlSignals_T_41_0 = ctrl__ctrlSignals_T_41_0;
  assign ctrl___ctrlSignals_T_11_0 = ctrl__ctrlSignals_T_11_0;
  assign ctrl___ctrlSignals_T_19_0 = ctrl__ctrlSignals_T_19_0;
  assign ctrl___ctrlSignals_T_95_0 = ctrl__ctrlSignals_T_95_0;
  assign ctrl___ctrlSignals_T_21_0 = ctrl__ctrlSignals_T_21_0;
  assign ctrl___ctrlSignals_T_47_0 = ctrl__ctrlSignals_T_47_0;
  assign ctrl___ctrlSignals_T_35_0 = ctrl__ctrlSignals_T_35_0;
  assign ctrl___ctrlSignals_T_75_0 = ctrl__ctrlSignals_T_75_0;
  assign ctrl___ctrlSignals_T_25_0 = ctrl__ctrlSignals_T_25_0;
  assign ctrl___ctrlSignals_T_55_0 = ctrl__ctrlSignals_T_55_0;
  assign ctrl___ctrlSignals_T_71_0 = ctrl__ctrlSignals_T_71_0;
  assign ctrl___ctrlSignals_T_27_0 = ctrl__ctrlSignals_T_27_0;
  assign ctrl___ctrlSignals_T_59_0 = ctrl__ctrlSignals_T_59_0;
  assign ctrl___ctrlSignals_T_29_0 = ctrl__ctrlSignals_T_29_0;
  assign ctrl___ctrlSignals_T_39_0 = ctrl__ctrlSignals_T_39_0;
  assign ctrl___ctrlSignals_T_1_0 = ctrl__ctrlSignals_T_1_0;
  assign ctrl___ctrlSignals_T_63_0 = ctrl__ctrlSignals_T_63_0;
  assign ctrl___ctrlSignals_T_97_0 = ctrl__ctrlSignals_T_97_0;
  assign ctrl___ctrlSignals_T_23_0 = ctrl__ctrlSignals_T_23_0;
  assign ctrl___ctrlSignals_T_65_0 = ctrl__ctrlSignals_T_65_0;
  assign ctrl___ctrlSignals_T_89_0 = ctrl__ctrlSignals_T_89_0;
  assign ctrl___ctrlSignals_T_51_0 = ctrl__ctrlSignals_T_51_0;
  assign ctrl___ctrlSignals_T_83_0 = ctrl__ctrlSignals_T_83_0;
  assign ctrl___ctrlSignals_T_77_0 = ctrl__ctrlSignals_T_77_0;
  assign ctrl___ctrlSignals_T_85_0 = ctrl__ctrlSignals_T_85_0;
  assign ctrl___ctrlSignals_T_37_0 = ctrl__ctrlSignals_T_37_0;
  assign ctrl___ctrlSignals_T_67_0 = ctrl__ctrlSignals_T_67_0;
  assign ctrl___ctrlSignals_T_91_0 = ctrl__ctrlSignals_T_91_0;
  assign ctrl___ctrlSignals_T_43_0 = ctrl__ctrlSignals_T_43_0;
  assign ctrl___ctrlSignals_T_17_0 = ctrl__ctrlSignals_T_17_0;
  assign ctrl___ctrlSignals_T_9_0 = ctrl__ctrlSignals_T_9_0;
  assign ctrl___ctrlSignals_T_79_0 = ctrl__ctrlSignals_T_79_0;
  assign ctrl___ctrlSignals_T_33_0 = ctrl__ctrlSignals_T_33_0;
  assign ctrl___ctrlSignals_T_45_0 = ctrl__ctrlSignals_T_45_0;
  assign ctrl___ctrlSignals_T_13_0 = ctrl__ctrlSignals_T_13_0;
  assign ctrl___ctrlSignals_T_53_0 = ctrl__ctrlSignals_T_53_0;
  assign ctrl___ctrlSignals_T_69_0 = ctrl__ctrlSignals_T_69_0;
  assign ctrl___ctrlSignals_T_3_0 = ctrl__ctrlSignals_T_3_0;
  assign ctrl___ctrlSignals_T_7_0 = ctrl__ctrlSignals_T_7_0;
  assign ctrl___ctrlSignals_T_73_0 = ctrl__ctrlSignals_T_73_0;
  assign ctrl___ctrlSignals_T_57_0 = ctrl__ctrlSignals_T_57_0;
  assign ctrl___ctrlSignals_T_61_0 = ctrl__ctrlSignals_T_61_0;
endmodule
module Cache(
  input         clock,
  input         reset,
  input         io_cpu_req_valid,
  input  [31:0] io_cpu_req_bits_addr,
  output        io_cpu_resp_valid,
  output [31:0] io_cpu_resp_bits_data,
  input         io_nasti_ar_ready,
  output        io_nasti_ar_valid,
  output [31:0] io_nasti_ar_bits_addr,
  output        io_nasti_r_ready,
  input         io_nasti_r_valid,
  input  [63:0] io_nasti_r_bits_data,
  output        _T_5_0,
  output        _wmask_T_0,
  output        _T_18_0,
  output        io_cpu_req_valid_0,
  output        _T_25_0,
  output        _T_33_0,
  output        wen_0,
  output        is_alloc_reg_0,
  output        read_wrap_out_0,
  output        _T_21_0,
  output        _T_11_0,
  output        _T_16_0,
  output        _T_0,
  output        ren_0,
  output        _hit_T_2_0,
  output        _T_6_0,
  output        _io_nasti_ar_valid_T_0,
  output        _wen_T_0,
  output        is_idle_0,
  output        _T_8_0,
  output        is_write_0,
  output        _T_43_0,
  output        _T_20_0,
  output        _is_alloc_T_0,
  output        read_count_0,
  output        _T_13_0,
  output        io_cpu_resp_valid_0,
  output        _ren_T_0,
  output        _T_3_0,
  output        ren_reg_0,
  output        _T_19_0,
  output        _T_51_0,
  output        _T_28_0,
  output        _T_9_0,
  output        _T_14_0,
  output        _T_4_0,
  output        _T_47_0,
  output        _T_15_0,
  output        _T_40_0,
  output        is_alloc_0,
  output        hit_0,
  output        _T_30_0,
  output        is_read_0,
  output        _T_10_0
);
  reg [19:0] metaMem_tag [0:255]; // @[Cache.scala 63:28]
  wire  metaMem_tag_rmeta_en; // @[Cache.scala 63:28]
  wire [7:0] metaMem_tag_rmeta_addr; // @[Cache.scala 63:28]
  wire [19:0] metaMem_tag_rmeta_data; // @[Cache.scala 63:28]
  wire [19:0] metaMem_tag_MPORT_data; // @[Cache.scala 63:28]
  wire [7:0] metaMem_tag_MPORT_addr; // @[Cache.scala 63:28]
  wire  metaMem_tag_MPORT_mask; // @[Cache.scala 63:28]
  wire  metaMem_tag_MPORT_en; // @[Cache.scala 63:28]
  reg  metaMem_tag_rmeta_en_pipe_0 = 1'h0;
  reg [7:0] metaMem_tag_rmeta_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_0_0 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_0_0_rdata_MPORT_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_0_rdata_MPORT_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_0_rdata_MPORT_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_0_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_0_MPORT_1_addr; // @[Cache.scala 64:45]
  wire  dataMem_0_0_MPORT_1_mask; // @[Cache.scala 64:45]
  wire  dataMem_0_0_MPORT_1_en; // @[Cache.scala 64:45]
  reg  dataMem_0_0_rdata_MPORT_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_0_0_rdata_MPORT_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_0_1 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_0_1_rdata_MPORT_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_1_rdata_MPORT_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_1_rdata_MPORT_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_1_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_1_MPORT_1_addr; // @[Cache.scala 64:45]
  wire  dataMem_0_1_MPORT_1_mask; // @[Cache.scala 64:45]
  wire  dataMem_0_1_MPORT_1_en; // @[Cache.scala 64:45]
  reg  dataMem_0_1_rdata_MPORT_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_0_1_rdata_MPORT_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_0_2 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_0_2_rdata_MPORT_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_2_rdata_MPORT_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_2_rdata_MPORT_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_2_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_2_MPORT_1_addr; // @[Cache.scala 64:45]
  wire  dataMem_0_2_MPORT_1_mask; // @[Cache.scala 64:45]
  wire  dataMem_0_2_MPORT_1_en; // @[Cache.scala 64:45]
  reg  dataMem_0_2_rdata_MPORT_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_0_2_rdata_MPORT_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_0_3 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_0_3_rdata_MPORT_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_3_rdata_MPORT_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_3_rdata_MPORT_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_3_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_3_MPORT_1_addr; // @[Cache.scala 64:45]
  wire  dataMem_0_3_MPORT_1_mask; // @[Cache.scala 64:45]
  wire  dataMem_0_3_MPORT_1_en; // @[Cache.scala 64:45]
  reg  dataMem_0_3_rdata_MPORT_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_0_3_rdata_MPORT_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_1_0 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_1_0_rdata_MPORT_1_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_0_rdata_MPORT_1_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_0_rdata_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_0_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_0_MPORT_2_addr; // @[Cache.scala 64:45]
  wire  dataMem_1_0_MPORT_2_mask; // @[Cache.scala 64:45]
  wire  dataMem_1_0_MPORT_2_en; // @[Cache.scala 64:45]
  reg  dataMem_1_0_rdata_MPORT_1_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_1_0_rdata_MPORT_1_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_1_1 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_1_1_rdata_MPORT_1_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_1_rdata_MPORT_1_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_1_rdata_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_1_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_1_MPORT_2_addr; // @[Cache.scala 64:45]
  wire  dataMem_1_1_MPORT_2_mask; // @[Cache.scala 64:45]
  wire  dataMem_1_1_MPORT_2_en; // @[Cache.scala 64:45]
  reg  dataMem_1_1_rdata_MPORT_1_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_1_1_rdata_MPORT_1_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_1_2 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_1_2_rdata_MPORT_1_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_2_rdata_MPORT_1_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_2_rdata_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_2_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_2_MPORT_2_addr; // @[Cache.scala 64:45]
  wire  dataMem_1_2_MPORT_2_mask; // @[Cache.scala 64:45]
  wire  dataMem_1_2_MPORT_2_en; // @[Cache.scala 64:45]
  reg  dataMem_1_2_rdata_MPORT_1_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_1_2_rdata_MPORT_1_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_1_3 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_1_3_rdata_MPORT_1_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_3_rdata_MPORT_1_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_3_rdata_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_3_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_3_MPORT_2_addr; // @[Cache.scala 64:45]
  wire  dataMem_1_3_MPORT_2_mask; // @[Cache.scala 64:45]
  wire  dataMem_1_3_MPORT_2_en; // @[Cache.scala 64:45]
  reg  dataMem_1_3_rdata_MPORT_1_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_1_3_rdata_MPORT_1_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_2_0 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_2_0_rdata_MPORT_2_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_0_rdata_MPORT_2_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_0_rdata_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_0_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_0_MPORT_3_addr; // @[Cache.scala 64:45]
  wire  dataMem_2_0_MPORT_3_mask; // @[Cache.scala 64:45]
  wire  dataMem_2_0_MPORT_3_en; // @[Cache.scala 64:45]
  reg  dataMem_2_0_rdata_MPORT_2_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_2_0_rdata_MPORT_2_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_2_1 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_2_1_rdata_MPORT_2_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_1_rdata_MPORT_2_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_1_rdata_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_1_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_1_MPORT_3_addr; // @[Cache.scala 64:45]
  wire  dataMem_2_1_MPORT_3_mask; // @[Cache.scala 64:45]
  wire  dataMem_2_1_MPORT_3_en; // @[Cache.scala 64:45]
  reg  dataMem_2_1_rdata_MPORT_2_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_2_1_rdata_MPORT_2_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_2_2 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_2_2_rdata_MPORT_2_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_2_rdata_MPORT_2_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_2_rdata_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_2_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_2_MPORT_3_addr; // @[Cache.scala 64:45]
  wire  dataMem_2_2_MPORT_3_mask; // @[Cache.scala 64:45]
  wire  dataMem_2_2_MPORT_3_en; // @[Cache.scala 64:45]
  reg  dataMem_2_2_rdata_MPORT_2_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_2_2_rdata_MPORT_2_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_2_3 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_2_3_rdata_MPORT_2_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_3_rdata_MPORT_2_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_3_rdata_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_3_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_3_MPORT_3_addr; // @[Cache.scala 64:45]
  wire  dataMem_2_3_MPORT_3_mask; // @[Cache.scala 64:45]
  wire  dataMem_2_3_MPORT_3_en; // @[Cache.scala 64:45]
  reg  dataMem_2_3_rdata_MPORT_2_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_2_3_rdata_MPORT_2_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_3_0 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_3_0_rdata_MPORT_3_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_0_rdata_MPORT_3_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_0_rdata_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_0_MPORT_4_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_0_MPORT_4_addr; // @[Cache.scala 64:45]
  wire  dataMem_3_0_MPORT_4_mask; // @[Cache.scala 64:45]
  wire  dataMem_3_0_MPORT_4_en; // @[Cache.scala 64:45]
  reg  dataMem_3_0_rdata_MPORT_3_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_3_0_rdata_MPORT_3_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_3_1 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_3_1_rdata_MPORT_3_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_1_rdata_MPORT_3_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_1_rdata_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_1_MPORT_4_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_1_MPORT_4_addr; // @[Cache.scala 64:45]
  wire  dataMem_3_1_MPORT_4_mask; // @[Cache.scala 64:45]
  wire  dataMem_3_1_MPORT_4_en; // @[Cache.scala 64:45]
  reg  dataMem_3_1_rdata_MPORT_3_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_3_1_rdata_MPORT_3_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_3_2 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_3_2_rdata_MPORT_3_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_2_rdata_MPORT_3_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_2_rdata_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_2_MPORT_4_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_2_MPORT_4_addr; // @[Cache.scala 64:45]
  wire  dataMem_3_2_MPORT_4_mask; // @[Cache.scala 64:45]
  wire  dataMem_3_2_MPORT_4_en; // @[Cache.scala 64:45]
  reg  dataMem_3_2_rdata_MPORT_3_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_3_2_rdata_MPORT_3_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_3_3 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_3_3_rdata_MPORT_3_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_3_rdata_MPORT_3_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_3_rdata_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_3_MPORT_4_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_3_MPORT_4_addr; // @[Cache.scala 64:45]
  wire  dataMem_3_3_MPORT_4_mask; // @[Cache.scala 64:45]
  wire  dataMem_3_3_MPORT_4_en; // @[Cache.scala 64:45]
  reg  dataMem_3_3_rdata_MPORT_3_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_3_3_rdata_MPORT_3_addr_pipe_0 = 8'h0;
  reg [2:0] state = 3'h0; // @[Cache.scala 59:22]
  reg [255:0] v = 256'h0; // @[Cache.scala 61:18]
  reg [255:0] d = 256'h0; // @[Cache.scala 62:18]
  reg [31:0] addr_reg = 32'h0; // @[Cache.scala 66:21]
  wire  _T = io_nasti_r_ready & io_nasti_r_valid; // @[Decoupled.scala 50:35]
  reg  read_count = 1'h0; // @[Counter.scala 62:40]
  wire  read_wrap_out = _T & read_count; // @[Counter.scala 120:{16,23}]
  wire  is_idle = state == 3'h0; // @[Cache.scala 75:23]
  wire  is_read = state == 3'h1; // @[Cache.scala 76:23]
  wire  is_write = state == 3'h2; // @[Cache.scala 77:24]
  wire  _is_alloc_T = state == 3'h6; // @[Cache.scala 78:24]
  wire  is_alloc = state == 3'h6 & read_wrap_out; // @[Cache.scala 78:36]
  reg  is_alloc_reg = 1'h0; // @[Cache.scala 79:29]
  wire [7:0] idx_reg = addr_reg[11:4]; // @[Cache.scala 89:25]
  wire [255:0] _hit_T = v >> idx_reg; // @[Cache.scala 98:11]
  wire [19:0] tag_reg = addr_reg[31:12]; // @[Cache.scala 88:25]
  wire  _hit_T_2 = metaMem_tag_rmeta_data == tag_reg; // @[Cache.scala 98:34]
  wire  hit = _hit_T[0] & metaMem_tag_rmeta_data == tag_reg; // @[Cache.scala 98:21]
  wire  _wen_T = hit | is_alloc_reg; // @[Cache.scala 82:30]
  wire  _wen_T_1 = is_write & (hit | is_alloc_reg); // @[Cache.scala 82:22]
  wire  wen = is_write & (hit | is_alloc_reg) | is_alloc; // @[Cache.scala 82:64]
  wire  _ren_T = ~wen; // @[Cache.scala 83:13]
  wire  _ren_T_2 = ~wen & (is_idle | is_read); // @[Cache.scala 83:18]
  wire  ren = ~wen & (is_idle | is_read) & io_cpu_req_valid; // @[Cache.scala 83:42]
  reg  ren_reg = 1'h0; // @[Cache.scala 84:24]
  wire [1:0] off_reg = addr_reg[3:2]; // @[Cache.scala 90:25]
  wire [63:0] rdata_lo_4 = {dataMem_1_3_rdata_MPORT_1_data,dataMem_1_2_rdata_MPORT_1_data,dataMem_1_1_rdata_MPORT_1_data
    ,dataMem_1_0_rdata_MPORT_1_data,dataMem_0_3_rdata_MPORT_data,dataMem_0_2_rdata_MPORT_data,
    dataMem_0_1_rdata_MPORT_data,dataMem_0_0_rdata_MPORT_data}; // @[Cat.scala 31:58]
  wire [127:0] rdata = {dataMem_3_3_rdata_MPORT_3_data,dataMem_3_2_rdata_MPORT_3_data,dataMem_3_1_rdata_MPORT_3_data,
    dataMem_3_0_rdata_MPORT_3_data,dataMem_2_3_rdata_MPORT_2_data,dataMem_2_2_rdata_MPORT_2_data,
    dataMem_2_1_rdata_MPORT_2_data,dataMem_2_0_rdata_MPORT_2_data,rdata_lo_4}; // @[Cat.scala 31:58]
  reg [127:0] rdata_buf = 128'h0; // @[Reg.scala 16:16]
  wire [127:0] _GEN_12 = ren_reg ? rdata : rdata_buf; // @[Reg.scala 16:16 17:{18,22}]
  reg [63:0] refill_buf_0 = 64'h0; // @[Cache.scala 95:23]
  reg [63:0] refill_buf_1 = 64'h0; // @[Cache.scala 95:23]
  wire [127:0] _read_T = {refill_buf_1,refill_buf_0}; // @[Cache.scala 96:43]
  wire [127:0] read = is_alloc_reg ? _read_T : _GEN_12; // @[Cache.scala 96:17]
  wire [31:0] _GEN_14 = 2'h1 == off_reg ? read[63:32] : read[31:0]; // @[Cache.scala 101:{25,25}]
  wire [31:0] _GEN_15 = 2'h2 == off_reg ? read[95:64] : _GEN_14; // @[Cache.scala 101:{25,25}]
  wire  _wmask_T = ~is_alloc; // @[Cache.scala 113:19]
  wire [3:0] _wmask_T_1 = {off_reg,2'h0}; // @[Cat.scala 31:58]
  wire [18:0] _wmask_T_2 = 19'h0 << _wmask_T_1; // @[Cache.scala 113:40]
  wire [19:0] _wmask_T_3 = {1'b0,$signed(_wmask_T_2)}; // @[Cache.scala 113:80]
  wire [19:0] wmask = ~is_alloc ? $signed(_wmask_T_3) : $signed(-20'sh1); // @[Cache.scala 113:18]
  wire [127:0] _wdata_T_3 = {io_nasti_r_bits_data,refill_buf_0}; // @[Cat.scala 31:58]
  wire [127:0] wdata = _wmask_T ? 128'h0 : _wdata_T_3; // @[Cache.scala 114:18]
  wire [255:0] _v_T = 256'h1 << idx_reg; // @[Cache.scala 121:18]
  wire [255:0] _v_T_1 = v | _v_T; // @[Cache.scala 121:18]
  wire [255:0] _d_T_2 = d | _v_T; // @[Cache.scala 122:18]
  wire [255:0] _d_T_3 = ~d; // @[Cache.scala 122:18]
  wire [255:0] _d_T_4 = _d_T_3 | _v_T; // @[Cache.scala 122:18]
  wire [255:0] _d_T_5 = ~_d_T_4; // @[Cache.scala 122:18]
  wire [27:0] _io_nasti_ar_bits_T = {tag_reg,idx_reg}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_1 = {_io_nasti_ar_bits_T, 4'h0}; // @[Cache.scala 136:28]
  wire [34:0] _io_nasti_ar_bits_T_1 = {{3'd0}, _GEN_1}; // @[Cache.scala 136:28]
  wire [255:0] _is_dirty_T_2 = d >> idx_reg; // @[Cache.scala 166:33]
  wire  is_dirty = _hit_T[0] & _is_dirty_T_2[0]; // @[Cache.scala 166:29]
  wire  _T_25 = 3'h0 == state; // @[Cache.scala 167:17]
  wire  _T_28 = 3'h1 == state; // @[Cache.scala 167:17]
  wire [1:0] _GEN_106 = io_cpu_req_valid ? 2'h1 : 2'h0; // @[Cache.scala 175:32 176:17 178:17]
  wire  _io_nasti_ar_valid_T = ~is_dirty; // @[Cache.scala 182:30]
  wire  _T_30 = io_nasti_ar_ready & io_nasti_ar_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_107 = _T_30 ? 3'h6 : state; // @[Cache.scala 185:38 186:17 59:22]
  wire  _GEN_111 = hit ? 1'h0 : ~is_dirty; // @[Cache.scala 174:17 140:21 182:27]
  wire  _T_33 = 3'h2 == state; // @[Cache.scala 167:17]
  wire [2:0] _GEN_114 = _wen_T ? 3'h0 : _GEN_107; // @[Cache.scala 191:49 192:15]
  wire  _GEN_116 = _wen_T ? 1'h0 : _io_nasti_ar_valid_T; // @[Cache.scala 140:21 191:49 195:27]
  wire  _T_40 = 3'h3 == state; // @[Cache.scala 167:17]
  wire  _T_43 = 3'h4 == state; // @[Cache.scala 167:17]
  wire  _T_47 = 3'h5 == state; // @[Cache.scala 167:17]
  wire  _T_51 = 3'h6 == state; // @[Cache.scala 167:17]
  wire [2:0] _GEN_120 = read_wrap_out ? 3'h0 : state; // @[Cache.scala 222:27 223:15 59:22]
  wire [2:0] _GEN_121 = 3'h6 == state ? _GEN_120 : state; // @[Cache.scala 167:17 59:22]
  wire [2:0] _GEN_123 = 3'h5 == state ? _GEN_107 : _GEN_121; // @[Cache.scala 167:17]
  wire [2:0] _GEN_125 = 3'h4 == state ? state : _GEN_123; // @[Cache.scala 167:17]
  wire  _GEN_126 = 3'h4 == state ? 1'h0 : 3'h5 == state; // @[Cache.scala 167:17 140:21]
  wire [2:0] _GEN_128 = 3'h3 == state ? state : _GEN_125; // @[Cache.scala 167:17]
  wire  _GEN_130 = 3'h3 == state ? 1'h0 : _GEN_126; // @[Cache.scala 167:17 140:21]
  wire  _GEN_133 = 3'h2 == state ? _GEN_116 : _GEN_130; // @[Cache.scala 167:17]
  wire  _GEN_138 = 3'h1 == state ? _GEN_111 : _GEN_133; // @[Cache.scala 167:17]
  assign metaMem_tag_rmeta_en = metaMem_tag_rmeta_en_pipe_0;
  assign metaMem_tag_rmeta_addr = metaMem_tag_rmeta_addr_pipe_0;
  assign metaMem_tag_rmeta_data = metaMem_tag[metaMem_tag_rmeta_addr]; // @[Cache.scala 63:28]
  assign metaMem_tag_MPORT_data = addr_reg[31:12];
  assign metaMem_tag_MPORT_addr = addr_reg[11:4];
  assign metaMem_tag_MPORT_mask = 1'h1;
  assign metaMem_tag_MPORT_en = wen & is_alloc;
  assign dataMem_0_0_rdata_MPORT_en = dataMem_0_0_rdata_MPORT_en_pipe_0;
  assign dataMem_0_0_rdata_MPORT_addr = dataMem_0_0_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_0_rdata_MPORT_data = dataMem_0_0[dataMem_0_0_rdata_MPORT_addr]; // @[Cache.scala 64:45]
  assign dataMem_0_0_MPORT_1_data = wdata[7:0];
  assign dataMem_0_0_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_0_MPORT_1_mask = wmask[0];
  assign dataMem_0_0_MPORT_1_en = _wen_T_1 | is_alloc;
  assign dataMem_0_1_rdata_MPORT_en = dataMem_0_1_rdata_MPORT_en_pipe_0;
  assign dataMem_0_1_rdata_MPORT_addr = dataMem_0_1_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_1_rdata_MPORT_data = dataMem_0_1[dataMem_0_1_rdata_MPORT_addr]; // @[Cache.scala 64:45]
  assign dataMem_0_1_MPORT_1_data = wdata[15:8];
  assign dataMem_0_1_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_1_MPORT_1_mask = wmask[1];
  assign dataMem_0_1_MPORT_1_en = _wen_T_1 | is_alloc;
  assign dataMem_0_2_rdata_MPORT_en = dataMem_0_2_rdata_MPORT_en_pipe_0;
  assign dataMem_0_2_rdata_MPORT_addr = dataMem_0_2_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_2_rdata_MPORT_data = dataMem_0_2[dataMem_0_2_rdata_MPORT_addr]; // @[Cache.scala 64:45]
  assign dataMem_0_2_MPORT_1_data = wdata[23:16];
  assign dataMem_0_2_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_2_MPORT_1_mask = wmask[2];
  assign dataMem_0_2_MPORT_1_en = _wen_T_1 | is_alloc;
  assign dataMem_0_3_rdata_MPORT_en = dataMem_0_3_rdata_MPORT_en_pipe_0;
  assign dataMem_0_3_rdata_MPORT_addr = dataMem_0_3_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_3_rdata_MPORT_data = dataMem_0_3[dataMem_0_3_rdata_MPORT_addr]; // @[Cache.scala 64:45]
  assign dataMem_0_3_MPORT_1_data = wdata[31:24];
  assign dataMem_0_3_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_3_MPORT_1_mask = wmask[3];
  assign dataMem_0_3_MPORT_1_en = _wen_T_1 | is_alloc;
  assign dataMem_1_0_rdata_MPORT_1_en = dataMem_1_0_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_0_rdata_MPORT_1_addr = dataMem_1_0_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_0_rdata_MPORT_1_data = dataMem_1_0[dataMem_1_0_rdata_MPORT_1_addr]; // @[Cache.scala 64:45]
  assign dataMem_1_0_MPORT_2_data = wdata[39:32];
  assign dataMem_1_0_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_0_MPORT_2_mask = wmask[4];
  assign dataMem_1_0_MPORT_2_en = _wen_T_1 | is_alloc;
  assign dataMem_1_1_rdata_MPORT_1_en = dataMem_1_1_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_1_rdata_MPORT_1_addr = dataMem_1_1_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_1_rdata_MPORT_1_data = dataMem_1_1[dataMem_1_1_rdata_MPORT_1_addr]; // @[Cache.scala 64:45]
  assign dataMem_1_1_MPORT_2_data = wdata[47:40];
  assign dataMem_1_1_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_1_MPORT_2_mask = wmask[5];
  assign dataMem_1_1_MPORT_2_en = _wen_T_1 | is_alloc;
  assign dataMem_1_2_rdata_MPORT_1_en = dataMem_1_2_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_2_rdata_MPORT_1_addr = dataMem_1_2_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_2_rdata_MPORT_1_data = dataMem_1_2[dataMem_1_2_rdata_MPORT_1_addr]; // @[Cache.scala 64:45]
  assign dataMem_1_2_MPORT_2_data = wdata[55:48];
  assign dataMem_1_2_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_2_MPORT_2_mask = wmask[6];
  assign dataMem_1_2_MPORT_2_en = _wen_T_1 | is_alloc;
  assign dataMem_1_3_rdata_MPORT_1_en = dataMem_1_3_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_3_rdata_MPORT_1_addr = dataMem_1_3_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_3_rdata_MPORT_1_data = dataMem_1_3[dataMem_1_3_rdata_MPORT_1_addr]; // @[Cache.scala 64:45]
  assign dataMem_1_3_MPORT_2_data = wdata[63:56];
  assign dataMem_1_3_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_3_MPORT_2_mask = wmask[7];
  assign dataMem_1_3_MPORT_2_en = _wen_T_1 | is_alloc;
  assign dataMem_2_0_rdata_MPORT_2_en = dataMem_2_0_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_0_rdata_MPORT_2_addr = dataMem_2_0_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_0_rdata_MPORT_2_data = dataMem_2_0[dataMem_2_0_rdata_MPORT_2_addr]; // @[Cache.scala 64:45]
  assign dataMem_2_0_MPORT_3_data = wdata[71:64];
  assign dataMem_2_0_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_0_MPORT_3_mask = wmask[8];
  assign dataMem_2_0_MPORT_3_en = _wen_T_1 | is_alloc;
  assign dataMem_2_1_rdata_MPORT_2_en = dataMem_2_1_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_1_rdata_MPORT_2_addr = dataMem_2_1_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_1_rdata_MPORT_2_data = dataMem_2_1[dataMem_2_1_rdata_MPORT_2_addr]; // @[Cache.scala 64:45]
  assign dataMem_2_1_MPORT_3_data = wdata[79:72];
  assign dataMem_2_1_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_1_MPORT_3_mask = wmask[9];
  assign dataMem_2_1_MPORT_3_en = _wen_T_1 | is_alloc;
  assign dataMem_2_2_rdata_MPORT_2_en = dataMem_2_2_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_2_rdata_MPORT_2_addr = dataMem_2_2_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_2_rdata_MPORT_2_data = dataMem_2_2[dataMem_2_2_rdata_MPORT_2_addr]; // @[Cache.scala 64:45]
  assign dataMem_2_2_MPORT_3_data = wdata[87:80];
  assign dataMem_2_2_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_2_MPORT_3_mask = wmask[10];
  assign dataMem_2_2_MPORT_3_en = _wen_T_1 | is_alloc;
  assign dataMem_2_3_rdata_MPORT_2_en = dataMem_2_3_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_3_rdata_MPORT_2_addr = dataMem_2_3_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_3_rdata_MPORT_2_data = dataMem_2_3[dataMem_2_3_rdata_MPORT_2_addr]; // @[Cache.scala 64:45]
  assign dataMem_2_3_MPORT_3_data = wdata[95:88];
  assign dataMem_2_3_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_3_MPORT_3_mask = wmask[11];
  assign dataMem_2_3_MPORT_3_en = _wen_T_1 | is_alloc;
  assign dataMem_3_0_rdata_MPORT_3_en = dataMem_3_0_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_0_rdata_MPORT_3_addr = dataMem_3_0_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_0_rdata_MPORT_3_data = dataMem_3_0[dataMem_3_0_rdata_MPORT_3_addr]; // @[Cache.scala 64:45]
  assign dataMem_3_0_MPORT_4_data = wdata[103:96];
  assign dataMem_3_0_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_0_MPORT_4_mask = wmask[12];
  assign dataMem_3_0_MPORT_4_en = _wen_T_1 | is_alloc;
  assign dataMem_3_1_rdata_MPORT_3_en = dataMem_3_1_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_1_rdata_MPORT_3_addr = dataMem_3_1_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_1_rdata_MPORT_3_data = dataMem_3_1[dataMem_3_1_rdata_MPORT_3_addr]; // @[Cache.scala 64:45]
  assign dataMem_3_1_MPORT_4_data = wdata[111:104];
  assign dataMem_3_1_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_1_MPORT_4_mask = wmask[13];
  assign dataMem_3_1_MPORT_4_en = _wen_T_1 | is_alloc;
  assign dataMem_3_2_rdata_MPORT_3_en = dataMem_3_2_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_2_rdata_MPORT_3_addr = dataMem_3_2_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_2_rdata_MPORT_3_data = dataMem_3_2[dataMem_3_2_rdata_MPORT_3_addr]; // @[Cache.scala 64:45]
  assign dataMem_3_2_MPORT_4_data = wdata[119:112];
  assign dataMem_3_2_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_2_MPORT_4_mask = wmask[14];
  assign dataMem_3_2_MPORT_4_en = _wen_T_1 | is_alloc;
  assign dataMem_3_3_rdata_MPORT_3_en = dataMem_3_3_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_3_rdata_MPORT_3_addr = dataMem_3_3_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_3_rdata_MPORT_3_data = dataMem_3_3[dataMem_3_3_rdata_MPORT_3_addr]; // @[Cache.scala 64:45]
  assign dataMem_3_3_MPORT_4_data = wdata[127:120];
  assign dataMem_3_3_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_3_MPORT_4_mask = wmask[15];
  assign dataMem_3_3_MPORT_4_en = _wen_T_1 | is_alloc;
  assign io_cpu_resp_valid = is_idle | is_read & hit | is_alloc_reg; // @[Cache.scala 102:50]
  assign io_cpu_resp_bits_data = 2'h3 == off_reg ? read[127:96] : _GEN_15; // @[Cache.scala 101:{25,25}]
  assign io_nasti_ar_valid = 3'h0 == state ? 1'h0 : _GEN_138; // @[Cache.scala 167:17 140:21]
  assign io_nasti_ar_bits_addr = _io_nasti_ar_bits_T_1[31:0]; // @[nasti.scala 63:18 65:13]
  assign io_nasti_r_ready = state == 3'h6; // @[Cache.scala 142:29]
  assign _T_5_0 = wmask[2];
  assign _wmask_T_0 = _wmask_T;
  assign _T_18_0 = wmask[12];
  assign io_cpu_req_valid_0 = io_cpu_req_valid;
  assign _T_25_0 = _T_25;
  assign _T_33_0 = _T_33;
  assign wen_0 = wen;
  assign is_alloc_reg_0 = is_alloc_reg;
  assign read_wrap_out_0 = read_wrap_out;
  assign _T_21_0 = wmask[15];
  assign _T_11_0 = wmask[7];
  assign _T_16_0 = wmask[11];
  assign _T_0 = _T;
  assign ren_0 = ren;
  assign _hit_T_2_0 = _hit_T_2;
  assign _T_6_0 = wmask[3];
  assign _io_nasti_ar_valid_T_0 = _io_nasti_ar_valid_T;
  assign _wen_T_0 = _wen_T;
  assign is_idle_0 = is_idle;
  assign _T_8_0 = wmask[4];
  assign is_write_0 = is_write;
  assign _T_43_0 = _T_43;
  assign _T_20_0 = wmask[14];
  assign _is_alloc_T_0 = _is_alloc_T;
  assign read_count_0 = read_count;
  assign _T_13_0 = wmask[8];
  assign io_cpu_resp_valid_0 = io_cpu_resp_valid;
  assign _ren_T_0 = _ren_T;
  assign _T_3_0 = wmask[0];
  assign ren_reg_0 = ren_reg;
  assign _T_19_0 = wmask[13];
  assign _T_51_0 = _T_51;
  assign _T_28_0 = _T_28;
  assign _T_9_0 = wmask[5];
  assign _T_14_0 = wmask[9];
  assign _T_4_0 = wmask[1];
  assign _T_47_0 = _T_47;
  assign _T_15_0 = wmask[10];
  assign _T_40_0 = _T_40;
  assign is_alloc_0 = is_alloc;
  assign hit_0 = hit;
  assign _T_30_0 = _T_30;
  assign is_read_0 = is_read;
  assign _T_10_0 = wmask[6];
  always @(posedge clock) begin
    if (metaMem_tag_MPORT_en & metaMem_tag_MPORT_mask) begin
      metaMem_tag[metaMem_tag_MPORT_addr] <= metaMem_tag_MPORT_data; // @[Cache.scala 63:28]
    end
    metaMem_tag_rmeta_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      metaMem_tag_rmeta_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_0_MPORT_1_en & dataMem_0_0_MPORT_1_mask) begin
      dataMem_0_0[dataMem_0_0_MPORT_1_addr] <= dataMem_0_0_MPORT_1_data; // @[Cache.scala 64:45]
    end
    dataMem_0_0_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_0_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_1_MPORT_1_en & dataMem_0_1_MPORT_1_mask) begin
      dataMem_0_1[dataMem_0_1_MPORT_1_addr] <= dataMem_0_1_MPORT_1_data; // @[Cache.scala 64:45]
    end
    dataMem_0_1_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_1_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_2_MPORT_1_en & dataMem_0_2_MPORT_1_mask) begin
      dataMem_0_2[dataMem_0_2_MPORT_1_addr] <= dataMem_0_2_MPORT_1_data; // @[Cache.scala 64:45]
    end
    dataMem_0_2_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_2_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_3_MPORT_1_en & dataMem_0_3_MPORT_1_mask) begin
      dataMem_0_3[dataMem_0_3_MPORT_1_addr] <= dataMem_0_3_MPORT_1_data; // @[Cache.scala 64:45]
    end
    dataMem_0_3_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_3_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_0_MPORT_2_en & dataMem_1_0_MPORT_2_mask) begin
      dataMem_1_0[dataMem_1_0_MPORT_2_addr] <= dataMem_1_0_MPORT_2_data; // @[Cache.scala 64:45]
    end
    dataMem_1_0_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_0_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_1_MPORT_2_en & dataMem_1_1_MPORT_2_mask) begin
      dataMem_1_1[dataMem_1_1_MPORT_2_addr] <= dataMem_1_1_MPORT_2_data; // @[Cache.scala 64:45]
    end
    dataMem_1_1_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_1_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_2_MPORT_2_en & dataMem_1_2_MPORT_2_mask) begin
      dataMem_1_2[dataMem_1_2_MPORT_2_addr] <= dataMem_1_2_MPORT_2_data; // @[Cache.scala 64:45]
    end
    dataMem_1_2_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_2_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_3_MPORT_2_en & dataMem_1_3_MPORT_2_mask) begin
      dataMem_1_3[dataMem_1_3_MPORT_2_addr] <= dataMem_1_3_MPORT_2_data; // @[Cache.scala 64:45]
    end
    dataMem_1_3_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_3_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_0_MPORT_3_en & dataMem_2_0_MPORT_3_mask) begin
      dataMem_2_0[dataMem_2_0_MPORT_3_addr] <= dataMem_2_0_MPORT_3_data; // @[Cache.scala 64:45]
    end
    dataMem_2_0_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_0_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_1_MPORT_3_en & dataMem_2_1_MPORT_3_mask) begin
      dataMem_2_1[dataMem_2_1_MPORT_3_addr] <= dataMem_2_1_MPORT_3_data; // @[Cache.scala 64:45]
    end
    dataMem_2_1_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_1_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_2_MPORT_3_en & dataMem_2_2_MPORT_3_mask) begin
      dataMem_2_2[dataMem_2_2_MPORT_3_addr] <= dataMem_2_2_MPORT_3_data; // @[Cache.scala 64:45]
    end
    dataMem_2_2_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_2_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_3_MPORT_3_en & dataMem_2_3_MPORT_3_mask) begin
      dataMem_2_3[dataMem_2_3_MPORT_3_addr] <= dataMem_2_3_MPORT_3_data; // @[Cache.scala 64:45]
    end
    dataMem_2_3_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_3_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_0_MPORT_4_en & dataMem_3_0_MPORT_4_mask) begin
      dataMem_3_0[dataMem_3_0_MPORT_4_addr] <= dataMem_3_0_MPORT_4_data; // @[Cache.scala 64:45]
    end
    dataMem_3_0_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_0_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_1_MPORT_4_en & dataMem_3_1_MPORT_4_mask) begin
      dataMem_3_1[dataMem_3_1_MPORT_4_addr] <= dataMem_3_1_MPORT_4_data; // @[Cache.scala 64:45]
    end
    dataMem_3_1_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_1_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_2_MPORT_4_en & dataMem_3_2_MPORT_4_mask) begin
      dataMem_3_2[dataMem_3_2_MPORT_4_addr] <= dataMem_3_2_MPORT_4_data; // @[Cache.scala 64:45]
    end
    dataMem_3_2_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_2_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_3_MPORT_4_en & dataMem_3_3_MPORT_4_mask) begin
      dataMem_3_3[dataMem_3_3_MPORT_4_addr] <= dataMem_3_3_MPORT_4_data; // @[Cache.scala 64:45]
    end
    dataMem_3_3_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_3_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (reset) begin // @[Cache.scala 59:22]
      state <= 3'h0; // @[Cache.scala 59:22]
    end else if (3'h0 == state) begin // @[Cache.scala 167:17]
      if (io_cpu_req_valid) begin // @[Cache.scala 169:30]
        state <= 3'h1; // @[Cache.scala 170:15]
      end
    end else if (3'h1 == state) begin // @[Cache.scala 167:17]
      if (hit) begin // @[Cache.scala 174:17]
        state <= {{1'd0}, _GEN_106};
      end else begin
        state <= _GEN_107;
      end
    end else if (3'h2 == state) begin // @[Cache.scala 167:17]
      state <= _GEN_114;
    end else begin
      state <= _GEN_128;
    end
    if (reset) begin // @[Cache.scala 61:18]
      v <= 256'h0; // @[Cache.scala 61:18]
    end else if (wen) begin // @[Cache.scala 120:13]
      v <= _v_T_1; // @[Cache.scala 121:7]
    end
    if (reset) begin // @[Cache.scala 62:18]
      d <= 256'h0; // @[Cache.scala 62:18]
    end else if (wen) begin // @[Cache.scala 120:13]
      if (_wmask_T) begin // @[Cache.scala 122:18]
        d <= _d_T_2;
      end else begin
        d <= _d_T_5;
      end
    end
    if (io_cpu_resp_valid) begin // @[Cache.scala 104:27]
      addr_reg <= io_cpu_req_bits_addr; // @[Cache.scala 105:14]
    end
    if (reset) begin // @[Counter.scala 62:40]
      read_count <= 1'h0; // @[Counter.scala 62:40]
    end else if (_T) begin // @[Counter.scala 120:16]
      read_count <= read_count + 1'h1; // @[Counter.scala 78:15]
    end
    is_alloc_reg <= state == 3'h6 & read_wrap_out; // @[Cache.scala 78:36]
    ren_reg <= ~wen & (is_idle | is_read) & io_cpu_req_valid; // @[Cache.scala 83:42]
    if (ren_reg) begin // @[Reg.scala 17:18]
      rdata_buf <= rdata; // @[Reg.scala 17:22]
    end
    if (_T) begin // @[Cache.scala 143:25]
      if (~read_count) begin // @[Cache.scala 144:28]
        refill_buf_0 <= io_nasti_r_bits_data; // @[Cache.scala 144:28]
      end
    end
    if (_T) begin // @[Cache.scala 143:25]
      if (read_count) begin // @[Cache.scala 144:28]
        refill_buf_1 <= io_nasti_r_bits_data; // @[Cache.scala 144:28]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
  integer initvar;
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `endif // RANDOMIZE
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaMem_tag[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_0[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_1[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_2[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_3[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_0[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_1[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_2[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_3[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_0[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_1[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_2[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_3[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_0[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_1[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_2[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_3[initvar] = 0;
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Cache_1(
  input         clock,
  input         reset,
  input         io_cpu_abort,
  input         io_cpu_req_valid,
  input  [31:0] io_cpu_req_bits_addr,
  input  [31:0] io_cpu_req_bits_data,
  input  [3:0]  io_cpu_req_bits_mask,
  output        io_cpu_resp_valid,
  output [31:0] io_cpu_resp_bits_data,
  input         io_nasti_aw_ready,
  output        io_nasti_aw_valid,
  output [31:0] io_nasti_aw_bits_addr,
  input         io_nasti_w_ready,
  output        io_nasti_w_valid,
  output [63:0] io_nasti_w_bits_data,
  output        io_nasti_w_bits_last,
  output        io_nasti_b_ready,
  input         io_nasti_b_valid,
  input         io_nasti_ar_ready,
  output        io_nasti_ar_valid,
  output [31:0] io_nasti_ar_bits_addr,
  output        io_nasti_r_ready,
  input         io_nasti_r_valid,
  input  [63:0] io_nasti_r_bits_data,
  output        _T_5_0,
  output        _io_cpu_resp_valid_T_3_0,
  output        _wmask_T_0,
  output        _state_T_0,
  output        wen_0,
  output        _T_33_0,
  output        _T_44_0,
  output        read_wrap_out_0,
  output        _T_21_0,
  output        _T_16_0,
  output        _ren_T_0,
  output        ren_0,
  output        _hit_T_2_0,
  output        _T_6_0,
  output        _io_nasti_ar_valid_T_0,
  output        _T_1_0,
  output        _T_29_0,
  output        write_count_0,
  output        _T_8_0,
  output        is_write_0,
  output        _T_20_0,
  output        _is_alloc_T_0,
  output        read_count_0,
  output        io_cpu_resp_valid_0,
  output        _T_51_0,
  output        _T_4_0,
  output        _T_15_0,
  output        _T_40_0,
  output        is_alloc_0,
  output        hit_0,
  output        _T_30_0,
  output        is_read_0,
  output        _T_35_0,
  output        _T_10_0,
  output        _T_18_0,
  output        io_cpu_req_valid_0,
  output        _T_25_0,
  output        is_alloc_reg_0,
  output        _T_11_0,
  output        _T_0,
  output        _io_cpu_resp_valid_T_2_0,
  output        _wen_T_2_0,
  output        is_idle_0,
  output        _T_43_0,
  output        _T_13_0,
  output        write_wrap_out_0,
  output        _T_3_0,
  output        ren_reg_0,
  output        _T_19_0,
  output        _T_28_0,
  output        _T_9_0,
  output        _T_14_0,
  output        _T_47_0
);
  reg [19:0] metaMem_tag [0:255]; // @[Cache.scala 63:28]
  wire  metaMem_tag_rmeta_en; // @[Cache.scala 63:28]
  wire [7:0] metaMem_tag_rmeta_addr; // @[Cache.scala 63:28]
  wire [19:0] metaMem_tag_rmeta_data; // @[Cache.scala 63:28]
  wire [19:0] metaMem_tag_MPORT_data; // @[Cache.scala 63:28]
  wire [7:0] metaMem_tag_MPORT_addr; // @[Cache.scala 63:28]
  wire  metaMem_tag_MPORT_mask; // @[Cache.scala 63:28]
  wire  metaMem_tag_MPORT_en; // @[Cache.scala 63:28]
  reg  metaMem_tag_rmeta_en_pipe_0 = 1'h0;
  reg [7:0] metaMem_tag_rmeta_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_0_0 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_0_0_rdata_MPORT_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_0_rdata_MPORT_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_0_rdata_MPORT_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_0_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_0_MPORT_1_addr; // @[Cache.scala 64:45]
  wire  dataMem_0_0_MPORT_1_mask; // @[Cache.scala 64:45]
  wire  dataMem_0_0_MPORT_1_en; // @[Cache.scala 64:45]
  reg  dataMem_0_0_rdata_MPORT_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_0_0_rdata_MPORT_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_0_1 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_0_1_rdata_MPORT_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_1_rdata_MPORT_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_1_rdata_MPORT_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_1_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_1_MPORT_1_addr; // @[Cache.scala 64:45]
  wire  dataMem_0_1_MPORT_1_mask; // @[Cache.scala 64:45]
  wire  dataMem_0_1_MPORT_1_en; // @[Cache.scala 64:45]
  reg  dataMem_0_1_rdata_MPORT_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_0_1_rdata_MPORT_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_0_2 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_0_2_rdata_MPORT_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_2_rdata_MPORT_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_2_rdata_MPORT_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_2_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_2_MPORT_1_addr; // @[Cache.scala 64:45]
  wire  dataMem_0_2_MPORT_1_mask; // @[Cache.scala 64:45]
  wire  dataMem_0_2_MPORT_1_en; // @[Cache.scala 64:45]
  reg  dataMem_0_2_rdata_MPORT_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_0_2_rdata_MPORT_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_0_3 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_0_3_rdata_MPORT_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_3_rdata_MPORT_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_3_rdata_MPORT_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_3_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_0_3_MPORT_1_addr; // @[Cache.scala 64:45]
  wire  dataMem_0_3_MPORT_1_mask; // @[Cache.scala 64:45]
  wire  dataMem_0_3_MPORT_1_en; // @[Cache.scala 64:45]
  reg  dataMem_0_3_rdata_MPORT_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_0_3_rdata_MPORT_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_1_0 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_1_0_rdata_MPORT_1_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_0_rdata_MPORT_1_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_0_rdata_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_0_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_0_MPORT_2_addr; // @[Cache.scala 64:45]
  wire  dataMem_1_0_MPORT_2_mask; // @[Cache.scala 64:45]
  wire  dataMem_1_0_MPORT_2_en; // @[Cache.scala 64:45]
  reg  dataMem_1_0_rdata_MPORT_1_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_1_0_rdata_MPORT_1_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_1_1 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_1_1_rdata_MPORT_1_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_1_rdata_MPORT_1_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_1_rdata_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_1_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_1_MPORT_2_addr; // @[Cache.scala 64:45]
  wire  dataMem_1_1_MPORT_2_mask; // @[Cache.scala 64:45]
  wire  dataMem_1_1_MPORT_2_en; // @[Cache.scala 64:45]
  reg  dataMem_1_1_rdata_MPORT_1_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_1_1_rdata_MPORT_1_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_1_2 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_1_2_rdata_MPORT_1_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_2_rdata_MPORT_1_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_2_rdata_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_2_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_2_MPORT_2_addr; // @[Cache.scala 64:45]
  wire  dataMem_1_2_MPORT_2_mask; // @[Cache.scala 64:45]
  wire  dataMem_1_2_MPORT_2_en; // @[Cache.scala 64:45]
  reg  dataMem_1_2_rdata_MPORT_1_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_1_2_rdata_MPORT_1_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_1_3 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_1_3_rdata_MPORT_1_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_3_rdata_MPORT_1_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_3_rdata_MPORT_1_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_3_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_1_3_MPORT_2_addr; // @[Cache.scala 64:45]
  wire  dataMem_1_3_MPORT_2_mask; // @[Cache.scala 64:45]
  wire  dataMem_1_3_MPORT_2_en; // @[Cache.scala 64:45]
  reg  dataMem_1_3_rdata_MPORT_1_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_1_3_rdata_MPORT_1_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_2_0 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_2_0_rdata_MPORT_2_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_0_rdata_MPORT_2_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_0_rdata_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_0_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_0_MPORT_3_addr; // @[Cache.scala 64:45]
  wire  dataMem_2_0_MPORT_3_mask; // @[Cache.scala 64:45]
  wire  dataMem_2_0_MPORT_3_en; // @[Cache.scala 64:45]
  reg  dataMem_2_0_rdata_MPORT_2_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_2_0_rdata_MPORT_2_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_2_1 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_2_1_rdata_MPORT_2_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_1_rdata_MPORT_2_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_1_rdata_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_1_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_1_MPORT_3_addr; // @[Cache.scala 64:45]
  wire  dataMem_2_1_MPORT_3_mask; // @[Cache.scala 64:45]
  wire  dataMem_2_1_MPORT_3_en; // @[Cache.scala 64:45]
  reg  dataMem_2_1_rdata_MPORT_2_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_2_1_rdata_MPORT_2_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_2_2 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_2_2_rdata_MPORT_2_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_2_rdata_MPORT_2_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_2_rdata_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_2_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_2_MPORT_3_addr; // @[Cache.scala 64:45]
  wire  dataMem_2_2_MPORT_3_mask; // @[Cache.scala 64:45]
  wire  dataMem_2_2_MPORT_3_en; // @[Cache.scala 64:45]
  reg  dataMem_2_2_rdata_MPORT_2_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_2_2_rdata_MPORT_2_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_2_3 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_2_3_rdata_MPORT_2_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_3_rdata_MPORT_2_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_3_rdata_MPORT_2_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_3_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_2_3_MPORT_3_addr; // @[Cache.scala 64:45]
  wire  dataMem_2_3_MPORT_3_mask; // @[Cache.scala 64:45]
  wire  dataMem_2_3_MPORT_3_en; // @[Cache.scala 64:45]
  reg  dataMem_2_3_rdata_MPORT_2_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_2_3_rdata_MPORT_2_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_3_0 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_3_0_rdata_MPORT_3_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_0_rdata_MPORT_3_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_0_rdata_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_0_MPORT_4_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_0_MPORT_4_addr; // @[Cache.scala 64:45]
  wire  dataMem_3_0_MPORT_4_mask; // @[Cache.scala 64:45]
  wire  dataMem_3_0_MPORT_4_en; // @[Cache.scala 64:45]
  reg  dataMem_3_0_rdata_MPORT_3_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_3_0_rdata_MPORT_3_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_3_1 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_3_1_rdata_MPORT_3_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_1_rdata_MPORT_3_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_1_rdata_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_1_MPORT_4_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_1_MPORT_4_addr; // @[Cache.scala 64:45]
  wire  dataMem_3_1_MPORT_4_mask; // @[Cache.scala 64:45]
  wire  dataMem_3_1_MPORT_4_en; // @[Cache.scala 64:45]
  reg  dataMem_3_1_rdata_MPORT_3_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_3_1_rdata_MPORT_3_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_3_2 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_3_2_rdata_MPORT_3_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_2_rdata_MPORT_3_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_2_rdata_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_2_MPORT_4_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_2_MPORT_4_addr; // @[Cache.scala 64:45]
  wire  dataMem_3_2_MPORT_4_mask; // @[Cache.scala 64:45]
  wire  dataMem_3_2_MPORT_4_en; // @[Cache.scala 64:45]
  reg  dataMem_3_2_rdata_MPORT_3_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_3_2_rdata_MPORT_3_addr_pipe_0 = 8'h0;
  reg [7:0] dataMem_3_3 [0:255]; // @[Cache.scala 64:45]
  wire  dataMem_3_3_rdata_MPORT_3_en; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_3_rdata_MPORT_3_addr; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_3_rdata_MPORT_3_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_3_MPORT_4_data; // @[Cache.scala 64:45]
  wire [7:0] dataMem_3_3_MPORT_4_addr; // @[Cache.scala 64:45]
  wire  dataMem_3_3_MPORT_4_mask; // @[Cache.scala 64:45]
  wire  dataMem_3_3_MPORT_4_en; // @[Cache.scala 64:45]
  reg  dataMem_3_3_rdata_MPORT_3_en_pipe_0 = 1'h0;
  reg [7:0] dataMem_3_3_rdata_MPORT_3_addr_pipe_0 = 8'h0;
  reg [2:0] state = 3'h0; // @[Cache.scala 59:22]
  reg [255:0] v = 256'h0; // @[Cache.scala 61:18]
  reg [255:0] d = 256'h0; // @[Cache.scala 62:18]
  reg [31:0] addr_reg = 32'h0; // @[Cache.scala 66:21]
  reg [31:0] cpu_data = 32'h0; // @[Cache.scala 67:21]
  reg [3:0] cpu_mask = 4'h0; // @[Cache.scala 68:21]
  wire  _T = io_nasti_r_ready & io_nasti_r_valid; // @[Decoupled.scala 50:35]
  reg  read_count = 1'h0; // @[Counter.scala 62:40]
  wire  read_wrap_out = _T & read_count; // @[Counter.scala 120:{16,23}]
  wire  _T_1 = io_nasti_w_ready & io_nasti_w_valid; // @[Decoupled.scala 50:35]
  reg  write_count = 1'h0; // @[Counter.scala 62:40]
  wire  write_wrap_out = _T_1 & write_count; // @[Counter.scala 120:{16,23}]
  wire  is_idle = state == 3'h0; // @[Cache.scala 75:23]
  wire  is_read = state == 3'h1; // @[Cache.scala 76:23]
  wire  is_write = state == 3'h2; // @[Cache.scala 77:24]
  wire  _is_alloc_T = state == 3'h6; // @[Cache.scala 78:24]
  wire  is_alloc = state == 3'h6 & read_wrap_out; // @[Cache.scala 78:36]
  reg  is_alloc_reg = 1'h0; // @[Cache.scala 79:29]
  wire [7:0] idx_reg = addr_reg[11:4]; // @[Cache.scala 89:25]
  wire [255:0] _hit_T = v >> idx_reg; // @[Cache.scala 98:11]
  wire [19:0] tag_reg = addr_reg[31:12]; // @[Cache.scala 88:25]
  wire  _hit_T_2 = metaMem_tag_rmeta_data == tag_reg; // @[Cache.scala 98:34]
  wire  hit = _hit_T[0] & metaMem_tag_rmeta_data == tag_reg; // @[Cache.scala 98:21]
  wire  _wen_T = hit | is_alloc_reg; // @[Cache.scala 82:30]
  wire  _wen_T_2 = ~io_cpu_abort; // @[Cache.scala 82:50]
  wire  _wen_T_3 = is_write & (hit | is_alloc_reg) & ~io_cpu_abort; // @[Cache.scala 82:47]
  wire  wen = is_write & (hit | is_alloc_reg) & ~io_cpu_abort | is_alloc; // @[Cache.scala 82:64]
  wire  _ren_T = ~wen; // @[Cache.scala 83:13]
  wire  _ren_T_2 = ~wen & (is_idle | is_read); // @[Cache.scala 83:18]
  wire  ren = ~wen & (is_idle | is_read) & io_cpu_req_valid; // @[Cache.scala 83:42]
  reg  ren_reg = 1'h0; // @[Cache.scala 84:24]
  wire [1:0] off_reg = addr_reg[3:2]; // @[Cache.scala 90:25]
  wire [63:0] rdata_lo_4 = {dataMem_1_3_rdata_MPORT_1_data,dataMem_1_2_rdata_MPORT_1_data,dataMem_1_1_rdata_MPORT_1_data
    ,dataMem_1_0_rdata_MPORT_1_data,dataMem_0_3_rdata_MPORT_data,dataMem_0_2_rdata_MPORT_data,
    dataMem_0_1_rdata_MPORT_data,dataMem_0_0_rdata_MPORT_data}; // @[Cat.scala 31:58]
  wire [127:0] rdata = {dataMem_3_3_rdata_MPORT_3_data,dataMem_3_2_rdata_MPORT_3_data,dataMem_3_1_rdata_MPORT_3_data,
    dataMem_3_0_rdata_MPORT_3_data,dataMem_2_3_rdata_MPORT_2_data,dataMem_2_2_rdata_MPORT_2_data,
    dataMem_2_1_rdata_MPORT_2_data,dataMem_2_0_rdata_MPORT_2_data,rdata_lo_4}; // @[Cat.scala 31:58]
  reg [127:0] rdata_buf = 128'h0; // @[Reg.scala 16:16]
  wire [127:0] _GEN_12 = ren_reg ? rdata : rdata_buf; // @[Reg.scala 16:16 17:{18,22}]
  reg [63:0] refill_buf_0 = 64'h0; // @[Cache.scala 95:23]
  reg [63:0] refill_buf_1 = 64'h0; // @[Cache.scala 95:23]
  wire [127:0] _read_T = {refill_buf_1,refill_buf_0}; // @[Cache.scala 96:43]
  wire [127:0] read = is_alloc_reg ? _read_T : _GEN_12; // @[Cache.scala 96:17]
  wire [31:0] _GEN_14 = 2'h1 == off_reg ? read[63:32] : read[31:0]; // @[Cache.scala 101:{25,25}]
  wire [31:0] _GEN_15 = 2'h2 == off_reg ? read[95:64] : _GEN_14; // @[Cache.scala 101:{25,25}]
  wire  _io_cpu_resp_valid_T_2 = |cpu_mask; // @[Cache.scala 102:79]
  wire  _io_cpu_resp_valid_T_3 = ~(|cpu_mask); // @[Cache.scala 102:69]
  wire  _wmask_T = ~is_alloc; // @[Cache.scala 113:19]
  wire [3:0] _wmask_T_1 = {off_reg,2'h0}; // @[Cat.scala 31:58]
  wire [18:0] _GEN_4 = {{15'd0}, cpu_mask}; // @[Cache.scala 113:40]
  wire [18:0] _wmask_T_2 = _GEN_4 << _wmask_T_1; // @[Cache.scala 113:40]
  wire [19:0] _wmask_T_3 = {1'b0,$signed(_wmask_T_2)}; // @[Cache.scala 113:80]
  wire [19:0] wmask = ~is_alloc ? $signed(_wmask_T_3) : $signed(-20'sh1); // @[Cache.scala 113:18]
  wire [127:0] _wdata_T_2 = {cpu_data,cpu_data,cpu_data,cpu_data}; // @[Cat.scala 31:58]
  wire [127:0] _wdata_T_3 = {io_nasti_r_bits_data,refill_buf_0}; // @[Cat.scala 31:58]
  wire [127:0] wdata = _wmask_T ? _wdata_T_2 : _wdata_T_3; // @[Cache.scala 114:18]
  wire [255:0] _v_T = 256'h1 << idx_reg; // @[Cache.scala 121:18]
  wire [255:0] _v_T_1 = v | _v_T; // @[Cache.scala 121:18]
  wire [255:0] _d_T_2 = d | _v_T; // @[Cache.scala 122:18]
  wire [255:0] _d_T_3 = ~d; // @[Cache.scala 122:18]
  wire [255:0] _d_T_4 = _d_T_3 | _v_T; // @[Cache.scala 122:18]
  wire [255:0] _d_T_5 = ~_d_T_4; // @[Cache.scala 122:18]
  wire [27:0] _io_nasti_ar_bits_T = {tag_reg,idx_reg}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_1 = {_io_nasti_ar_bits_T, 4'h0}; // @[Cache.scala 136:28]
  wire [34:0] _io_nasti_ar_bits_T_1 = {{3'd0}, _GEN_1}; // @[Cache.scala 136:28]
  wire [27:0] _io_nasti_aw_bits_T = {metaMem_tag_rmeta_data,idx_reg}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_3 = {_io_nasti_aw_bits_T, 4'h0}; // @[Cache.scala 150:30]
  wire [34:0] _io_nasti_aw_bits_T_1 = {{3'd0}, _GEN_3}; // @[Cache.scala 150:30]
  wire [255:0] _is_dirty_T_2 = d >> idx_reg; // @[Cache.scala 166:33]
  wire  is_dirty = _hit_T[0] & _is_dirty_T_2[0]; // @[Cache.scala 166:29]
  wire  _T_25 = 3'h0 == state; // @[Cache.scala 167:17]
  wire  _state_T = |io_cpu_req_bits_mask; // @[Cache.scala 170:43]
  wire [1:0] _state_T_1 = |io_cpu_req_bits_mask ? 2'h2 : 2'h1; // @[Cache.scala 170:21]
  wire  _T_28 = 3'h1 == state; // @[Cache.scala 167:17]
  wire [1:0] _GEN_106 = io_cpu_req_valid ? _state_T_1 : 2'h0; // @[Cache.scala 175:32 176:17 178:17]
  wire  _io_nasti_ar_valid_T = ~is_dirty; // @[Cache.scala 182:30]
  wire  _T_29 = io_nasti_aw_ready & io_nasti_aw_valid; // @[Decoupled.scala 50:35]
  wire  _T_30 = io_nasti_ar_ready & io_nasti_ar_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_107 = _T_30 ? 3'h6 : state; // @[Cache.scala 185:38 186:17 59:22]
  wire [2:0] _GEN_108 = _T_29 ? 3'h3 : _GEN_107; // @[Cache.scala 183:32 184:17]
  wire  _GEN_110 = hit ? 1'h0 : is_dirty; // @[Cache.scala 174:17 154:21 181:27]
  wire  _GEN_111 = hit ? 1'h0 : ~is_dirty; // @[Cache.scala 174:17 140:21 182:27]
  wire  _T_33 = 3'h2 == state; // @[Cache.scala 167:17]
  wire  _T_35 = _wen_T | io_cpu_abort; // @[Cache.scala 191:32]
  wire [2:0] _GEN_114 = _wen_T | io_cpu_abort ? 3'h0 : _GEN_108; // @[Cache.scala 191:49 192:15]
  wire  _GEN_115 = _wen_T | io_cpu_abort ? 1'h0 : is_dirty; // @[Cache.scala 154:21 191:49 194:27]
  wire  _GEN_116 = _wen_T | io_cpu_abort ? 1'h0 : _io_nasti_ar_valid_T; // @[Cache.scala 140:21 191:49 195:27]
  wire  _T_40 = 3'h3 == state; // @[Cache.scala 167:17]
  wire [2:0] _GEN_117 = write_wrap_out ? 3'h4 : state; // @[Cache.scala 205:28 206:15 59:22]
  wire  _T_43 = 3'h4 == state; // @[Cache.scala 167:17]
  wire  _T_44 = io_nasti_b_ready & io_nasti_b_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_118 = _T_44 ? 3'h5 : state; // @[Cache.scala 211:29 212:15 59:22]
  wire  _T_47 = 3'h5 == state; // @[Cache.scala 167:17]
  wire  _T_51 = 3'h6 == state; // @[Cache.scala 167:17]
  wire [1:0] _state_T_5 = _io_cpu_resp_valid_T_2 ? 2'h2 : 2'h0; // @[Cache.scala 223:21]
  wire [2:0] _GEN_120 = read_wrap_out ? {{1'd0}, _state_T_5} : state; // @[Cache.scala 222:27 223:15 59:22]
  wire [2:0] _GEN_121 = 3'h6 == state ? _GEN_120 : state; // @[Cache.scala 167:17 59:22]
  wire [2:0] _GEN_123 = 3'h5 == state ? _GEN_107 : _GEN_121; // @[Cache.scala 167:17]
  wire [2:0] _GEN_125 = 3'h4 == state ? _GEN_118 : _GEN_123; // @[Cache.scala 167:17]
  wire  _GEN_126 = 3'h4 == state ? 1'h0 : 3'h5 == state; // @[Cache.scala 167:17 140:21]
  wire [2:0] _GEN_128 = 3'h3 == state ? _GEN_117 : _GEN_125; // @[Cache.scala 167:17]
  wire  _GEN_129 = 3'h3 == state ? 1'h0 : 3'h4 == state; // @[Cache.scala 167:17 163:20]
  wire  _GEN_130 = 3'h3 == state ? 1'h0 : _GEN_126; // @[Cache.scala 167:17 140:21]
  wire  _GEN_132 = 3'h2 == state & _GEN_115; // @[Cache.scala 167:17 154:21]
  wire  _GEN_133 = 3'h2 == state ? _GEN_116 : _GEN_130; // @[Cache.scala 167:17]
  wire  _GEN_134 = 3'h2 == state ? 1'h0 : 3'h3 == state; // @[Cache.scala 167:17 161:20]
  wire  _GEN_135 = 3'h2 == state ? 1'h0 : _GEN_129; // @[Cache.scala 167:17 163:20]
  wire  _GEN_137 = 3'h1 == state ? _GEN_110 : _GEN_132; // @[Cache.scala 167:17]
  wire  _GEN_138 = 3'h1 == state ? _GEN_111 : _GEN_133; // @[Cache.scala 167:17]
  wire  _GEN_139 = 3'h1 == state ? 1'h0 : _GEN_134; // @[Cache.scala 167:17 161:20]
  wire  _GEN_140 = 3'h1 == state ? 1'h0 : _GEN_135; // @[Cache.scala 167:17 163:20]
  assign metaMem_tag_rmeta_en = metaMem_tag_rmeta_en_pipe_0;
  assign metaMem_tag_rmeta_addr = metaMem_tag_rmeta_addr_pipe_0;
  assign metaMem_tag_rmeta_data = metaMem_tag[metaMem_tag_rmeta_addr]; // @[Cache.scala 63:28]
  assign metaMem_tag_MPORT_data = addr_reg[31:12];
  assign metaMem_tag_MPORT_addr = addr_reg[11:4];
  assign metaMem_tag_MPORT_mask = 1'h1;
  assign metaMem_tag_MPORT_en = wen & is_alloc;
  assign dataMem_0_0_rdata_MPORT_en = dataMem_0_0_rdata_MPORT_en_pipe_0;
  assign dataMem_0_0_rdata_MPORT_addr = dataMem_0_0_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_0_rdata_MPORT_data = dataMem_0_0[dataMem_0_0_rdata_MPORT_addr]; // @[Cache.scala 64:45]
  assign dataMem_0_0_MPORT_1_data = wdata[7:0];
  assign dataMem_0_0_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_0_MPORT_1_mask = wmask[0];
  assign dataMem_0_0_MPORT_1_en = _wen_T_3 | is_alloc;
  assign dataMem_0_1_rdata_MPORT_en = dataMem_0_1_rdata_MPORT_en_pipe_0;
  assign dataMem_0_1_rdata_MPORT_addr = dataMem_0_1_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_1_rdata_MPORT_data = dataMem_0_1[dataMem_0_1_rdata_MPORT_addr]; // @[Cache.scala 64:45]
  assign dataMem_0_1_MPORT_1_data = wdata[15:8];
  assign dataMem_0_1_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_1_MPORT_1_mask = wmask[1];
  assign dataMem_0_1_MPORT_1_en = _wen_T_3 | is_alloc;
  assign dataMem_0_2_rdata_MPORT_en = dataMem_0_2_rdata_MPORT_en_pipe_0;
  assign dataMem_0_2_rdata_MPORT_addr = dataMem_0_2_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_2_rdata_MPORT_data = dataMem_0_2[dataMem_0_2_rdata_MPORT_addr]; // @[Cache.scala 64:45]
  assign dataMem_0_2_MPORT_1_data = wdata[23:16];
  assign dataMem_0_2_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_2_MPORT_1_mask = wmask[2];
  assign dataMem_0_2_MPORT_1_en = _wen_T_3 | is_alloc;
  assign dataMem_0_3_rdata_MPORT_en = dataMem_0_3_rdata_MPORT_en_pipe_0;
  assign dataMem_0_3_rdata_MPORT_addr = dataMem_0_3_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_3_rdata_MPORT_data = dataMem_0_3[dataMem_0_3_rdata_MPORT_addr]; // @[Cache.scala 64:45]
  assign dataMem_0_3_MPORT_1_data = wdata[31:24];
  assign dataMem_0_3_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_3_MPORT_1_mask = wmask[3];
  assign dataMem_0_3_MPORT_1_en = _wen_T_3 | is_alloc;
  assign dataMem_1_0_rdata_MPORT_1_en = dataMem_1_0_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_0_rdata_MPORT_1_addr = dataMem_1_0_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_0_rdata_MPORT_1_data = dataMem_1_0[dataMem_1_0_rdata_MPORT_1_addr]; // @[Cache.scala 64:45]
  assign dataMem_1_0_MPORT_2_data = wdata[39:32];
  assign dataMem_1_0_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_0_MPORT_2_mask = wmask[4];
  assign dataMem_1_0_MPORT_2_en = _wen_T_3 | is_alloc;
  assign dataMem_1_1_rdata_MPORT_1_en = dataMem_1_1_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_1_rdata_MPORT_1_addr = dataMem_1_1_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_1_rdata_MPORT_1_data = dataMem_1_1[dataMem_1_1_rdata_MPORT_1_addr]; // @[Cache.scala 64:45]
  assign dataMem_1_1_MPORT_2_data = wdata[47:40];
  assign dataMem_1_1_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_1_MPORT_2_mask = wmask[5];
  assign dataMem_1_1_MPORT_2_en = _wen_T_3 | is_alloc;
  assign dataMem_1_2_rdata_MPORT_1_en = dataMem_1_2_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_2_rdata_MPORT_1_addr = dataMem_1_2_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_2_rdata_MPORT_1_data = dataMem_1_2[dataMem_1_2_rdata_MPORT_1_addr]; // @[Cache.scala 64:45]
  assign dataMem_1_2_MPORT_2_data = wdata[55:48];
  assign dataMem_1_2_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_2_MPORT_2_mask = wmask[6];
  assign dataMem_1_2_MPORT_2_en = _wen_T_3 | is_alloc;
  assign dataMem_1_3_rdata_MPORT_1_en = dataMem_1_3_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_3_rdata_MPORT_1_addr = dataMem_1_3_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_3_rdata_MPORT_1_data = dataMem_1_3[dataMem_1_3_rdata_MPORT_1_addr]; // @[Cache.scala 64:45]
  assign dataMem_1_3_MPORT_2_data = wdata[63:56];
  assign dataMem_1_3_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_3_MPORT_2_mask = wmask[7];
  assign dataMem_1_3_MPORT_2_en = _wen_T_3 | is_alloc;
  assign dataMem_2_0_rdata_MPORT_2_en = dataMem_2_0_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_0_rdata_MPORT_2_addr = dataMem_2_0_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_0_rdata_MPORT_2_data = dataMem_2_0[dataMem_2_0_rdata_MPORT_2_addr]; // @[Cache.scala 64:45]
  assign dataMem_2_0_MPORT_3_data = wdata[71:64];
  assign dataMem_2_0_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_0_MPORT_3_mask = wmask[8];
  assign dataMem_2_0_MPORT_3_en = _wen_T_3 | is_alloc;
  assign dataMem_2_1_rdata_MPORT_2_en = dataMem_2_1_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_1_rdata_MPORT_2_addr = dataMem_2_1_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_1_rdata_MPORT_2_data = dataMem_2_1[dataMem_2_1_rdata_MPORT_2_addr]; // @[Cache.scala 64:45]
  assign dataMem_2_1_MPORT_3_data = wdata[79:72];
  assign dataMem_2_1_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_1_MPORT_3_mask = wmask[9];
  assign dataMem_2_1_MPORT_3_en = _wen_T_3 | is_alloc;
  assign dataMem_2_2_rdata_MPORT_2_en = dataMem_2_2_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_2_rdata_MPORT_2_addr = dataMem_2_2_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_2_rdata_MPORT_2_data = dataMem_2_2[dataMem_2_2_rdata_MPORT_2_addr]; // @[Cache.scala 64:45]
  assign dataMem_2_2_MPORT_3_data = wdata[87:80];
  assign dataMem_2_2_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_2_MPORT_3_mask = wmask[10];
  assign dataMem_2_2_MPORT_3_en = _wen_T_3 | is_alloc;
  assign dataMem_2_3_rdata_MPORT_2_en = dataMem_2_3_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_3_rdata_MPORT_2_addr = dataMem_2_3_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_3_rdata_MPORT_2_data = dataMem_2_3[dataMem_2_3_rdata_MPORT_2_addr]; // @[Cache.scala 64:45]
  assign dataMem_2_3_MPORT_3_data = wdata[95:88];
  assign dataMem_2_3_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_3_MPORT_3_mask = wmask[11];
  assign dataMem_2_3_MPORT_3_en = _wen_T_3 | is_alloc;
  assign dataMem_3_0_rdata_MPORT_3_en = dataMem_3_0_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_0_rdata_MPORT_3_addr = dataMem_3_0_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_0_rdata_MPORT_3_data = dataMem_3_0[dataMem_3_0_rdata_MPORT_3_addr]; // @[Cache.scala 64:45]
  assign dataMem_3_0_MPORT_4_data = wdata[103:96];
  assign dataMem_3_0_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_0_MPORT_4_mask = wmask[12];
  assign dataMem_3_0_MPORT_4_en = _wen_T_3 | is_alloc;
  assign dataMem_3_1_rdata_MPORT_3_en = dataMem_3_1_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_1_rdata_MPORT_3_addr = dataMem_3_1_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_1_rdata_MPORT_3_data = dataMem_3_1[dataMem_3_1_rdata_MPORT_3_addr]; // @[Cache.scala 64:45]
  assign dataMem_3_1_MPORT_4_data = wdata[111:104];
  assign dataMem_3_1_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_1_MPORT_4_mask = wmask[13];
  assign dataMem_3_1_MPORT_4_en = _wen_T_3 | is_alloc;
  assign dataMem_3_2_rdata_MPORT_3_en = dataMem_3_2_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_2_rdata_MPORT_3_addr = dataMem_3_2_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_2_rdata_MPORT_3_data = dataMem_3_2[dataMem_3_2_rdata_MPORT_3_addr]; // @[Cache.scala 64:45]
  assign dataMem_3_2_MPORT_4_data = wdata[119:112];
  assign dataMem_3_2_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_2_MPORT_4_mask = wmask[14];
  assign dataMem_3_2_MPORT_4_en = _wen_T_3 | is_alloc;
  assign dataMem_3_3_rdata_MPORT_3_en = dataMem_3_3_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_3_rdata_MPORT_3_addr = dataMem_3_3_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_3_rdata_MPORT_3_data = dataMem_3_3[dataMem_3_3_rdata_MPORT_3_addr]; // @[Cache.scala 64:45]
  assign dataMem_3_3_MPORT_4_data = wdata[127:120];
  assign dataMem_3_3_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_3_MPORT_4_mask = wmask[15];
  assign dataMem_3_3_MPORT_4_en = _wen_T_3 | is_alloc;
  assign io_cpu_resp_valid = is_idle | is_read & hit | is_alloc_reg & ~(|cpu_mask); // @[Cache.scala 102:50]
  assign io_cpu_resp_bits_data = 2'h3 == off_reg ? read[127:96] : _GEN_15; // @[Cache.scala 101:{25,25}]
  assign io_nasti_aw_valid = 3'h0 == state ? 1'h0 : _GEN_137; // @[Cache.scala 167:17 154:21]
  assign io_nasti_aw_bits_addr = _io_nasti_aw_bits_T_1[31:0]; // @[nasti.scala 63:18 65:13]
  assign io_nasti_w_valid = 3'h0 == state ? 1'h0 : _GEN_139; // @[Cache.scala 167:17 161:20]
  assign io_nasti_w_bits_data = write_count ? read[127:64] : read[63:0]; // @[nasti.scala 94:{12,12}]
  assign io_nasti_w_bits_last = _T_1 & write_count; // @[Counter.scala 120:{16,23}]
  assign io_nasti_b_ready = 3'h0 == state ? 1'h0 : _GEN_140; // @[Cache.scala 167:17 163:20]
  assign io_nasti_ar_valid = 3'h0 == state ? 1'h0 : _GEN_138; // @[Cache.scala 167:17 140:21]
  assign io_nasti_ar_bits_addr = _io_nasti_ar_bits_T_1[31:0]; // @[nasti.scala 63:18 65:13]
  assign io_nasti_r_ready = state == 3'h6; // @[Cache.scala 142:29]
  assign _T_5_0 = wmask[2];
  assign _io_cpu_resp_valid_T_3_0 = _io_cpu_resp_valid_T_3;
  assign _wmask_T_0 = _wmask_T;
  assign _state_T_0 = _state_T;
  assign wen_0 = wen;
  assign _T_33_0 = _T_33;
  assign _T_44_0 = _T_44;
  assign read_wrap_out_0 = read_wrap_out;
  assign _T_21_0 = wmask[15];
  assign _T_16_0 = wmask[11];
  assign _ren_T_0 = _ren_T;
  assign ren_0 = ren;
  assign _hit_T_2_0 = _hit_T_2;
  assign _T_6_0 = wmask[3];
  assign _io_nasti_ar_valid_T_0 = _io_nasti_ar_valid_T;
  assign _T_1_0 = _T_1;
  assign _T_29_0 = _T_29;
  assign write_count_0 = write_count;
  assign _T_8_0 = wmask[4];
  assign is_write_0 = is_write;
  assign _T_20_0 = wmask[14];
  assign _is_alloc_T_0 = _is_alloc_T;
  assign read_count_0 = read_count;
  assign io_cpu_resp_valid_0 = io_cpu_resp_valid;
  assign _T_51_0 = _T_51;
  assign _T_4_0 = wmask[1];
  assign _T_15_0 = wmask[10];
  assign _T_40_0 = _T_40;
  assign is_alloc_0 = is_alloc;
  assign hit_0 = hit;
  assign _T_30_0 = _T_30;
  assign is_read_0 = is_read;
  assign _T_35_0 = _T_35;
  assign _T_10_0 = wmask[6];
  assign _T_18_0 = wmask[12];
  assign io_cpu_req_valid_0 = io_cpu_req_valid;
  assign _T_25_0 = _T_25;
  assign is_alloc_reg_0 = is_alloc_reg;
  assign _T_11_0 = wmask[7];
  assign _T_0 = _T;
  assign _io_cpu_resp_valid_T_2_0 = _io_cpu_resp_valid_T_2;
  assign _wen_T_2_0 = _wen_T_2;
  assign is_idle_0 = is_idle;
  assign _T_43_0 = _T_43;
  assign _T_13_0 = wmask[8];
  assign write_wrap_out_0 = write_wrap_out;
  assign _T_3_0 = wmask[0];
  assign ren_reg_0 = ren_reg;
  assign _T_19_0 = wmask[13];
  assign _T_28_0 = _T_28;
  assign _T_9_0 = wmask[5];
  assign _T_14_0 = wmask[9];
  assign _T_47_0 = _T_47;
  always @(posedge clock) begin
    if (metaMem_tag_MPORT_en & metaMem_tag_MPORT_mask) begin
      metaMem_tag[metaMem_tag_MPORT_addr] <= metaMem_tag_MPORT_data; // @[Cache.scala 63:28]
    end
    metaMem_tag_rmeta_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      metaMem_tag_rmeta_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_0_MPORT_1_en & dataMem_0_0_MPORT_1_mask) begin
      dataMem_0_0[dataMem_0_0_MPORT_1_addr] <= dataMem_0_0_MPORT_1_data; // @[Cache.scala 64:45]
    end
    dataMem_0_0_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_0_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_1_MPORT_1_en & dataMem_0_1_MPORT_1_mask) begin
      dataMem_0_1[dataMem_0_1_MPORT_1_addr] <= dataMem_0_1_MPORT_1_data; // @[Cache.scala 64:45]
    end
    dataMem_0_1_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_1_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_2_MPORT_1_en & dataMem_0_2_MPORT_1_mask) begin
      dataMem_0_2[dataMem_0_2_MPORT_1_addr] <= dataMem_0_2_MPORT_1_data; // @[Cache.scala 64:45]
    end
    dataMem_0_2_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_2_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_3_MPORT_1_en & dataMem_0_3_MPORT_1_mask) begin
      dataMem_0_3[dataMem_0_3_MPORT_1_addr] <= dataMem_0_3_MPORT_1_data; // @[Cache.scala 64:45]
    end
    dataMem_0_3_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_3_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_0_MPORT_2_en & dataMem_1_0_MPORT_2_mask) begin
      dataMem_1_0[dataMem_1_0_MPORT_2_addr] <= dataMem_1_0_MPORT_2_data; // @[Cache.scala 64:45]
    end
    dataMem_1_0_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_0_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_1_MPORT_2_en & dataMem_1_1_MPORT_2_mask) begin
      dataMem_1_1[dataMem_1_1_MPORT_2_addr] <= dataMem_1_1_MPORT_2_data; // @[Cache.scala 64:45]
    end
    dataMem_1_1_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_1_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_2_MPORT_2_en & dataMem_1_2_MPORT_2_mask) begin
      dataMem_1_2[dataMem_1_2_MPORT_2_addr] <= dataMem_1_2_MPORT_2_data; // @[Cache.scala 64:45]
    end
    dataMem_1_2_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_2_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_3_MPORT_2_en & dataMem_1_3_MPORT_2_mask) begin
      dataMem_1_3[dataMem_1_3_MPORT_2_addr] <= dataMem_1_3_MPORT_2_data; // @[Cache.scala 64:45]
    end
    dataMem_1_3_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_3_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_0_MPORT_3_en & dataMem_2_0_MPORT_3_mask) begin
      dataMem_2_0[dataMem_2_0_MPORT_3_addr] <= dataMem_2_0_MPORT_3_data; // @[Cache.scala 64:45]
    end
    dataMem_2_0_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_0_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_1_MPORT_3_en & dataMem_2_1_MPORT_3_mask) begin
      dataMem_2_1[dataMem_2_1_MPORT_3_addr] <= dataMem_2_1_MPORT_3_data; // @[Cache.scala 64:45]
    end
    dataMem_2_1_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_1_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_2_MPORT_3_en & dataMem_2_2_MPORT_3_mask) begin
      dataMem_2_2[dataMem_2_2_MPORT_3_addr] <= dataMem_2_2_MPORT_3_data; // @[Cache.scala 64:45]
    end
    dataMem_2_2_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_2_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_3_MPORT_3_en & dataMem_2_3_MPORT_3_mask) begin
      dataMem_2_3[dataMem_2_3_MPORT_3_addr] <= dataMem_2_3_MPORT_3_data; // @[Cache.scala 64:45]
    end
    dataMem_2_3_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_3_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_0_MPORT_4_en & dataMem_3_0_MPORT_4_mask) begin
      dataMem_3_0[dataMem_3_0_MPORT_4_addr] <= dataMem_3_0_MPORT_4_data; // @[Cache.scala 64:45]
    end
    dataMem_3_0_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_0_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_1_MPORT_4_en & dataMem_3_1_MPORT_4_mask) begin
      dataMem_3_1[dataMem_3_1_MPORT_4_addr] <= dataMem_3_1_MPORT_4_data; // @[Cache.scala 64:45]
    end
    dataMem_3_1_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_1_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_2_MPORT_4_en & dataMem_3_2_MPORT_4_mask) begin
      dataMem_3_2[dataMem_3_2_MPORT_4_addr] <= dataMem_3_2_MPORT_4_data; // @[Cache.scala 64:45]
    end
    dataMem_3_2_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_2_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_3_MPORT_4_en & dataMem_3_3_MPORT_4_mask) begin
      dataMem_3_3[dataMem_3_3_MPORT_4_addr] <= dataMem_3_3_MPORT_4_data; // @[Cache.scala 64:45]
    end
    dataMem_3_3_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_3_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (reset) begin // @[Cache.scala 59:22]
      state <= 3'h0; // @[Cache.scala 59:22]
    end else if (3'h0 == state) begin // @[Cache.scala 167:17]
      if (io_cpu_req_valid) begin // @[Cache.scala 169:30]
        state <= {{1'd0}, _state_T_1}; // @[Cache.scala 170:15]
      end
    end else if (3'h1 == state) begin // @[Cache.scala 167:17]
      if (hit) begin // @[Cache.scala 174:17]
        state <= {{1'd0}, _GEN_106};
      end else begin
        state <= _GEN_108;
      end
    end else if (3'h2 == state) begin // @[Cache.scala 167:17]
      state <= _GEN_114;
    end else begin
      state <= _GEN_128;
    end
    if (reset) begin // @[Cache.scala 61:18]
      v <= 256'h0; // @[Cache.scala 61:18]
    end else if (wen) begin // @[Cache.scala 120:13]
      v <= _v_T_1; // @[Cache.scala 121:7]
    end
    if (reset) begin // @[Cache.scala 62:18]
      d <= 256'h0; // @[Cache.scala 62:18]
    end else if (wen) begin // @[Cache.scala 120:13]
      if (_wmask_T) begin // @[Cache.scala 122:18]
        d <= _d_T_2;
      end else begin
        d <= _d_T_5;
      end
    end
    if (io_cpu_resp_valid) begin // @[Cache.scala 104:27]
      addr_reg <= io_cpu_req_bits_addr; // @[Cache.scala 105:14]
    end
    if (io_cpu_resp_valid) begin // @[Cache.scala 104:27]
      cpu_data <= io_cpu_req_bits_data; // @[Cache.scala 106:14]
    end
    if (io_cpu_resp_valid) begin // @[Cache.scala 104:27]
      cpu_mask <= io_cpu_req_bits_mask; // @[Cache.scala 107:14]
    end
    if (reset) begin // @[Counter.scala 62:40]
      read_count <= 1'h0; // @[Counter.scala 62:40]
    end else if (_T) begin // @[Counter.scala 120:16]
      read_count <= read_count + 1'h1; // @[Counter.scala 78:15]
    end
    if (reset) begin // @[Counter.scala 62:40]
      write_count <= 1'h0; // @[Counter.scala 62:40]
    end else if (_T_1) begin // @[Counter.scala 120:16]
      write_count <= write_count + 1'h1; // @[Counter.scala 78:15]
    end
    is_alloc_reg <= state == 3'h6 & read_wrap_out; // @[Cache.scala 78:36]
    ren_reg <= ~wen & (is_idle | is_read) & io_cpu_req_valid; // @[Cache.scala 83:42]
    if (ren_reg) begin // @[Reg.scala 17:18]
      rdata_buf <= rdata; // @[Reg.scala 17:22]
    end
    if (_T) begin // @[Cache.scala 143:25]
      if (~read_count) begin // @[Cache.scala 144:28]
        refill_buf_0 <= io_nasti_r_bits_data; // @[Cache.scala 144:28]
      end
    end
    if (_T) begin // @[Cache.scala 143:25]
      if (read_count) begin // @[Cache.scala 144:28]
        refill_buf_1 <= io_nasti_r_bits_data; // @[Cache.scala 144:28]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
  integer initvar;
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `endif // RANDOMIZE
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaMem_tag[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_0[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_1[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_2[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_3[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_0[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_1[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_2[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_3[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_0[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_1[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_2[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_3[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_0[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_1[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_2[initvar] = 0;
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_3[initvar] = 0;
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MemArbiter(
  input         clock,
  input         reset,
  output        io_icache_ar_ready,
  input         io_icache_ar_valid,
  input  [31:0] io_icache_ar_bits_addr,
  input         io_icache_r_ready,
  output        io_icache_r_valid,
  output [63:0] io_icache_r_bits_data,
  output        io_dcache_aw_ready,
  input         io_dcache_aw_valid,
  input  [31:0] io_dcache_aw_bits_addr,
  output        io_dcache_w_ready,
  input         io_dcache_w_valid,
  input  [63:0] io_dcache_w_bits_data,
  input         io_dcache_w_bits_last,
  input         io_dcache_b_ready,
  output        io_dcache_b_valid,
  output        io_dcache_ar_ready,
  input         io_dcache_ar_valid,
  input  [31:0] io_dcache_ar_bits_addr,
  input         io_dcache_r_ready,
  output        io_dcache_r_valid,
  output [63:0] io_dcache_r_bits_data,
  input         io_nasti_aw_ready,
  output        io_nasti_aw_valid,
  output [31:0] io_nasti_aw_bits_addr,
  input         io_nasti_w_ready,
  output        io_nasti_w_valid,
  output [63:0] io_nasti_w_bits_data,
  output        io_nasti_b_ready,
  input         io_nasti_b_valid,
  input         io_nasti_ar_ready,
  output        io_nasti_ar_valid,
  output [31:0] io_nasti_ar_bits_addr,
  output        io_nasti_r_ready,
  input         io_nasti_r_valid,
  input  [63:0] io_nasti_r_bits_data,
  input         io_nasti_r_bits_last,
  output        _T_2_0,
  output        _T_13_0,
  output        _T_24_0,
  output        io_dcache_ar_valid_0,
  output        _io_nasti_ar_valid_T_1_0,
  output        _T_20_0,
  output        _T_8_0,
  output        _io_dcache_b_valid_T_0,
  output        _T_5_0,
  output        _T_4_0,
  output        _io_icache_ar_ready_T_0,
  output        _T_10_0,
  output        _T_18_0,
  output        _io_nasti_aw_valid_T_0,
  output        _T_3_0,
  output        _io_icache_r_valid_T_0,
  output        _io_dcache_r_valid_T_0,
  output        _T_23_0,
  output        _io_nasti_w_valid_T_0
);
  reg [2:0] state = 3'h0; // @[Tile.scala 24:22]
  wire  _io_nasti_aw_valid_T = state == 3'h0; // @[Tile.scala 28:52]
  wire  _io_nasti_w_valid_T = state == 3'h3; // @[Tile.scala 34:50]
  wire  _io_dcache_b_valid_T = state == 3'h4; // @[Tile.scala 40:50]
  wire  _io_nasti_ar_valid_T_1 = ~io_nasti_aw_valid; // @[Tile.scala 52:5]
  wire  _io_nasti_ar_valid_T_2 = (io_icache_ar_valid | io_dcache_ar_valid) & _io_nasti_ar_valid_T_1; // @[Tile.scala 51:67]
  wire  _io_icache_ar_ready_T = ~io_dcache_ar_valid; // @[Tile.scala 54:47]
  wire  _io_icache_r_valid_T = state == 3'h1; // @[Tile.scala 59:50]
  wire  _io_dcache_r_valid_T = state == 3'h2; // @[Tile.scala 60:50]
  wire  _io_nasti_r_ready_T_3 = io_dcache_r_ready & _io_dcache_r_valid_T; // @[Tile.scala 62:23]
  wire  _T_2 = 3'h0 == state; // @[Tile.scala 64:17]
  wire  _T_3 = io_dcache_aw_ready & io_dcache_aw_valid; // @[Decoupled.scala 50:35]
  wire  _T_4 = io_dcache_ar_ready & io_dcache_ar_valid; // @[Decoupled.scala 50:35]
  wire  _T_5 = io_icache_ar_ready & io_icache_ar_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_0 = _T_5 ? 3'h1 : state; // @[Tile.scala 70:37 71:15 24:22]
  wire  _T_8 = 3'h1 == state; // @[Tile.scala 64:17]
  wire  _T_9 = io_nasti_r_ready & io_nasti_r_valid; // @[Decoupled.scala 50:35]
  wire  _T_10 = _T_9 & io_nasti_r_bits_last; // @[Tile.scala 75:28]
  wire [2:0] _GEN_3 = _T_9 & io_nasti_r_bits_last ? 3'h0 : state; // @[Tile.scala 75:53 76:15 24:22]
  wire  _T_13 = 3'h2 == state; // @[Tile.scala 64:17]
  wire  _T_18 = 3'h3 == state; // @[Tile.scala 64:17]
  wire  _T_19 = io_dcache_w_ready & io_dcache_w_valid; // @[Decoupled.scala 50:35]
  wire  _T_20 = _T_19 & io_dcache_w_bits_last; // @[Tile.scala 85:29]
  wire [2:0] _GEN_5 = _T_19 & io_dcache_w_bits_last ? 3'h4 : state; // @[Tile.scala 85:55 86:15 24:22]
  wire  _T_23 = 3'h4 == state; // @[Tile.scala 64:17]
  wire  _T_24 = io_nasti_b_ready & io_nasti_b_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_6 = _T_24 ? 3'h0 : state; // @[Tile.scala 90:29 91:15 24:22]
  wire [2:0] _GEN_7 = 3'h4 == state ? _GEN_6 : state; // @[Tile.scala 64:17 24:22]
  wire [2:0] _GEN_8 = 3'h3 == state ? _GEN_5 : _GEN_7; // @[Tile.scala 64:17]
  assign io_icache_ar_ready = io_dcache_ar_ready & ~io_dcache_ar_valid; // @[Tile.scala 54:44]
  assign io_icache_r_valid = io_nasti_r_valid & state == 3'h1; // @[Tile.scala 59:41]
  assign io_icache_r_bits_data = io_nasti_r_bits_data; // @[Tile.scala 57:20]
  assign io_dcache_aw_ready = io_nasti_aw_ready & _io_nasti_aw_valid_T; // @[Tile.scala 29:43]
  assign io_dcache_w_ready = io_nasti_w_ready & _io_nasti_w_valid_T; // @[Tile.scala 35:41]
  assign io_dcache_b_valid = io_nasti_b_valid & state == 3'h4; // @[Tile.scala 40:41]
  assign io_dcache_ar_ready = io_nasti_ar_ready & _io_nasti_ar_valid_T_1 & _io_nasti_aw_valid_T; // @[Tile.scala 53:65]
  assign io_dcache_r_valid = io_nasti_r_valid & state == 3'h2; // @[Tile.scala 60:41]
  assign io_dcache_r_bits_data = io_nasti_r_bits_data; // @[Tile.scala 58:20]
  assign io_nasti_aw_valid = io_dcache_aw_valid & state == 3'h0; // @[Tile.scala 28:43]
  assign io_nasti_aw_bits_addr = io_dcache_aw_bits_addr; // @[Tile.scala 27:20]
  assign io_nasti_w_valid = io_dcache_w_valid & state == 3'h3; // @[Tile.scala 34:41]
  assign io_nasti_w_bits_data = io_dcache_w_bits_data; // @[Tile.scala 33:19]
  assign io_nasti_b_ready = io_dcache_b_ready & _io_dcache_b_valid_T; // @[Tile.scala 41:41]
  assign io_nasti_ar_valid = _io_nasti_ar_valid_T_2 & _io_nasti_aw_valid_T; // @[Tile.scala 52:24]
  assign io_nasti_ar_bits_addr = io_dcache_ar_valid ? io_dcache_ar_bits_addr : io_icache_ar_bits_addr; // @[Tile.scala 47:8]
  assign io_nasti_r_ready = io_icache_r_ready & _io_icache_r_valid_T | _io_nasti_r_ready_T_3; // @[Tile.scala 61:66]
  assign _T_2_0 = _T_2;
  assign _T_13_0 = _T_13;
  assign _T_24_0 = _T_24;
  assign io_dcache_ar_valid_0 = io_dcache_ar_valid;
  assign _io_nasti_ar_valid_T_1_0 = _io_nasti_ar_valid_T_1;
  assign _T_20_0 = _T_20;
  assign _T_8_0 = _T_8;
  assign _io_dcache_b_valid_T_0 = _io_dcache_b_valid_T;
  assign _T_5_0 = _T_5;
  assign _T_4_0 = _T_4;
  assign _io_icache_ar_ready_T_0 = _io_icache_ar_ready_T;
  assign _T_10_0 = _T_10;
  assign _T_18_0 = _T_18;
  assign _io_nasti_aw_valid_T_0 = _io_nasti_aw_valid_T;
  assign _T_3_0 = _T_3;
  assign _io_icache_r_valid_T_0 = _io_icache_r_valid_T;
  assign _io_dcache_r_valid_T_0 = _io_dcache_r_valid_T;
  assign _T_23_0 = _T_23;
  assign _io_nasti_w_valid_T_0 = _io_nasti_w_valid_T;
  always @(posedge clock) begin
    if (reset) begin // @[Tile.scala 24:22]
      state <= 3'h0; // @[Tile.scala 24:22]
    end else if (3'h0 == state) begin // @[Tile.scala 64:17]
      if (_T_3) begin // @[Tile.scala 66:31]
        state <= 3'h3; // @[Tile.scala 67:15]
      end else if (_T_4) begin // @[Tile.scala 68:37]
        state <= 3'h2; // @[Tile.scala 69:15]
      end else begin
        state <= _GEN_0;
      end
    end else if (3'h1 == state) begin // @[Tile.scala 64:17]
      state <= _GEN_3;
    end else if (3'h2 == state) begin // @[Tile.scala 64:17]
      state <= _GEN_3;
    end else begin
      state <= _GEN_8;
    end
  end
endmodule
module Tile(
  input         clock,
  input         reset,
  input         io_nasti_aw_ready,
  output        io_nasti_aw_valid,
  output [31:0] io_nasti_aw_bits_addr,
  input         io_nasti_w_ready,
  output        io_nasti_w_valid,
  output [63:0] io_nasti_w_bits_data,
  output        io_nasti_b_ready,
  input         io_nasti_b_valid,
  input         io_nasti_ar_ready,
  output        io_nasti_ar_valid,
  output [31:0] io_nasti_ar_bits_addr,
  output        io_nasti_r_ready,
  input         io_nasti_r_valid,
  input  [63:0] io_nasti_r_bits_data,
  input         io_nasti_r_bits_last,
  output        core__dpath__csr___io_out_T_29_0,
  output        core__dpath__csr___T_0,
  output        core__dpath__csr__isInstRet_0,
  output        core__dpath__csr___T_10_0,
  output        core__dpath__csr___T_7_0,
  output        core__dpath__csr___io_out_T_33_0,
  output        core__dpath__csr___T_23_0,
  output        core__dpath__csr___io_out_T_25_0,
  output        core__dpath__csr___T_6_0,
  output        core__dpath__csr___io_out_T_31_0,
  output        core__dpath__csr___wdata_T_3_0,
  output        core__dpath__csr__privInst_0,
  output        core__dpath__csr___T_16_0,
  output        core__dpath__csr__isEret_0,
  output        core__dpath__csr___io_out_T_41_0,
  output        core__dpath__csr___io_out_T_1_0,
  output        core__dpath__csr___io_out_T_53_0,
  output        core__dpath__csr__iaddrInvalid_0,
  output        core__dpath__csr___io_out_T_27_0,
  output        core__dpath__csr___io_out_T_43_0,
  output        core__dpath__csr___T_1_0,
  output        core__dpath__csr___io_out_T_35_0,
  output        core__dpath__csr___T_3_0,
  output        core__dpath__csr___T_18_0,
  output        core__dpath__csr__privValid_0,
  output        core__dpath__csr___io_expt_T_6_0,
  output        core__dpath__csr___isInstRet_T_0,
  output        core__dpath__csr___io_out_T_3_0,
  output        core__dpath__csr___io_out_T_7_0,
  output        core__dpath__csr__io_expt_0,
  output        core__dpath__csr___T_24_0,
  output        core__dpath__csr___wen_T_0,
  output        core__dpath__csr___T_21_0,
  output        core__dpath__csr__wen_0,
  output        core__dpath__csr___T_13_0,
  output        core__dpath__csr___T_8_0,
  output        core__dpath__csr___io_out_T_47_0,
  output        core__dpath__csr___io_out_T_19_0,
  output        core__dpath__csr___T_12_0,
  output        core__dpath__csr___io_out_T_9_0,
  output        core__dpath__csr___csrRO_T_4_0,
  output        core__dpath__csr___io_out_T_5_0,
  output        core__dpath__csr___isEcall_T_1_0,
  output        core__dpath__csr___wdata_T_5_0,
  output        core__dpath__csr___laddrInvalid_T_6_0,
  output        core__dpath__csr___T_17_0,
  output        core__dpath__csr___laddrInvalid_T_8_0,
  output        core__dpath__csr___io_out_T_45_0,
  output        core__dpath__csr___io_out_T_17_0,
  output        core__dpath__csr___io_out_T_13_0,
  output        core__dpath__csr___io_out_T_11_0,
  output        core__dpath__csr___T_20_0,
  output        core__dpath__csr___T_14_0,
  output        core__dpath__csr___io_out_T_55_0,
  output        core__dpath__csr___io_out_T_39_0,
  output        core__dpath__csr___io_out_T_51_0,
  output        core__dpath__csr__laddrInvalid_0,
  output        core__dpath__csr___io_out_T_23_0,
  output        core__dpath__csr___isInstRet_T_1_0,
  output        core__dpath__csr___io_expt_T_5_0,
  output        core__dpath__csr___isEcall_T_4_0,
  output        core__dpath__csr___csrRO_T_2_0,
  output        core__dpath__csr___saddrInvalid_T_3_0,
  output        core__dpath__csr__isEcall_0,
  output        core__dpath__csr__isEbreak_0,
  output        core__dpath__csr___io_out_T_49_0,
  output        core__dpath__csr___T_11_0,
  output        core__dpath__csr___wdata_T_7_0,
  output        core__dpath__csr___isInstRet_T_5_0,
  output        core__dpath__csr___io_out_T_37_0,
  output        core__dpath__csr___saddrInvalid_T_5_0,
  output        core__dpath__csr___T_22_0,
  output        core__dpath__csr___io_out_T_57_0,
  output        core__dpath__csr___laddrInvalid_T_4_0,
  output        core__dpath__csr___T_9_0,
  output        core__dpath__csr___T_15_0,
  output        core__dpath__csr__saddrInvalid_0,
  output        core__dpath__csr___T_19_0,
  output        core__dpath__csr___io_out_T_21_0,
  output        core__dpath__csr___io_out_T_15_0,
  output        core__dpath__regFile___T_1_0,
  output        core__dpath__regFile___io_rdata2_T_0,
  output        core__dpath__regFile___io_rdata1_T_0,
  output        core__dpath__alu___out_T_1_0,
  output        core__dpath__alu___cmp_T_4_0,
  output        core__dpath__alu___out_T_0,
  output        core__dpath__alu___out_T_10_0,
  output        core__dpath__alu___out_T_12_0,
  output        core__dpath__alu___shin_T_0,
  output        core__dpath__alu___out_T_9_0,
  output        core__dpath__alu___out_T_4_0,
  output        core__dpath__alu___out_T_3_0,
  output        core__dpath__alu___out_T_14_0,
  output        core__dpath__alu___out_T_6_0,
  output        core__dpath__alu___out_T_7_0,
  output        core__dpath__alu___out_T_8_0,
  output        core__dpath__alu___cmp_T_2_0,
  output        core__dpath__alu___sum_T_0,
  output        core__dpath__alu___out_T_5_0,
  output        core__dpath__alu___out_T_2_0,
  output        core__dpath__alu___out_T_16_0,
  output        core__dpath__immGen___io_out_T_2_0,
  output        core__dpath__immGen___io_out_T_4_0,
  output        core__dpath__immGen___io_out_T_6_0,
  output        core__dpath__immGen___io_out_T_12_0,
  output        core__dpath__immGen___io_out_T_8_0,
  output        core__dpath__immGen___io_out_T_10_0,
  output        core__dpath__brCond__isSameSign_0,
  output        core__dpath__brCond__eq_0,
  output        core__dpath__brCond___io_taken_T_5_0,
  output        core__dpath__brCond___io_taken_T_0,
  output        core__dpath__brCond___io_taken_T_11_0,
  output        core__dpath__brCond___io_taken_T_8_0,
  output        core__dpath__brCond___io_taken_T_14_0,
  output        core__dpath__brCond___io_taken_T_2_0,
  output        core__dpath__brCond__geu_0,
  output        core__dpath__brCond__ge_0,
  output        core__dpath___io_dcache_req_bits_mask_T_7_0,
  output        core__dpath___npc_T_2_0,
  output        core__dpath___inst_T_2_0,
  output        core__dpath___rs1_T_0,
  output        core__dpath___T_6_0,
  output        core__dpath__io_ctrl_A_sel_0,
  output        core__dpath___npc_T_5_0,
  output        core__dpath___io_icache_req_valid_T_0,
  output        core__dpath__io_ctrl_B_sel_0,
  output        core__dpath___regWrite_T_9_0,
  output        core__dpath___stall_T_1_0,
  output        core__dpath__csr__io_expt,
  output        core__dpath___regWrite_T_7_0,
  output        core__dpath___stall_T_0,
  output        core__dpath___rs1hazard_T_2_0,
  output        core__dpath___load_T_13_0,
  output        core__dpath___load_T_11_0,
  output        core__dpath___rs1_T_1_0,
  output        core__dpath__stall_0,
  output        core__dpath___io_dcache_req_bits_mask_T_9_0,
  output        core__dpath___load_T_15_0,
  output        core__dpath___io_dcache_req_bits_mask_T_5_0,
  output        core__dpath___rs2hazard_T_2_0,
  output        core__dpath___csr_in_T_0,
  output        core__dpath___npc_T_0,
  output        core__dpath___regWrite_T_5_0,
  output        core__dpath___npc_T_1_0,
  output        core__dpath___rs2_T_1_0,
  output        core__dpath___load_T_9_0,
  output        core__dpath___T_4_0,
  output        core__dpath___T_7_0,
  output        core__ctrl___ctrlSignals_T_31_0,
  output        core__ctrl___ctrlSignals_T_93_0,
  output        core__ctrl___ctrlSignals_T_87_0,
  output        core__ctrl___ctrlSignals_T_81_0,
  output        core__ctrl___ctrlSignals_T_15_0,
  output        core__ctrl___ctrlSignals_T_49_0,
  output        core__ctrl___ctrlSignals_T_5_0,
  output        core__ctrl___ctrlSignals_T_41_0,
  output        core__ctrl___ctrlSignals_T_11_0,
  output        core__ctrl___ctrlSignals_T_19_0,
  output        core__ctrl___ctrlSignals_T_95_0,
  output        core__ctrl___ctrlSignals_T_21_0,
  output        core__ctrl___ctrlSignals_T_47_0,
  output        core__ctrl___ctrlSignals_T_35_0,
  output        core__ctrl___ctrlSignals_T_75_0,
  output        core__ctrl___ctrlSignals_T_25_0,
  output        core__ctrl___ctrlSignals_T_55_0,
  output        core__ctrl___ctrlSignals_T_71_0,
  output        core__ctrl___ctrlSignals_T_27_0,
  output        core__ctrl___ctrlSignals_T_59_0,
  output        core__ctrl___ctrlSignals_T_29_0,
  output        core__ctrl___ctrlSignals_T_39_0,
  output        core__ctrl___ctrlSignals_T_1_0,
  output        core__ctrl___ctrlSignals_T_63_0,
  output        core__ctrl___ctrlSignals_T_97_0,
  output        core__ctrl___ctrlSignals_T_23_0,
  output        core__ctrl___ctrlSignals_T_65_0,
  output        core__ctrl___ctrlSignals_T_89_0,
  output        core__ctrl___ctrlSignals_T_51_0,
  output        core__ctrl___ctrlSignals_T_83_0,
  output        core__ctrl___ctrlSignals_T_77_0,
  output        core__ctrl___ctrlSignals_T_85_0,
  output        core__ctrl___ctrlSignals_T_37_0,
  output        core__ctrl___ctrlSignals_T_67_0,
  output        core__ctrl___ctrlSignals_T_91_0,
  output        core__ctrl___ctrlSignals_T_43_0,
  output        core__ctrl___ctrlSignals_T_17_0,
  output        core__ctrl___ctrlSignals_T_9_0,
  output        core__ctrl___ctrlSignals_T_79_0,
  output        core__ctrl___ctrlSignals_T_33_0,
  output        core__ctrl___ctrlSignals_T_45_0,
  output        core__ctrl___ctrlSignals_T_13_0,
  output        core__ctrl___ctrlSignals_T_53_0,
  output        core__ctrl___ctrlSignals_T_69_0,
  output        core__ctrl___ctrlSignals_T_3_0,
  output        core__ctrl___ctrlSignals_T_7_0,
  output        core__ctrl___ctrlSignals_T_73_0,
  output        core__ctrl___ctrlSignals_T_57_0,
  output        core__ctrl___ctrlSignals_T_61_0,
  output        icache___T_5_0,
  output        icache___wmask_T_0,
  output        icache___T_18_0,
  output        icache__io_cpu_req_valid_0,
  output        icache___T_25_0,
  output        icache___T_33_0,
  output        icache__wen_0,
  output        icache__is_alloc_reg_0,
  output        icache__read_wrap_out_0,
  output        icache___T_21_0,
  output        icache___T_11_0,
  output        icache___T_16_0,
  output        icache___T_0,
  output        icache__ren_0,
  output        icache___hit_T_2_0,
  output        icache___T_6_0,
  output        icache___io_nasti_ar_valid_T_0,
  output        icache___wen_T_0,
  output        icache__is_idle_0,
  output        icache___T_8_0,
  output        icache__is_write_0,
  output        icache___T_43_0,
  output        icache___T_20_0,
  output        icache___is_alloc_T_0,
  output        icache__read_count_0,
  output        icache___T_13_0,
  output        icache__io_cpu_resp_valid_0,
  output        icache___ren_T_0,
  output        icache___T_3_0,
  output        icache__ren_reg_0,
  output        icache___T_19_0,
  output        icache___T_51_0,
  output        icache___T_28_0,
  output        icache___T_9_0,
  output        icache___T_14_0,
  output        icache___T_4_0,
  output        icache___T_47_0,
  output        icache___T_15_0,
  output        icache___T_40_0,
  output        icache__is_alloc_0,
  output        icache__hit_0,
  output        icache___T_30_0,
  output        icache__is_read_0,
  output        icache___T_10_0,
  output        dcache___T_5_0,
  output        dcache___io_cpu_resp_valid_T_3_0,
  output        dcache___wmask_T_0,
  output        dcache___state_T_0,
  output        dcache__wen_0,
  output        dcache___T_33_0,
  output        dcache___T_44_0,
  output        dcache__read_wrap_out_0,
  output        dcache___T_21_0,
  output        dcache___T_16_0,
  output        dcache___ren_T_0,
  output        dcache__ren_0,
  output        dcache___hit_T_2_0,
  output        dcache___T_6_0,
  output        dcache___io_nasti_ar_valid_T_0,
  output        dcache___T_1_0,
  output        dcache___T_29_0,
  output        dcache__write_count_0,
  output        dcache___T_8_0,
  output        dcache__is_write_0,
  output        dcache___T_20_0,
  output        dcache___is_alloc_T_0,
  output        dcache__read_count_0,
  output        dcache__io_cpu_resp_valid_0,
  output        dcache___T_51_0,
  output        dcache___T_4_0,
  output        dcache___T_15_0,
  output        dcache___T_40_0,
  output        dcache__is_alloc_0,
  output        dcache__hit_0,
  output        dcache___T_30_0,
  output        dcache__is_read_0,
  output        dcache___T_35_0,
  output        dcache___T_10_0,
  output        dcache___T_18_0,
  output        dcache__io_cpu_req_valid_0,
  output        dcache___T_25_0,
  output        dcache__is_alloc_reg_0,
  output        dcache___T_11_0,
  output        dcache___T_0,
  output        dcache___io_cpu_resp_valid_T_2_0,
  output        dcache___wen_T_2_0,
  output        dcache__is_idle_0,
  output        dcache___T_43_0,
  output        dcache___T_13_0,
  output        dcache__write_wrap_out_0,
  output        dcache___T_3_0,
  output        dcache__ren_reg_0,
  output        dcache___T_19_0,
  output        dcache___T_28_0,
  output        dcache___T_9_0,
  output        dcache___T_14_0,
  output        dcache___T_47_0,
  output        arb___T_2_0,
  output        arb___T_13_0,
  output        arb___T_24_0,
  output        arb__io_dcache_ar_valid_0,
  output        arb___io_nasti_ar_valid_T_1_0,
  output        arb___T_20_0,
  output        arb___T_8_0,
  output        arb___io_dcache_b_valid_T_0,
  output        arb___T_5_0,
  output        arb___T_4_0,
  output        arb___io_icache_ar_ready_T_0,
  output        arb___T_10_0,
  output        arb___T_18_0,
  output        arb___io_nasti_aw_valid_T_0,
  output        arb___T_3_0,
  output        arb___io_icache_r_valid_T_0,
  output        arb___io_dcache_r_valid_T_0,
  output        arb___T_23_0,
  output        arb___io_nasti_w_valid_T_0
);
  wire  core_clock; // @[Tile.scala 109:20]
  wire  core_reset; // @[Tile.scala 109:20]
  wire  core_io_icache_req_valid; // @[Tile.scala 109:20]
  wire [31:0] core_io_icache_req_bits_addr; // @[Tile.scala 109:20]
  wire  core_io_icache_resp_valid; // @[Tile.scala 109:20]
  wire [31:0] core_io_icache_resp_bits_data; // @[Tile.scala 109:20]
  wire  core_io_dcache_abort; // @[Tile.scala 109:20]
  wire  core_io_dcache_req_valid; // @[Tile.scala 109:20]
  wire [31:0] core_io_dcache_req_bits_addr; // @[Tile.scala 109:20]
  wire [31:0] core_io_dcache_req_bits_data; // @[Tile.scala 109:20]
  wire [3:0] core_io_dcache_req_bits_mask; // @[Tile.scala 109:20]
  wire  core_io_dcache_resp_valid; // @[Tile.scala 109:20]
  wire [31:0] core_io_dcache_resp_bits_data; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_29_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__isInstRet_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_10_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_7_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_33_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_23_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_25_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_6_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_31_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___wdata_T_3_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__privInst_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_16_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__isEret_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_41_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_1_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_53_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__iaddrInvalid_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_27_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_43_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_1_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_35_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_3_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_18_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__privValid_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_expt_T_6_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___isInstRet_T_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_3_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_7_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__io_expt_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_24_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___wen_T_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_21_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__wen_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_13_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_8_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_47_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_19_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_12_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_9_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___csrRO_T_4_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_5_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___isEcall_T_1_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___wdata_T_5_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___laddrInvalid_T_6_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_17_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___laddrInvalid_T_8_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_45_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_17_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_13_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_11_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_20_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_14_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_55_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_39_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_51_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__laddrInvalid_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_23_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___isInstRet_T_1_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_expt_T_5_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___isEcall_T_4_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___csrRO_T_2_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___saddrInvalid_T_3_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__isEcall_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__isEbreak_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_49_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_11_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___wdata_T_7_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___isInstRet_T_5_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_37_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___saddrInvalid_T_5_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_22_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_57_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___laddrInvalid_T_4_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_9_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_15_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__saddrInvalid_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___T_19_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_21_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr___io_out_T_15_0; // @[Tile.scala 109:20]
  wire  core_dpath__regFile___T_1_0; // @[Tile.scala 109:20]
  wire  core_dpath__regFile___io_rdata2_T_0; // @[Tile.scala 109:20]
  wire  core_dpath__regFile___io_rdata1_T_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_1_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___cmp_T_4_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_10_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_12_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___shin_T_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_9_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_4_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_3_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_14_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_6_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_7_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_8_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___cmp_T_2_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___sum_T_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_5_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_2_0; // @[Tile.scala 109:20]
  wire  core_dpath__alu___out_T_16_0; // @[Tile.scala 109:20]
  wire  core_dpath__immGen___io_out_T_2_0; // @[Tile.scala 109:20]
  wire  core_dpath__immGen___io_out_T_4_0; // @[Tile.scala 109:20]
  wire  core_dpath__immGen___io_out_T_6_0; // @[Tile.scala 109:20]
  wire  core_dpath__immGen___io_out_T_12_0; // @[Tile.scala 109:20]
  wire  core_dpath__immGen___io_out_T_8_0; // @[Tile.scala 109:20]
  wire  core_dpath__immGen___io_out_T_10_0; // @[Tile.scala 109:20]
  wire  core_dpath__brCond__isSameSign_0; // @[Tile.scala 109:20]
  wire  core_dpath__brCond__eq_0; // @[Tile.scala 109:20]
  wire  core_dpath__brCond___io_taken_T_5_0; // @[Tile.scala 109:20]
  wire  core_dpath__brCond___io_taken_T_0; // @[Tile.scala 109:20]
  wire  core_dpath__brCond___io_taken_T_11_0; // @[Tile.scala 109:20]
  wire  core_dpath__brCond___io_taken_T_8_0; // @[Tile.scala 109:20]
  wire  core_dpath__brCond___io_taken_T_14_0; // @[Tile.scala 109:20]
  wire  core_dpath__brCond___io_taken_T_2_0; // @[Tile.scala 109:20]
  wire  core_dpath__brCond__geu_0; // @[Tile.scala 109:20]
  wire  core_dpath__brCond__ge_0; // @[Tile.scala 109:20]
  wire  core_dpath___io_dcache_req_bits_mask_T_7_0; // @[Tile.scala 109:20]
  wire  core_dpath___npc_T_2_0; // @[Tile.scala 109:20]
  wire  core_dpath___inst_T_2_0; // @[Tile.scala 109:20]
  wire  core_dpath___rs1_T_0; // @[Tile.scala 109:20]
  wire  core_dpath___T_6_0; // @[Tile.scala 109:20]
  wire  core_dpath__io_ctrl_A_sel_0; // @[Tile.scala 109:20]
  wire  core_dpath___npc_T_5_0; // @[Tile.scala 109:20]
  wire  core_dpath___io_icache_req_valid_T_0; // @[Tile.scala 109:20]
  wire  core_dpath__io_ctrl_B_sel_0; // @[Tile.scala 109:20]
  wire  core_dpath___regWrite_T_9_0; // @[Tile.scala 109:20]
  wire  core_dpath___stall_T_1_0; // @[Tile.scala 109:20]
  wire  core_dpath__csr__io_expt; // @[Tile.scala 109:20]
  wire  core_dpath___regWrite_T_7_0; // @[Tile.scala 109:20]
  wire  core_dpath___stall_T_0; // @[Tile.scala 109:20]
  wire  core_dpath___rs1hazard_T_2_0; // @[Tile.scala 109:20]
  wire  core_dpath___load_T_13_0; // @[Tile.scala 109:20]
  wire  core_dpath___load_T_11_0; // @[Tile.scala 109:20]
  wire  core_dpath___rs1_T_1_0; // @[Tile.scala 109:20]
  wire  core_dpath__stall_0; // @[Tile.scala 109:20]
  wire  core_dpath___io_dcache_req_bits_mask_T_9_0; // @[Tile.scala 109:20]
  wire  core_dpath___load_T_15_0; // @[Tile.scala 109:20]
  wire  core_dpath___io_dcache_req_bits_mask_T_5_0; // @[Tile.scala 109:20]
  wire  core_dpath___rs2hazard_T_2_0; // @[Tile.scala 109:20]
  wire  core_dpath___csr_in_T_0; // @[Tile.scala 109:20]
  wire  core_dpath___npc_T_0; // @[Tile.scala 109:20]
  wire  core_dpath___regWrite_T_5_0; // @[Tile.scala 109:20]
  wire  core_dpath___npc_T_1_0; // @[Tile.scala 109:20]
  wire  core_dpath___rs2_T_1_0; // @[Tile.scala 109:20]
  wire  core_dpath___load_T_9_0; // @[Tile.scala 109:20]
  wire  core_dpath___T_4_0; // @[Tile.scala 109:20]
  wire  core_dpath___T_7_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_31_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_93_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_87_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_81_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_15_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_49_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_5_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_41_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_11_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_19_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_95_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_21_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_47_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_35_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_75_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_25_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_55_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_71_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_27_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_59_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_29_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_39_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_1_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_63_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_97_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_23_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_65_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_89_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_51_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_83_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_77_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_85_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_37_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_67_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_91_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_43_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_17_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_9_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_79_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_33_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_45_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_13_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_53_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_69_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_3_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_7_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_73_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_57_0; // @[Tile.scala 109:20]
  wire  core_ctrl___ctrlSignals_T_61_0; // @[Tile.scala 109:20]
  wire  icache_clock; // @[Tile.scala 110:22]
  wire  icache_reset; // @[Tile.scala 110:22]
  wire  icache_io_cpu_req_valid; // @[Tile.scala 110:22]
  wire [31:0] icache_io_cpu_req_bits_addr; // @[Tile.scala 110:22]
  wire  icache_io_cpu_resp_valid; // @[Tile.scala 110:22]
  wire [31:0] icache_io_cpu_resp_bits_data; // @[Tile.scala 110:22]
  wire  icache_io_nasti_ar_ready; // @[Tile.scala 110:22]
  wire  icache_io_nasti_ar_valid; // @[Tile.scala 110:22]
  wire [31:0] icache_io_nasti_ar_bits_addr; // @[Tile.scala 110:22]
  wire  icache_io_nasti_r_ready; // @[Tile.scala 110:22]
  wire  icache_io_nasti_r_valid; // @[Tile.scala 110:22]
  wire [63:0] icache_io_nasti_r_bits_data; // @[Tile.scala 110:22]
  wire  icache__T_5_0; // @[Tile.scala 110:22]
  wire  icache__wmask_T_0; // @[Tile.scala 110:22]
  wire  icache__T_18_0; // @[Tile.scala 110:22]
  wire  icache_io_cpu_req_valid_0; // @[Tile.scala 110:22]
  wire  icache__T_25_0; // @[Tile.scala 110:22]
  wire  icache__T_33_0; // @[Tile.scala 110:22]
  wire  icache_wen_0; // @[Tile.scala 110:22]
  wire  icache_is_alloc_reg_0; // @[Tile.scala 110:22]
  wire  icache_read_wrap_out_0; // @[Tile.scala 110:22]
  wire  icache__T_21_0; // @[Tile.scala 110:22]
  wire  icache__T_11_0; // @[Tile.scala 110:22]
  wire  icache__T_16_0; // @[Tile.scala 110:22]
  wire  icache__T_0; // @[Tile.scala 110:22]
  wire  icache_ren_0; // @[Tile.scala 110:22]
  wire  icache__hit_T_2_0; // @[Tile.scala 110:22]
  wire  icache__T_6_0; // @[Tile.scala 110:22]
  wire  icache__io_nasti_ar_valid_T_0; // @[Tile.scala 110:22]
  wire  icache__wen_T_0; // @[Tile.scala 110:22]
  wire  icache_is_idle_0; // @[Tile.scala 110:22]
  wire  icache__T_8_0; // @[Tile.scala 110:22]
  wire  icache_is_write_0; // @[Tile.scala 110:22]
  wire  icache__T_43_0; // @[Tile.scala 110:22]
  wire  icache__T_20_0; // @[Tile.scala 110:22]
  wire  icache__is_alloc_T_0; // @[Tile.scala 110:22]
  wire  icache_read_count_0; // @[Tile.scala 110:22]
  wire  icache__T_13_0; // @[Tile.scala 110:22]
  wire  icache_io_cpu_resp_valid_0; // @[Tile.scala 110:22]
  wire  icache__ren_T_0; // @[Tile.scala 110:22]
  wire  icache__T_3_0; // @[Tile.scala 110:22]
  wire  icache_ren_reg_0; // @[Tile.scala 110:22]
  wire  icache__T_19_0; // @[Tile.scala 110:22]
  wire  icache__T_51_0; // @[Tile.scala 110:22]
  wire  icache__T_28_0; // @[Tile.scala 110:22]
  wire  icache__T_9_0; // @[Tile.scala 110:22]
  wire  icache__T_14_0; // @[Tile.scala 110:22]
  wire  icache__T_4_0; // @[Tile.scala 110:22]
  wire  icache__T_47_0; // @[Tile.scala 110:22]
  wire  icache__T_15_0; // @[Tile.scala 110:22]
  wire  icache__T_40_0; // @[Tile.scala 110:22]
  wire  icache_is_alloc_0; // @[Tile.scala 110:22]
  wire  icache_hit_0; // @[Tile.scala 110:22]
  wire  icache__T_30_0; // @[Tile.scala 110:22]
  wire  icache_is_read_0; // @[Tile.scala 110:22]
  wire  icache__T_10_0; // @[Tile.scala 110:22]
  wire  dcache_clock; // @[Tile.scala 111:22]
  wire  dcache_reset; // @[Tile.scala 111:22]
  wire  dcache_io_cpu_abort; // @[Tile.scala 111:22]
  wire  dcache_io_cpu_req_valid; // @[Tile.scala 111:22]
  wire [31:0] dcache_io_cpu_req_bits_addr; // @[Tile.scala 111:22]
  wire [31:0] dcache_io_cpu_req_bits_data; // @[Tile.scala 111:22]
  wire [3:0] dcache_io_cpu_req_bits_mask; // @[Tile.scala 111:22]
  wire  dcache_io_cpu_resp_valid; // @[Tile.scala 111:22]
  wire [31:0] dcache_io_cpu_resp_bits_data; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_aw_ready; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_aw_valid; // @[Tile.scala 111:22]
  wire [31:0] dcache_io_nasti_aw_bits_addr; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_w_ready; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_w_valid; // @[Tile.scala 111:22]
  wire [63:0] dcache_io_nasti_w_bits_data; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_w_bits_last; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_b_ready; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_b_valid; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_ar_ready; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_ar_valid; // @[Tile.scala 111:22]
  wire [31:0] dcache_io_nasti_ar_bits_addr; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_r_ready; // @[Tile.scala 111:22]
  wire  dcache_io_nasti_r_valid; // @[Tile.scala 111:22]
  wire [63:0] dcache_io_nasti_r_bits_data; // @[Tile.scala 111:22]
  wire  dcache__T_5_0; // @[Tile.scala 111:22]
  wire  dcache__io_cpu_resp_valid_T_3_0; // @[Tile.scala 111:22]
  wire  dcache__wmask_T_0; // @[Tile.scala 111:22]
  wire  dcache__state_T_0; // @[Tile.scala 111:22]
  wire  dcache_wen_0; // @[Tile.scala 111:22]
  wire  dcache__T_33_0; // @[Tile.scala 111:22]
  wire  dcache__T_44_0; // @[Tile.scala 111:22]
  wire  dcache_read_wrap_out_0; // @[Tile.scala 111:22]
  wire  dcache__T_21_0; // @[Tile.scala 111:22]
  wire  dcache__T_16_0; // @[Tile.scala 111:22]
  wire  dcache__ren_T_0; // @[Tile.scala 111:22]
  wire  dcache_ren_0; // @[Tile.scala 111:22]
  wire  dcache__hit_T_2_0; // @[Tile.scala 111:22]
  wire  dcache__T_6_0; // @[Tile.scala 111:22]
  wire  dcache__io_nasti_ar_valid_T_0; // @[Tile.scala 111:22]
  wire  dcache__T_1_0; // @[Tile.scala 111:22]
  wire  dcache__T_29_0; // @[Tile.scala 111:22]
  wire  dcache_write_count_0; // @[Tile.scala 111:22]
  wire  dcache__T_8_0; // @[Tile.scala 111:22]
  wire  dcache_is_write_0; // @[Tile.scala 111:22]
  wire  dcache__T_20_0; // @[Tile.scala 111:22]
  wire  dcache__is_alloc_T_0; // @[Tile.scala 111:22]
  wire  dcache_read_count_0; // @[Tile.scala 111:22]
  wire  dcache_io_cpu_resp_valid_0; // @[Tile.scala 111:22]
  wire  dcache__T_51_0; // @[Tile.scala 111:22]
  wire  dcache__T_4_0; // @[Tile.scala 111:22]
  wire  dcache__T_15_0; // @[Tile.scala 111:22]
  wire  dcache__T_40_0; // @[Tile.scala 111:22]
  wire  dcache_is_alloc_0; // @[Tile.scala 111:22]
  wire  dcache_hit_0; // @[Tile.scala 111:22]
  wire  dcache__T_30_0; // @[Tile.scala 111:22]
  wire  dcache_is_read_0; // @[Tile.scala 111:22]
  wire  dcache__T_35_0; // @[Tile.scala 111:22]
  wire  dcache__T_10_0; // @[Tile.scala 111:22]
  wire  dcache__T_18_0; // @[Tile.scala 111:22]
  wire  dcache_io_cpu_req_valid_0; // @[Tile.scala 111:22]
  wire  dcache__T_25_0; // @[Tile.scala 111:22]
  wire  dcache_is_alloc_reg_0; // @[Tile.scala 111:22]
  wire  dcache__T_11_0; // @[Tile.scala 111:22]
  wire  dcache__T_0; // @[Tile.scala 111:22]
  wire  dcache__io_cpu_resp_valid_T_2_0; // @[Tile.scala 111:22]
  wire  dcache__wen_T_2_0; // @[Tile.scala 111:22]
  wire  dcache_is_idle_0; // @[Tile.scala 111:22]
  wire  dcache__T_43_0; // @[Tile.scala 111:22]
  wire  dcache__T_13_0; // @[Tile.scala 111:22]
  wire  dcache_write_wrap_out_0; // @[Tile.scala 111:22]
  wire  dcache__T_3_0; // @[Tile.scala 111:22]
  wire  dcache_ren_reg_0; // @[Tile.scala 111:22]
  wire  dcache__T_19_0; // @[Tile.scala 111:22]
  wire  dcache__T_28_0; // @[Tile.scala 111:22]
  wire  dcache__T_9_0; // @[Tile.scala 111:22]
  wire  dcache__T_14_0; // @[Tile.scala 111:22]
  wire  dcache__T_47_0; // @[Tile.scala 111:22]
  wire  arb_clock; // @[Tile.scala 112:19]
  wire  arb_reset; // @[Tile.scala 112:19]
  wire  arb_io_icache_ar_ready; // @[Tile.scala 112:19]
  wire  arb_io_icache_ar_valid; // @[Tile.scala 112:19]
  wire [31:0] arb_io_icache_ar_bits_addr; // @[Tile.scala 112:19]
  wire  arb_io_icache_r_ready; // @[Tile.scala 112:19]
  wire  arb_io_icache_r_valid; // @[Tile.scala 112:19]
  wire [63:0] arb_io_icache_r_bits_data; // @[Tile.scala 112:19]
  wire  arb_io_dcache_aw_ready; // @[Tile.scala 112:19]
  wire  arb_io_dcache_aw_valid; // @[Tile.scala 112:19]
  wire [31:0] arb_io_dcache_aw_bits_addr; // @[Tile.scala 112:19]
  wire  arb_io_dcache_w_ready; // @[Tile.scala 112:19]
  wire  arb_io_dcache_w_valid; // @[Tile.scala 112:19]
  wire [63:0] arb_io_dcache_w_bits_data; // @[Tile.scala 112:19]
  wire  arb_io_dcache_w_bits_last; // @[Tile.scala 112:19]
  wire  arb_io_dcache_b_ready; // @[Tile.scala 112:19]
  wire  arb_io_dcache_b_valid; // @[Tile.scala 112:19]
  wire  arb_io_dcache_ar_ready; // @[Tile.scala 112:19]
  wire  arb_io_dcache_ar_valid; // @[Tile.scala 112:19]
  wire [31:0] arb_io_dcache_ar_bits_addr; // @[Tile.scala 112:19]
  wire  arb_io_dcache_r_ready; // @[Tile.scala 112:19]
  wire  arb_io_dcache_r_valid; // @[Tile.scala 112:19]
  wire [63:0] arb_io_dcache_r_bits_data; // @[Tile.scala 112:19]
  wire  arb_io_nasti_aw_ready; // @[Tile.scala 112:19]
  wire  arb_io_nasti_aw_valid; // @[Tile.scala 112:19]
  wire [31:0] arb_io_nasti_aw_bits_addr; // @[Tile.scala 112:19]
  wire  arb_io_nasti_w_ready; // @[Tile.scala 112:19]
  wire  arb_io_nasti_w_valid; // @[Tile.scala 112:19]
  wire [63:0] arb_io_nasti_w_bits_data; // @[Tile.scala 112:19]
  wire  arb_io_nasti_b_ready; // @[Tile.scala 112:19]
  wire  arb_io_nasti_b_valid; // @[Tile.scala 112:19]
  wire  arb_io_nasti_ar_ready; // @[Tile.scala 112:19]
  wire  arb_io_nasti_ar_valid; // @[Tile.scala 112:19]
  wire [31:0] arb_io_nasti_ar_bits_addr; // @[Tile.scala 112:19]
  wire  arb_io_nasti_r_ready; // @[Tile.scala 112:19]
  wire  arb_io_nasti_r_valid; // @[Tile.scala 112:19]
  wire [63:0] arb_io_nasti_r_bits_data; // @[Tile.scala 112:19]
  wire  arb_io_nasti_r_bits_last; // @[Tile.scala 112:19]
  wire  arb__T_2_0; // @[Tile.scala 112:19]
  wire  arb__T_13_0; // @[Tile.scala 112:19]
  wire  arb__T_24_0; // @[Tile.scala 112:19]
  wire  arb_io_dcache_ar_valid_0; // @[Tile.scala 112:19]
  wire  arb__io_nasti_ar_valid_T_1_0; // @[Tile.scala 112:19]
  wire  arb__T_20_0; // @[Tile.scala 112:19]
  wire  arb__T_8_0; // @[Tile.scala 112:19]
  wire  arb__io_dcache_b_valid_T_0; // @[Tile.scala 112:19]
  wire  arb__T_5_0; // @[Tile.scala 112:19]
  wire  arb__T_4_0; // @[Tile.scala 112:19]
  wire  arb__io_icache_ar_ready_T_0; // @[Tile.scala 112:19]
  wire  arb__T_10_0; // @[Tile.scala 112:19]
  wire  arb__T_18_0; // @[Tile.scala 112:19]
  wire  arb__io_nasti_aw_valid_T_0; // @[Tile.scala 112:19]
  wire  arb__T_3_0; // @[Tile.scala 112:19]
  wire  arb__io_icache_r_valid_T_0; // @[Tile.scala 112:19]
  wire  arb__io_dcache_r_valid_T_0; // @[Tile.scala 112:19]
  wire  arb__T_23_0; // @[Tile.scala 112:19]
  wire  arb__io_nasti_w_valid_T_0; // @[Tile.scala 112:19]
  Core core ( // @[Tile.scala 109:20]
    .clock(core_clock),
    .reset(core_reset),
    .io_icache_req_valid(core_io_icache_req_valid),
    .io_icache_req_bits_addr(core_io_icache_req_bits_addr),
    .io_icache_resp_valid(core_io_icache_resp_valid),
    .io_icache_resp_bits_data(core_io_icache_resp_bits_data),
    .io_dcache_abort(core_io_dcache_abort),
    .io_dcache_req_valid(core_io_dcache_req_valid),
    .io_dcache_req_bits_addr(core_io_dcache_req_bits_addr),
    .io_dcache_req_bits_data(core_io_dcache_req_bits_data),
    .io_dcache_req_bits_mask(core_io_dcache_req_bits_mask),
    .io_dcache_resp_valid(core_io_dcache_resp_valid),
    .io_dcache_resp_bits_data(core_io_dcache_resp_bits_data),
    .dpath__csr___io_out_T_29_0(core_dpath__csr___io_out_T_29_0),
    .dpath__csr___T_0(core_dpath__csr___T_0),
    .dpath__csr__isInstRet_0(core_dpath__csr__isInstRet_0),
    .dpath__csr___T_10_0(core_dpath__csr___T_10_0),
    .dpath__csr___T_7_0(core_dpath__csr___T_7_0),
    .dpath__csr___io_out_T_33_0(core_dpath__csr___io_out_T_33_0),
    .dpath__csr___T_23_0(core_dpath__csr___T_23_0),
    .dpath__csr___io_out_T_25_0(core_dpath__csr___io_out_T_25_0),
    .dpath__csr___T_6_0(core_dpath__csr___T_6_0),
    .dpath__csr___io_out_T_31_0(core_dpath__csr___io_out_T_31_0),
    .dpath__csr___wdata_T_3_0(core_dpath__csr___wdata_T_3_0),
    .dpath__csr__privInst_0(core_dpath__csr__privInst_0),
    .dpath__csr___T_16_0(core_dpath__csr___T_16_0),
    .dpath__csr__isEret_0(core_dpath__csr__isEret_0),
    .dpath__csr___io_out_T_41_0(core_dpath__csr___io_out_T_41_0),
    .dpath__csr___io_out_T_1_0(core_dpath__csr___io_out_T_1_0),
    .dpath__csr___io_out_T_53_0(core_dpath__csr___io_out_T_53_0),
    .dpath__csr__iaddrInvalid_0(core_dpath__csr__iaddrInvalid_0),
    .dpath__csr___io_out_T_27_0(core_dpath__csr___io_out_T_27_0),
    .dpath__csr___io_out_T_43_0(core_dpath__csr___io_out_T_43_0),
    .dpath__csr___T_1_0(core_dpath__csr___T_1_0),
    .dpath__csr___io_out_T_35_0(core_dpath__csr___io_out_T_35_0),
    .dpath__csr___T_3_0(core_dpath__csr___T_3_0),
    .dpath__csr___T_18_0(core_dpath__csr___T_18_0),
    .dpath__csr__privValid_0(core_dpath__csr__privValid_0),
    .dpath__csr___io_expt_T_6_0(core_dpath__csr___io_expt_T_6_0),
    .dpath__csr___isInstRet_T_0(core_dpath__csr___isInstRet_T_0),
    .dpath__csr___io_out_T_3_0(core_dpath__csr___io_out_T_3_0),
    .dpath__csr___io_out_T_7_0(core_dpath__csr___io_out_T_7_0),
    .dpath__csr__io_expt_0(core_dpath__csr__io_expt_0),
    .dpath__csr___T_24_0(core_dpath__csr___T_24_0),
    .dpath__csr___wen_T_0(core_dpath__csr___wen_T_0),
    .dpath__csr___T_21_0(core_dpath__csr___T_21_0),
    .dpath__csr__wen_0(core_dpath__csr__wen_0),
    .dpath__csr___T_13_0(core_dpath__csr___T_13_0),
    .dpath__csr___T_8_0(core_dpath__csr___T_8_0),
    .dpath__csr___io_out_T_47_0(core_dpath__csr___io_out_T_47_0),
    .dpath__csr___io_out_T_19_0(core_dpath__csr___io_out_T_19_0),
    .dpath__csr___T_12_0(core_dpath__csr___T_12_0),
    .dpath__csr___io_out_T_9_0(core_dpath__csr___io_out_T_9_0),
    .dpath__csr___csrRO_T_4_0(core_dpath__csr___csrRO_T_4_0),
    .dpath__csr___io_out_T_5_0(core_dpath__csr___io_out_T_5_0),
    .dpath__csr___isEcall_T_1_0(core_dpath__csr___isEcall_T_1_0),
    .dpath__csr___wdata_T_5_0(core_dpath__csr___wdata_T_5_0),
    .dpath__csr___laddrInvalid_T_6_0(core_dpath__csr___laddrInvalid_T_6_0),
    .dpath__csr___T_17_0(core_dpath__csr___T_17_0),
    .dpath__csr___laddrInvalid_T_8_0(core_dpath__csr___laddrInvalid_T_8_0),
    .dpath__csr___io_out_T_45_0(core_dpath__csr___io_out_T_45_0),
    .dpath__csr___io_out_T_17_0(core_dpath__csr___io_out_T_17_0),
    .dpath__csr___io_out_T_13_0(core_dpath__csr___io_out_T_13_0),
    .dpath__csr___io_out_T_11_0(core_dpath__csr___io_out_T_11_0),
    .dpath__csr___T_20_0(core_dpath__csr___T_20_0),
    .dpath__csr___T_14_0(core_dpath__csr___T_14_0),
    .dpath__csr___io_out_T_55_0(core_dpath__csr___io_out_T_55_0),
    .dpath__csr___io_out_T_39_0(core_dpath__csr___io_out_T_39_0),
    .dpath__csr___io_out_T_51_0(core_dpath__csr___io_out_T_51_0),
    .dpath__csr__laddrInvalid_0(core_dpath__csr__laddrInvalid_0),
    .dpath__csr___io_out_T_23_0(core_dpath__csr___io_out_T_23_0),
    .dpath__csr___isInstRet_T_1_0(core_dpath__csr___isInstRet_T_1_0),
    .dpath__csr___io_expt_T_5_0(core_dpath__csr___io_expt_T_5_0),
    .dpath__csr___isEcall_T_4_0(core_dpath__csr___isEcall_T_4_0),
    .dpath__csr___csrRO_T_2_0(core_dpath__csr___csrRO_T_2_0),
    .dpath__csr___saddrInvalid_T_3_0(core_dpath__csr___saddrInvalid_T_3_0),
    .dpath__csr__isEcall_0(core_dpath__csr__isEcall_0),
    .dpath__csr__isEbreak_0(core_dpath__csr__isEbreak_0),
    .dpath__csr___io_out_T_49_0(core_dpath__csr___io_out_T_49_0),
    .dpath__csr___T_11_0(core_dpath__csr___T_11_0),
    .dpath__csr___wdata_T_7_0(core_dpath__csr___wdata_T_7_0),
    .dpath__csr___isInstRet_T_5_0(core_dpath__csr___isInstRet_T_5_0),
    .dpath__csr___io_out_T_37_0(core_dpath__csr___io_out_T_37_0),
    .dpath__csr___saddrInvalid_T_5_0(core_dpath__csr___saddrInvalid_T_5_0),
    .dpath__csr___T_22_0(core_dpath__csr___T_22_0),
    .dpath__csr___io_out_T_57_0(core_dpath__csr___io_out_T_57_0),
    .dpath__csr___laddrInvalid_T_4_0(core_dpath__csr___laddrInvalid_T_4_0),
    .dpath__csr___T_9_0(core_dpath__csr___T_9_0),
    .dpath__csr___T_15_0(core_dpath__csr___T_15_0),
    .dpath__csr__saddrInvalid_0(core_dpath__csr__saddrInvalid_0),
    .dpath__csr___T_19_0(core_dpath__csr___T_19_0),
    .dpath__csr___io_out_T_21_0(core_dpath__csr___io_out_T_21_0),
    .dpath__csr___io_out_T_15_0(core_dpath__csr___io_out_T_15_0),
    .dpath__regFile___T_1_0(core_dpath__regFile___T_1_0),
    .dpath__regFile___io_rdata2_T_0(core_dpath__regFile___io_rdata2_T_0),
    .dpath__regFile___io_rdata1_T_0(core_dpath__regFile___io_rdata1_T_0),
    .dpath__alu___out_T_1_0(core_dpath__alu___out_T_1_0),
    .dpath__alu___cmp_T_4_0(core_dpath__alu___cmp_T_4_0),
    .dpath__alu___out_T_0(core_dpath__alu___out_T_0),
    .dpath__alu___out_T_10_0(core_dpath__alu___out_T_10_0),
    .dpath__alu___out_T_12_0(core_dpath__alu___out_T_12_0),
    .dpath__alu___shin_T_0(core_dpath__alu___shin_T_0),
    .dpath__alu___out_T_9_0(core_dpath__alu___out_T_9_0),
    .dpath__alu___out_T_4_0(core_dpath__alu___out_T_4_0),
    .dpath__alu___out_T_3_0(core_dpath__alu___out_T_3_0),
    .dpath__alu___out_T_14_0(core_dpath__alu___out_T_14_0),
    .dpath__alu___out_T_6_0(core_dpath__alu___out_T_6_0),
    .dpath__alu___out_T_7_0(core_dpath__alu___out_T_7_0),
    .dpath__alu___out_T_8_0(core_dpath__alu___out_T_8_0),
    .dpath__alu___cmp_T_2_0(core_dpath__alu___cmp_T_2_0),
    .dpath__alu___sum_T_0(core_dpath__alu___sum_T_0),
    .dpath__alu___out_T_5_0(core_dpath__alu___out_T_5_0),
    .dpath__alu___out_T_2_0(core_dpath__alu___out_T_2_0),
    .dpath__alu___out_T_16_0(core_dpath__alu___out_T_16_0),
    .dpath__immGen___io_out_T_2_0(core_dpath__immGen___io_out_T_2_0),
    .dpath__immGen___io_out_T_4_0(core_dpath__immGen___io_out_T_4_0),
    .dpath__immGen___io_out_T_6_0(core_dpath__immGen___io_out_T_6_0),
    .dpath__immGen___io_out_T_12_0(core_dpath__immGen___io_out_T_12_0),
    .dpath__immGen___io_out_T_8_0(core_dpath__immGen___io_out_T_8_0),
    .dpath__immGen___io_out_T_10_0(core_dpath__immGen___io_out_T_10_0),
    .dpath__brCond__isSameSign_0(core_dpath__brCond__isSameSign_0),
    .dpath__brCond__eq_0(core_dpath__brCond__eq_0),
    .dpath__brCond___io_taken_T_5_0(core_dpath__brCond___io_taken_T_5_0),
    .dpath__brCond___io_taken_T_0(core_dpath__brCond___io_taken_T_0),
    .dpath__brCond___io_taken_T_11_0(core_dpath__brCond___io_taken_T_11_0),
    .dpath__brCond___io_taken_T_8_0(core_dpath__brCond___io_taken_T_8_0),
    .dpath__brCond___io_taken_T_14_0(core_dpath__brCond___io_taken_T_14_0),
    .dpath__brCond___io_taken_T_2_0(core_dpath__brCond___io_taken_T_2_0),
    .dpath__brCond__geu_0(core_dpath__brCond__geu_0),
    .dpath__brCond__ge_0(core_dpath__brCond__ge_0),
    .dpath___io_dcache_req_bits_mask_T_7_0(core_dpath___io_dcache_req_bits_mask_T_7_0),
    .dpath___npc_T_2_0(core_dpath___npc_T_2_0),
    .dpath___inst_T_2_0(core_dpath___inst_T_2_0),
    .dpath___rs1_T_0(core_dpath___rs1_T_0),
    .dpath___T_6_0(core_dpath___T_6_0),
    .dpath__io_ctrl_A_sel_0(core_dpath__io_ctrl_A_sel_0),
    .dpath___npc_T_5_0(core_dpath___npc_T_5_0),
    .dpath___io_icache_req_valid_T_0(core_dpath___io_icache_req_valid_T_0),
    .dpath__io_ctrl_B_sel_0(core_dpath__io_ctrl_B_sel_0),
    .dpath___regWrite_T_9_0(core_dpath___regWrite_T_9_0),
    .dpath___stall_T_1_0(core_dpath___stall_T_1_0),
    .dpath__csr__io_expt(core_dpath__csr__io_expt),
    .dpath___regWrite_T_7_0(core_dpath___regWrite_T_7_0),
    .dpath___stall_T_0(core_dpath___stall_T_0),
    .dpath___rs1hazard_T_2_0(core_dpath___rs1hazard_T_2_0),
    .dpath___load_T_13_0(core_dpath___load_T_13_0),
    .dpath___load_T_11_0(core_dpath___load_T_11_0),
    .dpath___rs1_T_1_0(core_dpath___rs1_T_1_0),
    .dpath__stall_0(core_dpath__stall_0),
    .dpath___io_dcache_req_bits_mask_T_9_0(core_dpath___io_dcache_req_bits_mask_T_9_0),
    .dpath___load_T_15_0(core_dpath___load_T_15_0),
    .dpath___io_dcache_req_bits_mask_T_5_0(core_dpath___io_dcache_req_bits_mask_T_5_0),
    .dpath___rs2hazard_T_2_0(core_dpath___rs2hazard_T_2_0),
    .dpath___csr_in_T_0(core_dpath___csr_in_T_0),
    .dpath___npc_T_0(core_dpath___npc_T_0),
    .dpath___regWrite_T_5_0(core_dpath___regWrite_T_5_0),
    .dpath___npc_T_1_0(core_dpath___npc_T_1_0),
    .dpath___rs2_T_1_0(core_dpath___rs2_T_1_0),
    .dpath___load_T_9_0(core_dpath___load_T_9_0),
    .dpath___T_4_0(core_dpath___T_4_0),
    .dpath___T_7_0(core_dpath___T_7_0),
    .ctrl___ctrlSignals_T_31_0(core_ctrl___ctrlSignals_T_31_0),
    .ctrl___ctrlSignals_T_93_0(core_ctrl___ctrlSignals_T_93_0),
    .ctrl___ctrlSignals_T_87_0(core_ctrl___ctrlSignals_T_87_0),
    .ctrl___ctrlSignals_T_81_0(core_ctrl___ctrlSignals_T_81_0),
    .ctrl___ctrlSignals_T_15_0(core_ctrl___ctrlSignals_T_15_0),
    .ctrl___ctrlSignals_T_49_0(core_ctrl___ctrlSignals_T_49_0),
    .ctrl___ctrlSignals_T_5_0(core_ctrl___ctrlSignals_T_5_0),
    .ctrl___ctrlSignals_T_41_0(core_ctrl___ctrlSignals_T_41_0),
    .ctrl___ctrlSignals_T_11_0(core_ctrl___ctrlSignals_T_11_0),
    .ctrl___ctrlSignals_T_19_0(core_ctrl___ctrlSignals_T_19_0),
    .ctrl___ctrlSignals_T_95_0(core_ctrl___ctrlSignals_T_95_0),
    .ctrl___ctrlSignals_T_21_0(core_ctrl___ctrlSignals_T_21_0),
    .ctrl___ctrlSignals_T_47_0(core_ctrl___ctrlSignals_T_47_0),
    .ctrl___ctrlSignals_T_35_0(core_ctrl___ctrlSignals_T_35_0),
    .ctrl___ctrlSignals_T_75_0(core_ctrl___ctrlSignals_T_75_0),
    .ctrl___ctrlSignals_T_25_0(core_ctrl___ctrlSignals_T_25_0),
    .ctrl___ctrlSignals_T_55_0(core_ctrl___ctrlSignals_T_55_0),
    .ctrl___ctrlSignals_T_71_0(core_ctrl___ctrlSignals_T_71_0),
    .ctrl___ctrlSignals_T_27_0(core_ctrl___ctrlSignals_T_27_0),
    .ctrl___ctrlSignals_T_59_0(core_ctrl___ctrlSignals_T_59_0),
    .ctrl___ctrlSignals_T_29_0(core_ctrl___ctrlSignals_T_29_0),
    .ctrl___ctrlSignals_T_39_0(core_ctrl___ctrlSignals_T_39_0),
    .ctrl___ctrlSignals_T_1_0(core_ctrl___ctrlSignals_T_1_0),
    .ctrl___ctrlSignals_T_63_0(core_ctrl___ctrlSignals_T_63_0),
    .ctrl___ctrlSignals_T_97_0(core_ctrl___ctrlSignals_T_97_0),
    .ctrl___ctrlSignals_T_23_0(core_ctrl___ctrlSignals_T_23_0),
    .ctrl___ctrlSignals_T_65_0(core_ctrl___ctrlSignals_T_65_0),
    .ctrl___ctrlSignals_T_89_0(core_ctrl___ctrlSignals_T_89_0),
    .ctrl___ctrlSignals_T_51_0(core_ctrl___ctrlSignals_T_51_0),
    .ctrl___ctrlSignals_T_83_0(core_ctrl___ctrlSignals_T_83_0),
    .ctrl___ctrlSignals_T_77_0(core_ctrl___ctrlSignals_T_77_0),
    .ctrl___ctrlSignals_T_85_0(core_ctrl___ctrlSignals_T_85_0),
    .ctrl___ctrlSignals_T_37_0(core_ctrl___ctrlSignals_T_37_0),
    .ctrl___ctrlSignals_T_67_0(core_ctrl___ctrlSignals_T_67_0),
    .ctrl___ctrlSignals_T_91_0(core_ctrl___ctrlSignals_T_91_0),
    .ctrl___ctrlSignals_T_43_0(core_ctrl___ctrlSignals_T_43_0),
    .ctrl___ctrlSignals_T_17_0(core_ctrl___ctrlSignals_T_17_0),
    .ctrl___ctrlSignals_T_9_0(core_ctrl___ctrlSignals_T_9_0),
    .ctrl___ctrlSignals_T_79_0(core_ctrl___ctrlSignals_T_79_0),
    .ctrl___ctrlSignals_T_33_0(core_ctrl___ctrlSignals_T_33_0),
    .ctrl___ctrlSignals_T_45_0(core_ctrl___ctrlSignals_T_45_0),
    .ctrl___ctrlSignals_T_13_0(core_ctrl___ctrlSignals_T_13_0),
    .ctrl___ctrlSignals_T_53_0(core_ctrl___ctrlSignals_T_53_0),
    .ctrl___ctrlSignals_T_69_0(core_ctrl___ctrlSignals_T_69_0),
    .ctrl___ctrlSignals_T_3_0(core_ctrl___ctrlSignals_T_3_0),
    .ctrl___ctrlSignals_T_7_0(core_ctrl___ctrlSignals_T_7_0),
    .ctrl___ctrlSignals_T_73_0(core_ctrl___ctrlSignals_T_73_0),
    .ctrl___ctrlSignals_T_57_0(core_ctrl___ctrlSignals_T_57_0),
    .ctrl___ctrlSignals_T_61_0(core_ctrl___ctrlSignals_T_61_0)
  );
  Cache icache ( // @[Tile.scala 110:22]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_cpu_req_valid(icache_io_cpu_req_valid),
    .io_cpu_req_bits_addr(icache_io_cpu_req_bits_addr),
    .io_cpu_resp_valid(icache_io_cpu_resp_valid),
    .io_cpu_resp_bits_data(icache_io_cpu_resp_bits_data),
    .io_nasti_ar_ready(icache_io_nasti_ar_ready),
    .io_nasti_ar_valid(icache_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(icache_io_nasti_ar_bits_addr),
    .io_nasti_r_ready(icache_io_nasti_r_ready),
    .io_nasti_r_valid(icache_io_nasti_r_valid),
    .io_nasti_r_bits_data(icache_io_nasti_r_bits_data),
    ._T_5_0(icache__T_5_0),
    ._wmask_T_0(icache__wmask_T_0),
    ._T_18_0(icache__T_18_0),
    .io_cpu_req_valid_0(icache_io_cpu_req_valid_0),
    ._T_25_0(icache__T_25_0),
    ._T_33_0(icache__T_33_0),
    .wen_0(icache_wen_0),
    .is_alloc_reg_0(icache_is_alloc_reg_0),
    .read_wrap_out_0(icache_read_wrap_out_0),
    ._T_21_0(icache__T_21_0),
    ._T_11_0(icache__T_11_0),
    ._T_16_0(icache__T_16_0),
    ._T_0(icache__T_0),
    .ren_0(icache_ren_0),
    ._hit_T_2_0(icache__hit_T_2_0),
    ._T_6_0(icache__T_6_0),
    ._io_nasti_ar_valid_T_0(icache__io_nasti_ar_valid_T_0),
    ._wen_T_0(icache__wen_T_0),
    .is_idle_0(icache_is_idle_0),
    ._T_8_0(icache__T_8_0),
    .is_write_0(icache_is_write_0),
    ._T_43_0(icache__T_43_0),
    ._T_20_0(icache__T_20_0),
    ._is_alloc_T_0(icache__is_alloc_T_0),
    .read_count_0(icache_read_count_0),
    ._T_13_0(icache__T_13_0),
    .io_cpu_resp_valid_0(icache_io_cpu_resp_valid_0),
    ._ren_T_0(icache__ren_T_0),
    ._T_3_0(icache__T_3_0),
    .ren_reg_0(icache_ren_reg_0),
    ._T_19_0(icache__T_19_0),
    ._T_51_0(icache__T_51_0),
    ._T_28_0(icache__T_28_0),
    ._T_9_0(icache__T_9_0),
    ._T_14_0(icache__T_14_0),
    ._T_4_0(icache__T_4_0),
    ._T_47_0(icache__T_47_0),
    ._T_15_0(icache__T_15_0),
    ._T_40_0(icache__T_40_0),
    .is_alloc_0(icache_is_alloc_0),
    .hit_0(icache_hit_0),
    ._T_30_0(icache__T_30_0),
    .is_read_0(icache_is_read_0),
    ._T_10_0(icache__T_10_0)
  );
  Cache_1 dcache ( // @[Tile.scala 111:22]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_cpu_abort(dcache_io_cpu_abort),
    .io_cpu_req_valid(dcache_io_cpu_req_valid),
    .io_cpu_req_bits_addr(dcache_io_cpu_req_bits_addr),
    .io_cpu_req_bits_data(dcache_io_cpu_req_bits_data),
    .io_cpu_req_bits_mask(dcache_io_cpu_req_bits_mask),
    .io_cpu_resp_valid(dcache_io_cpu_resp_valid),
    .io_cpu_resp_bits_data(dcache_io_cpu_resp_bits_data),
    .io_nasti_aw_ready(dcache_io_nasti_aw_ready),
    .io_nasti_aw_valid(dcache_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(dcache_io_nasti_aw_bits_addr),
    .io_nasti_w_ready(dcache_io_nasti_w_ready),
    .io_nasti_w_valid(dcache_io_nasti_w_valid),
    .io_nasti_w_bits_data(dcache_io_nasti_w_bits_data),
    .io_nasti_w_bits_last(dcache_io_nasti_w_bits_last),
    .io_nasti_b_ready(dcache_io_nasti_b_ready),
    .io_nasti_b_valid(dcache_io_nasti_b_valid),
    .io_nasti_ar_ready(dcache_io_nasti_ar_ready),
    .io_nasti_ar_valid(dcache_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(dcache_io_nasti_ar_bits_addr),
    .io_nasti_r_ready(dcache_io_nasti_r_ready),
    .io_nasti_r_valid(dcache_io_nasti_r_valid),
    .io_nasti_r_bits_data(dcache_io_nasti_r_bits_data),
    ._T_5_0(dcache__T_5_0),
    ._io_cpu_resp_valid_T_3_0(dcache__io_cpu_resp_valid_T_3_0),
    ._wmask_T_0(dcache__wmask_T_0),
    ._state_T_0(dcache__state_T_0),
    .wen_0(dcache_wen_0),
    ._T_33_0(dcache__T_33_0),
    ._T_44_0(dcache__T_44_0),
    .read_wrap_out_0(dcache_read_wrap_out_0),
    ._T_21_0(dcache__T_21_0),
    ._T_16_0(dcache__T_16_0),
    ._ren_T_0(dcache__ren_T_0),
    .ren_0(dcache_ren_0),
    ._hit_T_2_0(dcache__hit_T_2_0),
    ._T_6_0(dcache__T_6_0),
    ._io_nasti_ar_valid_T_0(dcache__io_nasti_ar_valid_T_0),
    ._T_1_0(dcache__T_1_0),
    ._T_29_0(dcache__T_29_0),
    .write_count_0(dcache_write_count_0),
    ._T_8_0(dcache__T_8_0),
    .is_write_0(dcache_is_write_0),
    ._T_20_0(dcache__T_20_0),
    ._is_alloc_T_0(dcache__is_alloc_T_0),
    .read_count_0(dcache_read_count_0),
    .io_cpu_resp_valid_0(dcache_io_cpu_resp_valid_0),
    ._T_51_0(dcache__T_51_0),
    ._T_4_0(dcache__T_4_0),
    ._T_15_0(dcache__T_15_0),
    ._T_40_0(dcache__T_40_0),
    .is_alloc_0(dcache_is_alloc_0),
    .hit_0(dcache_hit_0),
    ._T_30_0(dcache__T_30_0),
    .is_read_0(dcache_is_read_0),
    ._T_35_0(dcache__T_35_0),
    ._T_10_0(dcache__T_10_0),
    ._T_18_0(dcache__T_18_0),
    .io_cpu_req_valid_0(dcache_io_cpu_req_valid_0),
    ._T_25_0(dcache__T_25_0),
    .is_alloc_reg_0(dcache_is_alloc_reg_0),
    ._T_11_0(dcache__T_11_0),
    ._T_0(dcache__T_0),
    ._io_cpu_resp_valid_T_2_0(dcache__io_cpu_resp_valid_T_2_0),
    ._wen_T_2_0(dcache__wen_T_2_0),
    .is_idle_0(dcache_is_idle_0),
    ._T_43_0(dcache__T_43_0),
    ._T_13_0(dcache__T_13_0),
    .write_wrap_out_0(dcache_write_wrap_out_0),
    ._T_3_0(dcache__T_3_0),
    .ren_reg_0(dcache_ren_reg_0),
    ._T_19_0(dcache__T_19_0),
    ._T_28_0(dcache__T_28_0),
    ._T_9_0(dcache__T_9_0),
    ._T_14_0(dcache__T_14_0),
    ._T_47_0(dcache__T_47_0)
  );
  MemArbiter arb ( // @[Tile.scala 112:19]
    .clock(arb_clock),
    .reset(arb_reset),
    .io_icache_ar_ready(arb_io_icache_ar_ready),
    .io_icache_ar_valid(arb_io_icache_ar_valid),
    .io_icache_ar_bits_addr(arb_io_icache_ar_bits_addr),
    .io_icache_r_ready(arb_io_icache_r_ready),
    .io_icache_r_valid(arb_io_icache_r_valid),
    .io_icache_r_bits_data(arb_io_icache_r_bits_data),
    .io_dcache_aw_ready(arb_io_dcache_aw_ready),
    .io_dcache_aw_valid(arb_io_dcache_aw_valid),
    .io_dcache_aw_bits_addr(arb_io_dcache_aw_bits_addr),
    .io_dcache_w_ready(arb_io_dcache_w_ready),
    .io_dcache_w_valid(arb_io_dcache_w_valid),
    .io_dcache_w_bits_data(arb_io_dcache_w_bits_data),
    .io_dcache_w_bits_last(arb_io_dcache_w_bits_last),
    .io_dcache_b_ready(arb_io_dcache_b_ready),
    .io_dcache_b_valid(arb_io_dcache_b_valid),
    .io_dcache_ar_ready(arb_io_dcache_ar_ready),
    .io_dcache_ar_valid(arb_io_dcache_ar_valid),
    .io_dcache_ar_bits_addr(arb_io_dcache_ar_bits_addr),
    .io_dcache_r_ready(arb_io_dcache_r_ready),
    .io_dcache_r_valid(arb_io_dcache_r_valid),
    .io_dcache_r_bits_data(arb_io_dcache_r_bits_data),
    .io_nasti_aw_ready(arb_io_nasti_aw_ready),
    .io_nasti_aw_valid(arb_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(arb_io_nasti_aw_bits_addr),
    .io_nasti_w_ready(arb_io_nasti_w_ready),
    .io_nasti_w_valid(arb_io_nasti_w_valid),
    .io_nasti_w_bits_data(arb_io_nasti_w_bits_data),
    .io_nasti_b_ready(arb_io_nasti_b_ready),
    .io_nasti_b_valid(arb_io_nasti_b_valid),
    .io_nasti_ar_ready(arb_io_nasti_ar_ready),
    .io_nasti_ar_valid(arb_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(arb_io_nasti_ar_bits_addr),
    .io_nasti_r_ready(arb_io_nasti_r_ready),
    .io_nasti_r_valid(arb_io_nasti_r_valid),
    .io_nasti_r_bits_data(arb_io_nasti_r_bits_data),
    .io_nasti_r_bits_last(arb_io_nasti_r_bits_last),
    ._T_2_0(arb__T_2_0),
    ._T_13_0(arb__T_13_0),
    ._T_24_0(arb__T_24_0),
    .io_dcache_ar_valid_0(arb_io_dcache_ar_valid_0),
    ._io_nasti_ar_valid_T_1_0(arb__io_nasti_ar_valid_T_1_0),
    ._T_20_0(arb__T_20_0),
    ._T_8_0(arb__T_8_0),
    ._io_dcache_b_valid_T_0(arb__io_dcache_b_valid_T_0),
    ._T_5_0(arb__T_5_0),
    ._T_4_0(arb__T_4_0),
    ._io_icache_ar_ready_T_0(arb__io_icache_ar_ready_T_0),
    ._T_10_0(arb__T_10_0),
    ._T_18_0(arb__T_18_0),
    ._io_nasti_aw_valid_T_0(arb__io_nasti_aw_valid_T_0),
    ._T_3_0(arb__T_3_0),
    ._io_icache_r_valid_T_0(arb__io_icache_r_valid_T_0),
    ._io_dcache_r_valid_T_0(arb__io_dcache_r_valid_T_0),
    ._T_23_0(arb__T_23_0),
    ._io_nasti_w_valid_T_0(arb__io_nasti_w_valid_T_0)
  );
  assign io_nasti_aw_valid = arb_io_nasti_aw_valid; // @[Tile.scala 119:12]
  assign io_nasti_aw_bits_addr = arb_io_nasti_aw_bits_addr; // @[Tile.scala 119:12]
  assign io_nasti_w_valid = arb_io_nasti_w_valid; // @[Tile.scala 119:12]
  assign io_nasti_w_bits_data = arb_io_nasti_w_bits_data; // @[Tile.scala 119:12]
  assign io_nasti_b_ready = arb_io_nasti_b_ready; // @[Tile.scala 119:12]
  assign io_nasti_ar_valid = arb_io_nasti_ar_valid; // @[Tile.scala 119:12]
  assign io_nasti_ar_bits_addr = arb_io_nasti_ar_bits_addr; // @[Tile.scala 119:12]
  assign io_nasti_r_ready = arb_io_nasti_r_ready; // @[Tile.scala 119:12]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_icache_resp_valid = icache_io_cpu_resp_valid; // @[Tile.scala 115:18]
  assign core_io_icache_resp_bits_data = icache_io_cpu_resp_bits_data; // @[Tile.scala 115:18]
  assign core_io_dcache_resp_valid = dcache_io_cpu_resp_valid; // @[Tile.scala 116:18]
  assign core_io_dcache_resp_bits_data = dcache_io_cpu_resp_bits_data; // @[Tile.scala 116:18]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_cpu_req_valid = core_io_icache_req_valid; // @[Tile.scala 115:18]
  assign icache_io_cpu_req_bits_addr = core_io_icache_req_bits_addr; // @[Tile.scala 115:18]
  assign icache_io_nasti_ar_ready = arb_io_icache_ar_ready; // @[Tile.scala 117:17]
  assign icache_io_nasti_r_valid = arb_io_icache_r_valid; // @[Tile.scala 117:17]
  assign icache_io_nasti_r_bits_data = arb_io_icache_r_bits_data; // @[Tile.scala 117:17]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_cpu_abort = core_io_dcache_abort; // @[Tile.scala 116:18]
  assign dcache_io_cpu_req_valid = core_io_dcache_req_valid; // @[Tile.scala 116:18]
  assign dcache_io_cpu_req_bits_addr = core_io_dcache_req_bits_addr; // @[Tile.scala 116:18]
  assign dcache_io_cpu_req_bits_data = core_io_dcache_req_bits_data; // @[Tile.scala 116:18]
  assign dcache_io_cpu_req_bits_mask = core_io_dcache_req_bits_mask; // @[Tile.scala 116:18]
  assign dcache_io_nasti_aw_ready = arb_io_dcache_aw_ready; // @[Tile.scala 118:17]
  assign dcache_io_nasti_w_ready = arb_io_dcache_w_ready; // @[Tile.scala 118:17]
  assign dcache_io_nasti_b_valid = arb_io_dcache_b_valid; // @[Tile.scala 118:17]
  assign dcache_io_nasti_ar_ready = arb_io_dcache_ar_ready; // @[Tile.scala 118:17]
  assign dcache_io_nasti_r_valid = arb_io_dcache_r_valid; // @[Tile.scala 118:17]
  assign dcache_io_nasti_r_bits_data = arb_io_dcache_r_bits_data; // @[Tile.scala 118:17]
  assign arb_clock = clock;
  assign arb_reset = reset;
  assign arb_io_icache_ar_valid = icache_io_nasti_ar_valid; // @[Tile.scala 117:17]
  assign arb_io_icache_ar_bits_addr = icache_io_nasti_ar_bits_addr; // @[Tile.scala 117:17]
  assign arb_io_icache_r_ready = icache_io_nasti_r_ready; // @[Tile.scala 117:17]
  assign arb_io_dcache_aw_valid = dcache_io_nasti_aw_valid; // @[Tile.scala 118:17]
  assign arb_io_dcache_aw_bits_addr = dcache_io_nasti_aw_bits_addr; // @[Tile.scala 118:17]
  assign arb_io_dcache_w_valid = dcache_io_nasti_w_valid; // @[Tile.scala 118:17]
  assign arb_io_dcache_w_bits_data = dcache_io_nasti_w_bits_data; // @[Tile.scala 118:17]
  assign arb_io_dcache_w_bits_last = dcache_io_nasti_w_bits_last; // @[Tile.scala 118:17]
  assign arb_io_dcache_b_ready = dcache_io_nasti_b_ready; // @[Tile.scala 118:17]
  assign arb_io_dcache_ar_valid = dcache_io_nasti_ar_valid; // @[Tile.scala 118:17]
  assign arb_io_dcache_ar_bits_addr = dcache_io_nasti_ar_bits_addr; // @[Tile.scala 118:17]
  assign arb_io_dcache_r_ready = dcache_io_nasti_r_ready; // @[Tile.scala 118:17]
  assign arb_io_nasti_aw_ready = io_nasti_aw_ready; // @[Tile.scala 119:12]
  assign arb_io_nasti_w_ready = io_nasti_w_ready; // @[Tile.scala 119:12]
  assign arb_io_nasti_b_valid = io_nasti_b_valid; // @[Tile.scala 119:12]
  assign arb_io_nasti_ar_ready = io_nasti_ar_ready; // @[Tile.scala 119:12]
  assign arb_io_nasti_r_valid = io_nasti_r_valid; // @[Tile.scala 119:12]
  assign arb_io_nasti_r_bits_data = io_nasti_r_bits_data; // @[Tile.scala 119:12]
  assign arb_io_nasti_r_bits_last = io_nasti_r_bits_last; // @[Tile.scala 119:12]
  assign core__dpath__csr___io_out_T_29_0 = core_dpath__csr___io_out_T_29_0;
  assign core__dpath__csr___T_0 = core_dpath__csr___T_0;
  assign core__dpath__csr__isInstRet_0 = core_dpath__csr__isInstRet_0;
  assign core__dpath__csr___T_10_0 = core_dpath__csr___T_10_0;
  assign core__dpath__csr___T_7_0 = core_dpath__csr___T_7_0;
  assign core__dpath__csr___io_out_T_33_0 = core_dpath__csr___io_out_T_33_0;
  assign core__dpath__csr___T_23_0 = core_dpath__csr___T_23_0;
  assign core__dpath__csr___io_out_T_25_0 = core_dpath__csr___io_out_T_25_0;
  assign core__dpath__csr___T_6_0 = core_dpath__csr___T_6_0;
  assign core__dpath__csr___io_out_T_31_0 = core_dpath__csr___io_out_T_31_0;
  assign core__dpath__csr___wdata_T_3_0 = core_dpath__csr___wdata_T_3_0;
  assign core__dpath__csr__privInst_0 = core_dpath__csr__privInst_0;
  assign core__dpath__csr___T_16_0 = core_dpath__csr___T_16_0;
  assign core__dpath__csr__isEret_0 = core_dpath__csr__isEret_0;
  assign core__dpath__csr___io_out_T_41_0 = core_dpath__csr___io_out_T_41_0;
  assign core__dpath__csr___io_out_T_1_0 = core_dpath__csr___io_out_T_1_0;
  assign core__dpath__csr___io_out_T_53_0 = core_dpath__csr___io_out_T_53_0;
  assign core__dpath__csr__iaddrInvalid_0 = core_dpath__csr__iaddrInvalid_0;
  assign core__dpath__csr___io_out_T_27_0 = core_dpath__csr___io_out_T_27_0;
  assign core__dpath__csr___io_out_T_43_0 = core_dpath__csr___io_out_T_43_0;
  assign core__dpath__csr___T_1_0 = core_dpath__csr___T_1_0;
  assign core__dpath__csr___io_out_T_35_0 = core_dpath__csr___io_out_T_35_0;
  assign core__dpath__csr___T_3_0 = core_dpath__csr___T_3_0;
  assign core__dpath__csr___T_18_0 = core_dpath__csr___T_18_0;
  assign core__dpath__csr__privValid_0 = core_dpath__csr__privValid_0;
  assign core__dpath__csr___io_expt_T_6_0 = core_dpath__csr___io_expt_T_6_0;
  assign core__dpath__csr___isInstRet_T_0 = core_dpath__csr___isInstRet_T_0;
  assign core__dpath__csr___io_out_T_3_0 = core_dpath__csr___io_out_T_3_0;
  assign core__dpath__csr___io_out_T_7_0 = core_dpath__csr___io_out_T_7_0;
  assign core__dpath__csr__io_expt_0 = core_dpath__csr__io_expt_0;
  assign core__dpath__csr___T_24_0 = core_dpath__csr___T_24_0;
  assign core__dpath__csr___wen_T_0 = core_dpath__csr___wen_T_0;
  assign core__dpath__csr___T_21_0 = core_dpath__csr___T_21_0;
  assign core__dpath__csr__wen_0 = core_dpath__csr__wen_0;
  assign core__dpath__csr___T_13_0 = core_dpath__csr___T_13_0;
  assign core__dpath__csr___T_8_0 = core_dpath__csr___T_8_0;
  assign core__dpath__csr___io_out_T_47_0 = core_dpath__csr___io_out_T_47_0;
  assign core__dpath__csr___io_out_T_19_0 = core_dpath__csr___io_out_T_19_0;
  assign core__dpath__csr___T_12_0 = core_dpath__csr___T_12_0;
  assign core__dpath__csr___io_out_T_9_0 = core_dpath__csr___io_out_T_9_0;
  assign core__dpath__csr___csrRO_T_4_0 = core_dpath__csr___csrRO_T_4_0;
  assign core__dpath__csr___io_out_T_5_0 = core_dpath__csr___io_out_T_5_0;
  assign core__dpath__csr___isEcall_T_1_0 = core_dpath__csr___isEcall_T_1_0;
  assign core__dpath__csr___wdata_T_5_0 = core_dpath__csr___wdata_T_5_0;
  assign core__dpath__csr___laddrInvalid_T_6_0 = core_dpath__csr___laddrInvalid_T_6_0;
  assign core__dpath__csr___T_17_0 = core_dpath__csr___T_17_0;
  assign core__dpath__csr___laddrInvalid_T_8_0 = core_dpath__csr___laddrInvalid_T_8_0;
  assign core__dpath__csr___io_out_T_45_0 = core_dpath__csr___io_out_T_45_0;
  assign core__dpath__csr___io_out_T_17_0 = core_dpath__csr___io_out_T_17_0;
  assign core__dpath__csr___io_out_T_13_0 = core_dpath__csr___io_out_T_13_0;
  assign core__dpath__csr___io_out_T_11_0 = core_dpath__csr___io_out_T_11_0;
  assign core__dpath__csr___T_20_0 = core_dpath__csr___T_20_0;
  assign core__dpath__csr___T_14_0 = core_dpath__csr___T_14_0;
  assign core__dpath__csr___io_out_T_55_0 = core_dpath__csr___io_out_T_55_0;
  assign core__dpath__csr___io_out_T_39_0 = core_dpath__csr___io_out_T_39_0;
  assign core__dpath__csr___io_out_T_51_0 = core_dpath__csr___io_out_T_51_0;
  assign core__dpath__csr__laddrInvalid_0 = core_dpath__csr__laddrInvalid_0;
  assign core__dpath__csr___io_out_T_23_0 = core_dpath__csr___io_out_T_23_0;
  assign core__dpath__csr___isInstRet_T_1_0 = core_dpath__csr___isInstRet_T_1_0;
  assign core__dpath__csr___io_expt_T_5_0 = core_dpath__csr___io_expt_T_5_0;
  assign core__dpath__csr___isEcall_T_4_0 = core_dpath__csr___isEcall_T_4_0;
  assign core__dpath__csr___csrRO_T_2_0 = core_dpath__csr___csrRO_T_2_0;
  assign core__dpath__csr___saddrInvalid_T_3_0 = core_dpath__csr___saddrInvalid_T_3_0;
  assign core__dpath__csr__isEcall_0 = core_dpath__csr__isEcall_0;
  assign core__dpath__csr__isEbreak_0 = core_dpath__csr__isEbreak_0;
  assign core__dpath__csr___io_out_T_49_0 = core_dpath__csr___io_out_T_49_0;
  assign core__dpath__csr___T_11_0 = core_dpath__csr___T_11_0;
  assign core__dpath__csr___wdata_T_7_0 = core_dpath__csr___wdata_T_7_0;
  assign core__dpath__csr___isInstRet_T_5_0 = core_dpath__csr___isInstRet_T_5_0;
  assign core__dpath__csr___io_out_T_37_0 = core_dpath__csr___io_out_T_37_0;
  assign core__dpath__csr___saddrInvalid_T_5_0 = core_dpath__csr___saddrInvalid_T_5_0;
  assign core__dpath__csr___T_22_0 = core_dpath__csr___T_22_0;
  assign core__dpath__csr___io_out_T_57_0 = core_dpath__csr___io_out_T_57_0;
  assign core__dpath__csr___laddrInvalid_T_4_0 = core_dpath__csr___laddrInvalid_T_4_0;
  assign core__dpath__csr___T_9_0 = core_dpath__csr___T_9_0;
  assign core__dpath__csr___T_15_0 = core_dpath__csr___T_15_0;
  assign core__dpath__csr__saddrInvalid_0 = core_dpath__csr__saddrInvalid_0;
  assign core__dpath__csr___T_19_0 = core_dpath__csr___T_19_0;
  assign core__dpath__csr___io_out_T_21_0 = core_dpath__csr___io_out_T_21_0;
  assign core__dpath__csr___io_out_T_15_0 = core_dpath__csr___io_out_T_15_0;
  assign core__dpath__regFile___T_1_0 = core_dpath__regFile___T_1_0;
  assign core__dpath__regFile___io_rdata2_T_0 = core_dpath__regFile___io_rdata2_T_0;
  assign core__dpath__regFile___io_rdata1_T_0 = core_dpath__regFile___io_rdata1_T_0;
  assign core__dpath__alu___out_T_1_0 = core_dpath__alu___out_T_1_0;
  assign core__dpath__alu___cmp_T_4_0 = core_dpath__alu___cmp_T_4_0;
  assign core__dpath__alu___out_T_0 = core_dpath__alu___out_T_0;
  assign core__dpath__alu___out_T_10_0 = core_dpath__alu___out_T_10_0;
  assign core__dpath__alu___out_T_12_0 = core_dpath__alu___out_T_12_0;
  assign core__dpath__alu___shin_T_0 = core_dpath__alu___shin_T_0;
  assign core__dpath__alu___out_T_9_0 = core_dpath__alu___out_T_9_0;
  assign core__dpath__alu___out_T_4_0 = core_dpath__alu___out_T_4_0;
  assign core__dpath__alu___out_T_3_0 = core_dpath__alu___out_T_3_0;
  assign core__dpath__alu___out_T_14_0 = core_dpath__alu___out_T_14_0;
  assign core__dpath__alu___out_T_6_0 = core_dpath__alu___out_T_6_0;
  assign core__dpath__alu___out_T_7_0 = core_dpath__alu___out_T_7_0;
  assign core__dpath__alu___out_T_8_0 = core_dpath__alu___out_T_8_0;
  assign core__dpath__alu___cmp_T_2_0 = core_dpath__alu___cmp_T_2_0;
  assign core__dpath__alu___sum_T_0 = core_dpath__alu___sum_T_0;
  assign core__dpath__alu___out_T_5_0 = core_dpath__alu___out_T_5_0;
  assign core__dpath__alu___out_T_2_0 = core_dpath__alu___out_T_2_0;
  assign core__dpath__alu___out_T_16_0 = core_dpath__alu___out_T_16_0;
  assign core__dpath__immGen___io_out_T_2_0 = core_dpath__immGen___io_out_T_2_0;
  assign core__dpath__immGen___io_out_T_4_0 = core_dpath__immGen___io_out_T_4_0;
  assign core__dpath__immGen___io_out_T_6_0 = core_dpath__immGen___io_out_T_6_0;
  assign core__dpath__immGen___io_out_T_12_0 = core_dpath__immGen___io_out_T_12_0;
  assign core__dpath__immGen___io_out_T_8_0 = core_dpath__immGen___io_out_T_8_0;
  assign core__dpath__immGen___io_out_T_10_0 = core_dpath__immGen___io_out_T_10_0;
  assign core__dpath__brCond__isSameSign_0 = core_dpath__brCond__isSameSign_0;
  assign core__dpath__brCond__eq_0 = core_dpath__brCond__eq_0;
  assign core__dpath__brCond___io_taken_T_5_0 = core_dpath__brCond___io_taken_T_5_0;
  assign core__dpath__brCond___io_taken_T_0 = core_dpath__brCond___io_taken_T_0;
  assign core__dpath__brCond___io_taken_T_11_0 = core_dpath__brCond___io_taken_T_11_0;
  assign core__dpath__brCond___io_taken_T_8_0 = core_dpath__brCond___io_taken_T_8_0;
  assign core__dpath__brCond___io_taken_T_14_0 = core_dpath__brCond___io_taken_T_14_0;
  assign core__dpath__brCond___io_taken_T_2_0 = core_dpath__brCond___io_taken_T_2_0;
  assign core__dpath__brCond__geu_0 = core_dpath__brCond__geu_0;
  assign core__dpath__brCond__ge_0 = core_dpath__brCond__ge_0;
  assign core__dpath___io_dcache_req_bits_mask_T_7_0 = core_dpath___io_dcache_req_bits_mask_T_7_0;
  assign core__dpath___npc_T_2_0 = core_dpath___npc_T_2_0;
  assign core__dpath___inst_T_2_0 = core_dpath___inst_T_2_0;
  assign core__dpath___rs1_T_0 = core_dpath___rs1_T_0;
  assign core__dpath___T_6_0 = core_dpath___T_6_0;
  assign core__dpath__io_ctrl_A_sel_0 = core_dpath__io_ctrl_A_sel_0;
  assign core__dpath___npc_T_5_0 = core_dpath___npc_T_5_0;
  assign core__dpath___io_icache_req_valid_T_0 = core_dpath___io_icache_req_valid_T_0;
  assign core__dpath__io_ctrl_B_sel_0 = core_dpath__io_ctrl_B_sel_0;
  assign core__dpath___regWrite_T_9_0 = core_dpath___regWrite_T_9_0;
  assign core__dpath___stall_T_1_0 = core_dpath___stall_T_1_0;
  assign core__dpath__csr__io_expt = core_dpath__csr__io_expt;
  assign core__dpath___regWrite_T_7_0 = core_dpath___regWrite_T_7_0;
  assign core__dpath___stall_T_0 = core_dpath___stall_T_0;
  assign core__dpath___rs1hazard_T_2_0 = core_dpath___rs1hazard_T_2_0;
  assign core__dpath___load_T_13_0 = core_dpath___load_T_13_0;
  assign core__dpath___load_T_11_0 = core_dpath___load_T_11_0;
  assign core__dpath___rs1_T_1_0 = core_dpath___rs1_T_1_0;
  assign core__dpath__stall_0 = core_dpath__stall_0;
  assign core__dpath___io_dcache_req_bits_mask_T_9_0 = core_dpath___io_dcache_req_bits_mask_T_9_0;
  assign core__dpath___load_T_15_0 = core_dpath___load_T_15_0;
  assign core__dpath___io_dcache_req_bits_mask_T_5_0 = core_dpath___io_dcache_req_bits_mask_T_5_0;
  assign core__dpath___rs2hazard_T_2_0 = core_dpath___rs2hazard_T_2_0;
  assign core__dpath___csr_in_T_0 = core_dpath___csr_in_T_0;
  assign core__dpath___npc_T_0 = core_dpath___npc_T_0;
  assign core__dpath___regWrite_T_5_0 = core_dpath___regWrite_T_5_0;
  assign core__dpath___npc_T_1_0 = core_dpath___npc_T_1_0;
  assign core__dpath___rs2_T_1_0 = core_dpath___rs2_T_1_0;
  assign core__dpath___load_T_9_0 = core_dpath___load_T_9_0;
  assign core__dpath___T_4_0 = core_dpath___T_4_0;
  assign core__dpath___T_7_0 = core_dpath___T_7_0;
  assign core__ctrl___ctrlSignals_T_31_0 = core_ctrl___ctrlSignals_T_31_0;
  assign core__ctrl___ctrlSignals_T_93_0 = core_ctrl___ctrlSignals_T_93_0;
  assign core__ctrl___ctrlSignals_T_87_0 = core_ctrl___ctrlSignals_T_87_0;
  assign core__ctrl___ctrlSignals_T_81_0 = core_ctrl___ctrlSignals_T_81_0;
  assign core__ctrl___ctrlSignals_T_15_0 = core_ctrl___ctrlSignals_T_15_0;
  assign core__ctrl___ctrlSignals_T_49_0 = core_ctrl___ctrlSignals_T_49_0;
  assign core__ctrl___ctrlSignals_T_5_0 = core_ctrl___ctrlSignals_T_5_0;
  assign core__ctrl___ctrlSignals_T_41_0 = core_ctrl___ctrlSignals_T_41_0;
  assign core__ctrl___ctrlSignals_T_11_0 = core_ctrl___ctrlSignals_T_11_0;
  assign core__ctrl___ctrlSignals_T_19_0 = core_ctrl___ctrlSignals_T_19_0;
  assign core__ctrl___ctrlSignals_T_95_0 = core_ctrl___ctrlSignals_T_95_0;
  assign core__ctrl___ctrlSignals_T_21_0 = core_ctrl___ctrlSignals_T_21_0;
  assign core__ctrl___ctrlSignals_T_47_0 = core_ctrl___ctrlSignals_T_47_0;
  assign core__ctrl___ctrlSignals_T_35_0 = core_ctrl___ctrlSignals_T_35_0;
  assign core__ctrl___ctrlSignals_T_75_0 = core_ctrl___ctrlSignals_T_75_0;
  assign core__ctrl___ctrlSignals_T_25_0 = core_ctrl___ctrlSignals_T_25_0;
  assign core__ctrl___ctrlSignals_T_55_0 = core_ctrl___ctrlSignals_T_55_0;
  assign core__ctrl___ctrlSignals_T_71_0 = core_ctrl___ctrlSignals_T_71_0;
  assign core__ctrl___ctrlSignals_T_27_0 = core_ctrl___ctrlSignals_T_27_0;
  assign core__ctrl___ctrlSignals_T_59_0 = core_ctrl___ctrlSignals_T_59_0;
  assign core__ctrl___ctrlSignals_T_29_0 = core_ctrl___ctrlSignals_T_29_0;
  assign core__ctrl___ctrlSignals_T_39_0 = core_ctrl___ctrlSignals_T_39_0;
  assign core__ctrl___ctrlSignals_T_1_0 = core_ctrl___ctrlSignals_T_1_0;
  assign core__ctrl___ctrlSignals_T_63_0 = core_ctrl___ctrlSignals_T_63_0;
  assign core__ctrl___ctrlSignals_T_97_0 = core_ctrl___ctrlSignals_T_97_0;
  assign core__ctrl___ctrlSignals_T_23_0 = core_ctrl___ctrlSignals_T_23_0;
  assign core__ctrl___ctrlSignals_T_65_0 = core_ctrl___ctrlSignals_T_65_0;
  assign core__ctrl___ctrlSignals_T_89_0 = core_ctrl___ctrlSignals_T_89_0;
  assign core__ctrl___ctrlSignals_T_51_0 = core_ctrl___ctrlSignals_T_51_0;
  assign core__ctrl___ctrlSignals_T_83_0 = core_ctrl___ctrlSignals_T_83_0;
  assign core__ctrl___ctrlSignals_T_77_0 = core_ctrl___ctrlSignals_T_77_0;
  assign core__ctrl___ctrlSignals_T_85_0 = core_ctrl___ctrlSignals_T_85_0;
  assign core__ctrl___ctrlSignals_T_37_0 = core_ctrl___ctrlSignals_T_37_0;
  assign core__ctrl___ctrlSignals_T_67_0 = core_ctrl___ctrlSignals_T_67_0;
  assign core__ctrl___ctrlSignals_T_91_0 = core_ctrl___ctrlSignals_T_91_0;
  assign core__ctrl___ctrlSignals_T_43_0 = core_ctrl___ctrlSignals_T_43_0;
  assign core__ctrl___ctrlSignals_T_17_0 = core_ctrl___ctrlSignals_T_17_0;
  assign core__ctrl___ctrlSignals_T_9_0 = core_ctrl___ctrlSignals_T_9_0;
  assign core__ctrl___ctrlSignals_T_79_0 = core_ctrl___ctrlSignals_T_79_0;
  assign core__ctrl___ctrlSignals_T_33_0 = core_ctrl___ctrlSignals_T_33_0;
  assign core__ctrl___ctrlSignals_T_45_0 = core_ctrl___ctrlSignals_T_45_0;
  assign core__ctrl___ctrlSignals_T_13_0 = core_ctrl___ctrlSignals_T_13_0;
  assign core__ctrl___ctrlSignals_T_53_0 = core_ctrl___ctrlSignals_T_53_0;
  assign core__ctrl___ctrlSignals_T_69_0 = core_ctrl___ctrlSignals_T_69_0;
  assign core__ctrl___ctrlSignals_T_3_0 = core_ctrl___ctrlSignals_T_3_0;
  assign core__ctrl___ctrlSignals_T_7_0 = core_ctrl___ctrlSignals_T_7_0;
  assign core__ctrl___ctrlSignals_T_73_0 = core_ctrl___ctrlSignals_T_73_0;
  assign core__ctrl___ctrlSignals_T_57_0 = core_ctrl___ctrlSignals_T_57_0;
  assign core__ctrl___ctrlSignals_T_61_0 = core_ctrl___ctrlSignals_T_61_0;
  assign icache___T_5_0 = icache__T_5_0;
  assign icache___wmask_T_0 = icache__wmask_T_0;
  assign icache___T_18_0 = icache__T_18_0;
  assign icache__io_cpu_req_valid_0 = icache_io_cpu_req_valid_0;
  assign icache___T_25_0 = icache__T_25_0;
  assign icache___T_33_0 = icache__T_33_0;
  assign icache__wen_0 = icache_wen_0;
  assign icache__is_alloc_reg_0 = icache_is_alloc_reg_0;
  assign icache__read_wrap_out_0 = icache_read_wrap_out_0;
  assign icache___T_21_0 = icache__T_21_0;
  assign icache___T_11_0 = icache__T_11_0;
  assign icache___T_16_0 = icache__T_16_0;
  assign icache___T_0 = icache__T_0;
  assign icache__ren_0 = icache_ren_0;
  assign icache___hit_T_2_0 = icache__hit_T_2_0;
  assign icache___T_6_0 = icache__T_6_0;
  assign icache___io_nasti_ar_valid_T_0 = icache__io_nasti_ar_valid_T_0;
  assign icache___wen_T_0 = icache__wen_T_0;
  assign icache__is_idle_0 = icache_is_idle_0;
  assign icache___T_8_0 = icache__T_8_0;
  assign icache__is_write_0 = icache_is_write_0;
  assign icache___T_43_0 = icache__T_43_0;
  assign icache___T_20_0 = icache__T_20_0;
  assign icache___is_alloc_T_0 = icache__is_alloc_T_0;
  assign icache__read_count_0 = icache_read_count_0;
  assign icache___T_13_0 = icache__T_13_0;
  assign icache__io_cpu_resp_valid_0 = icache_io_cpu_resp_valid_0;
  assign icache___ren_T_0 = icache__ren_T_0;
  assign icache___T_3_0 = icache__T_3_0;
  assign icache__ren_reg_0 = icache_ren_reg_0;
  assign icache___T_19_0 = icache__T_19_0;
  assign icache___T_51_0 = icache__T_51_0;
  assign icache___T_28_0 = icache__T_28_0;
  assign icache___T_9_0 = icache__T_9_0;
  assign icache___T_14_0 = icache__T_14_0;
  assign icache___T_4_0 = icache__T_4_0;
  assign icache___T_47_0 = icache__T_47_0;
  assign icache___T_15_0 = icache__T_15_0;
  assign icache___T_40_0 = icache__T_40_0;
  assign icache__is_alloc_0 = icache_is_alloc_0;
  assign icache__hit_0 = icache_hit_0;
  assign icache___T_30_0 = icache__T_30_0;
  assign icache__is_read_0 = icache_is_read_0;
  assign icache___T_10_0 = icache__T_10_0;
  assign dcache___T_5_0 = dcache__T_5_0;
  assign dcache___io_cpu_resp_valid_T_3_0 = dcache__io_cpu_resp_valid_T_3_0;
  assign dcache___wmask_T_0 = dcache__wmask_T_0;
  assign dcache___state_T_0 = dcache__state_T_0;
  assign dcache__wen_0 = dcache_wen_0;
  assign dcache___T_33_0 = dcache__T_33_0;
  assign dcache___T_44_0 = dcache__T_44_0;
  assign dcache__read_wrap_out_0 = dcache_read_wrap_out_0;
  assign dcache___T_21_0 = dcache__T_21_0;
  assign dcache___T_16_0 = dcache__T_16_0;
  assign dcache___ren_T_0 = dcache__ren_T_0;
  assign dcache__ren_0 = dcache_ren_0;
  assign dcache___hit_T_2_0 = dcache__hit_T_2_0;
  assign dcache___T_6_0 = dcache__T_6_0;
  assign dcache___io_nasti_ar_valid_T_0 = dcache__io_nasti_ar_valid_T_0;
  assign dcache___T_1_0 = dcache__T_1_0;
  assign dcache___T_29_0 = dcache__T_29_0;
  assign dcache__write_count_0 = dcache_write_count_0;
  assign dcache___T_8_0 = dcache__T_8_0;
  assign dcache__is_write_0 = dcache_is_write_0;
  assign dcache___T_20_0 = dcache__T_20_0;
  assign dcache___is_alloc_T_0 = dcache__is_alloc_T_0;
  assign dcache__read_count_0 = dcache_read_count_0;
  assign dcache__io_cpu_resp_valid_0 = dcache_io_cpu_resp_valid_0;
  assign dcache___T_51_0 = dcache__T_51_0;
  assign dcache___T_4_0 = dcache__T_4_0;
  assign dcache___T_15_0 = dcache__T_15_0;
  assign dcache___T_40_0 = dcache__T_40_0;
  assign dcache__is_alloc_0 = dcache_is_alloc_0;
  assign dcache__hit_0 = dcache_hit_0;
  assign dcache___T_30_0 = dcache__T_30_0;
  assign dcache__is_read_0 = dcache_is_read_0;
  assign dcache___T_35_0 = dcache__T_35_0;
  assign dcache___T_10_0 = dcache__T_10_0;
  assign dcache___T_18_0 = dcache__T_18_0;
  assign dcache__io_cpu_req_valid_0 = dcache_io_cpu_req_valid_0;
  assign dcache___T_25_0 = dcache__T_25_0;
  assign dcache__is_alloc_reg_0 = dcache_is_alloc_reg_0;
  assign dcache___T_11_0 = dcache__T_11_0;
  assign dcache___T_0 = dcache__T_0;
  assign dcache___io_cpu_resp_valid_T_2_0 = dcache__io_cpu_resp_valid_T_2_0;
  assign dcache___wen_T_2_0 = dcache__wen_T_2_0;
  assign dcache__is_idle_0 = dcache_is_idle_0;
  assign dcache___T_43_0 = dcache__T_43_0;
  assign dcache___T_13_0 = dcache__T_13_0;
  assign dcache__write_wrap_out_0 = dcache_write_wrap_out_0;
  assign dcache___T_3_0 = dcache__T_3_0;
  assign dcache__ren_reg_0 = dcache_ren_reg_0;
  assign dcache___T_19_0 = dcache__T_19_0;
  assign dcache___T_28_0 = dcache__T_28_0;
  assign dcache___T_9_0 = dcache__T_9_0;
  assign dcache___T_14_0 = dcache__T_14_0;
  assign dcache___T_47_0 = dcache__T_47_0;
  assign arb___T_2_0 = arb__T_2_0;
  assign arb___T_13_0 = arb__T_13_0;
  assign arb___T_24_0 = arb__T_24_0;
  assign arb__io_dcache_ar_valid_0 = arb_io_dcache_ar_valid_0;
  assign arb___io_nasti_ar_valid_T_1_0 = arb__io_nasti_ar_valid_T_1_0;
  assign arb___T_20_0 = arb__T_20_0;
  assign arb___T_8_0 = arb__T_8_0;
  assign arb___io_dcache_b_valid_T_0 = arb__io_dcache_b_valid_T_0;
  assign arb___T_5_0 = arb__T_5_0;
  assign arb___T_4_0 = arb__T_4_0;
  assign arb___io_icache_ar_ready_T_0 = arb__io_icache_ar_ready_T_0;
  assign arb___T_10_0 = arb__T_10_0;
  assign arb___T_18_0 = arb__T_18_0;
  assign arb___io_nasti_aw_valid_T_0 = arb__io_nasti_aw_valid_T_0;
  assign arb___T_3_0 = arb__T_3_0;
  assign arb___io_icache_r_valid_T_0 = arb__io_icache_r_valid_T_0;
  assign arb___io_dcache_r_valid_T_0 = arb__io_dcache_r_valid_T_0;
  assign arb___T_23_0 = arb__T_23_0;
  assign arb___io_nasti_w_valid_T_0 = arb__io_nasti_w_valid_T_0;
endmodule
