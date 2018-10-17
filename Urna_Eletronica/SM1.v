
`timescale 1ns/1ns

module SM1 (
    reset,clock,botao0,
    HEX0);

    input reset;
    input clock;
    input botao0;
    tri0 reset;
    tri0 botao0;
    output HEX0;
    reg HEX0;
    reg reg_HEX0;
    reg [4:0] fstate;
    reg [4:0] reg_fstate;
    parameter Espera=0,Verifica=1,Apura=2,Computa=3,Exibe=4;

    initial
    begin
        reg_HEX0 <= 1'b0;
    end

    always @(posedge clock)
    begin
        if (clock) begin
            fstate <= reg_fstate;
        end
    end

    always @(fstate or reset or botao0 or reg_HEX0)
    begin
        if (reset) begin
            reg_fstate <= Espera;
            reg_HEX0 <= 1'b0;
            HEX0 <= 1'b0;
        end
        else begin
            reg_HEX0 <= 1'b0;
            HEX0 <= 1'b0;
            case (fstate)
                Espera: begin
                    if ((botao0 == 1'b0))
                        reg_fstate <= Verifica;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= Espera;

                    reg_HEX0 <= 1'b0;
                end
                Verifica: begin
                    if ((botao0 == 1'b0))
                        reg_fstate <= Exibe;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= Verifica;

                    reg_HEX0 <= 1'b1;
                end
                Apura: begin
                    if ((botao0 == 1'b0))
                        reg_fstate <= Espera;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= Apura;

                    reg_HEX0 <= 1'b1;
                end
                Computa: begin
                    if ((botao0 == 1'b0))
                        reg_fstate <= Apura;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= Computa;

                    reg_HEX0 <= 1'b1;
                end
                Exibe: begin
                    if ((botao0 == 1'b0))
                        reg_fstate <= Computa;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= Exibe;

                    reg_HEX0 <= 1'b1;
                end
                default: begin
                    reg_HEX0 <= 1'bx;
                    $display ("Reach undefined state");
                end
            endcase
            HEX0 <= reg_HEX0;
        end
    end
endmodule // SM1
