module major_tb();
reg [7:0]a;
reg [7:0]b;
wire [15:0]y;
integer i;
integer s;
major_project dut(a,b,y);
initial
begin
s = $fopen("PAM.txt","w");
for(i = 0; i< 65536;i = i+1) 
begin
{a,b} = i;
$monitor ("a =%b,b = %b, y= %d",a,b,y);
#100;
$fdisplay(s,y);
end
$fclose(s);
$finish;
end
endmodule