# Prática 4: ULA e Memória de Dados - AOC I

Este repositório contém a implementação dos circuitos em Verilog para a Prática 4 da disciplina de Laboratório de Arquitetura e Organização de Computadores I (AOC I).

---

## Sobre o Projeto

O objetivo desta prática é projetar, implementar e simular em Verilog os blocos lógicos fundamentais para um processador, com foco na Unidade Lógica e Aritmética (ULA) e na Memória de Dados, ambas baseadas na arquitetura MIPS.

## Componentes Implementados

### 1. Somador de 32 bits

* **Descrição:** Um somador completo que opera com dois operandos de 32 bits.
* **Implementação:** O circuito foi construído com um somador completo de 1 bit como bloco básico.

### 2. Unidade Lógica e Aritmética (ULA) de 32 bits

* **Descrição:** Uma ULA baseada na arquitetura MIPS.
* **Interface:** `module ULA32bits (a, b, ALUop, zero, result, overflow);`
* **Operações:** A ULA é capaz de executar 5 operações distintas, selecionadas pelo sinal de controle `ALUop`:
    * `000`: `and`
    * `001`: `or`
    * `010`: `add` (soma)
    * `110`: `subtract` (subtração)
    * `111`: `slt` (set less than / "defina se menor que")
* **Saídas:** Além do resultado (`result`), a ULA possui saídas para `zero` (indica se o resultado é zero) e `overflow`.

### 3. Extensor de Sinal (16 para 32 bits)

* **Descrição:** Um bloco combinacional que recebe um sinal de entrada de 16 bits e o estende para um sinal de saída de 32 bits, replicando o bit de sinal.
* **Exemplo de Operação:**
    * `Entrada (16 bits): 0000000000000001`
    * `Saída (32 bits): 00000000000000000000000000000001`

### 4. Memória de Dados (32 bytes)

* **Descrição:** Uma implementação de uma memória de dados com capacidade de armazenamento de 32 bytes.
* **Interface:** `module memoriaDados (address, memWrite, memRead, clock, writeData, readData);`
* **Operação:**
    * **Escrita (`memWrite = 1`):** Armazena o valor de `writeData` (32 bits) no endereço especificado por `address`, na borda de subida do clock.
    * **Leitura (`memRead = 1`):** Disponibiliza na saída `readData` (32 bits) o dado armazenado no endereço `address`.
    * **Endereçamento:** A memória é endereçável a byte.

---

## 💻 Ferramentas Utilizadas

* **Linguagem:** Verilog HDL
* **Síntese e Implementação:** Quartus II
* **Simulação:** ModelSim
* **Hardware (Demonstração):** Placa FPGA DE-2 Altera