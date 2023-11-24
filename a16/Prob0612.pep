            BR          main
limit:      .EQUATE     5           ;constant
number:     .EQUATE     0           ;local #2d

main:       SUBSP       2, i        ;push #number
            DECI        number, s   

while:      LDWA        number, s   ;(number < limit)
            CPWA        limit,  i
            BRGE        endWh
            LDWA        number, s
            ADDA        1,      i
            STWA        number, s
            DECO        number, s
            BR          while

endWh:      ADDSP       2,      i   ;pop #number
            STOP
            .END