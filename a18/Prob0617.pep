            BR          main

;***************
age:        .EQUATE     4                   ;formal parameter #2d
nextYr:     .EQUATE     0                   ;local variable #2d
putNext:    SUBSP       2,          i       ;push #nextYr
            LDWA        age,        s  
            ADDA        1,          i
            STWA        nextYr,     s       ;nextYr = age + 1
            STRO        printf1,    d 
            DECO        age,        s 
            LDBA        "\n",       i
            STBA        0xFC16,     d
            STRO        printf2,    d 
            DECO        nextYr,     s
            STBA        0xFC16,     d
            ADDSP       2,          i       ;pop #nextYr
            RET
printf1:    .ASCII      "Age: \x00"
printf2:    .ASCII      "Age next year: \x00"



;***************
myAge:      .EQUATE     0                   ;local variable #2d
main:       SUBSP       2,      i           ;push #myAge
            DECI        myAge,  s
            LDWA        myAge,  s
            STWA        -2,     s 
            SUBSP       2,      i           ;push #age
            CALL        putNext
            ADDSP       2,      i           ;pop #age
            LDWA        64,     i
            STWA        -2,     s
            SUBSP       2,      i           ;push #age
            CALL        putNext
            ADDSP       4,      i           ;pop #age #myAge 
            STOP
            .END 