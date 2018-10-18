module chamaDig();
reg key1,key2;
	wire [6:0] hex1,hex2;
	wire [3:0] bcd1;
	wire teste;
	wire [3:0]d3;
	digitos chamado(.key1(key1),.key2(key2),.hex1(hex1),.hex2(hex2),.bcd1(bcd1),.teste(teste),.d3(d3));


endmodule 