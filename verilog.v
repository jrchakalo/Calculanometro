module verilog(clk, col, line, pressed, ledX, ledY, hex_decimos, hex_uni, hex_dez, hex_cen, hex_x1, hex_x2, hex_y1, hex_y2);	
	
	input clk;
	input [3:0] col;
	output wire [3:0] line;
	wire [3:0] num;
	output wire pressed;
	output reg ledX;
	output reg ledY;
	
	output wire [0:6] hex_x1, hex_x2, hex_y1, hex_y2;
	output wire [0:6] hex_decimos, hex_uni;
	output wire [0:6] hex_dez, hex_cen;
	
	wire [3:0] dez;
	wire [9:0] seg;
	
	reg [3:0] num0;
	reg [3:0] num1;
	reg [3:0] num2;
	reg [3:0] num3;
	
	reg [3:0] x1;
	reg [3:0] x2;
	reg [3:0] y1;
	reg [3:0] y2;
	
	wire [6:0] x;
	wire [6:0] y;
	wire [1:0] op;
	
	wire led1;
	wire led2;
	
	wire [13:0] result;
	wire signal;
	
	reg [3:0] incro;
	reg funcao;
	
	scanner(clk, col, line, pressed, num);
	
	maqCro(clk, incro, dez, seg);
	
	seleciona(num, clk, pressed, led1, led2, x, y, op);
	
	calculadora(x, y, op, clk, result, signal);
	
	always @(*) begin
		case(funcao)
			0: begin
				x1 <= 15;
				x2 <= 15;
				y1 <= 15;
				y2 <= 15;
				
				num0 <= dez % 10;
				num1 <= seg% 10;
				num2 <= (seg/10) % 10;
				num3 <= (seg/100) % 10;
				
				
				if (num == 4'd12) begin
					funcao <= 0;
				end
				if (num == 4'd14) begin
					funcao <= 1;
				end else if (num == 4'd15) begin
					funcao <= 1;
				end else begin
					funcao <= 0;
				end		
				
				incro <= num;
			end
			1: begin
				x1 <= x % 10;
				x2 <= x / 10;
				y1 <= y % 10;
				y2 <= y / 10;
			
				num0 <= result % 10;
				num1 <= (result/10) % 10;
				if (signal) begin
					num2 <= 4'd14;
				end else begin
					num2 <= (result/100) % 10;
				end
				if (signal) begin
					num3 <= 4'd15;
				end else begin
					num3 <= (result/1000) % 10;
				end
				
				if (num == 4'd13) begin
					funcao <= 0;
				end
				
				ledX = led1;
				ledY = led2;
			end
		endcase
	end
	
	display(x1, hex_x1);
	display(x2, hex_x2);
	display(y2, hex_y1);
	display(y1, hex_y2);
	
	display(num0, hex_decimos);
	display(num1, hex_uni);
	display(num2, hex_dez);
	display(num3, hex_cen);

endmodule

	
