*-----------------------------------------------------------
* Title      :lauflicht 2 leds
* Written by :alen l
* Date       :
* Description:2 leds gleichzeitig vom links und rechts gegeneinander
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

led_address     equ     $E00010     *constante led_adresse = $E00010
delay_time      equ     25*1000    *constante delay_time = 100000 (dez)

    move.b  #129,d0
    move.b  #1,d1
    move.b  #128,d2
    
loop:
    move.l  #delay_time,d3
    move.b  d0,led_address
    rol.b   #1,d1
    ror.b   #1,d2
    move.b  d1,d0
    add.b   d2,d0
    
    bsr     delay           *jump in subroutine
    
    bra     loop            *branch to loop

    SIMHALT             ; halt simulator

* Put variables and constants here

delay:
    sub.l   #1,d3   
    cmp.l   #0,d3   *compare d3 mit 0
    bne     delay   *wenn nicht 0 == d3 jump zu delay
    rts             *sonst jump aus subroutine raus



    END    START        ; last line of source







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
