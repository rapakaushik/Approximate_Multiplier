module asm1(a0,a1,b,p);
input a0,a1;
input[7:0] b;
output[8:0] p;
wire k1,k2,k3,k4,k5,k6,k7;
wire l0,l1,l2,l3,l4,l5,l6;

 assign p[0] = (a0 & b[0]);
 assign k1 = (a0 & b[1]);
 assign k2 = (a0 & b[2]);
 assign k3 = (a0 & b[3]);
 assign k4 = (a0 & b[4]);
 assign k5 = (a0 & b[5]);
 assign k6 = (a0 & b[6]);
 assign k7 = (a0 & b[7]);
 
 
 assign l0 = (a1 & b[0]);
 assign l1 = (a1 & b[1]);
 assign l2 = (a1 & b[2]);
 assign l3 = (a1 & b[3]);
 assign l4 = (a1 & b[4]);
 assign l5 = (a1 & b[5]);
 assign l6 = (a1 & b[6]);
 assign p[8] = (a1 & b[7]);
 
 
assign p[1]  = (k1|l0);
assign p[2]  = (k2|l1);
assign p[3]  = (k3|l2);
assign p[4]  = (k4|l3);
assign p[5]  = (k5|l4);
assign p[6]  = (k6|l5);
assign p[7]  = (k7|l6);

endmodule

module asm2(
    input a3,
    input a2,
    input [7:0] b,
    output [9:0] pp2
    );
    wire k1,k2,k3,k4,k5,k6,k7;
    wire l0,l1,l2,l3,l4,l5,l6,l7;
    wire p0,p1,p2,p3,p4,p5,p6,p7,p8;
    wire g1,g2,g3,g4,g5,g6,g7;
    wire c1,c2,c3,c4,c5,c6,c7;
    
    assign k1=(a2&b[1]);
    assign k2=(a2&b[2]);
    assign k3=(a2&b[3]);
    assign k4=(a2&b[4]);
    assign k5=(a2&b[5]);
    assign k6=(a2&b[6]);
    assign k7=(a2&b[7]);
    
    assign l0=(a3&b[0]);
    assign l1=(a3&b[1]);
    assign l2=(a3&b[2]);
    assign l3=(a3&b[3]);
    assign l4=(a3&b[4]);
    assign l5=(a3&b[5]);
    assign l6=(a3&b[6]);
    assign l7=(a3&b[7]);
    
    assign p0=(a2&b[0]);
    assign p1=(l0|k1);
    assign p2=(l1|k2);
    assign p3=(l2|k3);
    assign p4=(l3|k4);
    assign p5=(l4|k5);
    assign p6=(l5|k6);
    assign p7=(l6|k7);
    assign p8=l7;
    
    assign g1=(l0&k1);
    assign g2=(l1&k2);
    assign g3=(l2&k3);
    assign g4=(l3&k4);
    assign g5=(l4&k5);
    assign g6=(l5&k6);
    assign g7=(l6&k7);
    
    assign c1=(~p1&p0);
    assign c2=(~p2&p1);
    assign c3=(~p3&p2);
    assign c4=(~p4&p3);
    assign c5=(~p5&p4);
    assign c6=(~p6&p5);
    assign c7=(~p7&p6);
    
    assign m1=(c1|g1);
    assign m2=(c2|g2);
    assign m3=(c3|g3);
    assign m4=(c4|g4);
    assign m5=(c5|g5);
    assign m6=(c6|g6);
    assign m7=(c7|g7);
    assign m8=(~l7&p7);
    
    assign s=(g7|g6|g5);
    
    assign pp2[0]=((s&0)|(~s&p0));
    assign pp2[1]=((s&m1)|(~s&p1));
    assign pp2[2]=((s&m2)|(~s&p2));
    assign pp2[3]=((s&m3)|(~s&p3));
    assign pp2[4]=((s&m4)|(~s&p4));
    assign pp2[5]=((s&m5)|(~s&p5));
    assign pp2[6]=((s&m6)|(~s&p6));
    assign pp2[7]=((s&m7)|(~s&p7));
    assign pp2[8]=((s&m8)|(~s&p8));
    assign pp2[9]=((s&l7)|(~s&0));
endmodule

module partialp(a,b,pp);
input a;
input [7:0]b;
output [7:0]pp;
assign pp[0]=(a&b[0]);
assign pp[1]=(a&b[1]);
assign pp[2]=(a&b[2]);
assign pp[3]=(a&b[3]);
assign pp[4]=(a&b[4]);
assign pp[5]=(a&b[5]);
assign pp[6]=(a&b[6]);
assign pp[7]=(a&b[7]);
endmodule

module ha(a,b,s,c);
input a,b;
output s,c;
xor(s,a,b);
and(c,a,b);
endmodule

