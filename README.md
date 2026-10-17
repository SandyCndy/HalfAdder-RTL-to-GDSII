# Half Adder — Verilog RTL-to-GDSII

A Half Adder implemented in Verilog HDL, verified with Icarus Verilog, synthesized using Yosys, and physically implemented through OpenLane 2 using the Sky130 PDK.

## Design Overview

Inputs:
- `A`: First 1-bit input
- `B`: Second 1-bit input

Outputs:
- `SUM = A XOR B`
- `CARRY = A AND B`

## Truth Table

| A | B | SUM | CARRY |
|---|---|-----|-------|
| 0 | 0 |  0  |   0   |
| 0 | 1 |  1  |   0   |
| 1 | 0 |  1  |   0   |
| 1 | 1 |  0  |   1   |

## Tools

- Verilog HDL
- Icarus Verilog
- GTKWave
- Yosys
- OpenLane 2
- Sky130 PDK
- Docker
- Ubuntu Linux

## Project Structure

- `rtl/half_adder.v`: RTL implementation
- `tb/half_adder_tb.v`: Self-checking testbench
- `sim/`: Simulation outputs
- `synthesis/`: Generic synthesis outputs
- `openlane/config.json`: Physical-design configuration
- `docs/`: Documentation

## Simulation

Run from the project root:

    iverilog -g2012 -Wall -o sim/half_adder_check rtl/half_adder.v tb/half_adder_tb.v
    vvp sim/half_adder_check

**Result:** PASS — All four input combinations tested successfully.

To view the waveform:

    gtkwave sim/half_adder.vcd

## Generic Synthesis

Yosys reported:
- 1 XOR logic cell
- 1 AND logic cell
- 0 synthesis-check problems

## Physical Design Results

The OpenLane 2 RTL-to-GDS flow completed successfully.

| Metric | Result |
|---|---:|
| Standard-cell area | 1,243.69 µm² |
| Core area | 66,333.6 µm² |
| Standard-cell utilization | 1.875% |
| Routed wirelength | 591 µm |
| Routed vias | 25 |
| Final routing DRC errors | 0 |
| Magic DRC errors | 0 |
| KLayout DRC errors | 0 |
| LVS errors | 0 |

These metrics come from an educational run using a deliberately generous floorplan.

**Timing note:** This is a combinational design with no clock port. The reported timing slack does not establish that a synchronous design meets a clock-frequency target.

## Learning Outcomes

- Verilog RTL design
- Self-checking testbench development
- Simulation and waveform inspection
- Generic synthesis using Yosys
- RTL-to-GDS physical design
- DRC and LVS report inspection

## Future Work

- Parameterized ALU
- Synchronous FIFO
- UART transmitter and receiver
- SystemVerilog verification
- Timing constraints and physical optimization
