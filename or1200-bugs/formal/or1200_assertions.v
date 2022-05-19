// translated from: https://github.com/rzhang2285/Assertions/blob/master/or1200.txt

`include "or1200_defines.v"

module or1200_assertions(
    input clock,
    input reset,
    // monitored signals
    input [`OR1200_OPERAND_WIDTH-1:0] operand_a,
    input [`OR1200_OPERAND_WIDTH-1:0] operand_b,
    input [31:0] if_insn,
    input id_freeze,
    input [31:0] id_insn,
    input [31:0] ex_simm,
    input [31:0] or1200_if_insn_saved,
    input [31:0] or1200_sprs_spr_dat_ppc,
    input [31:0] or1200_sprs_spr_dat_npc,
    input [`OR1200_SR_WIDTH-1:0] or1200_sprs_to_sr,
    input [`OR1200_SR_WIDTH-1:0] or1200_sprs_sr,
    input [31:0] or1200_sprs_spr_dat_o,
    input [31:0] or1200_ctrl_ex_insn,
    input [31:0] or1200_ctrl_ex_pc,
    input [31:0] or1200_ctrl_wb_insn,
    input [`OR1200_REGFILE_ADDR_WIDTH-1:0] or1200_rf_rf_addrw,
    input or1200_rf_we,
    input [`OR1200_REGFILE_ADDR_WIDTH-1:0] or1200_rf_addrw,
    input [`OR1200_OPERAND_WIDTH-1:0] or1200_rf_rf_dataw,
    input or1200_rf_rf_we,
    input [31:0] or1200_except_wb_pc,
    input [31:0] or1200_except_epcr,
    input [31:0] or1200_except_eear,
    input [31:0] or1200_except_esr,
    input [31:0] or1200_except_lsu_addr,
    input [31:0] or1200_except_spr_dat_npc,
    input [31:0] or1200_genpc_pc,
    input [31:0] or1200_lsu_dcpu_dat_i,
    input [`OR1200_OPERAND_WIDTH-1:0] or1200_lsu_or1200_mem2reg_regdata,
    input [`OR1200_OPERAND_WIDTH-1:0] or1200_lsu_or1200_reg2mem_memdata,
    input [`OR1200_OPERAND_WIDTH-1:0] or1200_lsu_or1200_reg2mem_regdata,
    input [`OR1200_OPERAND_WIDTH-1:0] or1200_lsu_or1200_mem2reg_memdata,
    input [31:0] icpu_dat_i,
    input [31:0] dcpu_dat_o,
    input [31:0] dcpu_adr_o
);


// delayed signals
reg prev_sr0 = 0;
reg [31:0] prev_epcr = 0;
reg [31:0] prev_eear = 0;
reg [31:0] prev_esr = 0;
reg [31:0] prev_ex_insn = 0;
reg [31:0] prev_if_insn = 0;
reg prev_id_freeze = 0;

reg past_valid = 0;

always @(posedge clock) begin
    prev_sr0 <= or1200_sprs_sr[0];
    prev_epcr <= or1200_except_epcr;
    prev_eear <= or1200_except_eear;
    prev_esr <= or1200_except_esr;
    prev_ex_insn <= or1200_ctrl_ex_insn;
    prev_if_insn <= if_insn;
    prev_id_freeze <= id_freeze;
    past_valid <= 1;
end


always @(posedge clock) begin
if (!reset) begin


//////////////////////////////////
// Control Flow
//////////////////////////////////
assert(or1200_except_wb_pc == or1200_sprs_spr_dat_ppc);
assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 1) )) || (or1200_ctrl_ex_pc == or1200_sprs_spr_dat_npc));
assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 2) )) || (or1200_ctrl_ex_pc == or1200_sprs_spr_dat_npc));
assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 3) )) || (or1200_ctrl_ex_pc == or1200_sprs_spr_dat_npc));

