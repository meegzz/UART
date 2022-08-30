//  AUTHOR: Mohamed Maged Elkholy.
//  INFO.: Undergraduate ECE student, Alexandria university, Egypt.
//  AUTHOR'S EMAIL: majiidd17@icloud.com
//  FILE NAME: BaudTest.v
//  TYPE: Test fixture "Test bench".
//  DATE: 31/8/2022
//  KEYWORDS: Baud Rate, Clock Generator.

`timescale 1ns/1ps
module BaudTest;

//  Regs to drive inputs
reg reset_n;
reg clock;
reg [1:0] baud_rate;

//  wires to show outputs
wire baud_clk;

//  Instance of the design module
Sampling ForTest(
    .reset_n(reset_n),
    .clock(clock),
    .baud_rate(baud_rate),
    
    .baud_clk(baud_clk)
);

//  System's Clock 50MHz
initial
begin
    Clock = 1'b0;
    forever #10 Clock = ~Clock;
end

//  Resetting the system
initial 
begin
    reset_n = 1'b0;
    #100  reset_n = 1'b1;
end

//  Test
integer i = 0;
initial 
begin
    for (i = 0; i < 4; i = i +1) 
    begin
        baud_rate = i;
        #(3000000/(i+1));
    end
end

endmodule