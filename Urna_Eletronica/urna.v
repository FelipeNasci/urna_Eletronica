
`timescale 1ns/1ns

module urna (
    reset,clock,botao0,
    HEX0);

    input reset;
    input clock;
    input botao0;
    tri0 reset;
    tri0 botao0;
	 
    output reg [6:0] HEX0;
    reg reg_HEX0;
    reg [4:0] estado;
    reg [4:0] estado_atual;
	 
	 //estados
    parameter Espera=0,Verifica=1,Apura=2,Computa=3,Exibe=4;

    initial
    begin
			HEX0 <= 7'b0000001; //0
        //reg_HEX0 <= 1'b0;
    end

    always @(posedge clock)
    begin
        if (clock) begin
            estado <= estado_atual;
        end
    end

    always @(estado or reset or botao0 or HEX0)
    begin
        if (!reset) begin
            estado_atual <= Espera;
            //reg_HEX0 <= 1'b0;
            HEX0 <= 7'b0000001; //0
        end
        else begin
            //reg_HEX0 <= 1'b0;
            HEX0 <= 7'b0000001; //0
            case (estado)
                Espera: begin
					 
					 HEX0 <= 7'b0000110; //E
                    if ((botao0 == 1'b0))
                        estado_atual <= Verifica;
                    // Inserting 'else' block to prevent latch inference
                    else
                        estado_atual <= Espera;

                    //reg_HEX0 <= 1'b0;
                end
                Verifica: begin
					 HEX0 <= 7'b1111001; //1
                    if ((botao0 == 1'b0))
                        estado_atual <= Exibe;
                    // Inserting 'else' block to prevent latch inference
                    else
                        estado_atual <= Verifica;

                    //reg_HEX0 <= 1'b1;
                end
                Apura: begin
					 HEX0 <= 7'b0100100; //2
                    if ((botao0 == 1'b0))
                        estado_atual <= Espera;
                    // Inserting 'else' block to prevent latch inference
                    else
                        estado_atual <= Apura;

                    //reg_HEX0 <= 1'b1;
                end
                Computa: begin
					 HEX0 <= 7'b0110000; //3
                    if ((botao0 == 1'b0))
                        estado_atual <= Apura;
                    // Inserting 'else' block to prevent latch inference
                    else
                        estado_atual <= Computa;

                    //reg_HEX0 <= 1'b1;
                end
                Exibe: begin
					 HEX0 <= 7'b0011000; //4
                    if ((botao0 == 1'b0))
                        estado_atual <= Computa;
                    // Inserting 'else' block to prevent latch inference
                    else
                        estado_atual <= Exibe;

                    //reg_HEX0 <= 1'b1;
                end
                default: begin
							HEX0 <= 7'b0000001; //0
                    //reg_HEX0 <= 1'bx;
                    $display ("Reach undefined state");
                end
            endcase
            //HEX0 <= reg_HEX0;
        end
    end
endmodule // SM1
