module counter (
    input wire reset,
    input wire clk,
    input wire [7:0] wdata,
    input wire wr,
    output reg [7:0] data,
    
    output [7:0] qa
   
);
always @ (posedge clk or posedge reset)
    qa = qa + 1;
    
    if (reset)
       begin
       data <= 8'h00;
       end
  
    if(wr)
    begin
       data <= wdata;
       $display("written %h",wdata);
    end
   else
      begin
      data <= data + 8'h01;
      end
endmodule