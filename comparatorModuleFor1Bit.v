module Comparator1Bit ( 
a_ip,
b_ip,
a_op_G,
a_op_E_b, b_op_G,
);

input a_ip;
input b_ip; 

output a_op_G; 
output a_op_E_b;
output b_op_G;

nand (a_op_G, a_ip, ~b_ip);
nand (b_op_G, ~a_ip, b_ip);
nand (a_op_E_b, a_op_G, b_op_G);

endmodule

