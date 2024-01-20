//Câu 6. Thiết kế mạch hiển thị chữ “HELLO” lên 5 LED 7 đoạn với 2 ngõ vào được gánvới 
//switch, sao cho nếu switch = 2’b00 thì chữ “HELLO” nhấp nháy với tần số khoảng 1Hz, switch 
//= 2’b01 thì khoảng 2 Hz, switch = 2’b10 thì khoảng 4 Hz và switch = 2’b11thì khoảng 8 Hz. 
//Clock được lấy từ xung clock 50MHz.
module cau6(input [1:0] SW, input CLOCK_50, output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4);
reg [25:0] counter;
wire mode;
always @(posedge CLOCK_50) 
	counter = counter + 1'b1;
	assign mode = (SW == 2'b00)? counter[25]:
				  (SW == 2'b01)? counter[24]:
				  (SW == 2'b10)? counter[23]:counter[22];
	assign HEX0 = (mode)? 7'b0000001:7'b1111111; //O
	assign HEX1 = (mode)? 7'b1110001:7'b1111111; //L
	assign HEX2 = (mode)? 7'b1110001:7'b1111111; //L 
	assign HEX3 = (mode)? 7'b0110000:7'b1111111; //E
	assign HEX4 = (mode)? 7'b1001000:7'b1111111; //H
endmodule
