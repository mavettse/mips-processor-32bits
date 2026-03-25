[English](README.md) | Português-BR

# Practice 6: Datapath for Branch Instructions

This assignment focuses on expanding the single-cycle MIPS processor architecture to support flow control instructions, enabling the execution of conditional and unconditional branches.

## Objectives

The main goal is to modify the MIPS architecture design to implement the branch instructions `beq` (Branch on Equal) and `j` (Jump), allowing the processor to alter the program's execution flow (loops and conditionals).

The main tasks include:

* **Unconditional Jump Support:** Alter the architecture to support the `j` instruction (J-Format), calculating the target address by concatenating the 4 most significant bits of `PC+4` with the 26 bits of the instruction's address field (after a *shift left 2*).
* **Conditional Branch Support:** Make the necessary changes and tests for the `beq` instruction to work, using the ALU for equality comparison and relative address calculation.
* **Control Unit Update:** Modify the Main Control Unit to include the "Jump" control signal needed for the branch address multiplexer.
* **FPGA Validation:** Implement and validate a test program that initializes specific registers ($8, $9, $10, $12) and executes a sequence of instructions (`beq`, `addi`, `sw`, `lw`, `sub`, `j`) to prove the functioning of the jumps and the data integrity on the displays.