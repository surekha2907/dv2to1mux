`timescale 1ns/1ps

module mux_tb;

    // DUT inputs
    logic a;
    logic b;
    logic sel;

    // DUT actual output
    logic y;

    // Testbench expected output
    logic expected_y;

    // Result counters
    int pass_count = 0;
    int fail_count = 0;

    // DUT instantiation
    mux_2to1 dut (
        .a   (a),
        .b   (b),
        .sel (sel),
        .y   (y)
    );

    // Task to apply one test case
    task automatic run_test(
        input logic test_a,
        input logic test_b,
        input logic test_sel,
        input logic test_expected_y
    );
        begin
            // Apply stimulus
            a          = test_a;
            b          = test_b;
            sel        = test_sel;
            expected_y = test_expected_y;

            // Wait for DUT output to settle
            #10;

            // Compare actual and expected outputs
            if (y === expected_y) begin
                $display(
                    "Time=%0t a=%0b b=%0b sel=%0b expected_y=%0b actual_y=%0b PASS",
                    $time,
                    a,
                    b,
                    sel,
                    expected_y,
                    y
                );

                pass_count++;
            end
            else begin
                $display(
                    "Time=%0t a=%0b b=%0b sel=%0b expected_y=%0b actual_y=%0b FAIL",
                    $time,
                    a,
                    b,
                    sel,
                    expected_y,
                    y
                );

                fail_count++;
            end
        end
    endtask

    initial begin
        // Create waveform file
        $dumpfile("mux_waveform.vcd");

        // Dump all signals inside mux_tb
      $dumpvars(1, mux_tb);

        // Initialize signals
        a          = 1'b0;
        b          = 1'b0;
        sel        = 1'b0;
        expected_y = 1'b0;

        $display("----------------------------------------------------------");
        $display("Starting 2:1 Multiplexer Verification");
        $display("----------------------------------------------------------");

        // Test Case 1
        // a=0, b=0, sel=0, expected_y=0
        run_test(1'b0, 1'b0, 1'b0, 1'b0);

        // Test Case 2
        // a=1, b=0, sel=0, expected_y=1
        run_test(1'b1, 1'b0, 1'b0, 1'b1);

        // Test Case 3
        // a=0, b=1, sel=1, expected_y=1
        run_test(1'b0, 1'b1, 1'b1, 1'b1);

        // Test Case 4
        // a=1, b=1, sel=1, expected_y=1
        run_test(1'b1, 1'b1, 1'b1, 1'b1);

        $display("----------------------------------------------------------");
        $display(
            "Simulation Summary: PASS=%0d FAIL=%0d",
            pass_count,
            fail_count
        );

        if (fail_count == 0)
            $display("FINAL RESULT: ALL TESTS PASSED");
        else
            $display("FINAL RESULT: TEST FAILED");

        $display("----------------------------------------------------------");

        $finish;
    end

endmodule