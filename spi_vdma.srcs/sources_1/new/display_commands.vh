// Uncomment to enable dislay test mode, or add definition to Compile and Run options
// `define DISPLAY_TEST

// Determine whether command or data will be transmitted
`define COMMAND                     1'b0
`define DATA                        1'b1

// Power on command sequense (setup and wake-up)
`define SW_RESET                    {`COMMAND, 8'h01}
`define POWER_CONTROL_B             {`COMMAND, 8'hCF}, {`DATA, 8'h0}, {`DATA, 8'hC1}, {`DATA, 8'h30}
`define POWER_ON_SECUENCE_CONTROL   {`COMMAND, 8'hED}, {`DATA, 8'h64}, {`DATA, 8'h03}, {`DATA, 8'h12}, {`DATA, 8'h81}
`define PUMP_RATIO_CONTROL          {`COMMAND, 8'hF7}, {`DATA, 8'h20}
`define DRIVER_TIMING_CONTROL_B     {`COMMAND, 8'hEA}, {`DATA, 8'h00}, {`DATA, 8'h00}
`define POWER_CONTROL_1             {`COMMAND, 8'hC0}, {`DATA, 8'h23}
`define POWER_CONTROL_2             {`COMMAND, 8'hC1}, {`DATA, 8'h10}
`define VCOM_CONTROL_1              {`COMMAND, 8'hC5}, {`DATA, 8'h3e}, {`DATA, 8'h28}
`define VCOM_CONTROL_2              {`COMMAND, 8'hC7}, {`DATA, 8'h86}
`define MEM_ACC_CONTROL             {`COMMAND, 8'h36}, {`DATA, 8'h48}
`define PIXEL_FORMAT                {`COMMAND, 8'h3A}, {`DATA, 8'h55}
`define FORMAT_CONTROL              {`COMMAND, 8'hB1}, {`DATA, 8'h00}, {`DATA, 8'h13}
`define DISPLAY_FUNCTION_CONTROL    {`COMMAND, 8'hB6}, {`DATA, 8'h08}, {`DATA, 8'h82}, {`DATA, 8'h27}
`define GAMMA_3_FUNCTION_DISABLE    {`COMMAND, 8'hF2}, {`DATA, 8'h00}
`define GAMMA_FUNCTION_SET          {`COMMAND, 8'h26}, {`DATA, 8'h01} 
`define SLEEP_OFF                   {`COMMAND, 8'h11}
`define DISPLAY_ON                  {`COMMAND, 8'h29}

// Delay after sleep off command
// `define WAKEUP_DELAY_MS             time'(2ms) // for simulation
`define WAKEUP_DELAY_100MHZ         10**5 // for synthesis

`define TOTAL_PW_ON_PACKETS_NUM     41

`define WRITE_MEMORY_COMMAND {`COMMAND, 8'h2C}
