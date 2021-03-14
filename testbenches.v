`include "ALU.v"  //Utility Modules are already included in ALU.v

module ALU_1b_Ordinary_TB;
  
  reg a, b, Less, Ainvert, Binvert, CarryIn;
  reg [1:0] Operation;
  
  wire Result, CarryOut;
  
  ALU_1b_Ordinary ALU1(
  .a (a),
  .b (b),
  .Less (Less),
  .Ainvert (Ainvert),
  .Binvert (Binvert),
  .CarryIn (CarryIn),
  .Operation (Operation),
  .Result (Result),
  .CarryOut (CarryOut)
  );
  
  initial
    begin
      a = 1;
      b = 1;
      Less = 0; //Less is used to check for a<b
      Ainvert = 0;
      Binvert = 0;
      CarryIn = 1;
      
      Operation = 2'b00;  //For and operation      
      #1 $display("\na AND b = %d", Result);
      
      Operation = 2'b01;  //For OR operation      
      #1 $display("\na OR b = %d", Result);

      Operation = 2'b10;  //For Add operation      
      #1 $display("\na + b = %d, CarryOut= %d", Result, CarryOut);
            
    end
  
endmodule

module fullAdder_TB;
  
  reg a, b, Cin;
  wire sum, Cout;
  
  //Instantiating a full adder
  fullAdder A1(
  .a (a),
  .b (b),
  .Cin (Cin),
  .sum (sum),
  .Cout (Cout)
  );
  
  //Test block
  initial
    begin
      
      a = 1'b0;
      b = 1'b0;
      Cin = 1'b0;
      
      #1 $display("\nSum= %d, Carry-out= %d", sum, Cout);
          
    end 
  
endmodule


//Testbench
module mux4to1_TB;
  
  reg [3:0] inp;
  reg [1:0] select;
  
  wire op;
  
  mux4to1 M1(op, inp, select);
  
  initial
    begin
      
      inp = 4'b0101;
      
      select = 2'b00;      
      #1 $display("Output line value= %d, Input= %d", op, inp);
      
      select = 2'b01;      
      #1 $display("Output line value= %d, Input= %d", op, inp);
      
      select = 2'b10;      
      #1 $display("Output line value= %d, Input= %d", op, inp);
      
      select = 2'b11;      
      #1 $display("Output line value= %d, Input= %d", op, inp);
      
      #1 $display("First bit= %d", inp[0]);
    
    end

endmodule  