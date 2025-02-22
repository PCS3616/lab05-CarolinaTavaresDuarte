@ /0000
LD /106 ; Inicializa i = 0
MM /100 ; Armazena i na posição de memória inicial
MM /102 ; Inicializa o acumulador da soma

@ /0006
LOOP LD /102 ; Carrega o acumulador da soma
AD /100 ; Soma 2*i + 1
MM /102 ; Atualiza o acumulador da soma
LD /102 ; Carrega o valor do quadrado atual
MM /104 ; Armazena o quadrado na memória

LD /100 ; Carrega i
AD /106 ; Soma 1 (i = i + 1)
MM /100 ; Atualiza i na memória
SB /10A ; Subtrai 64 para verificar se i < 64
JZ /0020 ; Se i == 64, sai do loop
JP /0006 ; Volta para o início do loop

@ /0020
HM /0000 ; Halt (fim da execução)

@ /0100
K /0000 ; i (contador)
K /0000 ; Acumulador da soma
K /0000 ; Local onde serão armazenados os quadrados
K /0001 ; Constante 1 (para incremento)
K /0040 ; Constante 64 (limite do loop)
