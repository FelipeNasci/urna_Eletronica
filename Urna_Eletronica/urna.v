
`timescale 1ns/1ns

module urna (
reset,clock,botao0,
    HEX0);

    input reset;
    input clock;
    input botao0;
    //tri0 reset;
    //tri0 botao0;
    output HEX0;
    reg [6:0] HEX0;
    reg [6:0] reg_HEX0;
    reg [4:0] estado;
    reg [4:0] estado_atual;
	 
	 reg block ;
	 reg rst;
	 
	 reg init;
	 
    parameter Espera=0,Apura=1,Computa=2,Exibe=3,Verifica=4;

    initial begin 
		estado_atual <= Espera;
    end  

	 //Da erro se Colocar o reset aqui!
    always @(posedge clock) begin
			
			case (estado_atual)

					Espera: begin
						HEX0 <= 7'b1001111;//1
						
					end
					
					Verifica: begin
						HEX0 <= 7'b0010010;//2
					end
					
					 Apura: begin
						HEX0 <= 7'b0000110; // 3	
					 end
						
				endcase
    end
	 

	always @( negedge botao0 or  negedge reset) begin
		
		if(!reset)begin 
			estado_atual = Espera;
		end
		
		else begin 
		
				case (estado_atual)

					Espera: begin

						if (botao0 == 0) 
							estado_atual <= Verifica;
						else
							estado_atual <= Espera;
					 end
					 
					 Verifica: begin
					 
						if (botao0 == 0) 
							estado_atual <= Apura;
						else
							estado_atual <= Verifica;
					 end
					 
					 Apura: begin

						if (botao0 == 1'b0)
							estado_atual <= Espera;
						else
							estado_atual <= Apura;
						
					end
						
				endcase
		
		end

	end
	 
endmodule


