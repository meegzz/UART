//  This module is created by Mohamed Maged
//  Undergraduate ECE student, Alexandria university.
//  Simple Serial-In-Parallel-Out shift register stores the data recieved at the clock [BaudRate].

module SIPO(
    input DataTx, Recieve, ResetN, BaudOut,
    
    output RecievedFlag,
    output [10:0] DataParl
);
//Internal
reg [10:0] Shifter;
reg [3:0]  Count;

always @(posedge BaudOut, negedge ResetN) begin
    if(~ResetN)begin
      Shifter <= {11{1'b1}};
      Count   <= 4'd0;
    end
    else begin
      if(Recieve)begin
        Shifter <= {Shifter, DataTx};
        Count   <= Count + 1'd1;
      end
      else begin
        Shifter <= Shifter;
        Count   <= Count;
      end
    end
end

//DoneFlag assignment
assign RecievedFlag = (Count == 4'd11);

//Output
assign DataParl = Shifter;
endmodule