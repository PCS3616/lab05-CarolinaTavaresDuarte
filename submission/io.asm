@ /0000
SC /00E       ; Chama a sub-rotina de leitura e soma
HM /0000      ; Halt (fim da execução)

@ /000E
K /0000       ; Endereço de referência

GD /000       ; Lê os dois primeiros dígitos (X)
SB /108       ; Subtrai 0x3030 para converter de ASCII para decimal
MM /100       ; Armazena X convertido

GD /000       ; Lê os espaços entre os números (descarta)
MM /10E       ; armazena os espaços
GD /000       ; Lê os últimos dois dígitos (Y)
MM /102       ; armazena Y
LD /102       ; carreguei Y
SB /108       ; Subtrai 0x3030 para converter de ASCII para decimal
MM /102       ; Armazena Y convertido

LD /100       ; Carrega X convertido
AD /102       ; Soma com Y convertido
MM /10C       ; Armazena o resultado da soma
MM /104       ; armazena o auxiliar da soma

LD /10C       ; Carrega o resultado
SB /10A       ; Verifica se o dígito menos significativo >= A
JN /0050      ; Se não precisar de ajuste, pula

SB /10A       ; Subtrai 0x000A (corrige o "vai-um")
AD /10C       ; Soma 0x0100 para o "vai-um"
MM /104       ; Atualiza o resultado
LD /104       ; carreguei o resultado
AD /108       ; adicionar para o algoritmo
PD /100       ; printei o final
RS /00E

@ /0050
LD /104       ; Carrega o resultado final
AD /108       ; Soma 0x3030 para converter de volta para ASCII
PD /100       ; Imprime o resultado no monitor

RS /00E       ; Retorna da sub-rotina

@ /0100
K /0000       ; Primeiro número (X)
K /0000       ; Segundo número (Y)
K /0000       ; Resultado da soma

@ /0106
K /3030       ; Constante ASCII (-0x3030)
K /000A       ; Constante para ajuste do "vai-um"
K /0100       ; Constante para somar 0x0100 no "vai-um"
K /0000       ; memoria auxiliar
k /0000       ; espaços veja esse
