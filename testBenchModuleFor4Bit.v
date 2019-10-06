module Comparator4Bit_TB(); 

reg[3:0] a_ip;
reg[3:0] b_ip;

reg a_ip_G, b_ip_G, a_ip_E_b;
wire a_op_G, b_op_G, a_op_E_b; 
integer xx,yy,zz;

Comparator4Bit  test4Bit (
.a_ip(a_ip), 
.b_ip(b_ip), 
.a_ip_G(a_ip_G), 
.b_ip_G(b_ip_G), 
.a_ip_E_b(a_ip_E_b), 
.a_op_G(a_op_G), 
.a_op_E_b(a_op_E_b), 
.b_op_G(b_op_G));

initial

begin

for(xx=0;xx<=8;xx=xx+1)

begin
case(xx)

0:b_ip =4'b0000; 
1:b_ip =4'b0001; 
2:b_ip =4'b0010; 
3:b_ip =4'b0011; 
4:b_ip =4'b0100; 
5:b_ip =4'b0101; 
6:b_ip =4'b1000;
7:b_ip =4'b1001;
8:b_ip =4'b1111; 

endcase

for(yy=0;yy<=8;yy=yy+1)

begin

case(yy)
0:a_ip =4'b0000; 
1:a_ip =4'b0001; 
2:a_ip =4'b0010; 
3:a_ip =4'b0011; 
4:a_ip =4'b0100; 
5:a_ip =4'b0101; 
6:a_ip =4'b1000; 
7:a_ip =4'b1001; 
8:a_ip =4'b1111;
endcase

begin

case(zz)

0: {a_ip_G,b_ip_G,a_ip_E_b}=3'b100; 
1: {a_ip_G,b_ip_G,a_ip_E_b}=3'b010; 
2: {a_ip_G,b_ip_G,a_ip_E_b}=3'b001;
endcase

#5 // delay of 5ns

$display("a_ip:%b,b_ip:%b, a_op_G:%b,a_op_E_b:%b,b_op_G:%b",a_ip,b_ip, a_op_G,a_op_E_b,b_op_G);

end
end 
end
end 
endmodule

