@ /0100
N K /0005 ; Número para calcular o fatorial (mude para testar)
RES K /0001 ; Acumulador do fatorial inicializado com 1
PROV K /0000 ; Variável temporária para decrementar
UM K /0001 ; Constante 1 para decremento
RESFINAL K /0000 ; Onde armazenaremos o resultado final

@ /0200
    LD N ; Carrega N
    JZ CASO_ESPECIAL ; Se N == 0, pula para armazenar 1
    MM RES ; Guarda o valor inicial de N em RES
    SB UM ; Decrementa N
    JZ CASO_ESPECIAL ; Se N - 1 == 0 (ou seja, se N == 1), pula para armazenar 1
    SC FAC ; Chama a sub-rotina do fatorial
    LD RES ; Carrega o resultado final
    MM RESFINAL ; Armazena o resultado final em RESFINAL
    HM =0 ; Fim da execução

; =========================
; Sub-rotina para calcular fatorial
; =========================
@ /0250
FAC     MM PROV ; Salva N temporariamente em PROV
LOOP    LD PROV ; Carrega PROV (N, N-1, N-2, ...)
        SB UM ; Decrementa PROV
        JZ RETORNO ; Se PROV == 0, retorna
        MM PROV ; Atualiza PROV com o novo valor decrementado
        LD RES ; Carrega o fatorial parcial
        ML PROV ; Multiplica pelo valor atualizado de N
        MM RES ; Atualiza o valor do fatorial
        JP LOOP ; Volta para continuar a iteração

RETORNO RS FAC ; Retorna ao programa principal

; =========================
; Caso especial: fatorial(0) e fatorial(1)
; =========================
@ /0300
CASO_ESPECIAL   LV =1 ; Carrega o valor fixo 1
                MM RESFINAL ; Armazena 1 como resultado final
                HM =0 ; Halt (fim da execução)