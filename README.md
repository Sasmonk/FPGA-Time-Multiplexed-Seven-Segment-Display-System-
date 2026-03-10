# FPGA Time-Multiplexed Seven-Segment Display System

## Overview

This project implements a **time-multiplexed hardware controller for a 4-digit seven-segment display** using **Verilog RTL**.
The design is deployed on the **Digilent Basys3 FPGA board**, which contains a **Xilinx Artix-7 FPGA** and an onboard multiplexed seven-segment display.

The system demonstrates both **combinational and sequential digital design techniques** including BCD decoding, shift-register digit generation, clock division, and time-multiplexed display control.

A sequential shift-register generates cyclic digits (0–9) which are dynamically displayed across the four digits using multiplexing.

---

## Key Features

* Verilog RTL implementation of a **multiplexed seven-segment display controller**
* **Binary-Coded Decimal (BCD) to 7-segment decoder**
* **Sequential shift-register digit generator (0–9 cycle)**
* **Clock divider logic** derived from the 100 MHz FPGA clock
* **Time-multiplexed digit selection** for multi-digit display
* FPGA synthesis and deployment using **Xilinx Vivado**
* Hardware pin mapping using **Xilinx Design Constraints (XDC)**

---

## Hardware Platform

Target board:

* Digilent Basys3 FPGA Board
* Xilinx Artix-7 FPGA
* 4-digit onboard seven-segment display
* 100 MHz system clock

---

## System Architecture

The system consists of the following hardware modules:

### 1. Seven Segment Decoder (`seven_seg_decoder.v`)

* Converts a **4-bit BCD digit** into the corresponding **7-segment pattern**
* Implemented using combinational logic
* Outputs **active-low segment signals** compatible with Basys3 hardware

### 2. Digit Shift Register (`digit_shift_register.v`)

* Implements a **sequential shift register**
* Generates digits **0–9 cyclically**
* Shifts newly generated digits into a **4-digit register**
* Provides dynamic values to the display controller

### 3. Multiplex Display Controller (`mux_display_controller.v`)

* Controls **digit multiplexing**
* Activates one digit at a time while sharing segment lines
* Uses a refresh counter derived from the system clock
* Ensures a refresh rate suitable for **visual persistence**

### 4. Top Module (`top.v`)

* Integrates all modules into a complete system
* Connects shift register outputs to the display controller
* Serves as the **synthesis entry point for the FPGA**

---

## Project Structure

```
fpga-multiplexed-seven-segment-display

rtl/
    seven_seg_decoder.v
    digit_shift_register.v
    mux_display_controller.v
    top.v

tb/
    tb_top.v

constraints/
    basys3.xdc

README.md
```

---

## Simulation

Simulation can be performed using the **Vivado Simulator**.

Steps:

1. Create a new project in Vivado
2. Add RTL files from the `rtl/` directory
3. Add the testbench from the `tb/` directory
4. Set `tb_top.v` as the simulation top module
5. Run **Behavioral Simulation**
6. Observe signal activity in the Vivado waveform viewer

---

## FPGA Implementation Flow

Using **Xilinx Vivado**:

1. Create a new Vivado project
2. Select the **Basys3 board**
3. Add the RTL source files
4. Add the **XDC constraint file**
5. Run **Synthesis**
6. Run **Implementation**
7. Generate the **Bitstream**
8. Program the FPGA board

---

## Display Behavior

The shift register continuously generates digits from **0 to 9**, which are shifted across the four display digits.

Example display sequence:

```
0000
0001
0012
0123
1234
2345
3456
4567
5678
6789
7890
```

The display controller refreshes each digit rapidly so that all digits appear illuminated simultaneously.

---

## Applications

* Digital clocks
* Embedded system debugging displays
* FPGA learning platforms
* Hardware counters and timers
* Basic FPGA user-interface displays

