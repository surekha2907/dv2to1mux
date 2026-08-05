# dv2to1mux
# 2:1 Multiplexer Verification using SystemVerilog

## Project Description

This project verifies the working of a **2:1 Multiplexer (MUX)** using **SystemVerilog**.

The project contains:
- A multiplexer design (DUT)
- A testbench to verify the design
- A waveform to check the output visually

The testbench applies different input combinations and compares the actual output with the expected output.

---

## Project Files

```
project_name/
├── mux.sv        # Multiplexer Design (DUT)
├── mux_tb.sv     # Testbench
└── README.md     # Project Description
```

---

## DUT Functionality

The DUT is a **2:1 Multiplexer**.

It has:
- Two inputs: `a` and `b`
- One select signal: `sel`
- One output: `y`

If `sel = 0`, the output is `a`.

If `sel = 1`, the output is `b`.

### Truth Table

| a | b | sel | y |
|---|---|-----|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 1 |
| 1 | 1 | 0 | 1 |
| 0 | 0 | 1 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 1 |

---

## Verification Approach

The design is verified using a **self-checking SystemVerilog testbench**.

The testbench performs the following steps:

- Applies input values to the DUT.
- Calculates the expected output.
- Compares the DUT output with the expected output.
- Displays whether the test passed or failed.
- Counts the total number of passed and failed test cases.
- Generates a waveform for debugging.

---

## Test Scenarios

The following test cases were executed:

| Test Case | a | b | sel | Expected Output |
|-----------|---|---|-----|-----------------|
| Test 1 | 0 | 0 | 0 | 0 |
| Test 2 | 1 | 0 | 0 | 1 |
| Test 3 | 0 | 1 | 1 | 1 |
| Test 4 | 1 | 1 | 1 | 1 |

These test cases verify that the multiplexer selects the correct input based on the value of `sel`.

---

## Simulation Result

The simulation completed successfully.

- Total Test Cases: **4**
- Passed: **4**
- Failed: **0**

The waveform also shows that the DUT output (`y`) matches the expected output (`expected_y`) for all test cases.

---

## Conclusion

The 2:1 Multiplexer was successfully verified using SystemVerilog. All test cases passed, showing that the design works correctly for the tested input combinations.
