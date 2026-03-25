English | [Português-BR](README.pt-br.md)

# Practice 1: Logic Blocks, ALU, and Data Memory

This assignment focuses on implementing fundamental components of the MIPS architecture in Verilog, serving as the foundation for building the processor.

## Objectives

The goal is to design, implement, and simulate the following modules:

* **Full Adder (32-bit):** An adder built from 1-bit full adders.
* **32-bit Arithmetic Logic Unit (ALU):** An ALU capable of executing the five basic MIPS operations:
    * `000`: and
    * `001`: or
    * `010`: add
    * `110`: subtract
    * `111`: slt (set less than)
* **Sign Extender:** A module that converts a 16-bit input signal into a 32-bit output signal (sign extension).
* **Data Memory:** A data memory with a storage capacity of 64 bytes, supporting read (`memRead`) and write (`memWrite`) operations synchronized with the clock.