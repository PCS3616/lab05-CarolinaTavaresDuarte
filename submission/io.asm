@ /0000
SC /00E       ; Chama a sub-rotina de leitura e soma
HM /0000      ; Halt (fim da execução)

@ /000E
K /0000       ; Endereço de referência

GD /000       ; Lê os dois primeiros dígitos (X)
SB /106       ; Subtrai 0x3030 para converter de ASCII para decimal
MM /100       ; Armazena X convertido

GD /000       ; Lê os espaços entre os números (descarta)
MM /10E       ; armazena os espaços
GD /000       ; Lê os últimos dois dígitos (Y)
MM /102       ; armazena Y
SB /106       ; Subtrai 0x3030 para converter de ASCII para decimal
MM /102       ; Armazena Y convertido

LD /100       ; Carrega X convertido
AD /102       ; Soma com Y convertido
MM /10C       ; Armazena o resultado da soma
MM /104       ; armazena o auxiliar da soma

LD /10C       ; Carrega o resultado
SB /108       ; Verifica se o dígito menos significativo >= A
JN /050      ; Se não precisar de ajuste, pula

AD /10A       ; Soma 0x0100 para o "vai-um"
MM /104       ; Atualiza o resultado
LD /104       ; carreguei o resultado
AD /106       ; adicionar para o algoritmo
PD /100       ; printei o final
RS /00E

@ /0050
LD /104       ; Carrega o resultado final
AD /106       ; Soma 0x3030 para converter de volta para ASCII
PD /100       ; Imprime o resultado no monitor
RS /00E       ; Retorna da sub-rotina

@ /0100
K /0000       ; Primeiro número (X) (100)
K /0000       ; Segundo número (Y) (102)
K /0000       ; Resultado da soma (104)

@ /0106
K /3030       ; Constante ASCII (-0x3030) (106)
K /000A       ; Constante para ajuste do "vai-um" (108)
K /0100       ; Constante para somar 0x0100 no "vai-um" (10A)
K /0000       ; memoria auxiliar (10C)
k /0000       ; espaços (10E)
