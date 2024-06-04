//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2024 11:30:32
// Design Name: 
// Module Name: spi
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

module spi(
    input clk,
    
    input miso,
    output mosi,
    output scl,
    output csx,
    
    input wr,
    input data_i[7:0],
    
    input rd,
    output data_o[7:0],
    
    input reset
);

    always_ff @(posedge clk or negedge reset) begin
        
    end
    
    always_comb begin
        
    end
    
endmodule
