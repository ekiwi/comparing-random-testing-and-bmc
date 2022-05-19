// Copyright 2022 The Regents of the University of California
// released under BSD 3-Clause License
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>


// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "or1200_defines.v"

module harness(
  input clk,
  input rst,
`ifndef SYM_MEM
  // instruction bus inputs
  input [31:0] icpu_dat_i,
  input icpu_ack_i,
  input icpu_rty_i,
  input icpu_err_i,
  input [31:0] icpu_adr_i,
  input [3:0] icpu_tag_i,
  // data bus inputs
  input [31:0] dcpu_dat_i,
  input dcpu_ack_i,
  input dcpu_rty_i,
  input dcpu_err_i,
  input [3:0] dcpu_tag_i,
`endif
  // interrupt inputs
  input sig_int,
  input sig_tick
);

// outputs
wire [31:0] icpu_adr_o;

// constant zero wires for tied of inputs
wire du_stall = 1'b0;
wire [`OR1200_OPERAND_WIDTH-1:0] du_addr = 0;
wire [`OR1200_OPERAND_WIDTH-1:0] du_dat_du = 0;
wire du_read = 1'b0;
wire du_write = 1'b0;
wire [`OR1200_DU_DSR_WIDTH-1:0] du_dsr = 0;
wire [24:0] du_dmr1 = 0;
wire du_hwbkpt = 1'b0;
wire du_hwbkpt_ls_r = 1'b0;
wire du_flush_pipe = 1'b0;

// these pins are left unconstraint in the original security exploit paper
// but it is not clear when they would ever be useful to generate a
// replayable result
wire [`OR1200_OPERAND_WIDTH-1:0] spr_dat_pic = 0;
wire [`OR1200_OPERAND_WIDTH-1:0] spr_dat_tt = 0;
wire [`OR1200_OPERAND_WIDTH-1:0] spr_dat_pm = 0;
wire [`OR1200_OPERAND_WIDTH-1:0] spr_dat_dmmu = 0;
wire [`OR1200_OPERAND_WIDTH-1:0] spr_dat_immu = 0;
wire [`OR1200_OPERAND_WIDTH-1:0] spr_dat_du = 0;
wire mtspr_dc_done = 1'b0;
wire boot_adr_sel_i = 1'b0;

// signal taps
wire [`OR1200_OPERAND_WIDTH-1:0] tap_operand_a;
wire [`OR1200_OPERAND_WIDTH-1:0] tap_operand_b;
wire [31:0] tap_if_insn;
wire tap_id_freeze;
wire [31:0] tap_id_insn;
wire [31:0] tap_ex_simm;
wire [31:0] tap_or1200_if_insn_saved;
wire [31:0] tap_or1200_sprs_spr_dat_ppc;
wire [31:0] tap_or1200_sprs_spr_dat_npc;
wire [`OR1200_SR_WIDTH-1:0] tap_or1200_sprs_to_sr;
wire [`OR1200_SR_WIDTH-1:0] tap_or1200_sprs_sr;
wire [31:0] tap_or1200_sprs_spr_dat_o;
wire [31:0] tap_or1200_ctrl_ex_insn;
wire [31:0] tap_or1200_ctrl_ex_pc;
wire [31:0] tap_or1200_ctrl_wb_insn;
wire [`OR1200_REGFILE_ADDR_WIDTH-1:0] tap_or1200_rf_rf_addrw;
wire tap_or1200_rf_we;
wire [`OR1200_REGFILE_ADDR_WIDTH-1:0] tap_or1200_rf_addrw;
wire [`OR1200_OPERAND_WIDTH-1:0] tap_or1200_rf_rf_dataw;
wire tap_or1200_rf_rf_we;
wire [31:0] tap_or1200_except_wb_pc;
wire [31:0] tap_or1200_except_epcr;
wire [31:0] tap_or1200_except_eear;
wire [`OR1200_SR_WIDTH-1:0] tap_or1200_except_esr;
wire [31:0] tap_or1200_except_lsu_addr;
wire [31:0] tap_or1200_except_spr_dat_npc;
wire [31:0] tap_or1200_genpc_pc;
wire [31:0] tap_or1200_lsu_dcpu_dat_i;
wire [`OR1200_OPERAND_WIDTH-1:0] tap_or1200_lsu_or1200_mem2reg_regdata;
wire [`OR1200_OPERAND_WIDTH-1:0] tap_or1200_lsu_or1200_reg2mem_memdata;
wire [`OR1200_OPERAND_WIDTH-1:0] tap_or1200_lsu_or1200_reg2mem_regdata;
wire [`OR1200_OPERAND_WIDTH-1:0] tap_or1200_lsu_or1200_mem2reg_memdata;
wire [31:0] dcpu_dat_o;
wire [31:0] dcpu_adr_o;

// reset assumption (reset is active in the initial state and then disabled after)
reg is_init;
initial is_init = 1;
always @(posedge clk) is_init <= 0;
always @(posedge clk) begin
    assume(rst == is_init);
end

`ifndef SYM_MEM
// very crude approximation of a memory
// instructions should stay stable while the address is stable
always @(posedge clk) begin
    if (!is_init) begin
        if ($stable(icpu_adr_o)) assume($stable(icpu_dat_i));
    end
end
`endif


`ifdef SYM_MEM

// using a simple whishbone sim memory based on:
// https://zipcpu.com/zipcpu/2017/05/29/simple-wishbone.html
// https://github.com/olofk/serv/blob/main/servant/servant_ram.v

// instruction bus inputs
reg [31:0] icpu_dat_i = 32'd0;
reg icpu_ack_i = 1'b0;
wire icpu_rty_i = 1'b0; // no retries
wire icpu_err_i = 1'b0; // no errors
wire [31:0] icpu_adr_i;
wire [3:0] icpu_tag_i;
// outputs
wire icpu_cycstb_o;
wire [3:0] icpu_sel_o;
wire [3:0] icpu_tag_o;

// data bus inputs
reg [31:0] dcpu_dat_i = 32'd0;
reg dcpu_ack_i = 1'b0;
wire dcpu_rty_i = 1'b0; // no retries
wire dcpu_err_i = 1'b0; // no errors
wire [3:0] dcpu_tag_i;
// outputs
wire [31:0] dcpu_adr_o;
wire dcpu_cycstb_o;
wire [31:0] dcpu_dat_o;
wire [3:0] dcpu_sel_o;
wire [3:0] dcpu_tag_o;
wire dcpu_we_o;


reg [31:0] mem [0:(1024*256)/4-1];

wire [3:0] we = {4{dcpu_we_o & dcpu_cycstb_o}} & dcpu_sel_o;

always @(posedge clk) begin
`ifndef DISABLE_DATA_MEM
	if (we[0]) mem[dcpu_adr_o][7:0]   <= dcpu_dat_o[7:0];
    if (we[1]) mem[dcpu_adr_o][15:8]  <= dcpu_dat_o[15:8];
    if (we[2]) mem[dcpu_adr_o][23:16] <= dcpu_dat_o[23:16];
    if (we[3]) mem[dcpu_adr_o][31:24] <= dcpu_dat_o[31:24];
    dcpu_dat_i <= mem[dcpu_adr_o];
    dcpu_ack_i <= dcpu_cycstb_o & !dcpu_ack_i;
`endif
    icpu_dat_i <= mem[icpu_adr_o];
    icpu_ack_i <= icpu_cycstb_o & !icpu_ack_i;
end


`endif


or1200_cpu dut(
    .clk(clk),
	.rst(rst),

	.icpu_dat_i(icpu_dat_i),
	.icpu_ack_i(icpu_ack_i),
	.icpu_rty_i(icpu_rty_i),
	.icpu_adr_i(icpu_adr_i),
	.icpu_err_i(icpu_err_i),
	.icpu_tag_i(icpu_tag_i),
    .icpu_adr_o(icpu_adr_o),

`ifdef SYM_MEM
    .icpu_cycstb_o(icpu_cycstb_o),
    .icpu_sel_o(icpu_sel_o),
    .icpu_tag_o(icpu_tag_o),
    .dcpu_adr_o(dcpu_adr_o),
    .dcpu_cycstb_o(dcpu_cycstb_o),
    .dcpu_dat_o(dcpu_dat_o),
    .dcpu_sel_o(dcpu_sel_o),
    .dcpu_tag_o(dcpu_tag_o),
    .dcpu_we_o(dcpu_we_o),
`endif

	// Connection CPU to external Debug port
	.du_stall(du_stall),
	.du_addr(du_addr),
	.du_dat_du(du_dat_du),
	.du_read(du_read),
	.du_write(du_write),
	.du_dsr(du_dsr),
	.du_dmr1(du_dmr1),
	.du_hwbkpt(du_hwbkpt),
	.du_hwbkpt_ls_r(du_hwbkpt_ls_r),
	// .du_flush_pipe(du_flush_pipe), // not part of the SPECS version of the CPU

	// Connection QMEM and CPU
    .dcpu_dat_i(dcpu_dat_i),
	.dcpu_ack_i(dcpu_ack_i),
	.dcpu_rty_i(dcpu_rty_i),
	.dcpu_err_i(dcpu_err_i),
	.dcpu_tag_i(dcpu_tag_i),
	.dcpu_dat_o(dcpu_dat_o),
	.dcpu_adr_o(dcpu_adr_o),


	// SR Interface
	.boot_adr_sel_i(boot_adr_sel_i),

	// Connection PIC and CPU's EXCEPT
	.sig_int(sig_int),
	.sig_tick(sig_tick),

	// SPRs
	.spr_dat_pic(spr_dat_pic),
	.spr_dat_tt(spr_dat_tt),
	.spr_dat_pm(spr_dat_pm),
	.spr_dat_dmmu(spr_dat_dmmu),
	.spr_dat_immu(spr_dat_immu),
	.spr_dat_du(spr_dat_du),
    .mtspr_dc_done(mtspr_dc_done),

    // signal taps
    .tap_operand_a(tap_operand_a),
	.tap_operand_b(tap_operand_b),
	.tap_if_insn(tap_if_insn),
	.tap_id_freeze(tap_id_freeze),
	.tap_id_insn(tap_id_insn),
	.tap_ex_simm(tap_ex_simm),
	.tap_or1200_if_insn_saved(tap_or1200_if_insn_saved),
	.tap_or1200_sprs_spr_dat_ppc(tap_or1200_sprs_spr_dat_ppc),
	.tap_or1200_sprs_spr_dat_npc(tap_or1200_sprs_spr_dat_npc),
	.tap_or1200_sprs_to_sr(tap_or1200_sprs_to_sr),
	.tap_or1200_sprs_sr(tap_or1200_sprs_sr),
	.tap_or1200_sprs_spr_dat_o(tap_or1200_sprs_spr_dat_o),
	.tap_or1200_ctrl_ex_insn(tap_or1200_ctrl_ex_insn),
	.tap_or1200_ctrl_ex_pc(tap_or1200_ctrl_ex_pc),
	.tap_or1200_ctrl_wb_insn(tap_or1200_ctrl_wb_insn),
	.tap_or1200_rf_rf_addrw(tap_or1200_rf_rf_addrw),
	.tap_or1200_rf_we(tap_or1200_rf_we),
	.tap_or1200_rf_addrw(tap_or1200_rf_addrw),
	.tap_or1200_rf_rf_dataw(tap_or1200_rf_rf_dataw),
	.tap_or1200_rf_rf_we(tap_or1200_rf_rf_we),
	.tap_or1200_except_wb_pc(tap_or1200_except_wb_pc),
	.tap_or1200_except_epcr(tap_or1200_except_epcr),
	.tap_or1200_except_eear(tap_or1200_except_eear),
	.tap_or1200_except_esr(tap_or1200_except_esr),
	.tap_or1200_except_lsu_addr(tap_or1200_except_lsu_addr),
	.tap_or1200_except_spr_dat_npc(tap_or1200_except_spr_dat_npc),
	.tap_or1200_genpc_pc(tap_or1200_genpc_pc),
	.tap_or1200_lsu_dcpu_dat_i(tap_or1200_lsu_dcpu_dat_i),
	.tap_or1200_lsu_or1200_mem2reg_regdata(tap_or1200_lsu_or1200_mem2reg_regdata),
	.tap_or1200_lsu_or1200_reg2mem_memdata(tap_or1200_lsu_or1200_reg2mem_memdata),
	.tap_or1200_lsu_or1200_reg2mem_regdata(tap_or1200_lsu_or1200_reg2mem_regdata),
	.tap_or1200_lsu_or1200_mem2reg_memdata(tap_or1200_lsu_or1200_mem2reg_memdata)
);

`ifdef SPECS_BUG


`ifdef BUG09

// we adapted one security assertion from SPECS
// https://github.com/impedimentToProgress/SPECS/blob/master/hardware/cores/fabric/BakedInAssertions.v

`define OR1200_EXCEPTION_VECTOR_UNMASK 32'hFFFFF0FF


wire past_valid = 1'b0;
always @(posedge clk)
  if (rst) past_valid <= 1'b0;
  else past_valid <= 1'b1;

always @(posedge clk) begin
if (!rst & past_valid) begin
if($rose(tap_or1200_ctrl_ex_pc == 32'h00000A00)) begin
    assert(tap_or1200_except_epcr == spr_dat_npc | tap_or1200_except_epcr == spr_dat_ppc+32'h4);
end
if ($rose((tap_or1200_ctrl_ex_pc & `OR1200_EXCEPTION_VECTOR_UNMASK) == 32'h0)) begin
    assert(tap_or1200_except_epcr == spr_dat_npc | tap_or1200_except_epcr == spr_dat_ppc+32'h4);
end

end
end


`else

or1200_assertions assertions(
	.clock(clk),
	.reset(rst),
	.operand_a(tap_operand_a),
    .operand_b(tap_operand_b),
    .if_insn(tap_if_insn),
    .id_freeze(tap_id_freeze),
    .id_insn(tap_id_insn),
    .ex_simm(tap_ex_simm),
    .or1200_if_insn_saved(tap_or1200_if_insn_saved),
    .or1200_sprs_spr_dat_ppc(tap_or1200_sprs_spr_dat_ppc),
    .or1200_sprs_spr_dat_npc(tap_or1200_sprs_spr_dat_npc),
    .or1200_sprs_to_sr(tap_or1200_sprs_to_sr),
    .or1200_sprs_sr(tap_or1200_sprs_sr),
    .or1200_sprs_spr_dat_o(tap_or1200_sprs_spr_dat_o),
    .or1200_ctrl_ex_insn(tap_or1200_ctrl_ex_insn),
    .or1200_ctrl_ex_pc(tap_or1200_ctrl_ex_pc),
    .or1200_ctrl_wb_insn(tap_or1200_ctrl_wb_insn),
    .or1200_rf_rf_addrw(tap_or1200_rf_rf_addrw),
    .or1200_rf_we(tap_or1200_rf_we),
    .or1200_rf_addrw(tap_or1200_rf_addrw),
    .or1200_rf_rf_dataw(tap_or1200_rf_rf_dataw),
    .or1200_rf_rf_we(tap_or1200_rf_rf_we),
    .or1200_except_wb_pc(tap_or1200_except_wb_pc),
    .or1200_except_epcr(tap_or1200_except_epcr),
    .or1200_except_eear(tap_or1200_except_eear),
    .or1200_except_esr(tap_or1200_except_esr),
    .or1200_except_lsu_addr(tap_or1200_except_lsu_addr),
    .or1200_except_spr_dat_npc(tap_or1200_except_spr_dat_npc),
    .or1200_genpc_pc(tap_or1200_genpc_pc),
    .or1200_lsu_dcpu_dat_i(tap_or1200_lsu_dcpu_dat_i),
    .or1200_lsu_or1200_mem2reg_regdata(tap_or1200_lsu_or1200_mem2reg_regdata),
    .or1200_lsu_or1200_reg2mem_memdata(tap_or1200_lsu_or1200_reg2mem_memdata),
    .or1200_lsu_or1200_reg2mem_regdata(tap_or1200_lsu_or1200_reg2mem_regdata),
    .or1200_lsu_or1200_mem2reg_memdata(tap_or1200_lsu_or1200_mem2reg_memdata),
    .icpu_dat_i(icpu_dat_i),
    .dcpu_dat_o(dcpu_dat_o),
    .dcpu_adr_o(dcpu_adr_o)
);
`endif
`endif

`ifdef ASSUME_VALID_INSTRUCTION
// instruction assumptions
or1200_assumptions assumptions(
	.clock(clk), .reset(rst), .insn(icpu_dat_i)
);
`endif

`ifndef SPECS_BUG
    // property checks
    `ifdef BUG20
    // aka bug06 from SCIFinder, line 12 in or1200.txt
    wire prop06 = (
        ~(((tap_or1200_ctrl_ex_insn & 'hFFE00000) >> 21  == 1826) &&
        (tap_operand_a > tap_operand_b)) ||
        (tap_or1200_sprs_to_sr[9] == 1) ||
        (rst == 1)
    );
    always @(posedge clk) begin
        assert(prop06);
    end
    `endif // BUG20

    `ifdef BUG24
    // when writing to address zero in the register file, the data needs to be 0
    always @(posedge clk) begin
        assert (!(tap_or1200_rf_rf_we && tap_or1200_rf_rf_addrw == 0 && tap_or1200_rf_rf_dataw != 0));
    end
    `endif // BUG24
`endif // !SPECS_BUG

endmodule