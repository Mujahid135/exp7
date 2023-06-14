module lab7(input logic reset, output reg [6:0]segments, input logic clk, output reg [7:0] anode,input logic direction );
	
	
	reg  [3:0] out;
	//reg  [2:0] set;
	//logic  [2:0] out_a;
	reg  [3:0] Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16;
	reg  [3:0] RQ0,RQ1,RQ2,RQ3,RQ4,RQ5,RQ6,RQ7,RQ8,RQ9,RQ10,RQ11,RQ12,RQ13,RQ14,RQ15,RQ16;
	
   //reg q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25;
    reg [2:0] Q;
	//reg [3:0] P;
	reg sp_clk, p_clk;
    tff_sp t1(clk, sp_clk);      //reduced frequency sp_clk=100Hz    assumed
    tff_sp t2(sp_clk, p_clk);         //2Hz     assumed
  //  tff_sp t3(q2, q3);
    //tff_sp t4(q3, q4);
  //  tff_sp t5(q4, q5);
  //  tff_sp t6(q5, q6);
   // tff_sp t7(q6, q7); 
   // tff_sp t8(q7, q8);
  //  tff_sp t9(q8, q9);
    //tff_sp t10(q9, q10);
   // tff_sp t11(q10, q11);
   // tff_sp t12(q11, q12);
   // tff_sp t13(q12, q13);
   // tff_sp t14(q13, q14);
   // tff_sp t15(q14, q15);
   // tff_sp t16(q15, q16);
   // tff_sp t17(q16, q17);
   // tff_sp t18(q17, sp_clk);     //reduced frequency sp_clk=100Hz
   // tff_sp t19(sp_clk, q18);
   // tff_sp t20(q18, q19);  
//	tff_sp t21(q19, q20); 
//	tff_sp t22(q20, q21); 
//	tff_sp t23(q21, q22); 
//	tff_sp t24(q22, q23); 
//	tff_sp t25(q23, p_clk);     //2Hz
	

