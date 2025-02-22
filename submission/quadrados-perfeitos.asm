@ /0000
LD /108        ; Inicializa i = 0
MM /100        ; Armazena i na memória
MM /102        ; Inicializa acumulador da soma

@ /0006
LOOP LD /102   ; Carrega o acumulador da soma
AD /100        ; Adiciona i
AD /100        ; Soma novamente para calcular 2*i
AD /10A        ; Adiciona 1 para formar (2*i + 1)
MM /102        ; Atualiza o acumulador da soma

LD /102        ; Carrega o quadrado atual
MM /110        ; Armazena na posição apropriada da memória

LD /100        ; Carrega i
AD /10A        ; Soma 1 ao contador (i = i + 1)
MM /100        ; Atualiza i na memória

SB /10C        ; Subtrai 64 para verificar se i < 64
JZ /0020       ; Se i == 64, sai do loop
JP /0006       ; Caso contrário, repete o loop

@ /0020
HM /0000       ; Finaliza a execução

@ /0100
K /0000        ; Inicializa i = 0
K /0000        ; Inicializa acumulador da soma
K /0000        ; Espaço reservado para armazenar os quadrados
K /0001        ; Constante 1 (incremento)
K /0040        ; Constante 64 (limite do loop)
