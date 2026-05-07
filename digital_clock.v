module digital_clk(input clk,rst,output reg [5:0] sec,min,hr);
  reg [26:0]count;
  reg clk_1;
  always@(posedge clk ,negedge rst)
    begin
      if(!rst)
        begin
          clk_1<=0;
          count<=0;
        end
      else
        begin
          if(count==1)
            begin
              count<=0;
              clk_1<=~clk_1;
            end
          else
            begin
              count<=count+1;
            end
        end
    end
  always@(posedge clk_1, negedge rst)
    begin
      if(!rst)
        begin
          sec<=0;
          min<=0;
          hr<=0;
        end
      else
        begin
          if(sec==6'd59)begin
            sec<=0;
            if(min==6'd59)begin
              min<=0;
              if(hr==6'd23)begin
                hr<=0;
              end
              else
                begin
                  hr<=hr+1;
                end
            end
            else
              begin
                min<=min+1;
              end
          end
          else
            begin
              sec<=sec+1;
            end
        end
    end
endmodule
