[English](README.md) | Português-BR 

# Processador MIPS 32 bits Monociclo

Um processador MIPS de 32 bits de ciclo único desenvolvido em Verilog. Este projeto foi construído incrementalmente como parte da disciplina de Laboratório de Arquitetura e Organização de Computadores I (LAOC I) do CEFET-MG. 

O objetivo do projeto é demonstrar a implementação prática do caminho de dados e das unidades de controle de uma arquitetura baseada em von Neumann, culminando em um processador funcional capaz de executar instruções lógicas, aritméticas, de desvio e de acesso à memória.

## Funcionalidades e Instruções Suportadas

O processador foi projetado para suportar o conjunto básico de instruções MIPS, divididas nos seguintes formatos:

* **Instruções Lógicas e Aritméticas (Formato R):** `add`, `sub`, `and`, `or`, `slt`.
* **Transferência de Dados (Formato I):** `lw` (Load Word) e `sw` (Store Word).
* **Desvio Condicional (Formato I):** `beq` (Branch on Equal).
* **Desvio Incondicional (Formato J):** `j` (Jump).

## Arquitetura e Componentes

O design interliga diversos blocos de hardware sintetizáveis descritos ao longo do projeto:

* **Unidade Lógica e Aritmética (ULA):** Bloco parametrizável responsável pelas operações matemáticas e lógicas centrais.
* **Banco de Registradores:** Módulo composto por 32 registradores de 32 bits.
* **Memórias Separadas:** O sistema adota blocos distintos para a Memória de Instruções (Read-Only) e Memória de Dados (Read/Write).
* **Unidades de Controle:** A arquitetura é estruturada por uma **Unidade de Controle Principal** (que decodifica o *opcode* e emite sinais de controle) e uma **Unidade de Controle da ULA** (que refina a operação baseada no campo *funct*).
* **Lógica de Desvio:** Circuitos somadores independentes e multiplexadores para o cálculo de endereços de *Branch* (PC + 4 + Imediato estendido) e *Jump* (Concatenação de bits).

## Ferramentas e Tecnologias

* **Linguagem:** Verilog HDL
* **Síntese e Análise:** Quartus II
* **Simulação:** ModelSim (validação via formas de onda)
* **Hardware Alvo:** Placa FPGA Altera DE-2 (validação em hardware real via displays de sete segmentos) 

## Estrutura do Módulo Top-Level

O arquivo principal (`processador.v`) integra todas as instâncias construídas ao longo das práticas. As conexões principais incluem:
* `countPC`: Gerenciamento do Program Counter.
* `memoriaInstrucao` / `memoriaDados`: Armazenamento.
* `bancoRegistradores`: Interface de registradores rs, rt e rd.
* `ULA32bits`: Execução das operações.
* Lógicas de extensão de sinal e multiplexadores de roteamento.

## Autores

* **Giovanni Estevam** - [https://github.com/mavettse]
* **João Vitor Lopes** - [https://github.com/joaovitorf4]

---
*Projeto desenvolvido para fins acadêmicos - Engenharia de Computação / 2025.*