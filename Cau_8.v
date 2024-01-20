//Câu 8: Thiết kế mạch hiển thị chữ “HI” dịch từ trái qua phải ở 6 LED 7 đoạn (từ HEX0
//đến HEX5), xung clock khoảng 1Hz được chia từ clock 50Mhz.
module Cau8(input CLOCK_50, output reg [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
reg [25:0] counter;
reg [2:0] X = 3'b000;
always @(posedge CLOCK_50)
	counter = counter + 1'b1;
always @(posedge counter[25])
begin
	if(X < 3'b101)
		X = X + 3'b001;
	else
		X = 3'b000;
end
always @(posedge counter[25])
begin
	if (X == 3'b000)
	begin
		HEX5 <= 7'b1001000;//chu H
		HEX4 <= 7'b1111001;//chu I
		HEX3 <= 7'b1111111;//tat
		HEX2 <= 7'b1111111;//tat
		HEX1 <= 7'b1111111;//tat
		HEX0 <= 7'b1111111;//tat
	end
	else if (X == 3'b001)
	begin
		HEX5 <= 7'b1111111;//tat
		HEX4 <= 7'b1001000;//chu H
		HEX3 <= 7'b1111001;//chu I
		HEX2 <= 7'b1111111;//tat
		HEX1 <= 7'b1111111;//tat
		HEX0 <= 7'b1111111;//tat
	end
	else if (X == 3'b010)
	begin
		HEX5 <= 7'b1111111;//tat
		HEX4 <= 7'b1111111;//tat
		HEX3 <= 7'b1001000;//chu H
		HEX2 <= 7'b1111001;//chu I
		HEX1 <= 7'b1111111;//tat
		HEX0 <= 7'b1111111;//tat
	end
	else if (X == 3'b011)
	begin
		HEX5 <= 7'b1111111;//tat
		HEX4 <= 7'b1111111;//tat
		HEX3 <= 7'b1111111;//tat
		HEX2 <= 7'b1001000;//chu H
		HEX1 <= 7'b1111001;//chu I
		HEX0 <= 7'b1111111;//tat
	end
	else if (X == 3'b100)
	begin
		HEX5 <= 7'b1111111;//tat
		HEX4 <= 7'b1111111;//tat
		HEX3 <= 7'b1111111;//tat
		HEX2 <= 7'b1111111;//tat
		HEX1 <= 7'b1001000;//chu H
		HEX0 <= 7'b1111001;//chu I
	end
	else
	begin
		HEX5 <= 7'b1111001;//chu I
		HEX4 <= 7'b1111111;//tat
		HEX3 <= 7'b1111111;//tat
		HEX2 <= 7'b1111111;//tat
		HEX1 <= 7'b1111111;//tat
		HEX0 <= 7'b1001000;//chu H
	end
end
endmodule