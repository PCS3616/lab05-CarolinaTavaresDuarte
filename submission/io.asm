@ /0000
SC /00E  ; Chama a sub-rotina de leitura e soma
HM /0000 ; Halt (fim da execução)

@ /000E
K /0000 ; Endereço de referência

GD /110 ; Lê os dois primeiros dígitos (ex: "07")
MM /100 ; Armazena X em ASCII

GD /110 ; Lê os espaços entre os números
GD /110 ; Lê os últimos dois dígitos (ex: "54")
MM /102 ; Armazena Y em ASCII

LD /100 ; Carrega X
SB /108 ; Subtrai 0x3030 para converter de ASCII para decimal
MM /100 ; Armazena X convertido

LD /102 ; Carrega Y
SB /108 ; Subtrai 0x3030 para converter de ASCII para decimal
MM /102 ; Armazena Y convertido

LD /100 ; Carrega X convertido
AD /102 ; Soma com Y convertido
MM /104 ; Armazena o resultado da soma

LD /104 ; Carrega o resultado
SB /10A ; Verifica se o dígito menos significativo >= A
JZ /050 ; Se não precisar de ajuste, pula

SB /10A ; Subtrai 0x000A (corrige o "vai-um")
AD /10C ; Soma 0x0100 para o "vai-um"
MM /104 ; Atualiza o resultado

@ /0050
LD /104 ; Carrega o resultado da soma
AD /108 ; Soma 0x3030 para converter de volta para ASCII
PD /112 ; Imprime o resultado no monitor
HM /0000 ; Halt (fim da execução)

@ /0100
K /0000 ; Primeiro número (X)
K /0000 ; Segundo número (Y)
K /0000 ; Resultado da soma

@ /0106
K /3030 ; Constante ASCII para ajuste (-0x3030)
K /000A ; Constante para ajuste do "vai-um" (-0x000A)
K /0100 ; Constante para somar 0x0100 no "vai-um"