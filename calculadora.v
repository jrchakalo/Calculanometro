module calculadora (x, y, op, clk, result, signal);
	
	input clk;
	input [6:0] x, y;
	input [1:0] op;
	output reg signal;
	output reg [13:0] result;
	
	reg [1:0] estado;
	parameter esp = 2'd0,  sum = 2'd1, sub = 2'd2, mult = 2'd3;
	
	
	initial begin
		estado = esp;
		result = 14'd0;
		signal = 0;
	end
	
	always @(posedge clk) begin	
		case(op) 
			esp:
				estado <= esp;
			sum:
				estado <= sum;
			sub:
				estado <= sub;
			mult:
				estado <= mult;
		endcase
	end
	
	always @(*) begin
		case(op) 
			esp: begin
				result <= 0;
				signal <= 0;
			end
			sum: begin
				result <= x+y;
				signal <= 0;
			end
			sub: begin
				if(y > x) begin
					result <= y-x;
					signal <= 1;
				end else begin
					result <= x-y;
					signal <= 0;
				end
			end
			mult: begin
				result <= x*y;
				signal <= 0;
			end
		endcase
	end
endmodule
	
	
				