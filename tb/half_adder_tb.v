`timescale 1ns/1ps

module half_adder_tb;

    reg A;
    reg B;

    wire SUM;
    wire CARRY;

    integer i;
    integer errors;

    half_adder uut (
        .A(A),
        .B(B),
        .SUM(SUM),
        .CARRY(CARRY)
    );

    initial begin
        $dumpfile("sim/half_adder.vcd");
        $dumpvars(0, half_adder_tb);

        errors = 0;

        $display("----------------------------------");
        $display("       HALF ADDER TEST");
        $display("----------------------------------");
        $display(" A B | SUM CARRY");
        $display("-----------------");

        // Test all four possible input combinations
        for (i = 0; i < 4; i = i + 1) begin
            {A, B} = i;
            #10;

            $display(" %b %b |  %b    %b",
                     A, B, SUM, CARRY);

            // Check expected SUM
            if (SUM !== (A ^ B)) begin
                $display("ERROR: SUM mismatch for A=%b B=%b",
                         A, B);
                errors = errors + 1;
            end

            // Check expected CARRY
            if (CARRY !== (A & B)) begin
                $display("ERROR: CARRY mismatch for A=%b B=%b",
                         A, B);
                errors = errors + 1;
            end
        end

        $display("-----------------");

        if (errors == 0) begin
            $display("PASS: All tests passed.");
        end else begin
            $fatal(1, "FAIL: %0d error(s) detected.", errors);
        end

        $finish;
    end

endmodule
