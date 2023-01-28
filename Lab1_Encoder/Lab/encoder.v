module encoder (in,out);
    input [7:0] in;
    output [2:0] out;
    wire [2:0] out;
    wire enable;
    assign out  =  
    (enable == 0) ? 3'bzzz:
    (in == 8'b0000_0001) ? 3'b000 : 
    (in == 8'b0000_0010) ? 3'b001 : 
    (in == 8'b0000_0100) ? 3'b010 : 
    (in == 8'b0000_1000) ? 3'b011 : 
    (in == 8'b0001_0000) ? 3'b100 : 
    (in == 8'b0010_0000) ? 3'b101 : 
    (in == 8'b0100_0000) ? 3'b110 : 
    (in == 8'b1000_0000) ? 3'b111 :  3'bxxx;
 endmodule