counter Count(sp_clk,reset, Q );    // Making 8 combinations for selection of anodes and acces the corresponding Data
	//assoign out_a = Q;
    //counter2 Count2(p_clk,reset, P ); // Making 16 combinations for turned off anodes corresponding don't cares 

	always_comb begin
			case(Q)
				3'b000 : anode = 8'b11111110;
				3'b001 : anode = 8'b11111101;
				3'b010 : anode = 8'b11111011;
				3'b011 : anode = 8'b11110111;
				3'b100 : anode = 8'b11101111;
				3'b101 : anode = 8'b11011111;
				3'b110 : anode = 8'b10111111;
				3'b111 : anode = 8'b01111111;
				
				
			endcase
	end

	always_comb begin
			case(out)
				4'b0000 : segments = 7'b1000000;
				4'b0001 : segments = 7'b1111001;
				4'b0010 : segments = 7'b0100100;
				4'b0011 : segments = 7'b0110000;
				4'b0100 : segments = 7'b0011001;
				4'b0101 : segments = 7'b0010010;
				4'b0110 : segments = 7'b0000010;
				4'b0111 : segments = 7'b1111000;
				4'b1000 : segments = 7'b0000000;
				4'b1001 : segments = 7'b0010000;
				4'b1010 : segments = 7'b0001000;  // A
				4'b1011 : segments = 7'b0000011;  // B
				4'b1100 : segments = 7'b1000110;  // C
				4'b1101 : segments = 7'b0100001;  // d
				4'b1110 : segments = 7'b0000110;  // E
				4'b1111 : segments = 7'b1111111;  // F
				
			endcase
	end
	initial begin
        Q0 <= 4'b0011;
        Q1 <= 4'b0001;
        Q2 <= 4'B1110;
        Q3 <= 4'b1110;
        Q4 <= 4'b0001;
        Q5 <= 4'b0010;
        Q6 <= 4'b0000;
        Q7 <= 4'b0010;
        Q8 <= 4'b1111;
        Q9 <= 4'b1111;
        Q10 <=4'b1111;
        Q11 <=4'b1111;
        Q12 <=4'b1111;
        Q13 <=4'b1111;
        Q14 <=4'b1111;
        Q15 <=4'b1111;
        Q16 <=4'b0101;
	end


	always @( posedge p_clk ) begin
		                                   // left shifting
        if (reset ==0) begin 

            Q7 <= Q6;
            Q6 <= Q5;
            Q5 <= Q4;
            Q4 <= Q3;
            Q3 <= Q2;
            Q2 <= Q1;
            Q1 <= Q0;
            Q0 <= Q16;
            Q16 <= Q15;
            Q15 <= Q14;
            Q14 <= Q13;
            Q13 <= Q12;
            Q12 <= Q11;
            Q11 <= Q10; 
            Q10 <= Q9;
            Q9 <= Q8;
            Q8 <= Q7;
        end
        
        else begin
        
            Q0 <= 4'b0011;
            Q1 <= 4'b0001;
            Q2 <= 4'B1110;
            Q3 <= 4'b1110;
            Q4 <= 4'b0001;
            Q5 <= 4'b0010;
            Q6 <= 4'b0000;
            Q7 <= 4'b0010;
            Q8 <= 4'b1111;
            Q9 <= 4'b1111;
            Q10 <=4'b1111;
            Q11 <=4'b1111;
            Q12 <=4'b1111;
            Q13 <=4'b1111;
            Q14 <=4'b1111;
            Q15 <=4'b1111;
            Q16 <=4'b0101;
        end
			
    end
        
        
    initial begin
        RQ0 <= 4'b0011;
        RQ1 <= 4'b0001;
        RQ2 <= 4'B1110;
        RQ3 <= 4'b1110;
        RQ4 <= 4'b0001;
        RQ5 <= 4'b0010;
        RQ6 <= 4'b0000;
        RQ7 <= 4'b0010;
        RQ8 <= 4'b1111;
        RQ9 <= 4'b1111;
        RQ10 <=4'b1111;
        RQ11 <=4'b1111;
        RQ12 <=4'b1111;
        RQ13 <=4'b1111;
        RQ14 <=4'b1111;
        RQ15 <=4'b1111;
        RQ16 <=4'b0101;
    end
		
    always @(posedge p_clk) begin
    
        if (reset==0) begin
            RQ0 <= RQ1;
            RQ1 <= RQ2;
            RQ2 <= RQ3;
            RQ3 <= RQ4;
            RQ4 <= RQ5;
            RQ5 <= RQ6;
            RQ6 <= RQ7;
            RQ7 <= RQ8;
            RQ8 <= RQ9;
            RQ9 <= RQ10;
            RQ10 <= RQ11;
            RQ11 <= RQ12;
            RQ12 <= RQ13;
            RQ13 <= RQ14;
            RQ14 <= RQ15;
            RQ15 <= RQ16;
            RQ16 <= RQ0;
            
        end
        
        else begin
            
            RQ0 <= 4'b0011;
            RQ1 <= 4'b0001;
            RQ2 <= 4'B1110;
            RQ3 <= 4'b1110;
            RQ4 <= 4'b0001;
            RQ5 <= 4'b0010;
            RQ6 <= 4'b0000;
            RQ7 <= 4'b0010;
            RQ8 <= 4'b1111;
            RQ9 <= 4'b1111;
            RQ10 <=4'b1111;
            RQ11 <=4'b1111;
            RQ12 <=4'b1111;
            RQ13 <=4'b1111;
            RQ14 <=4'b1111;
            RQ15 <=4'b1111;
            RQ16 <=4'b0101;
                
        end
        
    end
        
        
        
    always @(*) begin
        if (direction==1) begin       // Left shift Data showing

            if (Q==3'b000) begin
                out=Q0;   
            end
            else if(Q==3'b001) begin
                out=Q1;    
            end
            else if(Q==3'b010) begin
                out=Q2;   
            end
            else if(Q==3'b011) begin
                out=Q3;   
            end
            else if(Q==3'b100) begin
                out=Q4; 
            end
            else if(Q==3'b101) begin
                out=Q5;   
            end
            else if(Q==3'b110) begin
                out=Q6;   
            end
            else if(Q==3'b111) begin
                out=Q7;   
            end
        end
    
        else begin               // Right Shift Data Showing
        
            if (Q==3'b000) begin
                out=RQ0;    
            end
            else if(Q==3'b001) begin
                out=RQ1;        
            end
            else if(Q==3'b010) begin
                out=RQ2;       
            end
            else if(Q==3'b011) begin
                out=RQ3;         
            end
            else if(Q==3'b100) begin
                out=RQ4;
            end
            else if(Q==3'b101) begin
                out=RQ5;       
            end
            else if(Q==3'b110) begin
                out=RQ6;       
            end
            else if(Q==3'b111) begin
                out=RQ7;       
            end       
        end
    end
		
            
				
endmodule		
		









module tff_sp(clk_1, q);
    input   clk_1;
	output reg q;
	logic t=1;
	logic q0=0;
	 
	
	 
	 always_ff@(posedge clk_1)
	 begin
		if (t) begin
		   q<=~q0;
		   q0<=~q0;
		end
	 end
endmodule
   // 3 bit counter
module counter(
	input logic clk_2,reset_i,
	output logic [2:0] count
	);
	logic [2:0] count0;

   //initial begin
     //count <= 3'b000;
    //end

	
	always @( posedge clk_2)
	begin

		

		if(reset_i) 
    		count<=0;
		
		else 
			count<=count0;

	end
	always_comb begin
    
		count0<=count+1;
    end

endmodule
   // 4 bit counter




//module counter2(
	//input logic clk_2,reset_i,
	//output logic [3:0] count
	//);
	//logic [3:0] count0;
	//assign count0 = 4'b0000;
	
	//always_ff @( posedge clk_2)
//	begin

	//	if(reset_i) 
	//		count<=0;
		
	//	else 
		//	count<=count0;

//	end
//	always_comb
	//	count0<=count+1;

//endmodule