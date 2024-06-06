`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2024 23:33:49
// Design Name: 
// Module Name: scl_generator
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

module scl_generator
#(parameter DIV_PARAM = 8)
(
    input clk,
    input reset,
    input enable,
    output reg scl
);
    
    logic [$clog2(DIV_PARAM) - 1 : 0]counter;
    
    always_ff @(posedge clk or negedge reset) begin
        if(reset == '0 || enable == '0) begin
            counter <= '0;
        end
        else if(enable == '1)begin
            counter <= counter + 1'b1;
        end
    end
    
    always_comb begin
        if(reset == '0) begin
            scl <= '0;
        end
        if(counter == '1 && enable == '1) begin
           scl <= scl + 1'b1;
        end
    end
    
endmodule
