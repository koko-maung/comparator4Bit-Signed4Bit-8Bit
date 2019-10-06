module Comparator8Bit(a_ip,b_ip,a_ip_G,b_ip_G,a_ip_E_b,a_op_G,a_op_E_b,b_op_G);
input [7:0]a_ip;
input [7:0]b_ip;
input a_ip_G,b_ip_G,a_ip_E_b; 
output a_op_G,a_op_E_b,b_op_G;
wire a_ip_G01,b_ip_G01,a_ip_E01_b; 

wire [7:0]i;
wire [7:0]j;

assign i=a_ip+8'b10000000;
assign j=b_ip+8'b10000000;
Comparator4Bit  Comp4bit_01(i[3:0],j[3:0],a_ip_G,b_ip_G,a_ip_E_b,a_ip_G01,a_ip_E01_b,b_ip_G01);
Comparator4Bit  Comp4bit_02(i[7:4],j[7:4],a_ip_G01,b_ip_G01,a_ip_E01_b,a_op_G,a_op_E_b,b_op_G);
endmodule

