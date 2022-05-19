`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  reg [166:0] PI_io_inputs;
  wire [0:0] PI_clock = clock;
  TLSPITop UUT (
    .io_inputs(PI_io_inputs),
    .clock(PI_clock)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$formal$TLSPI_formal.\sv:236$1_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:237$2_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:238$3_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:239$4_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:240$5_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:241$6_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:242$7_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:243$8_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:244$9_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:245$10_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:246$11_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:247$12_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:248$13_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:249$14_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:250$15_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:251$16_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:252$17_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:253$18_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:254$19_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:255$20_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:256$21_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:257$22_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:258$23_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:259$24_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:260$25_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:261$26_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:262$27_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:263$28_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:264$29_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:265$30_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:266$31_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:267$32_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:268$33_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:269$34_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:270$35_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:271$36_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:272$37_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:273$38_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:274$39_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:275$40_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:276$41_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:277$42_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:278$43_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:279$44_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:280$45_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:281$46_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:282$47_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:283$48_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:284$49_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:285$50_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:286$51_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:287$52_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:288$53_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:289$54_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:290$55_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:291$56_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:292$57_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:293$58_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:294$59_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:295$60_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:296$61_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:297$62_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:298$63_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:299$64_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:300$65_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:301$66_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:302$67_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:303$68_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:304$69_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:305$70_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:306$71_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:307$72_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:308$73_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:309$74_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:310$75_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:311$76_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:312$77_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:313$78_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:314$79_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:315$80_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:316$81_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:317$82_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:318$83_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:319$84_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:320$85_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:321$86_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:322$87_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:323$88_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:324$89_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:325$90_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:326$91_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:327$92_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:328$93_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:329$94_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:330$95_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:331$96_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:332$97_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:333$98_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:334$99_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:335$100_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:336$101_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:337$102_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:338$103_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:339$104_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:340$105_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:341$106_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:342$107_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:343$108_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:344$109_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:345$110_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:346$111_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:347$112_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:348$113_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:349$114_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:350$115_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:351$116_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:352$117_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:353$118_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:354$119_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:355$120_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:356$121_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:357$122_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:358$123_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:359$124_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:360$125_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:361$126_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:362$127_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:363$128_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:364$129_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:365$130_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:366$131_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:367$132_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:368$133_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:369$134_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:370$135_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:371$136_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:372$137_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:373$138_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:374$139_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:375$140_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:376$141_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:377$142_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:378$143_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:379$144_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:380$145_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:381$146_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:382$147_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:383$148_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:384$149_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:385$150_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:386$151_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:387$152_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:388$153_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:389$154_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:390$155_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:391$156_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:392$157_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:393$158_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:394$159_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:395$160_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:396$161_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:397$162_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:398$163_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:399$164_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:400$165_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:401$166_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:402$167_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:403$168_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:404$169_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:405$170_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:406$171_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:407$172_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:408$173_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:409$174_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:410$175_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:411$176_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:412$177_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:413$178_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:414$179_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:415$180_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:416$181_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:417$182_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:418$183_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:419$184_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:420$185_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:421$186_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:422$187_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:423$188_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:424$189_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:425$190_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:426$191_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:427$192_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:428$193_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:429$194_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:430$195_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:431$196_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:432$197_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:433$198_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:434$199_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:435$200_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:436$201_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:437$202_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:438$203_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:439$204_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:440$205_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:441$206_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:442$207_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:443$208_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:444$209_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:445$210_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:446$211_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:447$212_CHECK  = 1'b0;
    // UUT.$formal$TLSPI_formal.\sv:455$213_EN  = 1'b0;
    UUT.bb.TLMonitor._T_613 = 1'b0;
    UUT.bb.TLMonitor._T_630 = 3'b000;
    UUT.bb.TLMonitor._T_632 = 3'b000;
    UUT.bb.TLMonitor._T_634 = 2'b00;
    UUT.bb.TLMonitor._T_636 = 7'b0000000;
    UUT.bb.TLMonitor._T_638 = 29'b00000000000000000000000000000;
    UUT.bb.TLMonitor._T_681 = 1'b0;
    UUT.bb.TLMonitor._T_698 = 3'b000;
    UUT.bb.TLMonitor._T_702 = 2'b00;
    UUT.bb.TLMonitor._T_704 = 7'b0000000;
    UUT.bb.TLMonitor._T_749 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    UUT.bb.TLMonitor._T_764 = 1'b0;
    UUT.bb.TLMonitor._T_792 = 1'b0;
    UUT.bb.ctrl_cs_dflt_0 = 1'b0;
    UUT.bb.ctrl_cs_dflt_1 = 1'b1;
    UUT.bb.ctrl_cs_dflt_2 = 1'b1;
    UUT.bb.ctrl_cs_dflt_3 = 1'b1;
    UUT.bb.ctrl_cs_id = 2'b00;
    UUT.bb.ctrl_cs_mode = 2'b00;
    UUT.bb.ctrl_dla_cssck = 8'b11111111;
    UUT.bb.ctrl_dla_intercs = 8'b00000000;
    UUT.bb.ctrl_dla_interxfr = 8'b11111111;
    UUT.bb.ctrl_dla_sckcs = 8'b11111111;
    UUT.bb.ctrl_fmt_endian = 1'b0;
    UUT.bb.ctrl_fmt_iodir = 1'b0;
    UUT.bb.ctrl_fmt_len = 4'b0000;
    UUT.bb.ctrl_fmt_proto = 2'b00;
    UUT.bb.ctrl_sck_div = 12'b000000000000;
    UUT.bb.ctrl_sck_pha = 1'b0;
    UUT.bb.ctrl_sck_pol = 1'b0;
    UUT.bb.ctrl_wm_rx = 4'b0000;
    UUT.bb.ctrl_wm_tx = 4'b0000;
    UUT.bb.fifo.cs_mode = 2'b01;
    UUT.bb.fifo.rxen = 1'b0;
    UUT.bb.fifo.rxq.maybe_full = 1'b0;
    UUT.bb.fifo.rxq.mem_sparse.addresses_0_bits = 3'b000;
    UUT.bb.fifo.rxq.mem_sparse.addresses_0_valid = 1'b0;
    UUT.bb.fifo.rxq.mem_sparse.addresses_1_bits = 3'b000;
    UUT.bb.fifo.rxq.mem_sparse.addresses_1_valid = 1'b0;
    UUT.bb.fifo.rxq.mem_sparse.addresses_2_bits = 3'b000;
    UUT.bb.fifo.rxq.mem_sparse.addresses_2_valid = 1'b0;
    UUT.bb.fifo.rxq.mem_sparse.addresses_3_bits = 3'b000;
    UUT.bb.fifo.rxq.mem_sparse.addresses_3_valid = 1'b0;
    UUT.bb.fifo.rxq.mem_sparse.addresses_4_bits = 3'b000;
    UUT.bb.fifo.rxq.mem_sparse.addresses_4_valid = 1'b0;
    UUT.bb.fifo.rxq.mem_sparse.addresses_5_bits = 3'b000;
    UUT.bb.fifo.rxq.mem_sparse.addresses_5_valid = 1'b0;
    UUT.bb.fifo.rxq.mem_sparse.addresses_6_bits = 3'b000;
    UUT.bb.fifo.rxq.mem_sparse.addresses_6_valid = 1'b0;
    UUT.bb.fifo.rxq.mem_sparse.addresses_7_bits = 3'b000;
    UUT.bb.fifo.rxq.mem_sparse.addresses_7_valid = 1'b0;
    UUT.bb.fifo.rxq.mem_sparse.nextAddr = 4'b0000;
    UUT.bb.fifo.rxq.value = 3'b000;
    UUT.bb.fifo.rxq.value_1 = 3'b000;
    UUT.bb.fifo.txq.maybe_full = 1'b1;
    UUT.bb.fifo.txq.mem_sparse.addresses_0_bits = 3'b111;
    UUT.bb.fifo.txq.mem_sparse.addresses_0_valid = 1'b0;
    UUT.bb.fifo.txq.mem_sparse.addresses_1_bits = 3'b111;
    UUT.bb.fifo.txq.mem_sparse.addresses_1_valid = 1'b0;
    UUT.bb.fifo.txq.mem_sparse.addresses_2_bits = 3'b111;
    UUT.bb.fifo.txq.mem_sparse.addresses_2_valid = 1'b0;
    UUT.bb.fifo.txq.mem_sparse.addresses_3_bits = 3'b111;
    UUT.bb.fifo.txq.mem_sparse.addresses_3_valid = 1'b0;
    UUT.bb.fifo.txq.mem_sparse.addresses_4_bits = 3'b111;
    UUT.bb.fifo.txq.mem_sparse.addresses_4_valid = 1'b0;
    UUT.bb.fifo.txq.mem_sparse.addresses_5_bits = 3'b111;
    UUT.bb.fifo.txq.mem_sparse.addresses_5_valid = 1'b0;
    UUT.bb.fifo.txq.mem_sparse.addresses_6_bits = 3'b111;
    UUT.bb.fifo.txq.mem_sparse.addresses_6_valid = 1'b0;
    UUT.bb.fifo.txq.mem_sparse.addresses_7_bits = 3'b111;
    UUT.bb.fifo.txq.mem_sparse.addresses_7_valid = 1'b0;
    UUT.bb.fifo.txq.mem_sparse.nextAddr = 4'b1000;
    UUT.bb.fifo.txq.value = 3'b111;
    UUT.bb.fifo.txq.value_1 = 3'b110;
    UUT.bb.ie_rxwm = 1'b0;
    UUT.bb.ie_txwm = 1'b0;
    UUT.bb.mac.clear = 1'b0;
    UUT.bb.mac.cs_assert = 1'b1;
    UUT.bb.mac.cs_dflt_0 = 1'b1;
    UUT.bb.mac.cs_dflt_1 = 1'b1;
    UUT.bb.mac.cs_dflt_2 = 1'b1;
    UUT.bb.mac.cs_dflt_3 = 1'b1;
    UUT.bb.mac.cs_id = 2'b00;
    UUT.bb.mac.cs_set = 1'b0;
    UUT.bb.mac.phy._T_50 = 1'b0;
    UUT.bb.mac.phy._T_51 = 1'b0;
    UUT.bb.mac.phy._T_53 = 1'b0;
    UUT.bb.mac.phy._T_54 = 1'b0;
    UUT.bb.mac.phy.buffer = 8'b00000000;
    UUT.bb.mac.phy.cref = 1'b0;
    UUT.bb.mac.phy.ctrl_fmt_endian = 1'b0;
    UUT.bb.mac.phy.ctrl_fmt_iodir = 1'b0;
    UUT.bb.mac.phy.ctrl_fmt_proto = 2'b00;
    UUT.bb.mac.phy.ctrl_sck_div = 12'b000000000000;
    UUT.bb.mac.phy.ctrl_sck_pha = 1'b0;
    UUT.bb.mac.phy.ctrl_sck_pol = 1'b0;
    UUT.bb.mac.phy.done = 1'b0;
    UUT.bb.mac.phy.last_d = 1'b0;
    UUT.bb.mac.phy.sample_d = 1'b0;
    UUT.bb.mac.phy.sck = 1'b0;
    UUT.bb.mac.phy.scnt = 8'b00000000;
    UUT.bb.mac.phy.setup_d = 1'b0;
    UUT.bb.mac.phy.tcnt = 12'b000000000000;
    UUT.bb.mac.phy.txd = 4'b0000;
    UUT.bb.mac.phy.xfr = 1'b0;
    UUT.bb.mac.state = 2'b10;
    UUT.is_meta_reset_phase = 1'b1;
    UUT.is_reset_phase = 1'b0;
    UUT.bb.fifo.rxq.mem_sparse.mem[3'b000] = 8'b00000000;
    UUT.bb.fifo.txq.mem_sparse.mem[3'b000] = 8'b11111111;

    // state 0
    PI_io_inputs = 167'b01111111111111111111111111111111000000000000000000000000000000001111111111111111100000100101100000000000000000000000000000000000000000001111101000000000000010001000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_io_inputs <= 167'b01111111111111111111111111111111000000000000000000000000000000001111111111111111100000100101100000000000000000000000000000000000000000001111101000000000000010001000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_io_inputs <= 167'b01111111000000011111000000000000000000000000000000000000000000001000000000010010000000010100000000000000000000000000000000001111100000000111001000000000100010001000000;
    end

    // state 3
    if (cycle == 2) begin
      PI_io_inputs <= 167'b11111111000100001111111111111111000000000000000000000000000000001000000000010010000000100100000000000000000000000000000000000001000000000111001000000000100010001000000;
    end

    // state 4
    if (cycle == 3) begin
      PI_io_inputs <= 167'b11111111111100001111111100000111000000000000000000000000000000001000000000010010000000001010000000000000000000000000000000001000000000001111000000000000100010001000000;
    end

    // state 5
    if (cycle == 4) begin
      PI_io_inputs <= 167'b11111111000000001111111111111110000000000000000000000000000000001000000000010010000000100000000000000000000000000000000000110110000000000111001000000000100010001000000;
    end

    // state 6
    if (cycle == 5) begin
      PI_io_inputs <= 167'b11111111111111111111111111111111000000000000000000000000000000001000000000010010000000100110000000000000000000000000000000001000000000001111100000000000100010001000000;
    end

    // state 7
    if (cycle == 6) begin
      PI_io_inputs <= 167'b00000000000000000000000000000000000000000000000000000000000000001000000000010010011111111111100000000000000000000000000000110000000000001000101111000000000000001000000;
    end

    genclock <= cycle < 7;
    cycle <= cycle + 1;
  end
endmodule
