include "Register.v";
include "decoder.v";
module RegisterFileFor #(parameter data_width=16, addr_width=3)(read_enable,write_enable,clk,rst,read_data,write_data,read_addr,write_addr);

localparam no_of_reg=2**addr_width;

input read_enable, write_enable, clk, rst;
output wire[data_width - 1 : 0] read_data;
input [data_width - 1 : 0] write_data;
input [addr_width - 1 : 0] read_addr,write_addr;

wire [no_of_reg - 1 : 0] rd_en;
wire [no_of_reg - 1 : 0] wr_en;

decoder dec1 (read_addr,rd_en);
decoder dec2 (write_addr,wr_en);

genvar i;
generate
for (i=0; i<no_of_reg;i=i+1)
Register #(data_width) REG (rd_en[i]&read_enable,wr_en[i]&write_enable,clk,rst,read_data,write_data);
endgenerate
endmodule
