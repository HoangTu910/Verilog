//Câu 1:Thiết kế mạch đếm lên/xuống theo mã BCD (0 đến 9) hiển thị ra LED 7 đoạn HEX0
//với tần số khoảng 1Hz được chia từ clock 50MHz, chân Up/Down được gán cho SW0.

module cau1(input CLOCK_50, output reg[6:0] HEX0,  input SW);
reg[25:0] counter;
reg[3:0] dem = 4'd0;
always @(posedge CLOCK_50)
	counter = counter + 1'b1;


always @(posedge counter[25])
	begin
		if(SW == 1 && dem == 4'd9)
			dem = 4'd0;
		else if(SW == 1 && dem != 4'd9)
			dem = dem + 1'b1;
		else if(SW == 0 && dem == 4'd0)
			dem = 4'd9;
		else	
			dem = dem - 1'b1;
		
		assign HEX0 = (dem == 4'b0000) ? 7'b0000001:
					  (dem == 4'b0001) ? 7'b1001111:
					  (dem == 4'b0010) ? ư:
					  (dem == 4'b0011) ? 7'b0000110:
					  (dem == 4'b0100) ? 7'b1001100:
					  (dem == 4'b0101) ? 7'b0100100:
					  (dem == 4'b0110) ? 7'b0100000:
					  (dem == 4'b0111) ? 7'b0001111:
					  (dem == 4'b1000) ? 7'b0000000:
					  (dem == 4'b1001) ? 7'b0000100:7'b1111111;
	end
endmodule
