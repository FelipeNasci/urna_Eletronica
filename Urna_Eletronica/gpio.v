module gpio(

	output reg buzzer
);
    //reg buzzer;
	parameter GND = 0;
    
	always @(buzzer) begin
    	if (~buzzer) begin
        		buzzer <= 1'b1;          // Buzzer sound on
    	end 
else begin
        		buzzer <= 1'b0;        	// Buzzer sound off
    	end
	end
    
endmodule


