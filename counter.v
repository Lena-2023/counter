module counter (
    input wire reset,
    input wire clk,
    input wire [7:0]wdata,
    input wire wr,
    output reg [7:0]data,
    
    input [7:0] qa
   
);
always @ (posedge clk or posedge reset)
   
   qa = qa + 1;
    
    if (reset)
       data <= 8'h00;
    else
    if(wr)
    begin
       data <= wdata;
       $display("written %h",wdata);
    end
   else
      data <= data + 8'h01;
endmodule