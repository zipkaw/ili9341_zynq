`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2024 23:57:10
// Design Name: 
// Module Name: scl_generator_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module scl_generator_tb();
    
    logic clk;
    logic reset;
    wire scl;
    logic enable;
    time neg_scl, pos_scl;
    always begin
        #5;
        clk = ~clk;
    end
    
    scl_generator dut(
        .clk(clk),
        .reset(reset),
        .scl(scl),
        .enable(enable)
    );
    
    initial begin
        neg_scl = $time;
        pos_scl = $time;
        clk <= 0;
        reset <= 0;
        enable <= 1;
        #50;
        reset <= 1;
        enable <= 1;
        #500;
        enable <= 0;
        #200;
        enable <= 1;
    end
    
    specify
        specparam L_H_W_Delay = 40ns;
        $width(negedge scl, L_H_W_Delay);
        $width(posedge scl, L_H_W_Delay);
    endspecify
    
endmodule
