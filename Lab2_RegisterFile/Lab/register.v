module Register #(parameter data_width=16)(read_enable,write_enable,clk,rst,read_data,write_data);

input read_enable, write_enable, clk, rst;
output reg [data_width - 1 : 0] read_data;
input [data_width - 1 : 0] write_data;

reg [data_width - 1 : 0] reg_data;

always @(posedge clk, posedge rst) begin
if(rst)
    reg_data=0;
else if (write_enable)
    reg_data= write_data;
end

always @(negedge clk, posedge rst) begin
if(rst)
   reg_data=16'bz;
else if (read_enable)
   read_data= reg_data;
else 
    read_data=16'bz;
end
endmodule

