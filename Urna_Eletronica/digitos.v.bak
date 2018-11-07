module digitos(key1,key2,hex1,hex2,bcd1,bcd2);
	input key1,key2;
	output reg [6:0] hex1,hex2;
	reg [3:0]d1,d2;
	output reg [3:0] bcd1,bcd2;
	
initial begin
	d2<=0;
	d1<=0;
	end
	
	function [6:0] display;
		input [3:0] bcd;
		reg   [6:0] segmentos;
	begin
	case (bcd)
		0: segmentos = 7'b1000000;	//gfedcba 
		1: segmentos = 7'b1111001;
		2: segmentos = 7'b0100100;
		3: segmentos = 7'b0110000;
		4: segmentos = 7'b0011001;
		5: segmentos = 7'b0010010;
		6: segmentos = 7'b0000010;
		7: segmentos = 7'b1111000;
		8: segmentos = 7'b0000000; 
		9: segmentos = 7'b0010000;
		default: segmentos = 7'bx;
		endcase	
	display = segmentos;
	end	
	endfunction
	
always@(negedge key1) begin 
		d1<=d1+1;
		if(d1>9-1) 
			d1<=0;		
end	

always@(negedge key2) begin 		
		d2<=d2+1;
		if(d2>9-1) 
			d2<=0;	
end

always @(*) begin
	bcd1<=d1;
	bcd2<=d2;
end	

always@(bcd1)	begin
	hex1= display(bcd1);
end
always@(bcd2)	begin
	hex2= display(bcd2);
end	



endmodule

