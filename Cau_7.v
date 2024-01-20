//Câu 7: Thiết kế mạch đổi từ số nhị phân 9 bit (lấy từ switch) thành số thập phân hiển thị lên 
//HEX2, HEX1 và HEX0.
module cau7 (SW, HEX0, HEX1, HEX2);
input [8:0] SW;
output [0:6] HEX0, HEX1, HEX2;
wire [3:0] donvi, chuc, tram;
assign donvi = SW%4'd10;
assign chuc = (SW/4'd10)%4'd10;
assign tram = ((SW/4'd10)/4'd10);
assign HEX0 = 	(donvi == 4'b0000) ? 7'b0000001://0
				(donvi == 4'b0001) ? 7'b1001111://1
				(donvi == 4'b0010) ? 7'b0010010://2
				(donvi == 4'b0011) ? 7'b0000110://3
				(donvi == 4'b0100) ? 7'b1001100://4
				(donvi == 4'b0101) ? 7'b0100100://5
				(donvi == 4'b0110) ? 7'b0100000://6
				(donvi == 4'b0111) ? 7'b0001111://7
				(donvi == 4'b1000) ? 7'b0000000:7'b0000100;//8 ->9
				
assign HEX1 = 	(chuc == 4'b0000) ? 7'b0000001://0
				(chuc == 4'b0001) ? 7'b1001111://1
				(chuc == 4'b0010) ? 7'b0010010://2
				(chuc == 4'b0011) ? 7'b0000110://3
				(chuc == 4'b0100) ? 7'b1001100://4
				(chuc == 4'b0101) ? 7'b0100100://5
				(chuc == 4'b0110) ? 7'b0100000://6
				(chuc == 4'b0111) ? 7'b0001111://7
				(chuc == 4'b1000) ? 7'b0000000:7'b0000100;//8 ->9
				
assign HEX2 = 	(tram == 4'b0000) ? 7'b0000001://0
				(tram == 4'b0001) ? 7'b1001111://1
				(tram == 4'b0010) ? 7'b0010010://2
				(tram == 4'b0011) ? 7'b0000110://3
				(tram == 4'b0100) ? 7'b1001100://4
				(tram == 4'b0101) ? 7'b0100100://5
				(tram == 4'b0110) ? 7'b0100000://6
				(tram == 4'b0111) ? 7'b0001111://7
				(tram == 4'b1000) ? 7'b0000000:7'b0000100;//8 ->9
endmodule