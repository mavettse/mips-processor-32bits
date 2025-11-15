# Prática 4: Blocos Lógicos, ULA e Memória de Dados

Esta prática foca na implementação de componentes fundamentais da arquitetura MIPS em Verilog, servindo como base para a construção do processador.

## Objetivos

O objetivo é projetar, implementar e simular os seguintes módulos:

* **Somador Completo (32 bits):** Um somador construído a partir de somadores completos de 1 bit (Full-Adders). 
* **Unidade Lógica e Aritmética (ULA) de 32 bits:** Uma ULA capaz de executar as cinco operações básicas do MIPS, selecionadas por um sinal de controle `ALUop` :
    * `000`: and
    * `001`: or
    * `010`: add
    * `110`: subtract
    * `111`: slt (set less than)
* **Extensor de Sinal:** Um módulo que converte um sinal de entrada de 16 bits para um sinal de saída de 32 bits (extensão de sinal). 
* **Memória de Dados:** Uma memória de dados com capacidade de 32 bytes, suportando operações de leitura (`memRead`) e escrita (`memWrite`) sincronizadas com o clock.