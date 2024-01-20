//Câu 5: Thiết kế mạch dịch LED sử dụng 8 LED xanh với clock khoảng 1Hz được chia từ
//clock 50Mhz sao cho 2 LED chạy từ ngoài vào giữa.
module cau5(CLOCK_50,LEDR);
input CLOCK_50;
output reg [7:0] LEDR;
reg [25:0] counter;
always @(posedge CLOCK_50)
	counter = counter + 1'b1;
always @(posedge counter[25])
	if(LEDR==8'b0)
		LEDR= 8'b10000001;
	else
		LEDR={LEDR[4],LEDR[7:5],LEDR[2:0],LEDR[3]};
endmodule