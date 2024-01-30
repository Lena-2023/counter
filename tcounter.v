module testbench;

reg clk;
reg reset;

wire [7:0] triangl;
wire [7:0] saw;
wire [7:0] revsaw;
wire [7:0] meander;
wire [7:0] meander025;

counter cnt1(.clk(clk), .reset(reset), .saw(saw), .revsaw(revsaw), .triangl(triangl), .meander(meander), .meander025(meander025));

initial
begin
    $dumpfile("bench.vcd");
    $dumpvars(0,testbench);

    $display("starting testbench!!!!");
    
    $monitor(reset,, clk,, saw,, revsaw,, triangl,, meander,, meander025);
  
        clk <= 0; 
        repeat (3000) 
            
        begin
                #10;
                clk <= 1;
                #10;
                clk <= 0; 
        end


    $display("finished OK!");
    //$finish;
end

initial
begin
  reset <= 1;
  #100;
  reset <= 0;
end

endmodule