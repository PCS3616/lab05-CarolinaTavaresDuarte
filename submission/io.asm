@ /0000
SC /00E       ; Chama a sub-rotina de leitura e soma
HM /0000      ; Para a execução

@ /000E
K /0000       ; Inicializa variável auxiliar

GD /000       ; Lê os dois primeiros dígitos (X)
JZ /0020      ; Se não houver entrada, pula para evitar erro
SB /108       ; Converte de ASCII para decimal (subtrai 0x3030)
MM /100       ; Armazena X convertido

GD /000       ; Lê o espaço (descarta)
GD /000       ; Lê os últimos dois dígitos (Y)
JZ /0020      ; Se não houver entrada, pula para evitar erro
SB /108       ; Converte de ASCII para decimal
MM /102       ; Armazena Y convertido

LD /100       ; Carrega X convertido
AD /102       ; Soma com Y convertido
MM /104       ; Armazena a soma na posição final
MM /106       ; Salva a soma original em uma memória auxiliar para correção futura

LD /104       ; Carrega a soma para verificar "vai-um"
SB /10A       ; Subtrai 0x000A para ver se o menor dígito >= A
JN /0050      ; Se for negativo, pula e mantém o valor original

LD /106       ; Se precisarmos corrigir, carregamos a soma original
SB /10A       ; Subtrai 0x000A para remover o excesso
AD /10C       ; Soma 0x0100 para aplicar o "vai-um"
MM /104       ; Atualiza o valor corrigido

@ /0050
LD /104       ; Carrega o resultado final
AD /108       ; Converte de volta para ASCII (soma 0x3030)
PD /100       ; Imprime o resultado no monitor

RS /00E       ; Retorna da sub-rotina

@ /0100
K /0000       ; Primeiro número (X)
K /0000       ; Segundo número (Y)
K /0000       ; Resultado da soma
K /0000       ; Memória auxiliar para armazenar a soma original

@ /0108
K /3030       ; Constante ASCII (-0x3030)
K /000A       ; Constante para ajuste do "vai-um"
K /0100       ; Constante para somar 0x0100 no "vai-um")
