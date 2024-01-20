//Câu 4:Thiết kế mạch dịch LED sử dụng 8 LED với xung clock khoảng 1Hz được chia từ
//clock 50Mhz, mỗi lần bấm và thả ngay KEY thì LED sẽ đứng yên, bấm và thả trong 3s
//LED sẽ dịch trái, bấm và thả trong 5s LED sẽ dịch phải.
module cau4(input CLOCK_50, input KEY, output reg [7:0] LEDR);
reg[25:0] counter;
reg[3:0] flag;
reg[3:0] t;
always @(posedge CLOCK_50) 
	counter = counter + 1'b1;
always @(posedge counter[25])
	if(KEY == 0)
		flag = flag + 1'b1;
	else
		flag = 0;
always @(posedge KEY)
	t = flag;
always @(posedge counter[25])
	begin
		if(LEDR == 0)
		LEDR = LEDR + 1'b1;
		else if(t<3)
		LEDR = LEDR;
		else if ((t>=3)&&(t<5))
		LEDR = {LEDR[6:0],LEDR[7]};//phai->trai
		else if (t>=5)
		LEDR = {LEDR[0], LEDR[7:1]};//trai->phai
	end
endmodule