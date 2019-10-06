module signed_Comparator4Bit  ( 
a_ip,
b_ip,
a_ip_G,
b_ip_G,
a_ip_E_b,
a_op_G,
a_op_E_b,
b_op_G 
);

input[4:1] a_ip;
input[4:1] b_ip;
input a_ip_G,b_ip_G,a_ip_E_b;

output a_op_G,a_op_E_b,b_op_G;

wire[4:1] a1,b1;

assign a1 = a_ip+4'b1000;
assign b1 = b_ip+4'b1000;

Comparator4Bit  signedComp4Bit(a1,b1,a_ip_G,b_ip_G,a_ip_E_b,a_op_G,a_op_E_b,b_op_G);
endmodule

