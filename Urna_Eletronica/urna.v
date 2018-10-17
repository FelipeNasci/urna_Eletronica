module urna (clock, numero, confirma, reset, finaliza, hex0);

	input clock;
	input confirma;						//key0
	input reset;						//key1
	input finaliza;						//key2
	input [3:0] numero;					//switch
	
	output reg [6:0] hex0;				//display 7 seg
	
	reg [9:0] cand1 = 0, cand2 = 0;		//votos computados
	reg [3:0] estadoAtual = inicial;

	//Estados
	parameter inicial = 0, verifica = 1, exibeCandidato = 2, computaVoto = 3, exibeVencedor = 4;
	parameter numCand1 = 1, numCand2 = 2; 

	//Exibir Estado Atual
	always@(*) 
		
		begin
			case(estadoAtual)
				inicial: hex0 			<= 	7'b1000000; // 0 
				verifica: hex0 			<= 	7'b1111001; // 1 
				exibeCandidato: hex0 	<= 7'b0100100; // 2 
				computaVoto: hex0 		<= 7'b0110000; // 3 
				exibeVencedor: hex0 	<= 7'b0011001; // 4
		endcase
		
	end	


	always@(posedge clock or negedge reset or negedge finaliza   ) 
	
		begin

			if(~finaliza)
				estadoAtual <= exibeVencedor;
			if(~reset)
				estadoAtual <= inicial;
			
			else begin
			
				case(estadoAtual)
					inicial : 
							if (numero != 4'b0000) estadoAtual <= verifica;
					
					verifica: 
							if(numero == numCand1)
								estadoAtual <= exibeCandidato; 
							else if(numero == numCand2)
								estadoAtual <= exibeCandidato;
							else estadoAtual <= inicial;
							  
					exibeCandidato: 
							if(!confirma)
								estadoAtual <= computaVoto;
							else estadoAtual <= inicial;
									
					computaVoto: estadoAtual <= inicial;
					
				endcase
			end


		end
		


endmodule 
