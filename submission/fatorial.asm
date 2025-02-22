@ /0000
LD /100        ; Carrega N da posição 0x100
JZ /02A        ; Se N == 0, pula para tratar fatorial = 1
SB /106        ; Subtrai 1 (agora o acumulador tem N - 1)
JZ /02A        ; Se N - 1 == 0 (ou seja, se N == 1), pula para tratar fatorial = 1
SC /00C        ; Chama a sub-rotina de fatorial
HM /0000       ; Halt (fim da execução)

@ /000C
K /0000
LD /100        ; Carrega N da posição 0x100
MM /104        ; Atualiza N na memória 0x104
LD /100        ; Carrega N da posição 0x100
SB /106        ; Decrementa N
MM /100        ; Armazena na variável auxiliar
SB /106        ; Subtrai de novo para ver se o novo N era 1
JZ /024        ; Se tinhamos N == 1, sai do laço

LD /104         ; Carrega o fatorial parcial
ML /100         ; Multiplica pelo valor atualizado de N
MM /104         ; Armazena o novo fatorial
JP /012         ; Volta para continuar a iteração

@ /0024
LD /104         ; Carrega o fatorial calculado
MM /102         ; Armazena o resultado na posição 0x102
RS /00C         ; Retorna ao programa principal

@ /002A
LD /106         ; Carrega o valor fixo 1
MM /102         ; Armazena 1 na posição 0x102
HM /0000        ; Halt (fim da execução)

@ /0100
K /0005         ; N (valor inicial, pode ser alterado para testar)
K /0000         ; Local onde o fatorial será armazenado
K /0000         ; Acumulador do fatorial
K /0001         ; Constante 1 (usada no decremento)
K /0000         ; Variável auxiliar