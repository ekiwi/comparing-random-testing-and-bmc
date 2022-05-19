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
  wire [0:0] PI_clock = clock;
  reg [258:0] PI_io_inputs;
  FFTSmallTop UUT (
    .clock(PI_clock),
    .io_inputs(PI_io_inputs)
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
    // UUT.$formal$FFTSmall_formal.\sv:254$1_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:254$1_EN  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:255$2_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:256$3_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:257$4_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:258$5_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:259$6_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:260$7_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:261$8_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:262$9_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:263$10_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:264$11_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:265$12_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:266$13_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:267$14_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:268$15_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:269$16_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:270$17_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:271$18_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:272$19_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:273$20_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:274$21_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:275$22_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:276$23_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:277$24_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:278$25_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:279$26_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:280$27_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:281$28_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:282$29_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:283$30_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:284$31_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:285$32_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:286$33_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:287$34_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:288$35_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:289$36_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:290$37_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:291$38_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:292$39_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:293$40_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:294$41_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:295$42_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:296$43_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:297$44_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:298$45_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:299$46_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:300$47_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:301$48_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:302$49_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:303$50_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:304$51_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:305$52_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:306$53_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:307$54_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:308$55_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:309$56_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:310$57_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:311$58_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:312$59_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:313$60_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:314$61_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:315$62_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:316$63_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:317$64_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:318$65_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:319$66_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:320$67_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:321$68_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:322$69_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:323$70_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:324$71_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:325$72_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:326$73_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:327$74_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:328$75_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:329$76_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:330$77_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:331$78_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:332$79_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:333$80_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:334$81_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:335$82_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:336$83_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:337$84_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:338$85_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:339$86_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:340$87_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:341$88_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:342$89_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:343$90_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:344$91_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:345$92_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:346$93_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:347$94_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:348$95_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:349$96_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:350$97_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:351$98_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:352$99_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:353$100_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:354$101_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:355$102_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:356$103_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:357$104_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:358$105_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:359$106_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:360$107_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:361$108_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:362$109_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:363$110_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:364$111_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:365$112_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:366$113_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:367$114_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:368$115_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:369$116_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:370$117_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:371$118_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:372$119_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:373$120_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:374$121_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:375$122_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:376$123_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:377$124_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:378$125_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:379$126_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:380$127_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:381$128_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:382$129_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:383$130_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:384$131_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:385$132_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:386$133_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:387$134_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:388$135_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:389$136_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:390$137_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:391$138_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:392$139_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:393$140_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:394$141_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:395$142_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:396$143_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:397$144_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:398$145_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:399$146_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:400$147_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:401$148_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:402$149_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:403$150_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:404$151_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:405$152_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:406$153_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:407$154_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:408$155_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:409$156_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:410$157_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:411$158_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:412$159_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:413$160_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:414$161_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:415$162_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:416$163_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:417$164_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:418$165_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:419$166_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:420$167_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:421$168_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:422$169_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:423$170_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:424$171_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:425$172_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:426$173_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:427$174_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:428$175_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:429$176_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:430$177_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:431$178_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:432$179_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:433$180_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:434$181_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:435$182_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:436$183_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:437$184_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:438$185_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:439$186_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:440$187_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:441$188_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:442$189_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:443$190_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:444$191_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:445$192_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:446$193_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:447$194_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:448$195_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:449$196_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:450$197_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:451$198_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:452$199_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:453$200_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:454$201_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:455$202_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:456$203_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:457$204_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:458$205_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:459$206_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:460$207_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:461$208_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:462$209_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:463$210_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:464$211_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:465$212_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:466$213_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:467$214_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:468$215_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:469$216_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:470$217_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:471$218_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:472$219_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:473$220_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:474$221_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:475$222_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:476$223_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:477$224_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:478$225_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:479$226_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:480$227_CHECK  = 1'b0;
    // UUT.$formal$FFTSmall_formal.\sv:481$228_CHECK  = 1'b0;
    UUT.bb.BiplexFFT._T_1060_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1060_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1139_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1139_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1202_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1202_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1281_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1281_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1344_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1344_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1430_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1430_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1516_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1516_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1602_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_1602_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_579 = 1'b0;
    UUT.bb.BiplexFFT._T_581 = 1'b0;
    UUT.bb.BiplexFFT._T_776_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_776_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_855_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_855_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_918_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_918_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_997_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT._T_997_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT.stage_outputs_2_0_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT.stage_outputs_2_0_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT.stage_outputs_2_2_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT.stage_outputs_2_2_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT.stage_outputs_2_4_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT.stage_outputs_2_4_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT.stage_outputs_2_6_imag = 17'b00000000000000000;
    UUT.bb.BiplexFFT.stage_outputs_2_6_real = 17'b00000000000000000;
    UUT.bb.BiplexFFT.sync_1 = 1'b1;
    UUT.bb.BiplexFFT.valid_delay = 1'b0;
    UUT.bb.BiplexFFT.value = 1'b0;
    UUT.bb.direct.valid_delay = 1'b0;
    UUT.bb.direct.value = 1'b0;
    UUT.bb.dses = 1'b0;
    UUT.bb.valid_delay = 1'b0;
    UUT.is_meta_reset_phase = 1'b1;
    UUT.is_reset_phase = 1'b0;

    // state 0
    PI_io_inputs = 259'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_io_inputs <= 259'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100;
    end

    // state 2
    if (cycle == 1) begin
      PI_io_inputs <= 259'b0000000000000000000000000000000000000000000000001111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111;
    end

    // state 3
    if (cycle == 2) begin
      PI_io_inputs <= 259'b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011;
    end

    // state 4
    if (cycle == 3) begin
      PI_io_inputs <= 259'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101;
    end

    // state 5
    if (cycle == 4) begin
      PI_io_inputs <= 259'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111;
    end

    // state 6
    if (cycle == 5) begin
      PI_io_inputs <= 259'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    end

    genclock <= cycle < 6;
    cycle <= cycle + 1;
  end
endmodule
