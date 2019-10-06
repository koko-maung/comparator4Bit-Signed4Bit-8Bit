module Comparator4Bit (
a_ip, 
b_ip, 
a_ip_G, 
b_ip_G, 
a_ip_E_b, 
a_op_G, 
b_op_G, 
a_op_E_b 
);

input[3:0] a_ip;
input[3:0] b_ip;
input a_ip_G, b_ip_G, a_ip_E_b;

output a_op_G, b_op_G, a_op_E_b;

wire[3:0]top; 
wire[3:0]bot; 
wire[3:0]mid; 
wire[3:0]midOR; 
wire mid5NAND,mid5NOR,midUN;

Comparator1Bit Block00(a_ip[0],b_ip[0], top[0],bot[0],mid[0]); 
Comparator1Bit Block01(a_ip[1],b_ip[1], top[1],bot[1],mid[1]); 
Comparator1Bit Block02(a_ip[2],b_ip[2], top[2],bot[2],mid[2]); 
Comparator1Bit Block03(a_ip[3],b_ip[3], top[3],bot[3],mid[3]);

or(midOR[3],mid[3], top[2]); 
or(midOR[2],mid[3],mid[2], top[1]); 
or(midOR[1],mid[3],mid[2],mid[1], top[0]); 
or(midOR[0],mid[3],mid[2],mid[1],mid[0],~b_ip_G); 
nand(mid5NAND, top[3],midOR[3],midOR[2],midOR[1],midOR[0]); 
nor(mid5NOR,mid[3],mid[2],mid[1],mid[0],~a_ip_E_b);

assign b_op_G=mid5NAND; 
assign a_op_E_b=mid5NOR; 

nor(midUN,mid5NAND,mid5NOR);

assign a_op_G=midUN;
endmodule

