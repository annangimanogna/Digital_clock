module digital_tb;
reg clk,rst;
wire [5:0]sec,min,hr;
  digital_clk dut(.clk(clk),.rst(rst),.sec(sec),.min(min),.hr(hr));
  initial 
    begin
      clk=0;
    end
  always #5 clk=~clk;
  initial
    begin rst=0;
      #20 rst=1;
    end
  // Dump for waveform
initial begin
  $dumpfile("digital.vcd");   // file name
  $dumpvars(0, digital_tb);   // dump all variables
end

// Simulation stop
initial begin
  #5000 $finish;   // run simulation for some time
end
endmodule
