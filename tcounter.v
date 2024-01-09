module test_counter;

reg reset, clk, wr;
reg [7:0]wdata;
wire [7:0] data_cnt;
reg [7:0] qa;

//������������� ��������� ������������ ������
counter counter_inst(reset, clk, wdata, wr, data_cnt, qa);

//���������� ������ �������� �������
always
  #10 clk = ~clk;

//�� ������ �������...

initial
begin
  clk = 0;
  reset = 0;
  wdata = 8'h00;
  wr = 1'b0;
  qa = 1;

//����� ��������� �������� "50" ������ ������ ������
  #50 reset = 1;

//��� ����� ����� "4" ������� ������ ������

  #4 reset = 0;

//����� ������������� "50"
  #50;

//���� ������ �������� ������� � ����� ����� ��� ������ ������ ������
  @(posedge clk)
  #0
    begin
      wdata = 8'h55;
      wr = 1'b1;
      qa = qa+1;
    end

//�� ���������� ������ ������� ������ ������
  @(posedge clk)
  #0
    begin
      wdata = 8'h00;
      wr = 1'b0;
    end
end

//����������� ��������� � ������ ������� "400"
initial
begin
  #400 $finish;
end

//������� ���� VCD ��� ������������ ������� ��������
initial
begin
  $dumpfile("out.vcd");
  $dumpvars(0,test_counter);
end

//��������� �� ���������� ��������� �������
initial
$monitor($stime,, reset,, clk,, wdata,, wr,, data_cnt,, qa);

endmodule