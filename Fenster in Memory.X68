*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :  01.11.2023

* Description:  Store a 2d array (6x6 bytes) of #00 in the memory beginnig @ mem adress $1054 to $10BA
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    move.b  #0,d0       *byte Wert 0 ins Register d0 speichern
    move.l  #$1054,A0   *long Wert 0x1054 ins Register A0 speichern
    move.b  #0,d1       *byte Wert 0 ins Register d0 speichern
    move.b  #6,d2       *byte Wert 6 ins Register d2 speichern
    
loop1:    
    move.b  d1,(A0)+    *schreibe wert von register d1 auf die memory adresse A0 und inkrementiere dan den adresswert
    cmp.b   #6,d0       *vergleiche wert aus register d0 mit 6
    beq loop2           *wenn d0 == 6 dann springe in loop2
    
    add.b   #1,d0       *addiere 1 zu dem register d0
    bra loop1           *springe zum anfang vom loop1    
    
loop2:
    add.l  #$9,A0       *addiere 9 zum register A0
    move.b  #0,d0       *setzte register d0 zurrück auf den wert 0
    cmp.b   #0,d2       *vergleiche register d2 mit 0
    bls     end         *wenn d2 < 0 dann springe zu end:
    
    sub.b   #1,d2       *subtrahiere 1 vom register d2
    bra loop1            *springe zum anfang von loop1

end:                    *
    lea     $1054,A1    *schreibt den wert aus speicheradresse $1054 ins register A1
    
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
