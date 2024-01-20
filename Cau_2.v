//Câu 2: Thiết kế mạch cộng 2 số 4 bit (sử dụng các switch làm ngõ vào) hiển thị ra led 7
//đoạn HEX1, HEX0 dưới dạng số thập phân.
	
module cau2(input [7:0] SW,output reg [0:6] HEX0,HEX1);
reg [4:0] donvi,chuc;
reg [6:0] sum;
always @(*)
	begin
		sum = SW[7:4] + SW[3:0];
		donvi= sum % 4'd10;
		chuc= sum / 4'd10;	
		case(donvi)
			0: HEX0=7'b0000001;
			1: HEX0=7'b1001111;
			2: HEX0=7'b0010010;
			3: HEX0=7'b0000110;
			4: HEX0=7'b1001100;
			5: HEX0=7'b0100100;
			6: HEX0=7'b0100000;
			7: HEX0=7'b0001111;
			8: HEX0=7'b0000000;
			9: HEX0=7'b0000100;
			default: HEX0=7'b1111111;
		endcase
		case(chuc)
			0: HEX1=7'b0000001;
			1: HEX1=7'b1001111;
			2: HEX1=7'b0010010;
			3: HEX1=7'b0000110; 
			default: HEX1=7'b1111111;
		endcase
	end
endmodule