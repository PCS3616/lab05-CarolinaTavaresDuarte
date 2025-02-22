@ /0000
LD /106        ; Inicializa i = 0
MM /100        ; Armazena i no início do espaço de memória
MM /102        ; Inicializa a variável acumuladora da soma

@ /0006
LOOP LD /102   ; Carrega o acumulador de soma
AD /100        ; Adiciona o contador i
AD /100        ; Soma mais uma vez para obter 2*i
AD /108        ; Adiciona 1 para formar (2*i + 1)
MM /102        ; Atualiza o acumulador da soma

LD /102        ; Carrega o valor do quadrado atual
MM /110        ; Armazena na posição apropriada da memória

LD /100        ; Carrega i atual
AD /108        ; Soma 1 ao contador (i = i + 1)
MM /100        ; Atualiza i na memória

SB /10A        ; Subtrai 64 para verificar o fim do loop
JZ /0020       ; Se i == 64, sai do loop
JP /0006       ; Caso contrário, continua iterando

@ /0020
HM /0000       ; Finaliza a execução

@ /0100
K /0000        ; Inicializa i = 0
K /0000        ; Inicializa acumulador da soma
K /0000        ; Espaço reservado para armazenar os quadrados
K /0001        ; Constante 1 (para incremento)
K /0040        ; Constante 64 (para limite do loop)
