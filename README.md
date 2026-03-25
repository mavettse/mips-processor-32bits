English | [Português-BR ](README.pt-br.md)

# 32-bit Single-Cycle MIPS Processor

A 32-bit single-cycle MIPS processor developed in Verilog. This project was built incrementally as part of the Computer Architecture and Organization Laboratory I (LAOC I) course at CEFET-MG.

The project's goal is to demonstrate the practical implementation of the datapath and control units of a von Neumann-based architecture, culminating in a functional processor capable of executing logical, arithmetic, branching, and memory access instructions.

## Features and Supported Instructions

The processor was designed to support the basic MIPS instruction set, divided into the following formats:

* **Logical and Arithmetic Instructions (R-Format):** `add`, `sub`, `and`, `or`, `slt`.
* **Data Transfer (I-Format):** `lw` (Load Word) and `sw` (Store Word).
* **Conditional Branch (I-Format):** `beq` (Branch on Equal).
* **Unconditional Jump (J-Format):** `j` (Jump).

## Architecture and Components

The design interconnects several synthesizable hardware blocks described throughout the project:

* **Arithmetic Logic Unit (ALU):** Parameterizable block responsible for the core mathematical and logical operations.
* **Register File:** Module composed of 32 32-bit registers.
* **Separate Memories:** The system adopts distinct blocks for the Instruction Memory (Read-Only) and Data Memory (Read/Write).
* **Control Units:** The architecture is structured by a **Main Control Unit** (which decodes the *opcode* and issues control signals) and an **ALU Control Unit** (which refines the operation based on the *funct* field).
* **Branch Logic:** Independent adder circuits and multiplexers for calculating *Branch* (PC + 4 + Sign-extended immediate) and *Jump* (Bit concatenation) addresses.

## Tools and Technologies

* **Language:** Verilog HDL
* **Synthesis and Analysis:** Quartus II
* **Simulation:** ModelSim (validation via waveforms)
* **Target Hardware:** Altera DE-2 FPGA board (real hardware validation via seven-segment displays)

## Top-Level Module Structure

The main file (`processador.v`) integrates all instances built throughout the practical assignments. Main connections include:
* `countPC`: Program Counter management.
* `memoriaInstrucao` / `memoriaDados`: Storage.
* `bancoRegistradores`: Interface for rs, rt, and rd registers.
* `ULA32bits`: Operation execution.
* Sign extension logic and routing multiplexers.

## Authors

* **Giovanni Estevam** - [https://github.com/mavettse]
* **João Vitor Lopes** - [https://github.com/joaovitorf4]

---
*Project developed for academic purposes - Computer Engineering / 2025.*