module lab7_tb;

    // Inputs
    //logic [3:0] data;
    logic reset;
    //logic write;
    //logic [2:0] sel;    // Changed from 3-bit to 8-bit
    logic clk;
    logic direction;
    

    // Outputs
    reg [6:0] segments;
    
    reg [7:0] anode;

    // Instantiate the module to be tested
    lab7 DUT(
        
        .reset(reset),        
        .clk(clk),
        .segments(segments),
        .anode(anode),
        .direction(direction)
        
    
        
    );

    // Define a clock generator for the test bench
    always #5 clk = ~clk;

    // Initialize inputs
    initial begin
        reset = 0;
        direction = 0;
        //write = 0;
        
        
        clk = 0;
        #5 reset = 1;
        direction = 1;
        #5 reset = 0;
        direction = 0;
    end

    // Test sequence
    initial begin
          
         #25 reset = 1;

         #10 reset = 0;
         #10 reset = 0;
      
         direction = 0;
        
        
        #500;
        direction = 1;
        //#100 reset = 0;
        
        #500;
        
      
        


        $finish;
    end

endmodule