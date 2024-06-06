`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2024 00:35:29
// Design Name: 
// Module Name: spi_tb
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


module spi_tb
#(
    localparam DATA_WIDTH = 10
)();

    logic clk;

    always begin
        #5;
        clk = ~clk;
    end
    
    wire mosi, scl;
    logic csx, dcx, wr, reset;
    logic [DATA_WIDTH-1:0] data_i;

    spi dut(
        .clk(clk),
        .mosi(mosi),
        .scl(scl),
        .csx(csx),
        .dcx(dsx),
        .wr(wr),
        .data_i(data_i),
        .reset(reset)
    );
    
    specify
        specparam hold=30ns, setup=30ns;
        $setup(mosi, posedge scl, setup);
        $hold(posedge scl, mosi, hold);
    endspecify
    
    initial begin
        data_i <= '0;
        wr <= 0;
        clk <= 0;
        reset <= 0;
        #50;
        reset <= 1;
        #50;
    end
    

endmodule
