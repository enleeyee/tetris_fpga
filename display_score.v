`timescale 1ns / 1ps

module display_score(
clk,
rst_n,
col_addr_sig,
row_addr_sig,
score_out,
color_score_out  
  );
input clk;
input rst_n;
input[10:0] col_addr_sig;
input[10:0] row_addr_sig;
input[15:0] score_out;
output color_score_out;  

reg data;
reg[11:0] addra;
wire[15:0] data_n;
 
 
assign data_n[15] = 0;
assign data_n[14] = 0;

assign data_n[13] = 0;
assign data_n[12] = 0;
assign data_n[11] = 0;
assign data_n[10] = 0;
assign color_score_out = ~data;
reg[3:0] r1, r2, r3, r4;
always@(posedge clk or negedge rst_n)

begin
if(!rst_n)
begin
r1 <= 0;
r2 <= 0;
r3 <= 0;
r4 <= 0;
end
else
	begin
		r1 <= score_out[15:12];
		r2 <= score_out[11:8];
		r3 <= score_out[7:4];
		r4 <= score_out[3:0];
	end
end


always@(posedge clk or negedge rst_n)
if(!rst_n)
	begin
		addra <= 0;
		data <= 1;
	end
  
  else
	 begin
	 if(col_addr_sig >= 12'd40 && col_addr_sig < 12'd100 && row_addr_sig >= 12'd360 && row_addr_sig < 12'd420)
		begin
		addra <= (row_addr_sig-12'd360)*60+col_addr_sig-12'd40;
		data <= data_n[r1];
		end
	 else if(col_addr_sig >= 12'd100 && col_addr_sig < 12'd160 && row_addr_sig >= 12'd360 && row_addr_sig < 12'd420)
		begin
		addra <= (row_addr_sig - 12'd360) * 60 + col_addr_sig - 12'd100;
		data <= data_n[r2];
		end
	else if(col_addr_sig >= 12'd160 && col_addr_sig < 12'd220 && row_addr_sig >= 12'd360 && row_addr_sig < 12'd420)
		begin
		addra <= (row_addr_sig - 12'd360) * 60 + col_addr_sig - 12'd160;
		data <= data_n[r3];
		end
	else if(col_addr_sig >= 12'd220 && col_addr_sig < 12'd280 && row_addr_sig >= 12'd360 && row_addr_sig < 12'd420)
		begin
		addra <= (row_addr_sig - 12'd360) * 60 + col_addr_sig - 12'd220;
		data <= data_n[r4];
		end			
  	 else
		begin
		addra <= 0;
		data <= 1;
		end
	 end
endmodule
