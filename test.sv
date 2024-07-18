`timescale 1ns/10ps
module test;
	logic clk, rst;
	top top(clk, rst);
	always #5 clk = ~clk;
	initial begin
		$dumpfile("top.vcd");
		$dumpvars(0, top);
		$readmemh("data/1.txt", top.pu0.dmem.dm);

		clk = 0;
		rst = 1;
		#20
		rst = 0;
		#4000
		$finish();
	end

endmodule