assert(~(((or1200_ctrl_ex_insn & 'hFFE00000) >> 21  == 1826) && (operand_a > operand_b)) || (or1200_sprs_to_sr[9] == 1));
assert(~(((or1200_ctrl_ex_insn & 'hFFE00000) >> 21  == 1829) && (operand_a <= operand_b)) || (or1200_sprs_to_sr[9] == 1));

// TODO: why would a instruction with opcode 9 set the write address in the register file to 9?
// assert((~((or1200_ctrl_ex_insn & 'hFC000000)>>26==1)) || (or1200_rf_rf_addrw==9));

// TODO: not sure what is special about rf_addrw = 9 ...
//assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 2) )) || (or1200_rf_rf_addrw != 9));


//////////////////////////////////
// Privilege Escalation / Deescalation 
//////////////////////////////////

if (past_valid) begin // properties using past values need to be delayed by one!
    assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 1) )) || (or1200_sprs_sr[0] == prev_sr0));
    assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 2) )) || (or1200_sprs_sr[0] == prev_sr0));
    assert((~( ((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 3) & (or1200_ctrl_ex_insn & 'h3C000000 != 0) )) || (or1200_sprs_sr[0] == prev_sr0));



    // the EPCR register can be written with a "Write to Special Purpose Register" Instruction like:
    // 18100004: ['l.movhi', 'r0', '0x4']
    // c01f0020: ['l.mtspr', 'r31', 'r0', '0x20']
    // Which will make the following exception fail:
    // assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 3) )) || (or1200_except_epcr == prev_epcr));
    
    assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 1) )) || (or1200_except_epcr == prev_epcr));
    assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 2) )) || (or1200_except_epcr == prev_epcr));
    


    // the EEAR register can be written with a "Write to Special Purpose Register" Instruction like:
    // a8090100: ['l.ori', 'r0', 'r9', '0x100']
    // c0100030: ['l.mtspr', 'r16', 'r0', '0x30']
    // Which will make the following exception fail:
    // assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 3) )) || (or1200_except_eear == prev_eear));


    assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 1) )) || (or1200_except_eear == prev_eear));
    assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 2) )) || (or1200_except_eear == prev_eear));
    



    assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 1) )) || (or1200_except_esr == prev_esr));
    assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 2) )) || (or1200_except_esr == prev_esr));
    assert((~( ((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 3) & (or1200_ctrl_ex_insn & 'h3C000000 != 0) )) || (or1200_except_esr == prev_esr));


    assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 9) )) || (or1200_except_eear == prev_eear));


    assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 9) )) || (or1200_except_epcr == prev_epcr));


    assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 9) )) || (or1200_except_esr == prev_esr));
end

// opcode == 9: l.rfe (Return From Exception)
// PC <-- EPCR
// SR <-- ESR
// assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 9)) || (or1200_genpc_pc == or1200_except_epcr));
// assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 9)) || (or1200_sprs_to_sr == or1200_except_esr));


if (past_valid) begin // properties using past values need to be delayed by one!
//    assert((~((prev_ex_insn & 'hFFFF0000) >> 16 == 8192)) || (~((or1200_ctrl_ex_insn & 'hFFFF0000) >> 16 != 8192)) || (or1200_except_lsu_addr == or1200_except_eear));
//   assert((~((prev_ex_insn & 'hFFFF0000) >> 16 == 8192)) || (~((or1200_ctrl_ex_insn & 'hFFFF0000) >> 16 != 8192)) || (or1200_except_spr_dat_npc == or1200_except_epcr));
end

// assert((~((or1200_ctrl_wb_insn & 'hFFFF0000) >> 16 == 8192)) || (or1200_except_lsu_addr == or1200_except_eear));
// assert((~((or1200_ctrl_wb_insn & 'hFFFF0000) >> 16 == 8192)) || (or1200_except_spr_dat_npc == or1200_except_epcr));

