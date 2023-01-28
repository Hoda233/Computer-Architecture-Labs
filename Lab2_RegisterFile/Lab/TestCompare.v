module TestCompare ();

localparam data_width=16;
localparam addr_width=3;

reg clk, rst, write_enable, read_enable;
reg [data_width - 1 : 0] write_data;
wire [data_width - 1 : 0] read_data_array;
wire [data_width - 1 : 0] read_data_for;
reg [addr_width - 1 : 0] read_addr,write_addr;

RegisterFileArray #(data_width, addr_width) t1 (read_enable,write_enable,clk,rst,read_data_array,write_data,read_addr,write_addr);
RegisterFileFor #(data_width, addr_width) t2 (read_enable,write_enable,clk,rst,read_data_for,write_data,read_addr,write_addr);
always begin
#10 clk=~clk;
end

initial begin
$display("-------------------------------------------------------------------------------------------------");
$display("Assumptions:");
$display("-------------");
$display("Write at +ve edge, read at -ve edge");
$display("-------------------------------------------------------------------------------------------------");

$display("Time Reset ReadEnable WriteEnable ReadAddress WriteAddress WriteData   ReadDataArray    ReadDataFor");
$display("-------------------------------------------------------------------------------------------------");
$monitor ("%g \t%b \t%b     \t%b \t%b \t%b \t%b \t%b \t%b", $time, rst, read_enable, write_enable, read_addr, write_addr, write_data,  read_data_array, read_data_for);


clk=0;
rst=0;
read_enable=0;
write_enable=0;


#10 //pos
read_enable=0;
write_enable=1;
write_data=16'b1111000011110000;
write_addr=3'b000;


#10 //neg
read_enable=1;
write_enable=0;
read_addr=3'b000;

#10 //pos
if(read_data_array==read_data_for)
 $display("Same Result:%b", read_data_array);
else 
 $display("Different Results: Array %b, Generate %b", read_data_array, read_data_for);

read_enable=0;
write_enable=0;
rst=1;

#10 //neg
rst=0;
read_enable=1;
write_enable=0;
read_addr=3'b000;

#20 //neg
if(read_data_array==read_data_for)
 $display("Same Result:%b", read_data_array);
else 
 $display("Different Results: Array %b, Generate %b", read_data_array, read_data_for);

read_enable=1;
write_enable=0;
read_addr=3'b001;

#10 //pos
if(read_data_array==read_data_for)
 $display("Same Result:%b", read_data_array);
else 
 $display("Different Results: Array %b, Generate %b", read_data_array, read_data_for);
read_enable=0;
write_enable=1;
write_data=16'b1111111111110000;
write_addr=3'b001;

#10 //neg
read_enable=1;
write_enable=0;
read_addr=3'b001;

#20 //neg
if(read_data_array==read_data_for)
 $display("Same Result:%b", read_data_array);
else 
 $display("Different Results: Array %b, Generate %b", read_data_array, read_data_for);
read_enable=1;
write_enable=0;
read_addr=3'b010;

#10 //pos
if(read_data_array==read_data_for)
 $display("Same Result:%b", read_data_array);
else 
 $display("Different Results: Array %b, Generate %b", read_data_array, read_data_for);
read_enable=1;
write_enable=0;
read_addr=3'b011;

#10 //neg
if(read_data_array==read_data_for)
 $display("Same Result:%b", read_data_array);
else 
 $display("Different Results: Array %b, Generate %b", read_data_array, read_data_for);
read_enable=0;
write_enable=1;
write_data=16'b1111111111111111;
write_addr=3'b011;

/*#10 //pos
rst=1;
write_enable=0;

#10 //neg
else if(read_data_array==read_data_for)
 $display("Same Result:%b", read_data_array);
else 
 $display("Different Results: Array %b, Generate %b", read_data_array, read_data_for);
rst=0;
read_enable=1;
write_enable=0;
read_addr=3'b011;*/

#10 //pos
read_enable=0;
write_enable=1;
write_data=16'b1111111111111111;
write_addr=3'b011;

#10 //neg
read_enable=1;
write_enable=0;
read_addr=3'b011;



#10 //pos
if(read_data_array== 16'bzzzzzzzzzzzzzzzz && read_data_for== 16'bzzzzzzzzzzzzzzzz)
$display("Same Result (z):%b", read_data_array);
else if(read_data_array==read_data_for)
 $display("Same Result:%b", read_data_array);
else 
 $display("Different Results: Array %b, Generate %b", read_data_array, read_data_for);


end

endmodule

