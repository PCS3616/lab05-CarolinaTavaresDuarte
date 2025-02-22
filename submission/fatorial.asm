@ /0000
LD N            ; Carrega N da posição 0x100
JZ CASO1        ; Se N == 0, pula para tratar fatorial = 1
SB UM           ; Subtrai 1 (agora o acumulador tem N - 1)
JZ CASO1        ; Se N - 1 == 0 (ou seja, se N == 1), pula para tratar fatorial = 1
SC /00C         ; Chama a sub-rotina de fatorial
HM /0000        ; Halt (fim da execução)

@ /000C
K /0000
LD N            ; Carrega N da posição 0x100
MM FAT          ; Atualiza N na memória 0x104
LD N            ; Carrega N da posição 0x100
SB UM           ; Decrementa N
MM AUX          ; Armazena na variável auxiliar
SB UM           ; Subtrai de novo para ver se o novo N era 1
JZ FIM_SUB      ; Se tinhamos N == 1, sai do laço

LD FAT          ; Carrega o fatorial parcial
ML AUX          ; Multiplica pelo valor atualizado de N
MM FAT          ; Armazena o novo fatorial
JP /012         ; Volta para continuar a iteração

@ /0024
FIM_SUB LD FAT  ; Carrega o fatorial calculado
MM RES          ; Armazena o resultado na posição 0x102
RS /00C         ; Retorna ao programa principal

@ /002A
CASO1 LV =1     ; Carrega o valor fixo 1
MM RES          ; Armazena 1 na posição 0x102
HM /0000        ; Halt (fim da execução)

@ /0100
N K /0005       ; N (valor inicial, pode ser alterado para testar)
RES K /0000     ; Local onde o fatorial será armazenado
FAT K /0000     ; Acumulador do fatorial
UM K /0001      ; Constante 1 (usada no decremento)
AUX K /0000     ; Variável auxiliar