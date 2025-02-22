@ /0000
LD /108       ; Inicializa i = 0
MM /100       ; Armazena i na memória
MM /102       ; Inicializa acumulador da soma (0)

@ /0006
LOOP LD /100  ; Carrega i
ML /10A       ; Multiplica por 2
AD /10C       ; Soma 1 (2*i + 1)
AD /102       ; Adiciona ao acumulador da soma
MM /102       ; Atualiza acumulador da soma

LD /102       ; Carrega o quadrado atual
MM /110       ; Armazena no endereço apropriado da memória

LD /100       ; Carrega i
AD /10C       ; Soma 1 (i = i + 1)
MM /100       ; Atualiza i na memória

SB /10E       ; Subtrai 64 para verificar se i < 64
JZ /0020      ; Se i == 64, sai do loop
JP /0006      ; Caso contrário, repete o loop

@ /0020
HM /0000      ; Finaliza a execução

@ /0100
K /0000       ; Inicializa i = 0
K /0000       ; Inicializa acumulador da soma (0)
K /0000       ; Espaço reservado para armazenar os quadrados
K /0001       ; Constante 1 (para incremento)
K /0002       ; Constante 2 (para multiplicação por 2)
K /0040       ; Constante 64 (limite do loop)
