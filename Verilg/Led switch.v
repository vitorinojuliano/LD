// Descrição: esse codigo executa o seguinte circuito:
não sw0 -> led0
sw1 e não sw2 -> led1
sw1 e não sw2 ou sw2 e sw3 -> led2
sw2 e sw3 -> led3

module top(
    input [3:0] sw,
    output [3:0] led
);
    // LED 0: ~SW0
    assign led[0] = ~sw[0];

    // LED 1: SW1 & ~SW2
    assign led[1] = sw[1] & ~sw[2];

    // LED 2: (SW1 & ~SW2) | (SW2 & SW3)
    assign led[2] = (sw[1] & ~sw[2]) | (sw[2] & sw[3]);

    // LED 3: SW2 & SW3
    assign led[3] = sw[2] & sw[3];

endmodule

// TESTEBEND
module testbench;
    reg [3:0] sw;
    wire [3:0] led;

    // Instancia o módulo que você deseja testar
    top uut (
        .sw(sw),
        .led(led)
    );

    // Procedimento inicial
    initial begin
        // Teste de combinação 1
        sw = 4'b0000;
        #10;
        $display("sw=0000, led=%b", led);
        
        // Teste de combinação 2
        sw = 4'b0001;
        #10;
        $display("sw=0001, led=%b", led);
        
        // Teste de combinação 3
        sw = 4'b0010;
        #10;
        $display("sw=0010, led=%b", led);
        
        // Teste de combinação 4
        sw = 4'b0100;
        #10;
        $display("sw=0100, led=%b", led);
        
        // Teste de combinação 5
        sw = 4'b1000;
        #10;
        $display("sw=1000, led=%b", led);
        
        // Teste de combinação 6
        sw = 4'b1010;
        #10;
        $display("sw=1010, led=%b", led);
        
        // Teste de combinação 7
        sw = 4'b1100;
        #10;
        $display("sw=1100, led=%b", led);
        
        // Teste de combinação 8
        sw = 4'b1110;
        #10;
        $display("sw=1110, led=%b", led);

        // Teste de combinação 9
        sw = 4'b1111;
        #10;
        $display("sw=1111, led=%b", led);
        
        $stop;
    end
endmodule


