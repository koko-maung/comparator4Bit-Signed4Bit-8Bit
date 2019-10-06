module Comparator8Bit_TB();
reg [7:0]a_ip;
reg [7:0]b_ip;
reg a_ip_G,b_ip_G,a_ip_E_b;
wire a_op_G,a_op_E_b,b_op_G;
integer i;

Comparator8Bit comp8bit(
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
b_ip_G = 1'b0;
a_ip_E_b = 1'b1;
a_ip_G = 1'b0;
end
initial
begin
for(i=0;i<=8;i=i+1) 
begin
case(i)
0:{ a_ip,b_ip }={8'b10000000,8'b10000000};
1:{ a_ip,b_ip }={8'b10000000,8'b00000000};
2:{ a_ip,b_ip }={8'b10000000,8'b01111111};
3:{ a_ip,b_ip }={8'b00000000,8'b10000000};
4:{ a_ip,b_ip }={8'b00000000,8'b00000000};
5:{ a_ip,b_ip }={8'b00000000,8'b01111111};
6:{ a_ip,b_ip }={8'b01111111,8'b10000000};
7:{ a_ip,b_ip }={8'b01111111,8'b00000000};
8:{ a_ip,b_ip }={8'b01111111,8'b01111111};
endcase
#10;
$display("a_ip:%b,b_ip:%b,a_op_G:%b,b_op_G:%b,a_op_E_b:%b",a_ip,b_ip,a_op_G,b_op_G,a_op_E_b);
end
end
endmodule

