
module maqCro(
input clk, 
input [3:0] place,
output reg [3:0] counter_Dezenas, 
output reg [9:0] segundos
);

initial begin counter_Dezenas = 0; end
initial begin segundos = 0; end

reg[3:0] Dez_temp = 0;
reg[9:0] seg_temp = 0;

reg[2:0] estCon = 0;

  parameter inicio = 3'b000;
  parameter zerar = 3'b001;
  parameter retomar = 3'b010;
  parameter congelar = 3'b011;
  parameter parar = 3'b100;
  
  parameter A = 4'd10;
  parameter B = 4'd11;
  parameter C = 4'd12;
  parameter D = 4'd13;

reg [31:0] clk_counter = 0;
parameter Decsec = 5000000;

always @(posedge clk) begin
	if(place < A) begin
		estCon = inicio;
	end

	case(estCon)
		inicio : begin
			if(place == A)
          			estCon = zerar;
        		else if(place == B) 
          			estCon = retomar;
        		else if(place == C)
          			estCon = congelar;
        		else if(place == D)
          			estCon = parar;
		end
		zerar: begin
			if(place == A) begin
				Dez_temp = 4'd0;
				seg_temp = 4'd0;
				
				counter_Dezenas = 4'd0;
				segundos = 4'd0;
			end
			else
				estCon = inicio;
		end
		retomar: begin
		
			if(place == B) begin
					
				if (clk_counter == Decsec) begin
					Dez_temp <= Dez_temp + 1;
					clk_counter <= 0; 
					if (Dez_temp == 10) begin 
						Dez_temp <= 0; 
						seg_temp <= seg_temp +1;
					end			
					counter_Dezenas <= Dez_temp;
					segundos <= seg_temp;
				end
			else begin
				clk_counter <= clk_counter + 1;
			end
			end
			
			else
				estCon = inicio;
		end
		congelar: begin
			if(place == C) begin
				
				if (clk_counter == Decsec) begin
					Dez_temp <= Dez_temp + 1;
					clk_counter <= 0; 
					if (Dez_temp == 10) begin 
						Dez_temp <= 0; 
						seg_temp <= seg_temp +1;
					end			
				end
				else begin
				clk_counter <= clk_counter + 1;
				end
			end
				
			else
				estCon = inicio;
		end
		parar: begin
			if(place == D) begin
				counter_Dezenas <= Dez_temp;
				segundos <= seg_temp;
			end
			else
				estCon = inicio;
		end
	endcase
end

endmodule