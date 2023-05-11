module scanner(
input clk,
input [3:0] col,
output reg [3:0] line,
output reg pressed,
output wire [3:0] place
);

initial pressed = 0;
initial line <= 4'b1111;

reg [3:0] tecla = 0;
initial tecla = 0;
assign place = tecla;

reg[3:0] linha = 0;
reg[3:0] coluna = 0;

reg [18:0] clk_counter = 0;
parameter milisec = 520000;
parameter miliDebounce = 2125000;

reg[3:0] lineState = 4'b1111;

parameter L0 = 4'b1111;
parameter L1 = 4'b0111;
parameter L2 = 4'b1011;
parameter L3 = 4'b1101;
parameter L4 = 4'b1110;
parameter L5 = 4'd10;


reg[1:0] colState = 0;

always@(posedge clk)begin
	
	if(col != 4'b0000) begin
			case(lineState)
				L0 : begin
						line <= L0;
						lineState <= L1;
					end
				L1 : begin	
						clk_counter <= 0;
						line <= L1; 
						
						if(clk_counter == milisec)
							lineState <= L2;
						else begin
						
						if(line == L1) begin
							if(col == L1) begin		
								linha <= 4'd1;
								coluna <= 4'd1;
								tecla <= 4'd1;									
							end
							else if(col == L2) begin
								linha <= 4'd1;
								coluna <= 4'd2;
								tecla <= 4'd2; 									
							end
							else if(col == L3) begin								
								linha <= 4'd1;
								coluna <= 4'd3;
								tecla <= 4'd3;						
							end
							else if(col == L4) begin								
								linha <= 4'd1;
								coluna <= 4'd4;
								tecla <= 4'd10;
							end
						end
						
							clk_counter <= clk_counter + 1;
						end
						
					end
				L2: begin
						clk_counter <= 0;
						line <= L2;
						
						if(clk_counter == milisec) begin
							lineState <= L3;
							end
						else begin
						
							if(line == L2) begin
							
								if(col == L1) begin
									linha <= 4'd2;
									coluna <= 4'd1;
									tecla <= 4'd4; end
								else if(col == L2) begin
									linha <= 4'd2;
									coluna <= 4'd2;
									tecla <= 4'd5; end
								else if(col == L3) begin
									linha <= 4'd2;
									coluna <= 4'd3;
									tecla <= 4'd6; end
								else if(col == L4) begin
									linha <= 4'd2;
									coluna <= 4'd4;
									tecla <= 4'd11; end									
							end
							clk_counter <= clk_counter + 1;
						end						
				end
				L3: begin
						clk_counter <= 0;
						line <= L3;
						
						if(clk_counter == milisec) begin
							lineState <= L4;
							end
						else begin
						
							if(line == L3) begin
							
								if(col == L1) begin
									linha <= 4'd3;
									coluna <= 4'd1;
									tecla <= 4'd7; end
								else if(col == L2) begin
									linha <= 4'd3;
									coluna <= 4'd2;
									tecla <= 4'd8; end
								else if(col == L3) begin
									linha <= 4'd3;
									coluna <= 4'd3;
									tecla <= 4'd9; end
								else if(col == L4) begin
									linha <= 4'd3;
									coluna <= 4'd4;
									tecla <= 4'd12; end									
							end
							clk_counter <= clk_counter + 1;
						end						
				end
				L4: begin
						clk_counter <= 0;
						line <= L4;
						
						if(clk_counter == milisec) begin
							lineState <= L5;
							end
						else begin
						
							if(line == L4) begin
							
								if(col == L1) begin
									linha <= 4'd4;
									coluna <= 4'd1;
									tecla <= 4'd14; end
								else if(col == L2) begin
									linha <= 4'd4;
									coluna <= 4'd2;
									tecla <= 4'd0; end
								else if(col == L3) begin
									linha <= 4'd4;
									coluna <= 4'd3;
									tecla <= 4'd15; end
								else if(col == L4) begin
									linha <= 4'd4;
									coluna <= 4'd4;
									tecla <= 4'd13; end									
							end
							clk_counter <= clk_counter + 1;
						end						
				end
				L5: begin
					clk_counter <= 0;
					if(clk_counter == milisec) 
						lineState <= L0;
					else
						clk_counter <= clk_counter + 1;
				end
				
				
			endcase
			
		end
				
end

reg [31:0] debounce = 0;

always@(posedge clk) begin
	if(col == 4'b1110) begin
			debounce <= 0;
			if(debounce < miliDebounce)
				debounce <= debounce + 1;
			else
				pressed <= 1;				
		end
	else if(col == 4'b1101) begin
			debounce <= 0;
			if(debounce < miliDebounce)
				debounce <= debounce + 1;
			else
				pressed <= 1;		
	end
	else if(col == 4'b1011) begin
			debounce <= 0;
			if(debounce < miliDebounce)
				debounce <= debounce + 1;
			else
				pressed <= 1;	
		end	
	else if(col == 4'b0111) begin
			debounce <= 0;
			if(debounce < miliDebounce)
				debounce <= debounce + 1;
			else
				pressed <= 1;		
		
	end
	else if(col == 4'b1110) begin
			debounce <= 0;
			if(debounce < miliDebounce)
				debounce <= debounce + 1;
			else
				pressed <= 1;		
	end
	else begin
		debounce <= 0;
			if(debounce < miliDebounce)
				debounce <= debounce + 1;
			else
				pressed <= 0;
	end
end
endmodule