# Prática 9: Caminho de Dados das Instruções de Desvio

Esta prática foca na expansão da arquitetura do processador MIPS monociclo para suportar instruções de controle de fluxo, permitindo a execução de desvios condicionais e incondicionais.

## Objetivos

O objetivo principal é alterar o projeto da arquitetura MIPS para implementar as instruções de desvio `beq` (Branch on Equal) e `j` (Jump), permitindo que o processador altere o fluxo de execução do programa (loops e condicionais).

As principais tarefas incluem:

* **Suporte ao Desvio Incondicional (Jump):** Alterar a arquitetura para suportar a instrução `j` (Formato J), calculando o endereço-alvo através da concatenação dos 4 bits mais significativos de `PC+4` com os 26 bits do campo de endereço da instrução (após um *shift left 2*).
* **Suporte ao Desvio Condicional (Branch):** Realizar as alterações e testes necessários para o funcionamento da instrução `beq` (Formato-I), utilizando a ULA para comparação de igualdade e o cálculo de endereço relativo.
* **Atualização da Unidade de Controle:** Modificar a Unidade de Controle Principal para incluir o sinal de controle "Jump" necessário para o multiplexador do endereço de desvio.

* **Validação em FPGA:** Implementar e validar um programa de teste que inicializa registradores específicos ($8, $9, $10, $12) e executa uma sequência de instruções (`beq`, `addi`, `sw`, `lw`, `sub`, `j`) para comprovar o funcionamento dos saltos e a integridade dos dados nos displays.

