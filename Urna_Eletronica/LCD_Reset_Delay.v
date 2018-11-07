/* Este modulo foi alterado para receber um novo sinal de entrada, chamado FORCE_RESET. Este novo sinal tem por objetivo forcar o modulo
 * a repetir o processo realizado assim que o modulo eh instanciado, ou seja, colocar '0' na saida, aguardar alguns milissegundos e depois
 * colocar '1' de volta na saida. Essa saida eh utilizada para resetar o LCD (o LCD eh resetado toda vez que esse sinal faz uma transicao
 * negativa.
 */

module LCD_Reset_Delay( input iCLK, input FORCE_RESET, output reg oRESET);
reg    [19:0]    Cont = 0;

always@(posedge iCLK, negedge FORCE_RESET)
begin
    if (!FORCE_RESET) Cont <= 0; else begin //Se FORCE_RESET for ativado (a ativacao eh feita quando o FORCE_RESET estiver no nivel '0'),
	                                         //reiniciar o contador para que a saida do modulo fique um pequeno intervalo no nivel '0', antes de
														  //voltar pro nivel '1'
		 if(Cont!=20'hFFFFF)
		 begin
			  Cont    <=    Cont + 1'b1;
			  oRESET    <=    1'b0;
		 end
		 else
		 oRESET    <=    1'b1;
	 end
end

endmodule
