module scl_generator
#(parameter HALF_PER_DIV_PARAM = 5)
(
    input clk,
    input reset,
    input enable,
    output reg scl
);
    
    logic [$clog2(HALF_PER_DIV_PARAM) - 1 : 0]counter;
    
    always_ff @(posedge clk or negedge reset) begin
        if(reset == '0 || enable == '0) begin
            counter <= '0;
            scl <= '0;
        end
        else if(enable == '1 && counter[$clog2(HALF_PER_DIV_PARAM) - 1 : 0] < HALF_PER_DIV_PARAM-1) begin
            counter <= counter + 1'b1;
        end else begin
            scl <= scl + 1'b1;
            counter <= 0;
        end
    end
    
endmodule
