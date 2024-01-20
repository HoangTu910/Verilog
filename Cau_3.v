Câu 3: Thiết kế mạch dịch led sử dụng 8 LED, LED sẽ chạy từ trái qua phải và dội lại từ
phải qua trái với xung clock khoảng 1Hz được chia từ clock 50Mhz.

module cau3(input CLOCK_50, output reg[7:0] LEDR)
reg[25:0] counter;

always @(posedge CLOCK_50)
	counter = counter + 1'b1;
	wire flag;


always @(posedge counter[25])
	begin
		if(LEDR == 0)
			LEDR = 7'b10000000;
		else if(flag == 1'b1)
			LEDR = {LEDR[0], LEDR[7:1]};
		else	
			LEDR = {LEDR[6:0], LEDR[7]};
	end


always @(posedge (posedge counter[24]))
	begin
		if(LEDR == 7'b10000000)
			flag = 1'b1;
		else	
			flag = 1'b0;
	end
endmodule
