@ /0000
SC /00E       ; Chama a sub-rotina para processar a entrada
HM /0000      ; Para a execução

@ /000E
K /0000       ; Inicializa variável auxiliar

GD /000       ; Lê os primeiros dois dígitos (X)
SB /108       ; Converte de ASCII para decimal
MM /100       ; Armazena X na memória

GD /000       ; Lê e ignora os espaços entre os números
GD /000       ; Lê os últimos dois dígitos (Y)
SB /108       ; Converte de ASCII para decimal
MM /102       ; Armazena Y na memória

LD /100       ; Carrega X
AD /102       ; Soma X + Y
MM /104       ; Armazena a soma no endereço temporário
MM /106       ; Salva o valor original antes da verificação do "vai-um"

LD /104       ; Carrega a soma para verificação do "vai-um"
ML /10A       ; Separa o menor dígito da soma
SB /10C       ; Subtrai 0x000A para verificar necessidade de ajuste
JN /0050      ; Se for menor, não precisa de ajuste, pula

LD /106       ; Recupera o valor original antes da subtração
SB /10C       ; Corrige o excesso
AD /10E       ; Adiciona 0x0100 para o "vai-um"
MM /104       ; Atualiza a soma corrigida

@ /0050
LD /104       ; Carrega o resultado corrigido
AD /108       ; Converte de volta para ASCII
PD /100       ; Imprime no monitor

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
