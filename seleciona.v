module seleciona(num, clk, pressed, ledX, ledY, x, y, op);
	
	input clk;
	input [3:0] num;
	input pressed;
	output reg [0:6] x, y;
	output reg [0:1] op;
	output reg ledX;
	output reg ledY;
	reg selected;
	reg [6:0] numtot;
	
	reg [1:0] numcount;
	reg [1:0] estado;
	reg [3:0] des;
	reg [3:0] alg;
	
	initial begin
		x=0;
		y=0;
		if (num == 2'd15) begin
			selected = 1;
		end else begin
			selected = 0;
		end
	end
	
	always @(*) begin
		case(numcount) 
			2'd0:
				estado = 2'd0;
			2'd1:
				estado = 2'd1;
			2'd2:
				estado = 2'd2;
		endcase
	end
		
	always @(*) begin
		if(numcount > 1) begin
			numcount = 2'd0;
		end
	
		if(pressed == 1) begin
			numcount = numcount + 1;
		end
	end
	
	always @(*) begin
		case(estado)
			2'd0: begin
				if(numcount == 0) begin
					des = num;
				end
			end
			2'd1: begin
				if(numcount == 1) begin
					alg = num;
				end
			end
			2'd2: begin
				case (des)
					4'd0: begin
						case(alg)
							4'd0:
								numtot = 7'd0;
							4'd1:
								numtot = 7'd1;
							4'd2:
								numtot = 7'd2;
							4'd3:
								numtot = 7'd3;
							4'd4:
								numtot = 7'd4;
							4'd5:
								numtot = 7'd5;
							4'd6:
								numtot = 7'd6;
							4'd7:
								numtot = 7'd7;
							4'd8:
								numtot = 7'd8;
							4'd9:
								numtot = 7'd9;
						endcase
					end
					4'd1: begin
						case(alg)
							4'd0:
								numtot = 7'd10;
							4'd1:
								numtot = 7'd11;
							4'd2:
								numtot = 7'd12;
							4'd3:
								numtot = 7'd13;
							4'd4:
								numtot = 7'd14;
							4'd5:
								numtot = 7'd15;
							4'd6:
								numtot = 7'd16;
							4'd7:
								numtot = 7'd17;
							4'd8:
								numtot = 7'd18;
							4'd9:
								numtot = 7'd19;
						endcase
					end
					4'd2: begin
						case(alg)
							4'd0:
								numtot = 7'd20;
							4'd1:
								numtot = 7'd21;
							4'd2:
								numtot = 7'd22;
							4'd3:
								numtot = 7'd23;
							4'd4:
								numtot = 7'd24;
							4'd5:
								numtot = 7'd25;
							4'd6:
								numtot = 7'd26;
							4'd7:
								numtot = 7'd27;
							4'd8:
								numtot = 7'd28;
							4'd9:
								numtot = 7'd29;
						endcase
					end
					4'd3: begin
						case(alg)
							4'd0:
								numtot = 7'd30;
							4'd1:
								numtot = 7'd31;
							4'd2:
								numtot = 7'd32;
							4'd3:
								numtot = 7'd33;
							4'd4:
								numtot = 7'd34;
							4'd5:
								numtot = 7'd35;
							4'd6:
								numtot = 7'd36;
							4'd7:
								numtot = 7'd37;
							4'd8:
								numtot = 7'd38;
							4'd9:
								numtot = 7'd39;
						endcase
					end
					4'd4: begin
						case(alg)
							4'd0:
								numtot = 7'd40;
							4'd1:
								numtot = 7'd41;
							4'd2:
								numtot = 7'd42;
							4'd3:
								numtot = 7'd43;
							4'd4:
								numtot = 7'd44;
							4'd5:
								numtot = 7'd45;
							4'd6:
								numtot = 7'd46;
							4'd7:
								numtot = 7'd47;
							4'd8:
								numtot = 7'd48;
							4'd9:
								numtot = 7'd49;
						endcase
					end
					4'd5: begin
						case(alg)
							4'd0:
								numtot = 7'd50;
							4'd1:
								numtot = 7'd51;
							4'd2:
								numtot = 7'd52;
							4'd3:
								numtot = 7'd53;
							4'd4:
								numtot = 7'd54;
							4'd5:
								numtot = 7'd55;
							4'd6:
								numtot = 7'd56;
							4'd7:
								numtot = 7'd57;
							4'd8:
								numtot = 7'd58;
							4'd9:
								numtot = 7'd59;
						endcase
					end
					4'd6: begin
						case(alg)
							4'd0:
								numtot = 7'd60;
							4'd1:
								numtot = 7'd61;
							4'd2:
								numtot = 7'd62;
							4'd3:
								numtot = 7'd63;
							4'd4:
								numtot = 7'd64;
							4'd5:
								numtot = 7'd65;
							4'd6:
								numtot = 7'd66;
							4'd7:
								numtot = 7'd67;
							4'd8:
								numtot = 7'd68;
							4'd9:
								numtot = 7'd69;
						endcase
					end
					4'd7: begin
						case(alg)
							4'd0:
								numtot = 7'd70;
							4'd1:
								numtot = 7'd71;
							4'd2:
								numtot = 7'd72;
							4'd3:
								numtot = 7'd73;
							4'd4:
								numtot = 7'd74;
							4'd5:
								numtot = 7'd75;
							4'd6:
								numtot = 7'd76;
							4'd7:
								numtot = 7'd77;
							4'd8:
								numtot = 7'd78;
							4'd9:
								numtot = 7'd79;
						endcase
					end
					4'd8: begin
						case(alg)
							4'd0:
								numtot = 7'd80;
							4'd1:
								numtot = 7'd81;
							4'd2:
								numtot = 7'd82;
							4'd3:
								numtot = 7'd83;
							4'd4:
								numtot = 7'd84;
							4'd5:
								numtot = 7'd85;
							4'd6:
								numtot = 7'd86;
							4'd7:
								numtot = 7'd87;
							4'd8:
								numtot = 7'd88;
							4'd9:
								numtot = 7'd89;
						endcase
					end
					4'd9: begin
						case(alg)
							4'd0:
								numtot = 7'd90;
							4'd1:
								numtot = 7'd91;
							4'd2:
								numtot = 7'd92;
							4'd3:
								numtot = 7'd93;
							4'd4:
								numtot = 7'd94;
							4'd5:
								numtot = 7'd95;
							4'd6:
								numtot = 7'd96;
							4'd7:
								numtot = 7'd97;
							4'd8:
								numtot = 7'd98;
							4'd9:
								numtot = 7'd99;
						endcase
					end
					4'd10: begin
						op = 2'd1;
					end
					4'd11: begin
						op = 2'd2;
					end
					4'd12: begin
						op = 2'd3;
					end
					4'd13: begin
						op = 2'd0;
					end
					4'd14: begin
						selected = 0;
						ledX <= 1;
						ledY <= 0;
					end
					4'd15: begin
						selected = 1;
						ledY <= 1;
						ledX <= 0;
					end
				endcase
			end
		endcase
	end	
			
	always @(*) begin
		if (selected == 0) begin
			x = numtot;
		end else if (selected == 1) begin
			y = numtot;
		end
	end
	
endmodule