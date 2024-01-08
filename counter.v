module counter (
    input wire reset,
    input wire clk,
    input wire [7:0] wdata,
    input wire wr,
    output reg [7:0] data,
    
    output [7:0] qa
   
);
always @ (posedge clk or posedge reset)
    begin
    
    qa = qa + 1;
        
    if (reset)
       data <= 8'h00;
         
    if(wr)
    begin
       data <= wdata;
       $display("written %h",wdata);
    end
    else
       data <= data + 8'h01;
      
      end
endmodule