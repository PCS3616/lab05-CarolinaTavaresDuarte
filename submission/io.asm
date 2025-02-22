@ /0000
SC /00E  ; Chama a sub-rotina de leitura e soma
HM /0000 ; Halt (fim da execução)

@ /000E
K /0000 ; Endereço de referência

GD /110 ; Lê os dois primeiros dígitos (ex: "07")
SB /108 ; subtrai 0x3030 para converter ASCII para decimal
MM /100 ; Armazena X em ASCII

GD /110 ; Lê os espaços entre os números
GD /110 ; Lê os últimos dois dígitos (ex: "54")
SB /108 ; subtrai 0x3030 para converter ASCII para decimal
MM /102 ; Armazena Y em ASCII

LD /100 ; Carrega X
AD /102 ; Soma Y convertido
MM /104 ; Armazena a soma

LD /104 ; Carrega soma
SB /10A ; Verifica d'igito menos significativo >=A
MM /050 ; Armazena Y convertido

SB /10A 
AD /10C
MM /104 ; Atualiza o resultado da soma

@ /0050
LD /104 ; Carrega o resultado da soma
AD /108 ; Soma 0x3030 para converter de volta para ASCII
PD /110 ; Imprime o resultado no monitor
HM /0000 ; Halt (fim da execução)

@ /0100
K /0000 ; Primeiro número (X)
K /0000 ; Segundo número (Y)
K /0000 ; Resultado da soma

@ /0106
K /3030 ; Constante ASCII para ajuste (-0x3030)
K /000A ; Constante para ajuste do "vai-um" (-0x000A)
K /0100 ; Constante para somar 0x0100 no "vai-um"