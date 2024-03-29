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
      - PIO READTDATA 8 bits
      - PIO WRITEDATA 8 bits
      - PIO COMMAND 3 bits (comandos CS, WR e RD)
 
  - Componente userHardware que se comunica com o Nios
      - Composto por um registrador de controle que recebe como entrada os dados dos barramentos do nios e aos comandos 
      - Um contador de 8 bits incremental
      - Um contador de 0s e 1s a partir de um input de dados
 
 - [Demo da integração do componente Qsys](https://youtu.be/QbR8crQcPQM)
 
 - Modificações
    - Em sala de aula foi estipulado alguns "workarounds" para o problema do UART não receber a primeira palavra. Todavia, escrevemos o código em C que faz essa verificação a nível de usuário, esperando um comando de inicialização e informando o usuário das operações de dados sendo feitas
    <img src = "/realterm2.png"  width="1000" height="500">
    
   - Problemas encontrados e workarounds:
      - O tutorial sugerido, mesmo após incessantes tentativas e troubleshootings não pareceu funcionar no nosso ambiente. O tutorial usado para dar o quickstart do projeto foi [esse](https://www.youtube.com/watch?v=nHFVwthr_Ew), mas com a diferença de que os códigos usados para o top level são em VHDL e não em Verilog, para possibilitar a integração com outros componentes
      - Ao reiniciar o quartus e tentar relançar o projeto em C pelo eclipse, ocorreu o erro ao dar Run no projeto. As duas soluções que pareceram funcionar consistentamente foram
          - Gerar novamente os componentes do Qsys e adicionar ao projeto novamente e recriar o projeto no eclipse
          - Reiniciar a máquina e fazer todos os procedimentos de load na FPGA
      - O notebook usado para desenvolvimento não reconhecia a porta COM para comunicação serial, mesmo com tentativas frustradas de instalação de drivers. Para solucionar o problema usamos o componente YP-05, configurando os pinos de tx e rx da FPGA e fazendo a conexão. 
    <img src = "/serial_2.jpeg"  width="600" height="300">

- TODOS:
  - Finalização da lógica do userHardware
  - Inclusão do userHardware no topLevel do projeto nios
  - Modelsim e testes finais 
  
  