assert((~((or1200_ctrl_ex_insn & 'hFFFF0000) >> 16 == 8192)) || (or1200_rf_rf_addrw == ((or1200_ctrl_ex_insn & 'h03E00000) >> 21)));


//////////////////////////////////
// Update Registers 
//////////////////////////////////

assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 47) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 57) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 51) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 52) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 53) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 54) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 55) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 48) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFF000000) >> 24 == 21) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 ==  9) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 17) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 ==  0) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 ==  4) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 ==  3) )) || (or1200_rf_we == 0));
assert((~(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 ==  8) )) || (or1200_rf_we == 0));

assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 48)) || (or1200_sprs_spr_dat_o == operand_b));


//////////////////////////////////
// Correct Results 
//////////////////////////////////

assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 2) )) || ((or1200_ctrl_ex_insn & 'h03e00000) >> 21 == or1200_rf_addrw));
assert((~(((or1200_ctrl_ex_insn & 'hC0000000) >> 30 == 3) )) || ((or1200_ctrl_ex_insn & 'h03e00000) >> 21 == or1200_rf_addrw));

//////////////////////////////////
// Instruction Executed 
//////////////////////////////////


assert(((or1200_ctrl_ex_insn & 'hFC000000) >> 26 != 'h1c));


if (past_valid) begin // properties using past values need to be delayed by one!
    assert((id_insn == 32'h14410000) || (id_insn == 32'h14610000) || (id_insn == prev_if_insn) || (prev_id_freeze) );
end

// assert((if_insn == 32'h14610000) || (if_insn == 32'h14410000) || (if_insn == icpu_dat_i ) || (if_insn == 0) || (if_insn == or1200_if_insn_saved));

//////////////////////////////////
// Memory Access 
//////////////////////////////////


// assert((operand_b == dcpu_dat_o));

// assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 32)) || (or1200_rf_rf_dataw == dcpu_dat_o));
// assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 33)) || (or1200_rf_rf_dataw == dcpu_dat_o));
// assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 34)) || (or1200_rf_rf_dataw == dcpu_dat_o));
// assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 35)) || (or1200_rf_rf_dataw == dcpu_dat_o));
// assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 36)) || (or1200_rf_rf_dataw == dcpu_dat_o));
// assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 37)) || (or1200_rf_rf_dataw == dcpu_dat_o));
// assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 38)) || (or1200_rf_rf_dataw == dcpu_dat_o));


assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 32)) || (dcpu_adr_o == operand_a + ex_simm));
assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 33)) || (dcpu_adr_o == operand_a + ex_simm));
assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 34)) || (dcpu_adr_o == operand_a + ex_simm));
assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 35)) || (dcpu_adr_o == operand_a + ex_simm));
assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 36)) || (dcpu_adr_o == operand_a + ex_simm));
assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 37)) || (dcpu_adr_o == operand_a + ex_simm));
assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 38)) || (dcpu_adr_o == operand_a + ex_simm));

assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 37)) || ((or1200_lsu_or1200_mem2reg_regdata & 32'hFFFF0000) == 0));
assert((~((or1200_ctrl_ex_insn & 'hFC000000) >> 26 == 53)) || ((or1200_lsu_or1200_reg2mem_memdata & 16'hFFFF) == (or1200_lsu_or1200_reg2mem_regdata & 16'hFFFF)));
assert((or1200_lsu_dcpu_dat_i == or1200_lsu_or1200_mem2reg_memdata));

// GP0 cannot be overwritten
assert((~((or1200_rf_rf_we == 1) && (or1200_rf_rf_addrw == 0))) || (or1200_rf_rf_dataw == 0));
//assert((~((or1200_ctrl_ex_insn & 'hFC0003CF) == 'hE00000C8)) || (((operand_a << (6'd32 - {1'b0, operand_b[4:0]})) | (operand_a >> operand_b[4:0])) == or1200_rf_rf_dataw) || (or1200_rf_rf_dataw == 0));

end
end



endmodule