# nios

Projeto de Lógica Reconfigurável de integração com o Nios2

-- André Luiz Rodrigues dos Santos
-- RA1500759-UTFPR
-- Luís Henrique Beltrão Santana
-- RA906867-UTFPR
-- 20190404

Observações: o projeto user_harware está presente no repositório para acelerar os testes. O projeto nios tem um tempo médio de compilação três vezes maior que o o projeto user_hardware, então para testes dos componentes é mais vantajoso manter um projeto paralelo referenciando os mesmos arquivos.

  ->Estrutura do projeto consiste em:
   - Componente do Nios criado pelo Qsys e controlado por um código em C
   - Componente userHardware que se comunica com o Nios
      - Composto por um registrador de controle
      - Um contador de 8 bits
      - Um contador de 0s e 1s a partir de um input de dados

-> TODOS:
  - Finalização da lógica do registrador 
  - Debug do recebimento e transmissão de dados pela UART(testar usando placa FTDI), driver do notebook não reconhece a porta COM.
  - Modelsim e testes finais 
  
