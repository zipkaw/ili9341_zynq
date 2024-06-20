module fifo
    #(
         parameter  DATA_WIDTH = 9, // 8 bits for a data, 1 bit for command/data select
         parameter  DEPTH     = 16,
         localparam PTR_WITDH  = $clog2(DEPTH)
     )
     (
         input clk,

         output reg [DATA_WIDTH-1:0] data_o,
         input read,

         input [DATA_WIDTH-1:0] data_i,
         input write,

         output reg full,
         output reg empty,

         input reset
     );

    logic [PTR_WITDH-1:0] wr_ptr, rd_ptr;
    logic [DATA_WIDTH-1:0] fifo_buff[DEPTH-1:0];
    integer fifo_capacity;

    always_ff @(posedge clk or negedge reset) begin
        if(!reset) begin
            wr_ptr <= '0;
            rd_ptr <= '0;
            fifo_capacity <= '0;
        end
        else begin
            if (write && !full) begin
                fifo_buff[wr_ptr] <= data_i;
                wr_ptr = wr_ptr + 1'b1;
                if (wr_ptr == DEPTH) begin
                    wr_ptr = 0;
                end
                fifo_capacity <= fifo_capacity + 1'b1;
            end
            if (read && !empty) begin
                // data_o <= fifo_buff[rd_ptr];
                rd_ptr = rd_ptr + 1'b1;
                if (rd_ptr == DEPTH) begin
                    rd_ptr = 0;
                end
                fifo_capacity <= fifo_capacity - 1'b1;
            end
        end
    end

    assign data_o = fifo_buff[rd_ptr];

    always_comb begin
        if (!reset) begin
            empty <= '1;
            full <= '0;
        end
        if (fifo_capacity == '0) begin
            empty <= '1;
        end
        else begin
            empty <= '0;
        end
        if (fifo_capacity == DEPTH) begin
            full <= '1;
        end
        else begin
            full <= '0;
        end
    end

endmodule