module fa(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire x,y,z;
ha o1(a,b,x,y);
ha o2(x,c,sum,z);
assign carry=y|z;
endmodule

module ppr(pp1,pp2,pp3,pp4,pp5,pp6,y);
input [8:0]pp1;
    input [9:0]pp2;
    input [7:0]pp3;
    input [7:0]pp4;
    input [7:0]pp5;
    input [7:0]pp6;
    output [15:0]y;
//stage1
wire [6:0]s1;
wire [6:0]c1;
fa h1(pp3[2],pp4[1],pp5[0],s1[0],c1[0]);
fa h2(pp3[3],pp4[2],pp5[1],s1[1],c1[1]);
fa h3(pp3[4],pp4[3],pp5[2],s1[2],c1[2]);
fa h4(pp3[5],pp4[4],pp5[3],s1[3],c1[3]);
fa h5(pp3[6],pp4[5],pp5[4],s1[4],c1[4]);
fa h6(pp3[7],pp4[6],pp5[5],s1[5],c1[5]);
fa h7(pp4[7],pp5[6],pp6[5],s1[6],c1[6]);

//stage2
wire[6:0]s2;
wire[6:0]c2;
fa i1(pp1[5],pp3[1],pp4[0],s2[0],c2[0]);
fa i2(pp1[7],c1[0],pp6[0],s2[1],c2[1]);
fa i3(pp1[8],c1[1],pp6[1],s2[2],c2[2]);
fa i4(s1[3],pp6[2],c1[2],s2[3],c2[3]);
fa i5(s1[4],pp6[3],c1[3],s2[4],c2[4]);
fa i6(s1[5],pp6[4],c1[4],s2[5],c2[5]);
fa i7(pp5[7],pp6[6],c1[6],s2[6],c2[6]);

//stage3
wire [9:0]s3;
wire [9:0]c3;
assign s3[0]=(pp2[0]|pp1[2]);
assign s3[1]=(pp2[1]|pp1[3]);
fa j1(pp2[2],pp1[4],pp3[0],s3[2],c3[2]);
fa j2(pp1[6],s1[0],c2[0],s3[3],c3[3]);
fa j3(pp2[5],s1[1],s2[1],s3[4],c3[4]);
fa j4(s1[2],s2[2],c2[1],s3[5],c3[5]);
fa j5(pp2[7],s2[3],c2[2],s3[6],c3[6]);
fa j6(pp2[8],s2[4],c2[3],s3[7],c3[7]);
fa j7(pp2[9],s2[5],c2[4],s3[8],c3[8]);
fa j8(c1[5],s1[6],c2[5],s3[9],c3[9]);

//stage4
wire [9:0]s4;
wire [9:0]c4;
fa k1(pp2[3],s2[0],c3[2],s4[0],c4[0]);
fa k2(pp2[4],s3[3],c4[0],s4[1],c4[1]);
fa k3(s3[4],c3[3],c4[1],s4[2],c4[2]);
fa k4(pp2[6],s3[5],c3[4],s4[3],c4[3]);
fa k5(s3[6],c3[5],c4[3],s4[4],c4[4]);
fa k6(s3[7],c3[6],c4[4],s4[5],c4[5]);
fa k7(s3[8],c3[7],c4[5],s4[6],c4[6]);
fa k8(s3[9],c3[8],c4[6],s4[7],c4[7]);
fa k9(s2[6],c3[9],c4[7],s4[8],c4[8]);
fa k10(pp6[7],c2[6],c4[8],s4[9],c4[9]); 

//stage5
wire [7:0]s5;
wire [7:0]c5;
ha e1(c4[2],s4[3],s5[0],c5[0]);
ha e2(s4[4],c5[0],s5[1],c5[1]);
ha e3(s4[5],c5[1],s5[2],c5[2]);
ha e4(s4[6],c5[2],s5[3],c5[3]);
ha e5(s4[7],c5[3],s5[4],c5[4]);
ha e6(s4[8],c5[4],s5[5],c5[5]);
ha e7(s4[9],c5[5],s5[6],c5[6]);
ha e8(c4[9],c5[6],s5[7],c5[7]);

assign y[0]=pp1[0];
assign y[1]=pp1[1];
assign y[2]=s3[0];
assign y[3]=s3[1];
assign y[4]=s3[2];
assign y[5]=s4[0];
assign y[6]=s4[1];
assign y[7]=s4[2];
assign y[8]=s5[0];
assign y[9]=s5[1];
assign y[10]=s5[2];
assign y[11]=s5[3];
assign y[12]=s5[4];
assign y[13]=s5[5];
assign y[14]=s5[6];
assign y[15]=s5[7];
endmodule

module major_project(
    input [7:0] a,
    input [7:0] b,
    output [15:0] res
    );
    wire [8:0]pp1;
    wire [9:0]pp2;
    wire [7:0]pp3;
    wire [7:0]pp4;
    wire [7:0]pp5;
    wire [7:0]pp6;
    asm1 x1(a[0],a[1],b,pp1);
    asm2 x2(a[3],a[2],b,pp2);
    partialp x3(a[4],b,pp3);
    partialp x4(a[5],b,pp4);
    partialp x5(a[6],b,pp5);
    partialp x6(a[7],b,pp6);
    ppr red(pp1,pp2,pp3,pp4,pp5,pp6,res);
endmodule