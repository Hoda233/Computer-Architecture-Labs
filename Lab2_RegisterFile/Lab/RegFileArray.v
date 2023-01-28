module RegisterFileArray #(parameter data_width=16, addr_width=3)(read_enable,write_enable,clk,rst,read_data,write_data,read_addr,write_addr);

input read_enable, write_enable, clk, rst;
output reg [data_width - 1 : 0] read_data;
input [data_width - 1 : 0] write_data;
input [addr_width - 1 : 0] read_addr,write_addr;

localparam no_of_reg=2**addr_width;
reg [data_width - 1 : 0] memory[no_of_reg - 1 : 0];

integer i;
always @(posedge clk or posedge rst) begin
if(rst)
 for(i=0; i< no_of_reg; i=i+1)
    memory[i]=0;
else if (write_enable)
   memory[write_addr]= write_data;
end


always @(negedge clk or posedge rst) begin
if(rst)
    memory[read_addr]=16'bz;
else if (read_enable)
  read_data = memory[read_addr];
else 
   read_data=16'bz;
end
endmodule

