                call dirvideo
                mov di,offset buffer
                mov si,0
                mov cx,2000
guarfil:        mov ax,es:[si]
                mov ds:[di],ax
                add di,2
                add si,2
                loop guarfil
inicio:         call fondopagina
                mov bh,0eh
                mov cx,710h
                mov dx,113fh
                int 10h
                mov dx,0
                call posicion
                mov dx,menu
                call despliegue
                mov dh,10
                call mover
tecla:          mov ah,0
                int 16h
                cmp ah,48h
                jne s1
                call arriba
                jmp tecla
        s1:     cmp ah,50h
                jne s2
                call abajo
                jmp tecla
        s2:     cmp ah,1ch
                je entrar
                jmp tecla
entrar:         cmp dh,10
                jne e1
                call TECLADO
        e1:     cmp dh,11
                jne e2
                call MOUSE1
        e2:     cmp dh,12
                jne e3
                call GRAFICO
        e3:     cmp dh,13
                jne e4
                call VIDEO
        e4:     cmp dh,14
                jne e5
                call RELOJ1
        e5:     cmp dh,15
                jne e6
                call CREDITOS
        e6:     cmp dh,16
                jne e7
                call FIN
        e7:     ret
arriba:         cmp dh,10
                jne a1
                call borrar
                mov dh,16
                call mover
                ret
        a1:     cmp dh,16
                jne a2
                call borrar
                dec dh
                call mover
                ret
        a2:     cmp dh,15
                jne a3
                call borrar
                dec dh
                call mover
                ret
        a3:     cmp dh,14
                jne a4
                call borrar
                dec dh
                call mover
                ret
        a4:     cmp dh,13
                jne a5
                call borrar
                dec dh
                call mover
                ret
        a5:     cmp dh,12
                jne a6
                call borrar
                dec dh
                call mover
                ret
        a6:     cmp dh,11
                jne a7
                call borrar
                dec dh
                call mover
        a7:     ret
abajo:          cmp dh,16
                jne b1
                call borrar
                mov dh,10
                call mover
                ret
        b1:     cmp dh,10
                jne b2
                call borrar
                inc dh
                call mover
                ret
        b2:     cmp dh,11
                jne b3
                call borrar
                inc dh
                call mover
                ret
        b3:     cmp dh,12
                jne b4
                call borrar
                inc dh
                call mover
                ret
        b4:     cmp dh,13
                jne b5
                call borrar
                inc dh
                call mover
                ret
        b5:     cmp dh,14
                jne b6
                call borrar
                inc dh
                call mover
                ret
        b6:     cmp dh,15
                jne b7
                call borrar
                inc dh
                call mover
        b7:     ret
aoffset:        mov al,dh
                mov dh,0
                mov bl,80
                mul bl
                add ax,dx
                add ax,ax
                mov si,ax
                inc si
                ret
mover:          mov dl,21
                call posicion
                push dx         
                call aoffset
                call dirvideo
                mov al,4eh
                mov cx,36
         p1:    mov [es:si],al
                add si,2
                loop p1
                pop dx
                ret
borrar:         mov dl,21
                call posicion
                push dx         
                call aoffset
                call dirvideo
                mov al,0eh
                mov cx,36
         p2:    mov [es:si],al
                add si,2
                loop p2
                pop dx
                ret
fondopagina:    mov ax,600h
                mov bh,47h
                mov cx,0
                mov dx,074fh
                int 10h
                mov bh,67h
                mov cx,800h
                mov dx,104fh
                int 10h
                mov bh,17h
                mov cx,1100h
                mov dx,184fh
                int 10h
                ret
fondopagina1:    mov ax,600h
                mov bh,47h
                mov cx,0
                mov dx,074fh
                int 10h
                mov bh,67h
                mov cx,800h
                mov dx,104fh
                int 10h
                mov bh,17h
                mov cx,1100h
                mov dx,184fh
                int 10h
                ret
teclado:        mov bh,03h
                call limpiar
                mov cx,0e16h
                mov dx,184dh
                mov bh,0eh
                int 10h
                mov dx,0
                call posicion
                mov dx,dteclado
                call despliegue
tecla2:         MOV AH,10h
                INT 16H
                CMP AH,01h
                JNE T1
                CALL T_Esc                
        T1:     CMP AH,3BH
                JNE T2
                CALL T_F1
        T2:     CMP AH,3CH
                JNE T3
                CALL T_F2
        T3:     CMP AH,3DH
                JNE T4
                CALL T_F3
        T4:     CMP AH,3EH
                JNE T5
                CALL T_F4
        T5:     CMP AH,3FH
                JNE T6
                CALL T_F5
        T6:     CMP AH,40H
                JNE T7
                CALL T_F6
        T7:     CMP AH,41H
                JNE T8
                CALL T_F7
        T8:     CMP AH,42H
                JNE T9
                CALL T_F8
        T9:     CMP AH,43H
                JNE T10
                CALL T_F9
        T10:    CMP AH,44H
                JNE T11
                CALL T_F10
        T11:    CMP AH,85H
                JNE T12
                CALL T_F11
        T12:    CMP AH,86H
                JNE T13
                CALL T_F12
        T13:    CMP AH,72h      
                JNE T15
                cmp al,00h
                jne t15
                CALL T_IMPR
        T15:    CMP AH,00      
                JNE T16
                cmp al,00h
                jne t16
                CALL T_PAUSA
        T16:    CMP AH,29H
                JNE T17
                CALL T_AF4
        T17:    CMP AH,02H
                JNE T18
                CALL T_1A
        T18:    CMP AH,03H
                JNE T19
                CALL T_2A
        T19:    CMP AH,04H
                JNE T20
                CALL T_3A
        T20:    CMP AH,05H
                JNE T21
                CALL T_4A
        T21:    CMP AH,06H
                JNE T22
                CALL T_5A
        T22:    CMP AH,07H
                JNE T23
                CALL T_6A
        T23:    CMP AH,08H
                JNE T24
                CALL T_7A
        T24:    CMP AH,09H
                JNE T25
                CALL T_8A
        T25:    CMP AH,0AH
                JNE T26
                CALL T_9A
        T26:    CMP AH,0BH
                JNE T27
                cmp al,30h
                jne t27
                CALL T_0A
        T27:    CMP AH,0CH      
                JNE T28
                CALL T_?
        T28:    CMP AH,0DH
                JNE T29
                CALL T_F47
        T29:    CMP AH,0EH
                JNE T30
                CALL T_DEL
        T30:    CMP AH,0FH
                JNE T31
                cmp al,9
                jne t31
                CALL T_TAB
        T31:    CMP Ah,10H
                JNE T32
                CALL T_Q
        T32:    CMP AH,11H
                JNE T33
                CALL T_W
        T33:    CMP AH,12H
                JNE T34
                CALL T_E
        T34:    CMP AH,13H
                JNE T35
                CALL T_R
        T35:    CMP AH,14H
                JNE T36
                CALL T_T
        T36:    CMP AH,15H
                JNE T37
                CALL T_Y
        T37:    CMP AH,16H
                JNE T38
                CALL T_U
        T38:    CMP AH,17H
                JNE T39
                CALL T_I
        T39:    CMP AH,18H
                JNE T40
                CALL T_O
        T40:    CMP AH,19H
                JNE T41
                CALL T_P
        T41:    CMP AH,1AH      
                JNE T42
                cmp al,1bh
                jne t42
                CALL T_F49 ;[
        T42:    CMP AH,1BH      
                JNE T43
                CALL T_F53
        T43:    CMP AH,1CH
                JNE T45
                CALL T_ENTER
        T45:    CMP AH,1EH
                JNE T46
                CALL T_A
        T46:    CMP AH,1FH
                JNE T47
                cmp al,73h
                JNE SSS1
                CALL T_S
           SSS1:CMP AL,53H
                jne t47
                CALL T_S
        T47:    CMP AH,20H
                JNE T48
                CALL T_D
        T48:    CMP AH,21H
                JNE T49
                CALL T_F
        T49:    CMP AH,22H
                JNE T50
                CALL T_G
        T50:    CMP AH,23H
                JNE T51
                CALL T_H
        T51:    CMP AH,24H
                JNE T52
                CALL T_J
        T52:    CMP AH,25H
                JNE T53
                CALL T_K
        T53:    CMP AH,26H
                JNE T54
                CALL T_L
        T54:    CMP AH,27H      
                JNE T55
                CALL T_F46 ;¤
        T55:    CMP AH,28H      
                JNE T56
                cmp al,7bh
                jne t123
                CALL T_F50
                JMP T56
           t123:cmp al,00h
                jne t56
                CALL T_F50 ;{
        T56:    CMP AH,2BH      
                JNE T58
                CALL T_F54 ;‡ 
        T58:    CMP AH,56H  
                JNE T59
                CALL T_AF8 ;< 
        T59:    CMP AH,2CH
                JNE T60
                CALL T_Z
        T60:    CMP AH,2DH
                JNE T61
                CALL T_X
        T61:    CMP AH,2EH
                JNE T62
                CALL T_C
        T62:    CMP AH,2FH
                JNE T63
                CALL T_V
        T63:    CMP AH,30H
                JNE T64
                CALL T_B
        T64:    CMP AH,31H
                JNE T65
                CALL T_N
        T65:    CMP AH,32H
                JNE T66
                CALL T_M
        T66:    CMP AH,33H      
                JNE T67
                CALL T_F40 ;;
        T67:    CMP AH,34H      
                JNE T68
                CALL T_F44 ;.
        T68:    CMP AH,35H
                JNE T69
                CALL T_A_  ;-
        T69:    CMP AH,0fH      
                JNE T70
                cmp al,00h
                jne T70
                CALL T_SHIFT
        T70:    CMP AH,94H
                JNE T71
                cmp al,00h
                jne t71
                CALL T_CTRL
        T71:    CMP AH,0b7h       
                JNE T72
                CALL T_WINder
        T72:    CMP AH,0A5H 
                JNE T73
                cmp al,00h
                jne t73
                call T_ALT
        T73:    CMP AH,39H
                JNE T75
                CALL T_ESPACIO
        T75:    CMP AH,0b6h       
                JNE T76
                CALL T_WIN
        T76:    CMP AH,0B8H
                JNE T78
                CALL T_MOUSE
        T78:    CMP AH,52H
                JNE T79
                cmp al,0e0h
                jne t79
                CALL T_INSERT
        T79:    CMP AH,47H
                JNE T80
                cmp al,0e0h
                jne t80
                CALL T_INICIO
        T80:    CMP AH,49H
                JNE T81
                cmp al,0e0h
                jne t81
                CALL T_REPAG
        T81:    CMP AH,53H
                JNE T82
                cmp al,0e0h
                jne t82
                CALL T_SUPRIMIR
        T82:    CMP AH,4FH
                JNE T83
                cmp al,0e0h
                jne t83
                CALL T_FIN
        T83:    CMP AH,51H
                JNE T84
                cmp al,0e0h
                jne t84
                CALL T_AVPAG
        T84:    CMP AH,48H
                JNE T85
                cmp al,0e0h
                jne t85
                CALL T_ARRIBA
        T85:    CMP AH,4BH
                JNE T86
                cmp al,0e0h
                jne t86
                CALL T_IZQUIERDA
        T86:    CMP AH,50H
                JNE T87
                cmp al,0e0h
                jne t87
                CALL T_ABAJO
        T87:    CMP AH,4DH
                JNE T89
                cmp al,0e0h
                jne t89
                CALL T_DERECHA
        T89:    CMP AL,2FH      
                JNE T90
                CALL T_F16 ;/
        T90:    cmp ah,37h
                jne t91
                CMP Al,2AH
                JNE T91
                CALL T_F20 ;*
        T91:    CMP AL,2DH
                JNE T92
                CALL T_F24 ;-
        T92:    CMP AH,47H
                JNE T93
                cmp al,37h
                je cu7
                cmp al,0
                jne t93
           cu7: CALL T_7
        T93:    CMP AH,48H
                JNE T94
                cmp al,38h
                je cu8
                cmp al,0
                jne t94
           cu8: CALL T_8
        T94:    CMP AH,49H
                JNE T95
                cmp al,39h
                je cu9
                cmp al,0
                jne t95
           cu9: CALL T_9
        T95:    CMP AL,2BH
                JNE T96
                CALL T_F18 ;+
        T96:    CMP AH,4BH
                JNE T97
                cmp al,34h
                je cu4
                cmp al,0
                jne t97
           cu4: CALL T_4
        T97:    CMP AH,4CH
                JNE T98
                cmp al,35h
                je cu5
                cmp al,0
                jne t98
           cu5: CALL T_5
        T98:    CMP AH,4DH
                JNE T99
                cmp al,36h
                je cu6
                cmp al,0
                jne t99
           cu6: CALL T_6
        T99:    CMP AH,4FH
                JNE T100
                cmp al,31h
                je cu1
                cmp al,0
                jne t100
           cu1: CALL T_1
        T100:   CMP AH,50H
                JNE T101
                cmp al,32h
                je cu2
                cmp al,0
                jne t101
           cu2: CALL T_2
        T101:   CMP AH,51H
                JNE T102
                cmp al,33h
                je cu3
                cmp al,0
                jne t102
           cu3: CALL T_3
        T102:   CMP AL,0DH
                JNE T103
                CALL T_INTRO
        T103:   CMP AH,52H
                JNE T104
                cmp al,30h
                je cu0
                cmp al,0
                jne t104
           cu0: CALL T_0Y
        T104:   CMP AH,53H
                JNE T105
                cmp al,2eh
                je cu
                cmp al,0
                jne t105
            cu: CALL T_F23  ;.
        T105:   cmp ah,1fh
                jne t106
                cmp al,13h
                jne t106
                call inicio
        t106:   CALL tecla2
T_ESC:          MOV DX,0103H
                call pregunta1
T_F1:           MOV DX,010BH
                call pregunta
T_F2:           MOV DX,010FH
                call pregunta
T_F3:           MOV DX,0113H
                call pregunta
T_F4:           MOV DX,0117H
                call pregunta
T_F5:           MOV DX,011DH
                call pregunta
T_F6:           MOV DX,0121H
                call pregunta
T_F7:           MOV DX,0125H
                call pregunta
T_F8:           MOV DX,0129H
                call pregunta
T_F9:           MOV DX,012FH
                call pregunta
T_F10:          MOV DX,0133H
                call pregunta
T_F11:          MOV DX,0137H
                call pregunta
T_F12:          MOV DX,013bH
                call pregunta
T_IMPR:         MOV DX,0142H
                call pregunta
T_BLOQ:         MOV DX,0146H
                call pregunta
T_PAUSA:        MOV DX,014AH
                call pregunta
T_AF4:          MOV DX,0403H
                call pregunta
T_1A:           MOV DX,0407H
                call pregunta
T_2A:           MOV DX,040BH
                call pregunta
T_3A:           MOV DX,040FH
                call pregunta
T_4A:           MOV DX,0413H
                call pregunta
T_5A:           MOV DX,0417H
                call pregunta
T_6A:           MOV DX,041BH
                call pregunta
T_7A:           MOV DX,041FH
                call pregunta
T_8A:           MOV DX,0423H
                call pregunta
T_9A:           MOV DX,0427H
                call pregunta
T_0A:           MOV DX,042BH
                call pregunta
T_?:            MOV DX,042FH
                call pregunta
T_F47:          MOV DX,0433H
                call pregunta
T_DEL:          MOV DX,0439H
                call pregunta
T_TAB:          MOV DX,0604H
                call pregunta
T_Q:            MOV DX,0609H
                cmp al,71h
                jne qq
                call pregunta
        qq:     cmp al,51h
                jne qqq        
                call mayus_letra
       qqq:     CALL TECLA2
T_W:            MOV DX,060DH
                cmp al,77h
                jne ww
                call pregunta
        ww:     cmp al,57h
                jne www        
                call mayus_letra
       www:     CALL TECLA2
T_E:            MOV DX,0611H
                cmp al,65h
                jne ee
                call pregunta
        ee:     cmp al,45h
                jne eee        
                call mayus_letra
       eee:     CALL TECLA2
T_R:            MOV DX,0615H
                cmp al,72h
                jne rr
                call pregunta
        rr:     cmp al,52h
                jne rrr        
                call mayus_letra
       rrr:     CALL TECLA2
T_T:            MOV DX,0619H
                cmp al,74h
                jne tt
                call pregunta
        tt:     cmp al,54h
                jne ttt        
                call mayus_letra
       ttt:     CALL TECLA2
T_Y:            MOV DX,061Dh
                cmp al,79h
                jne yy
                call pregunta
        yy:     cmp al,59h
                jne yyy        
                call mayus_letra
       yyy:     CALL TECLA2
T_U:            MOV DX,0621H
                cmp al,75h
                jne uu
                call pregunta
        uu:     cmp al,55h
                jne uuu        
                call mayus_letra
       uuu:     CALL TECLA2
T_I:            MOV DX,0625H
                cmp al,69h
                jne ii
                call pregunta
        ii:     cmp al,49h
                jne iii        
                call mayus_letra
       iii:     CALL TECLA2
T_O:            MOV DX,0629H
                cmp al,6fh
                jne oo
                call pregunta
        oo:     cmp al,4fh
                jne ooo        
                call mayus_letra
       ooo:     CALL TECLA2
T_P:            MOV DX,062DH
                cmp al,70h
                jne pp
                call pregunta
        pp:     cmp al,50h
                jne ppp        
                call mayus_letra
       ppp:     CALL TECLA2
T_F49:          MOV DX,0631H
                call pregunta
T_F53:          MOV DX,0635H
                call pregunta
T_ENTER:        MOV DX,063aH
                call pregunta2
T_MAYUS:        MOV DX,0806H
                call pregunta
T_A:            MOV DX,080AH
                cmp al,61h
                jne aa
                call pregunta
        aa:     cmp al,41h
                jne Aa1
                call mayus_letra
       aa1:     CALL TECLA2
T_S:            MOV DX,080EH
                cmp al,73h
                jne ss1
                call pregunta
        ss1:    cmp al,53h
                jne sss        
                call mayus_letra
       sss:     CALL TECLA2
T_D:            MOV DX,0812H
                cmp al,64h
                jne dd1
                call pregunta
        dd1:    cmp al,44h
                jne ddd        
                call mayus_letra
       ddd:     CALL TECLA2
T_F:            MOV DX,0816H
                cmp al,66h
                jne ff
                call pregunta
        ff:     cmp al,46h
                jne fff        
                call mayus_letra
       fff:     CALL TECLA2
T_G:            MOV DX,081AH
                cmp al,67h
                jne gg
                call pregunta
        gg:     cmp al,47h
                jne ggg        
                call mayus_letra
       ggg:     CALL TECLA2
T_H:            MOV DX,081EH
                cmp al,68h
                jne hh
                call pregunta
        hh:     cmp al,48h
                jne hhh        
                call mayus_letra
       hhh:     CALL TECLA2
T_J:            MOV DX,0822H
                cmp al,6ah
                jne jj
                call pregunta
        jj:     cmp al,4ah
                jne jjj        
                call mayus_letra
       jjj:     CALL TECLA2
T_K:            MOV DX,0826H
                cmp al,6bh
                jne kk
                call pregunta
        kk:     cmp al,4bh
                jne kkk        
                call mayus_letra
       kkk:     CALL TECLA2
T_L:            MOV DX,082AH
                cmp al,6ch
                jne ll
                call pregunta
        ll:     cmp al,4ch
                jne lll        
                call mayus_letra
       lll:     CALL TECLA2
T_F46:          MOV DX,082EH
                cmp al,0a4h
                jne Fn1
                call pregunta
        Fn1:    cmp al,0a5h
                jne fn11        
                call mayus_letra
       Fn11:    CALL TECLA2
T_F50:          MOV DX,0832H
                call pregunta
T_F54:          MOV DX,0836H
                call pregunta
T_SHIFT:        MOV DX,0A03H
                call pregunta5
T_AF8:          MOV DX,0A08H
                call pregunta
T_Z:            MOV DX,0A0CH
                cmp al,7ah
                jne zz
                call pregunta
        zz:     cmp al,5ah
                jne zzz        
                call mayus_letra
       zzz:     CALL TECLA2
T_X:            MOV DX,0A10H
                cmp al,78h
                jne xx
                call pregunta
        xx:     cmp al,58h
                jne xxx        
                call mayus_letra
       xxx:     CALL TECLA2
T_C:            MOV DX,0A14H
                cmp al,63h
                jne cc
                call pregunta
        cc:     cmp al,43h
                jne ccc        
                call mayus_letra
       ccc:     CALL TECLA2
T_V:            MOV DX,0A18H
                cmp al,76h
                jne vv
                call pregunta
        vv:     cmp al,56h
                jne vvv        
                call mayus_letra
       vvv:     CALL TECLA2
T_B:            MOV DX,0A1CH
                cmp al,62h
                jne bb
                call pregunta
        bb:     cmp al,42h
                jne bbb        
                call mayus_letra
       bbb:     CALL TECLA2
T_N:            MOV DX,0A20H
                cmp al,6eh
                jne nn
                call pregunta
        nn:     cmp al,4eh
                jne nnn        
                call mayus_letra
       nnn:     CALL TECLA2
T_M:            MOV DX,0A24H
                cmp al,6dh
                jne mm
                call pregunta
        mm:     cmp al,4dh
                jne mmm        
                call mayus_letra
       mmm:     CALL TECLA2
T_F40:          MOV DX,0A28H
                call pregunta
T_F44:          MOV DX,0A2CH
                call pregunta
T_A_:           MOV DX,0A30H
                call pregunta
T_CTRL:         MOV DX,0C03H
                call pregunta3
T_WIN:          MOV DX,0C08H
                call pregunta1
T_ALT:          MOV DX,0C0DH
                call pregunta4
T_ESPACIO:      MOV DX,0C1CH
                call pregunta
T_WINDER:       MOV DX,0C30H
                call pregunta1
T_MOUSE:        MOV DX,0C35H
                call pregunta1
T_INSERT:       MOV DX,0442H
                call pregunta
T_INICIO:       MOV DX,0446H
                call pregunta
T_REPAG:        MOV DX,044AH
                call pregunta
T_SUPRIMIR:     MOV DX,0642H
                call pregunta
T_FIN:          MOV DX,0646H
                call pregunta
T_AVPAG:        MOV DX,064AH
                call pregunta
T_ARRIBA:       MOV DX,0A46H
                call pregunta
T_IZQUIERDA:    MOV DX,0C42H
                call pregunta
T_ABAJO:        MOV DX,0C46H
                call pregunta
T_DERECHA:      MOV DX,0C4AH
                call pregunta
T_F16:          MOV DX,0F08H
                call pregunta
T_F20:          MOV DX,0F0cH
                call pregunta
T_F24:          MOV DX,0F10H
                call pregunta
T_7:            MOV DX,1104H
                cmp al,00h
                jne w7
                call pregunta
        w7:     cmp al,37h
                jne ww7        
                call num_letra
       ww7:     CALL TECLA2
T_8:            MOV DX,1108H
                cmp al,00h
                jne w8
                call pregunta
        w8:     cmp al,38h
                jne ww8        
                call num_letra
       ww8:     CALL TECLA2
T_9:            MOV DX,110cH
                cmp al,00h
                jne w9
                call pregunta
        w9:     cmp al,39h
                jne ww9        
                call num_letra
       ww9:     CALL TECLA2
T_F18:          MOV DX,1210H
                call pregunta
T_4:            MOV DX,1304H
                cmp al,00h
                jne w4
                call pregunta
        w4:     cmp al,34h
                jne ww4        
                call num_letra
       ww4:     CALL TECLA2
T_5:            MOV DX,1308H
                cmp al,00h
                jne w5
                call pregunta
        w5:     cmp al,35h
                jne ww5        
                call num_letra
       ww5:     CALL TECLA2
T_6:            MOV DX,130cH
                cmp al,00h
                jne w6
                call pregunta
        w6:     cmp al,36h
                jne ww6 
                call num_letra
       ww6:     CALL TECLA2
T_1:            MOV DX,1504H
                cmp al,00h
                jne w1
                call pregunta
        w1:     cmp al,31h
                jne ww1        
                call num_letra
       ww1:     CALL TECLA2
T_2:            MOV DX,1508H
                cmp al,00h
                jne w2
                call pregunta
        w2:     cmp al,32h
                jne ww2        
                call num_letra
       ww2:     CALL TECLA2
T_3:            MOV DX,150cH
                cmp al,00h
                jne w3
                call pregunta
        w3:     cmp al,33h
                jne ww3        
                call num_letra
       ww3:     CALL TECLA2
T_INTRO:        MOV DX,1610H
                call pregunta
T_0Y:           MOV DX,1706H
                cmp al,00h
                jne w0
                call pregunta
        w0:     cmp al,30h
                jne ww0        
                call num_letra
       ww0:     CALL TECLA2
T_F23:          MOV DX,170cH
                cmp al,00h
                jne w00
                call pregunta
        w00:    cmp al,2eh
                jne ww00       
                call num_letra
       ww00:    CALL TECLA2
pregunta:       push dx
                CALL DIRVIDEO
                call aoffset
                mov cx,3
                mov al,30h
       pre:     mov [es:si],al
                add si,2
                loop pre
                call retardo
                pop dx
                call borrarpre
                CALL TECLA2
borrarpre:      CALL DIRVIDEO
                call aoffset
                mov cx,3
                mov al,03h
       prb:     mov [es:si],al
                add si,2
                loop prb
                ret
pregunta1:      push dx
                CALL DIRVIDEO
                call aoffset
                mov cx,4
                mov al,30h
       pre1:    mov [es:si],al
                add si,2
                loop pre1
                call retardo
                pop dx
                call borrar1
                CALL TECLA2
borrar1:        CALL DIRVIDEO
                call aoffset
                mov cx,4
                mov al,03h
       prb1:    mov [es:si],al
                add si,2
                loop prb1
                ret
pregunta2:      push dx
                CALL DIRVIDEO
                call aoffset
                mov cx,3
                mov al,30h
       pre2:    mov [es:si],al
                add si,2
                loop pre2
                add si,158
                mov [es:si],al
                add si,160
                mov [es:si],al
                call retardo
                pop dx
                call borrar2
                CALL TECLA2
borrar2:        CALL DIRVIDEO
                call aoffset
                mov cx,3
                mov al,03h
       prb2:    mov [es:si],al
                add si,2
                loop prb2
                add si,158
                mov [es:si],al
                add si,160
                mov [es:si],al
                ret
pregunta3:      push dx                   
                CALL DIRVIDEO
                call aoffset
                mov cx,4
                mov al,30h
       pre3:    mov [es:si],al
                add si,2
                loop pre3
                add si,102
                mov cx,4
                mov al,30h
       pre31:   mov [es:si],al
                add si,2
                loop pre31
                call retardo
                pop dx
                call borrar3
                CALL TECLA2
borrar3:        CALL DIRVIDEO
                call aoffset
                mov cx,4
                mov al,03h
       prb3:    mov [es:si],al
                add si,2
                loop prb3
                add si,102
                mov cx,4
                mov al,03h
       prb31:   mov [es:si],al
                add si,2
                loop prb31
                ret
pregunta4:      push dx
                CALL DIRVIDEO
                call aoffset
                mov cx,4
                mov al,30h
       pre4:    mov [es:si],al
                add si,2
                loop pre4
                add si,52
                mov cx,4
                mov al,30h
       pre41:   mov [es:si],al
                add si,2
                loop pre41
                call retardo
                pop dx
                call borrar4
                CALL TECLA2
borrar4:        CALL DIRVIDEO
                call aoffset
                mov cx,4
                mov al,03h
       prb4:    mov [es:si],al
                add si,2
                loop prb4
                add si,52
                mov cx,4
                mov al,03h
       prb41:   mov [es:si],al
                add si,2
                loop prb41
                ret
pregunta5:      push dx                   
                CALL DIRVIDEO
                call aoffset
                mov cx,4
                mov al,30h
       pre5:    mov [es:si],al
                add si,2
                loop pre5
                add si,94
                mov cx,5
                mov al,30h
       pre51:   mov [es:si],al
                add si,2
                loop pre51
                call retardo
                pop dx
                call borrar5
                CALL TECLA2
borrar5:        CALL DIRVIDEO
                call aoffset
                mov cx,4
                mov al,03h
       prb5:    mov [es:si],al
                add si,2
                loop prb5
                add si,94
                mov cx,5
                mov al,03h
       prb51:   mov [es:si],al
                add si,2
                loop prb51
                ret
mayus_letra:    push dx
                mov ax,0b800h
                mov es,ax
                call aoffset
                mov cx,3
                mov al,30h
       mre:     mov [es:si],al
                add si,2
                loop mre
                mov si,509h
                mov cx,4
                mov al,30h
       may:     mov [es:si],al
                add si,2
                loop may
                call retardo
                pop dx
                call borrarmay
                ret
borrarmay:      mov ax,0b800h
                mov es,ax
                call aoffset
                mov cx,3
                mov al,03h
       mrb:     mov [es:si],al
                add si,2
                loop mrb
                mov si,509h
                mov cx,4
                mov al,03h
       bay:     mov [es:si],al
                add si,2
                loop bay
                ret
num_letra:      push dx
                mov ax,0b800h
                mov es,ax
                call aoffset
                mov cx,3
                mov al,30h
       ure:     mov [es:si],al
                add si,2
                loop ure
                mov si,969h
                mov cx,3
                mov al,30h
       uay:     mov [es:si],al
                add si,2
                loop uay
                call retardo
                pop dx
                call borraruay
                ret
borraruay:      mov ax,0b800h
                mov es,ax
                call aoffset
                mov cx,3
                mov al,03h
       mub:     mov [es:si],al
                add si,2
                loop mub
                mov si,969h
                mov cx,3
                mov al,03h
       buy:     mov [es:si],al
                add si,2
                loop buy
                ret
MOUSE1:         mov bh,07h
                call limpiar
                mov dx,0
                call posicion
                mov dx,boton
                call despliegue
                mov dx,32dh
                call posicion
                mov cx,22ah
                mov dx,449h
                mov ax,0
                int 33h
                mov bp,ax
                MOV AX,600H
                cmp bp,0;0ffffh
                je no_inst
                mov bh,47h
                int 10h
                mov dx,si_instalado
                call despliegue
                call botones1
no_inst:        mov bh,0c7h
                int 10h
                mov dx,no_instalado
                call despliegue
          eve:  mov ah,6
                mov dl,0ffh
                int 21h
                cmp al,27
                je fin1
                jmp eve
fin1:           mov ax,2
                int 33h
                call inicio
BOTONES1:       mov ax,01h
                int 33h
BOTONES:        mov ah,6
                mov dl,0ffh
                int 21h
                cmp al,27
                je fin1    
                mov ax,03h
                int 33h
                and bx,7
                cmp bx,0
                je ningun
                cmp bx,1
                je izq
                cmp bx,2
                je der
                cmp bx,3
                je izq_der
                cmp bx,4
                je central
                cmp bx,5
                je cen_izq
                cmp bx,6
                je cen_der
                cmp bx,7
                je todos
ningun:         push dx
                push cx
                CALL BORPINBOT
                pop cx
                pop dx
                call raton
cen_izq:        jmp cen_izq1
izq:            push dx
                push cx
                call borpinbot
                mov cl,0bh
                MOV DL,11H
                CALL PINBOT
                pop cx
                pop dx
                call raton
der:            push dx
                push cx
                CALL BORPINBOT
                MOV CL,1BH
                MOV DL,21H
                CALL PINBOT
                pop cx
                pop dx
                call raton
TODOS:          JMP TODOS0
CEN_DER:        JMP CEN_DER0
central:        jmp central1
izq_der:        push dx
                push cx
                CALL BORPINBOT
                MOV CL,0BH
                MOV DL,11H
                CALL PINBOT
                MOV CL,1BH
                MOV DL,21H
                CALL PINBOT
                pop cx
                pop dx
                call raton
central1:       push dx
                push cx
                CALL BORPINBOT
                MOV CL,13H
                MOV DL,19H
                CALL PINBOT
                pop cx
                pop dx
                call raton
TODOS0:          JMP TODOS1
CEN_DER0:        JMP CEN_DER1
cen_izq1:       push dx
                push cx
                CALL BORPINBOT
                MOV CL,0BH
                MOV DL,11H
                CALL PINBOT
                MOV CL,13H
                MOV DL,19H
                CALL PINBOT
                pop cx
                pop dx
                call raton
cen_der1:       push dx
                push cx
                CALL BORPINBOT
                MOV CL,1BH
                MOV DL,21H
                CALL PINBOT
                MOV CL,13H
                MOV DL,19H
                CALL PINBOT
                pop cx
                pop dx
                call raton
todos1:         push dx
                push cx
                CALL BORPINBOT
                MOV CL,0BH
                MOV DL,11H
                CALL PINBOT
                MOV CL,13H
                MOV DL,19H
                CALL PINBOT
                MOV CL,1BH
                MOV DL,21H
                CALL PINBOT
                pop cx
                pop dx
                call raton
raton:          PUSH DX
                MOV Dx,0c1ah
                CALL POSICION
                POP DX
                mov bl,8
                mov ax,cx
                div bl
                mov cx,ax
                mov ax,dx
                div bl
                mov dx,ax
                mov bl,0ah
                mov ax,cx
                MOV AH,0
                div bl
                mov cx,ax
                mov ax,dx
                MOV AH,0
                div bl
                mov bx,ax
                add bx,3030h
                add cx,3030h
                mov dl,bl
                call despliegue2
                mov dl,bh
                call despliegue2
                mov dx,0e1ah
                call posicion
                mov dl,cl
                call despliegue2
                mov dl,ch
                call despliegue2
                call retardo
                call botones
PINBOT:         MOV AX,600H
                MOV CH,5
                MOV DH,7
                MOV BH,47H
                INT 10H
                RET
BORPINBOT:      MOV AX,600H
                MOV CX,50BH
                MOV DX,711H
                MOV BH,07H
                INT 10H
                MOV CX,513H
                MOV DX,719H
                INT 10H
                MOV CX,51BH
                MOV DX,721H
                INT 10H
                RET
retardo:        mov cx,0fffh
temp:           push cx
                mov cx,0ffh
tem:            loop tem
                pop cx
                loop temp
                ret
posicion:       mov ah,2
                mov bh,0
                int 10h
                ret
despliegue:     mov ah,9
                int 21h
                ret
despliegue2:    mov ah,2
                int 21h
                ret
esperar:        mov ah,7
                int 21h
                ret
limpiar:        mov ax,0600h
                mov cx,0
                mov dx,184fh
                int 10h
                ret
GRAFICO:        call fondopagina
                mov bh,0eh
                mov cx,710h
                mov dx,113fh
                int 10h
                mov dx,0
                call posicion
                mov dx,menu1
                call despliegue
                mov dh,10
                call mover
tecla1:         mov ah,0
                int 16h
                cmp ah,48h
                jne sg1
                call arriba1
                jmp tecla1
        sg1:    cmp ah,50h
                jne sg2
                call abajo1
                jmp tecla1
        sg2:    cmp ah,1ch
                je entrar1
                jmp tecla1
entrar1:        cmp dh,10
                jne eg1
                call GRAF16
        eg1:    cmp dh,11
                jne eg2
                call GRAF256
        eg2:    cmp dh,12
                jne eg3
                call inicio
        eg3:    ret
arriba1:        cmp dh,10
                jne ag1
                call borrar
                mov dh,12
                call mover
                ret
        ag1:    cmp dh,12
                jne ag2
                call borrar
                dec dh
                call mover
                ret
        ag2:    cmp dh,11
                jne ag3
                call borrar
                dec dh
                call mover
        ag3:    ret
abajo1:         cmp dh,12
                jne bg1
                call borrar
                mov dh,10
                call mover
                ret
        bg1:    cmp dh,10
                jne bg2
                call borrar
                inc dh
                call mover
                ret
        bg2:    cmp dh,11
                jne bg3
                call borrar
                inc dh
                call mover
        bg3:    ret
graf16:         mov ax,12h
                int 10h
                mov ax,0c00h
                mov si,0
                mov bx,0
                mov cx,8
        linea:  push cx
                mov cx,240
                mov dx,0
        punto:  push cx
                mov cx,si
                int 10h
                mov bp,80
                call grosor
                inc dx
                pop cx
                loop punto
                add si,80
                inc al
                pop cx
                loop linea
                mov si,0
                mov cx,8
        lineaG:  push cx
                mov cx,240
                mov dx,240
        puntoG:  push cx
                mov cx,si
                int 10h
                mov bp,80
                call grosor
                inc dx
                pop cx
                loop puntoG
                add si,80
                inc al
                pop cx
                loop lineaG
                mov ah,07
                int 21h
                mov ax,3
                int 10h
                call grafico
graf256:        mov ax,13h
                int 10h
                mov ax,0c00h
                mov si,0
                mov bx,0
                mov cx,31   
       linea0:  push cx
                mov dx,0
                mov cx,25   
       punto0:  push cx
                mov cx,si
                int 10h
                mov bp,10
                call grosor
                inc dx
                pop cx
                loop punto0
                add si,10
                inc al
                pop cx
                loop linea0
                mov si,0
                mov cx,31
       linea1:  push cx
                mov cx,25
                mov dx,25
        punto1: push cx
                mov cx,si
                int 10h
                mov bp,10
                call grosor
                inc dx
                pop cx
                loop punto1
                add si,10
                inc al
                pop cx
                loop linea1
                mov si,0
                mov cx,31
       linea2:  push cx
                mov cx,25
                mov dx,50
        punto2: push cx
                mov cx,si
                int 10h
                mov bp,10
                call grosor
                inc dx
                pop cx
                loop punto2
                add si,10
                inc al
                pop cx
                loop linea2
                mov si,0
                mov cx,31
       linea3:  push cx
                mov cx,25
                mov dx,75
        punto3: push cx
                mov cx,si
                int 10h
                mov bp,10
                call grosor
                inc dx
                pop cx
                loop punto3
                add si,10
                inc al
                pop cx
                loop linea3
                mov si,0
                mov cx,31
       linea4:  push cx
                mov cx,25
                mov dx,100
        punto4: push cx
                mov cx,si
                int 10h
                mov bp,10
                call grosor
                inc dx
                pop cx
                loop punto4
                add si,10
                inc al
                pop cx
                loop linea4
                mov si,0
                mov cx,31
       linea5:  push cx
                mov cx,25
                mov dx,125
        punto5: push cx
                mov cx,si
                int 10h
                mov bp,10
                call grosor
                inc dx
                pop cx
                loop punto5
                add si,10
                inc al
                pop cx
                loop linea5
                mov si,0
                mov cx,31
       linea6:  push cx
                mov cx,25
                mov dx,150
        punto6: push cx
                mov cx,si
                int 10h
                mov bp,10
                call grosor
                inc dx
                pop cx
                loop punto6
                add si,10
                inc al
                pop cx
                loop linea6
                mov si,0
                mov cx,31
       linea7:  push cx
                mov cx,25
                mov dx,175
        punto7: push cx
                mov cx,si
                int 10h
                mov bp,10
                call grosor
                inc dx
                pop cx
                loop punto7
                add si,10
                inc al
                pop cx
                loop linea7
                mov ah,07
                int 21h
                mov ax,3
                int 10h
                call grafico
grosor:         push si
                push dx
                mov cx,bp
        pix1:   push cx
                mov cx,si
                int 10h
                inc si
                pop cx
                loop pix1
                pop dx
                pop si
                ret
VIDEO:          call fondopagina
                mov bh,0eh
                mov cx,710h
                mov dx,103fh
                int 10h
                mov dx,0
                call posicion
                mov dx,menu2
                call despliegue
                mov dh,10
                call mover
tecla3:         mov ah,0
                int 16h
                cmp ah,48h
                jne sv1
                call arriba2
                jmp tecla3
        sv1:    cmp ah,50h
                jne sv2
                call abajo2
                jmp tecla3
        sv2:    cmp ah,1ch
                je entrar2
                jmp tecla3
entrar2:        cmp dh,10
                jne ev1
                call RESTAURAR
        ev1:    cmp dh,11
                jne ev2
                call INICIO
        ev2:    ret
arriba2:        cmp dh,10
                jne av1
                call borrar
                mov dh,11
                call mover
                ret
        av1:    cmp dh,11
                jne av2
                call borrar
                dec dh
                call mover
        av2:    ret
abajo2:         cmp dh,11
                jne bv1
                call borrar
                mov dh,10
                call mover
                ret
        bv1:    cmp dh,10
                jne bv2
                call borrar
                inc dh
                call mover
        bv2:    ret
RESTAURAR:      mov di,offset buffer
                mov si,0
                mov cx,2000
mostfil:        mov ax,ds:[di]
                mov es:[si],ax
                add di,2
                add si,2
                loop mostfil
                call esperar
                call video
RELOJ1:         call fondopagina
                mov bh,07h
                mov cx,0205h
                mov dx,0d4ah
                int 10h
                mov cx,0527h
                mov dx,0628h
                call pintar5
                mov cx,0927h
                mov dx,0a28h
                call pintar5
                mov dx,307h
                call posicion
                call ocho1
                add dx,16
                call ocho1
                mov dx,032dh
                call posicion
                call ocho1
                add dx,16
                call ocho1
                cmp bp,0ffffh
                jne reloj
                call sistema
reloj:          mov dx,0
                call posicion
                mov ax,600h
                mov bh,0eh
                mov cx,1110h
                mov dx,153fh
                int 10h
                mov dx,menu4
                call despliegue
                mov dh,18
                call mover
tecla4:         mov ah,0
                int 16h
                cmp ah,48h
                jne sc1
                call arriba4
                jmp tecla4
        sc1:    cmp ah,50h
                jne sc2
                call abajo4
                jmp tecla4
        sc2:    cmp ah,1ch
                je entrar4
                jmp tecla4
entrar4:        cmp dh,18
                jne ec1
                call SISTEMA
        ec1:    cmp dh,19
                jne ec2
                call HORA1
        ec2:    cmp dh,20
                jne ec3
                call inicio
        ec3:    ret
arriba4:        cmp dh,18
                jne ac1
                call borrar
                mov dh,20
                call mover
                ret
        ac1:    cmp dh,20
                jne ac2
                call borrar
                dec dh
                call mover
                ret
        ac2:    cmp dh,19
                jne ac3
                call borrar
                dec dh
                call mover
        ac3:    ret
abajo4:         cmp dh,20
                jne bc1
                call borrar
                mov dh,18
                call mover
                ret
        bc1:    cmp dh,18
                jne bc2
                call borrar
                inc dh
                call mover
                ret
        bc2:    cmp dh,19
                jne bc3
                call borrar
                inc dh
                call mover
        bc3:    ret
SISTEMA:        mov cx,0527h
                mov dx,0628h
                call pintar4
                mov cx,0927h
                mov dx,0a28h
                call pintar4
leer1:          mov ah,2ch
                int 21h
hora:           mov dx,307h
                call posicion
                mov bp,cx
                cmp ch,0
                jne h1
                call num00
                call minutos
        h1:     cmp ch,1
                jne h2
                call num01
                call minutos
        h2:     cmp ch,2
                jne h3
                call num02
                call minutos
        h3:     cmp ch,3
                jne h4
                call num03
                call minutos
        h4:     cmp ch,4
                jne h5
                call num04
                call minutos
        h5:     cmp ch,5
                jne h6
                call num05
                call minutos
        h6:     cmp ch,6
                jne h7
                call num06
                call minutos
        h7:     cmp ch,7
                jne h8
                call num07
                call minutos
        h8:     cmp ch,8
                jne h9
                call num08
                call minutos
        h9:     cmp ch,9
                jne h10
                call num09
                call minutos
        h10:    cmp ch,0Ah
                jne h11
                call num10
                call minutos
        h11:    cmp ch,0Bh
                jne h12
                call num11
                call minutos
        h12:    cmp ch,0Ch
                jne h13
                call num12
                call minutos
        h13:    cmp ch,0Dh
                jne h14
                call num13
                call minutos
        h14:    cmp ch,0Eh
                jne h15
                call num14
                call minutos
        h15:    cmp ch,0Fh
                jne h16
                call num15
                call minutos
        h16:    cmp ch,10h
                jne h17
                call num16
                call minutos
        h17:    cmp ch,11h
                jne h18
                call num17
                call minutos
        h18:    cmp ch,12h
                jne h19
                call num18
                call minutos
        h19:    cmp ch,13h
                jne h20
                call num19
                call minutos
        h20:    cmp ch,14h
                jne h21
                call num20
                call minutos
        h21:    cmp ch,15h
                jne h22
                call num21
                call minutos
        h22:    cmp ch,16h
                jne h23
                call num22
                call minutos
        h23:    cmp ch,17h
                jne h24
                call num23
                call minutos
        h24:    call hora1
minutos:        mov dx,32dh
                call posicion
                mov cx,bp
                cmp cl,0
                jne m1
                call num00
                call reloj
        m1:     cmp cl,1
                jne m2
                call num01
                call reloj
        m2:     cmp cl,2
                jne m3
                call num02
                call reloj
        m3:     cmp cl,3
                jne m4
                call num03
                call reloj
        m4:     cmp cl,4
                jne m5
                call num04
                call reloj
        m5:     cmp cl,5
                jne m6
                call num05
                call reloj
        m6:     cmp cl,6
                jne m7
                call num06
                call reloj
        m7:     cmp cl,7
                jne m8
                call num07
                call reloj
        m8:     cmp cl,8
                jne m9
                call num08
                call reloj
        m9:     cmp cl,9
                jne m10
                call num09
                call reloj
        m10:    cmp cl,0Ah
                jne m11
                call num10
                call reloj
        m11:    cmp cl,0Bh
                jne m12
                call num11
                call reloj
        m12:    cmp cl,0Ch
                jne m13
                call num12
                call reloj
        m13:    cmp cl,0Dh
                jne m14
                call num13
                call reloj
        m14:    cmp cl,0Eh
                jne m15
                call num14
                call reloj
        m15:    cmp cl,0Fh
                jne m16
                call num15
                call reloj
        m16:    cmp cl,10h
                jne m17
                call num16
                call reloj
        m17:    cmp cl,11h
                jne m18
                call num17
                call reloj
        m18:    cmp cl,12h
                jne m19
                call num18
                call reloj
        m19:    cmp cl,13h
                jne m20
                call num19
                call reloj
        m20:    cmp cl,14h
                jne m21
                call num20
                call reloj
        m21:    cmp cl,15h
                jne m22
                call num21
                call reloj
        m22:    cmp cl,16h
                jne m23
                call num22
                call reloj
        m23:    cmp cl,17h
                jne m24
                call num23
                call reloj
        m24:    cmp cl,18h
                jne m25
                call num24
                call reloj
        m25:    cmp cl,19h
                jne m26
                call num25
                call reloj
        m26:    cmp cl,1Ah
                jne m27
                call num26
                call reloj
        m27:    cmp cl,1Bh
                jne m28
                call num27
                call reloj
        m28:    cmp cl,1Ch
                jne m29
                call num28
                call reloj
        m29:    cmp cl,1Dh
                jne m30
                call num29
                call reloj
        m30:    cmp cl,1Eh
                jne m31
                call num30
                call reloj
        m31:    cmp cl,1Fh
                jne m32
                call num31
                call reloj
        m32:    cmp cl,20h
                jne m33
                call num32
                call reloj
        m33:    cmp cl,21h
                jne m34
                call num33
                call reloj
        m34:    cmp cl,22h
                jne m35
                call num34
                call reloj
        m35:    cmp cl,23h
                jne m36
                call num35
                call reloj
        m36:    cmp cl,24h
                jne m37
                call num36
                call reloj
        m37:    cmp cl,25h
                jne m38
                call num37
                call reloj
        m38:    cmp cl,26h
                jne m39
                call num38
                call reloj
        m39:    cmp cl,27h
                jne m40
                call num39
                call reloj
        m40:    cmp cl,28h
                jne m41
                call num40
                call reloj
        m41:    cmp cl,29h
                jne m42
                call num41
                call reloj
        m42:    cmp cl,2Ah
                jne m43
                call num42
                call reloj
        m43:    cmp cl,2Bh
                jne m44
                call num43
                call reloj
        m44:    cmp cl,2Ch
                jne m45
                call num44
                call reloj
        m45:    cmp cl,2Dh
                jne m46
                call num45
                call reloj
        m46:    cmp cl,2Eh
                jne m47
                call num46
                call reloj
        m47:    cmp cl,2Fh
                jne m48
                call num47
                call reloj
        m48:    cmp cl,30h
                jne m49
                call num48
                call reloj
        m49:    cmp cl,31h
                jne m50
                call num49
                call reloj
        m50:    cmp cl,32h
                jne m51
                call num50
                call reloj
        m51:    cmp cl,33h
                jne m52
                call num51
                call reloj
        m52:    cmp cl,34h
                jne m53
                call num52
                call reloj
        m53:    cmp cl,35h
                jne m54
                call num53
                call reloj
        m54:    cmp cl,36h
                jne m55
                call num54
                call reloj
        m55:    cmp cl,37h
                jne m56
                call num55
                call reloj
        m56:    cmp cl,38h
                jne m57
                call num56
                call reloj
        m57:    cmp cl,39h
                jne m58
                call num57
                call reloj
        m58:    cmp cl,3Ah
                jne m59
                call num58
                call reloj
        m59:    cmp cl,3Bh
                jne m60
                call num59
        m60:    call reloj
num00:  call cero
        add dx,16
        call cero
        ret
num01:  call cero
        add dx,16
        call uno
        ret
num02:  call cero
        add dx,16
        call dos
        ret
num03:  call cero
        add dx,16
        call tres
        ret
num04:  call cero
        add dx,16
        call cuatro
        ret
num05:  call cero
        add dx,16
        call cinco
        ret
num06:  call cero
        add dx,16
        call seis
        ret
num07:  call cero
        add dx,16
        call siete
        ret
num08:  call cero
        add dx,16
        call ocho
        ret
num09:  call cero
        add dx,16
        call nueve
        ret
num10:  call uno
        add dx,16
        call cero
        ret
num11:  call uno
        add dx,16
        call uno
        ret
num12:  call uno
        add dx,16
        call dos
        ret
num13:  call uno
        add dx,16
        call tres
        ret
num14:  call uno
        add dx,16
        call cuatro
        ret
num15:  call uno
        add dx,16
        call cinco
        ret
num16:  call uno
        add dx,16
        call seis
        ret
num17:  call uno
        add dx,16
        call siete
        ret
num18:  call uno
        add dx,16
        call ocho
        ret
num19:  call uno
        add dx,16
        call nueve
        ret
num20:  call dos
        add dx,16
        call cero
        ret
num21:  call dos
        add dx,16
        call uno
        ret
num22:  call dos
        add dx,16
        call dos
        ret
num23:  call dos
        add dx,16
        call tres
        ret
num24:  call dos
        add dx,16
        call cuatro
        ret
num25:  call dos
        add dx,16
        call cinco
        ret
num26:  call dos
        add dx,16
        call seis
        ret
num27:  call dos
        add dx,16
        call siete
        ret
num28:  call dos
        add dx,16
        call ocho
        ret
num29:  call dos
        add dx,16
        call nueve
        ret
num30:  call tres
        add dx,16
        call cero
        ret
num31:  call tres
        add dx,16
        call uno
        ret
num32:  call tres
        add dx,16
        call dos
        ret
num33:  call tres
        add dx,16
        call tres
        ret
num34:  call tres
        add dx,16
        call cuatro
        ret
num35:  call tres
        add dx,16
        call cinco
        ret
num36:  call tres
        add dx,16
        call seis
        ret
num37:  call tres
        add dx,16
        call siete
        ret
num38:  call tres
        add dx,16
        call ocho
        ret
num39:  call tres
        add dx,16
        call nueve
        ret
num40:  call cuatro
        add dx,16
        call cero
        ret
num41:  call cuatro
        add dx,16
        call uno
        ret
num42:  call cuatro
        add dx,16
        call dos
        ret
num43:  call cuatro
        add dx,16
        call tres
        ret
num44:  call cuatro
        add dx,16
        call cuatro
        ret
num45:  call cuatro
        add dx,16
        call cinco
        ret
num46:  call cuatro
        add dx,16
        call seis
        ret
num47:  call cuatro
        add dx,16
        call siete
        ret
num48:  call cuatro
        add dx,16
        call ocho
        ret
num49:  call cuatro
        add dx,16
        call nueve
        ret
num50:  call cinco
        add dx,16
        call cero
        ret
num51:  call cinco
        add dx,16
        call uno
        ret
num52:  call cinco
        add dx,16
        call dos
        ret
num53:  call cinco
        add dx,16
        call tres
        ret
num54:  call cinco
        add dx,16
        call cuatro
        ret
num55:  call cinco
        add dx,16
        call cinco
        ret
num56:  call cinco
        add dx,16
        call seis
        ret
num57:  call cinco
        add dx,16
        call siete
        ret
num58:  call cinco
        add dx,16
        call ocho
        ret
num59:  call cinco
        add dx,16
        call nueve
        ret
cero:   push dx
        mov cx,dx
        add dx,90Bh
        call pintar
        add cx,204h
        sub dx,204h
        call pintar1
        pop dx
        ret
uno:    push dx
        mov cx,dx
        add dx,90Bh
        call pintar1
        add cx,8
        call pintar
        pop dx
        ret
dos:    push dx
        mov cx,dx
        add dx,90Bh
        call pintar
        add cx,200h
        sub dx,604h
        call pintar1
        add cx,404h
        add dx,404h
        call pintar1
        pop dx
        ret
tres:   push dx
        mov cx,dx
        add dx,90Bh
        call pintar
        add cx,200h
        sub dx,604h
        call pintar1
        add cx,400h
        add dx,400h
        call pintar1
        pop dx
        ret
cuatro: push dx
        mov cx,dx
        add dx,90Bh
        call pintar
        add cx,004h
        sub dx,604h
        call pintar1
        add ch,6
        sub cl,4
        add dx,600h
        call pintar1
        pop dx
        ret
cinco:  push dx
        mov cx,dx
        add dx,90Bh
        call pintar
        add cx,204h
        sub dx,600h
        call pintar1
        add ch,4
        sub cl,4
        add dh,4
        sub dl,4
        call pintar1
        pop dx
        ret
seis:   push dx
        mov cx,dx
        add dx,90Bh
        call pintar
        add cx,204h
        sub dx,600h
        call pintar1
        add ch,4
        add dh,4
        sub dl,4
        call pintar1
        pop dx
        ret
siete:  push dx
        mov cx,dx
        add dx,90Bh
        call pintar
        add cx,200h
        sub dx,004h
        call pintar1
        pop dx
        ret
ocho:   push dx
        mov cx,dx
        add dx,90Bh
        call pintar
        add cx,204h
        sub dx,604h
        call pintar1
        add cx,400h
        add dx,400h
        call pintar1
        pop dx
        ret
nueve:  push dx
        mov cx,dx
        add dx,90Bh
        call pintar
        add cx,204h
        sub dx,604h
        call pintar1
        add ch,4
        sub cl,4
        add dx,600h
        call pintar1
        pop dx
        ret
ocho1:  push dx
        mov cx,dx
        add dx,90Bh
        call pintar3
        add cx,204h
        sub dx,604h
        call pintar1
        add cx,400h
        add dx,400h
        call pintar1
        pop dx
        ret
pintar:         mov bh,70h
                mov ax,600h
                int 10h
                ret
pintar1:        mov bh,07h
                mov ax,600h
                int 10h
                ret
pintar2:        mov bh,0f0h
                mov ax,600h
                int 10h
                ret
pintar3:        mov bh,60h ;----------
                mov ax,600h
                int 10h
                ret
pintar4:        mov bh,0f0h
                mov ax,600h
                int 10h
                ret
pintar5:        mov bh,06h ;------------
                mov ax,600h
                int 10h
                ret
HORA1:          mov ax,600h
                mov cx,060eh
                mov dx,1141h
                mov bh,3eh
                int 10h
                mov dx,600h
                call posicion
                mov dx,menu5
                call despliegue
                mov dx,0b2fh
                call posicion
hora0:          mov ah,1
                int 21h
                mov ch,al
                cmp ch,32h
                ja error1
                cmp ch,30h
                jb error1
                sub ch,30h
hora2:          mov ah,1
                int 21h
                mov cl,al
                cmp ch,2
                jne yy11
                cmp cl,33h
                ja error1
                jmp yu
          yy11: cmp cl,39h 
                ja error1
          yu:   cmp cl,30h
                jb error1
                sub cl,30h
                mov ax,cx
                aad
                mov ch,al
                mov dx,0b32h
                call posicion
minuto1:        mov ah,1
                int 21h
                mov bh,al
                cmp bh,35h
                ja error1
                cmp bh,30h
                jb error1
                sub bh,30h
minuto2:        mov ah,1
                int 21h
                mov bl,al
                cmp bl,39h
                ja error1
                cmp bl,30h
                jb error1
                sub bl,30h
                mov ax,bx
                aad
                mov cl,al
                mov ah,2dh
                mov dx,0
                int 21h
otravez:        call esperar
                cmp al,0dh
                jne otravez
                mov bp,0ffffh
                call reloj1
error1:         mov ax,600h
                mov cx,0817h
                mov dx,0e38h
                mov bh,0eh
                int 10h
                mov dx,0818h
                call posicion
                mov dx,menu6
                call despliegue
                mov dx,0918h
                call posicion
                mov dx,menu61
                call despliegue
                mov dx,0a18h
                call posicion
                mov dx,menu62
                call despliegue
                mov dx,0b18h
                call posicion
                mov dx,menu63
                call despliegue
                mov dx,0c18h
                call posicion
                mov dx,menu64
                call despliegue
                mov dx,0d18h
                call posicion
                mov dx,menu65
                call despliegue
                mov dx,0e18h
                call posicion
                mov dx,menu66
                call despliegue
                mov dx,0918h
                call posicion
                call esperar
                call hora1
CREDITOS:       mov dx,0
                call posicion
                call fondopagina
                mov bh,0eh
                mov cx,610h
                mov dx,123fh
                int 10h
                mov dx,menu3
                call despliegue
                mov dx,70fh
                call posicion
                call esperar
                call inicio
FIN:            mov ax,2
                int 33h
                call fondopagina1
                mov ax,600h
                mov cx,0b21h
                mov dx,0e2eh
                mov bh,0eh
                int 10h
                mov dx,0a20h
                call posicion
                mov dx,usm0
                call despliegue
                mov dx,0b20h
                call posicion
                mov dx,usm2
                call despliegue
                mov dx,0c20h
                call posicion
                mov dx,usm3
                call despliegue
                mov dx,0d20h
                call posicion
                mov dx,usm4
                call despliegue
                mov dx,0e20h
                call posicion
                mov dx,usm5
                call despliegue
                mov dx,0f20h
                call posicion
                mov dx,usm6
                call despliegue
                mov dx,0a20h
                call posicion
                mov CX,50
emp:            push cx
                call retardo
                pop cx
                loop emp
                mov ax,2
                int 10h
                mov ax,600h
                mov cx,0
                mov dx,04fh
                mov bh,1eh
                int 10h
                mov dx,000ah
                call posicion
                mov dx,usm1
                call despliegue
                int 20h
dirvideo:       mov ax,0b800h
                mov es,ax
                ret
menu:   db 0ah,0ah,0ah,0ah,0ah,0ah,0dh,       
        db"               ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ   ",0dh,0ah,
        db"               Û                                                Û   ",0dh,0ah,
        db"               Û                     MENU                       Û   ",0ah,0dh,
        db"               Û                                                Û   ",0dh,0ah,
        db"               Û     1.- Test del Teclado                       Û   ",0dh,0ah,
        db"               Û     2.- Test del Mouse                         Û   ",0dh,0ah,
        db"               Û     3.- Test de la Tarjeta Gr fica             Û   ",0dh,0ah,
        db"               Û     4.- Direccionamiento de RAM de Video       Û   ",0dh,0ah,
        db"               Û     5.- Test del Reloj del Sistema             Û   ",0dh,0ah,
        db"               Û     6.- Cr‚ditos                               Û   ",0dh,0ah,
        db"               Û     7.- Finalizar Programa                     Û   ",0dh,0ah,
        db"               Û                                                Û   ",0dh,0ah,
        db"               ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß  $"
dteclado: db"  ÚÄÄÄÄ¿  ÚÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄ¿ ÚÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄ¿ ÚÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄ¿  ÚÄÄÄÂÄÄÄÂÄÄÄ¿ ",0dh,0ah,
          db"  ³ESC ³  ³F1 ³F2 ³F3 ³F4 ³ ³F5 ³F6 ³F7 ³F8 ³ ³F9 ³F10³F11³F12³  ³Imp³Blo³Pau³ ",0dh,0ah,
          db"  ÀÄÄÄÄÙ  ÀÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÙ ÀÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÙ ÀÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÙ  ÀÄÄÄÁÄÄÄÁÄÄÄÙ ",0dh,0ah,
          db"  ÚÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÄÄÄÄ¿  ÚÄÄÄÂÄÄÄÂÄÄÄ¿ ",0dh,0ah,
          DB"  ³ § ³ 1 ³ 2 ³ 3 ³ 4 ³ 5 ³ 6 ³ 7 ³ 8 ³ 9 ³ 0 ³ ? ³ ­ ³  DEL  ³  ³Ins³Ini³ReP³ ",0dh,0ah,
          DB"  ÃÄÄÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÄÄÄÄ´  ÃÄÄÄÅÄÄÄÅÄÄÄ´ ",0dh,0ah,
          db"  ³   ³ Q ³ W ³ E ³ R ³ T ³ Y ³ U ³ I ³ O ³ P ³ [ ³ + ³ Ä¿ ³  ³Sup³Fin³AvP³ ",0dh,0ah,
          db"  ÃÄÄÄÄÄÁÂÄÄÁÂÄÄÁÂÄÄÁÂÄÄÁÂÄÄÁÂÄÄÁÂÄÄÁÂÄÄÁÂÄÄÁÂÄÄÁÂÄÄÁÂÄÄÁ¿  ³ ³  ÀÄÄÄÁÄÄÄÁÄÄÄÙ ",0dh,0ah,
          db"  ³ May£ ³ A ³ S ³ D ³ F ³ G ³ H ³ J ³ K ³ L ³ ¥ ³ { ³ € ³  ³ ³                ",0dh,0ah,
          db"  ÃÄÄÄÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÂÄÁÄÄÄÁÄÄÄÄ´      ÚÄÄÄ¿     ",0dh,0ah,
          db"  ³   ³ < ³ Z ³ X ³ C ³ V ³ B ³ N ³ M ³ , ³ . ³ - ³         ³      ³  ³     ",0dh,0ah,
          db"  ÃÄÄÄÄÅÄÄÄÁÂÄÄÁÄÂÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÂÁÄÄÄÅÄÄÄÁÂÄÄÄÄÂÄÄÄÄ´  ÚÄÄÄÅÄÄÄÅÄÄÄ¿ ",0dh,0ah,
          db"  ³CTR ³ ÷÷ ³ALT ³                        ³ALTG³ ÷÷ ³ ÛÛ ³CTR ³  ³  ³  ³  ³ ",0dh,0ah,
          db"  ÀÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÙ  ÀÄÄÄÁÄÄÄÁÄÄÄÙ ",0dh,0ah,
          db"  TÚÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄ¿  ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ",0dh,0ah,
          db"  e³Blo³ / ³ * ³ - ³  Û       º * IMPR  =  CTRL + Impº * SHIFT = SHIFT + TAB Û",0dh,0ah,
          db"  cÃÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ´  Û    T  º * PAUSA =  CTRL + Pauº * CTRL  =  CTRL + TAB Û",0dh,0ah,
          db"  l³ 7 ³ 8 ³ 9 ³   ³  Û  P e  º *   [   =  CRTL + [  º * ALT   =   ALT + TAB Û",0dh,0ah,
          db"  aÃÄÄÄÅÄÄÄÅÄÄÄ´ + ³  Û  a c  º *   {   =   ALT + {  º                       Û",0dh,0ah,
          db"  d³ 4 ³ 5 ³ 6 ³   ³  Û  r l  ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ",0dh,0ah,
          db"  oÃÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ´  Û  a a  º  * MAYUS = Activar MAYUS + letra             Û",0dh,0ah,
          db"   ³ 1 ³ 2 ³ 3 ³ I ³  Û    s  º  * BLO   = Activar BLO + n£mero (teclado Num)Û",0dh,0ah,
          db"  NÃÄÄÄÁÄÄÄÅÄÄÄ´ N ³  ÛÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ",0dh,0ah,
          db"  u³   0   ³ . ³ T ³  Û           Para Men£ Principal = CTRL + S             Û",0dh,0ah,
          db"  mÀÄÄÄÄÄÄÄÁÄÄÄÁÄÄÄÙ  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß$"
si_instalado:   db" EL MOUSE ESTA INSTALADO$"
no_instalado:   db"EL MOUSE NO ESTA INSTALADO$"
boton:          db"                                                                           ",0ah,0dh,
                db"                                         ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ",0ah,0dh,
                db"                                         Û                                Û",0ah,0dh,
                db"                                         Û                                Û",0ah,0dh,
                db"          ÉÍÍÍÍÍÍÍËÍÍÍÍÍÍÍËÍÍÍÍÍÍÍ»      Û                                Û",0ah,0dh,
                db"          º       º       º       º      ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß",0ah,0dh,
                db"          º       º       º       º                                        ",0ah,0dh,
                db"          º       º       º       º                                        ",0ah,0dh,
                db"          ÌÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍ¹          ÍÍËÍÍ  ÉÍÍÍ  ÉÍÍÍ  ÍÍËÍÍ      ",0ah,0dh,
                db"          º                       º            º    ÌÍÍ   ÈÍÍ»    º        ",0ah,0dh,
                db"          º                       º            Ê    ÈÍÍÍ  ÍÍÍ¼    Ê        ",0ah,0dh,
                db"          º                       º                                        ",0ah,0dh,
                db"          º        FILA :         º      ÉÍÍËÍÍ»  ÉÍÍÍ»  Ë   Ë  ÉÍÍÍ  ÉÍÍÍ ",0ah,0dh,       
                db"          º                       º      º  º  º  º   º  º   º  ÈÍÍ»  ÌÍÍ  ",0ah,0dh,
                db"          º      COLUMNA:         º      Ê     Ê  ÈÍÍÍ¼  ÈÍÍÍ¼  ÍÍÍ¼  ÈÍÍÍ ",0ah,0dh,
                db"          º                       º                                        ",0ah,0dh,
                db"          º                       º                                        ",0ah,0dh,
                db"           º                     º       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»",0ah,0dh,
                db"            º                   º        º  Para Volver al Men£ Principal º",0ah,0dh,
                db"             º                 º         º         Presione  ESC          º",0ah,0dh,
                db"              ÈÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍ¼         ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼",0ah,0dh,
                db"                      º                                  º                 ",0ah,0dh,
                db"                      º                                  º                 ",0ah,0dh,
                db"                      ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼                 ",0ah,0dh,
                db"                                                                          $"
menu1:  db 0ah,0ah,0ah,0ah,0ah,0ah,0dh
        db"               ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               Û                     MENU                       Û   ",0ah,0dh
        db"               Û                                                Û   ",0dh,0ah
        db"               Û     1.- 16 Colores en 640*480 Pixeles          Û   ",0dh,0ah
        db"               Û     2.- 256 Colores en 320*200 Pixeles         Û   ",0dh,0ah
        db"               Û     3.- Volver a Men£ Principal                Û   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ   ",0dh,0ah
        db"               Û         Nota: Para volver a este Men£          Û   ",0dh,0ah
        db"               Û            presione cualquier TECLA            Û   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß   ",0dh,0ah
        db"                                                                   $"
menu2:  db 0ah,0ah,0ah,0ah,0ah,0ah,0dh
        db"               ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               Û                     MENU                       Û   ",0ah,0dh
        db"               Û                                                Û   ",0dh,0ah
        db"               Û     1.- Restaurar Pantalla Inicial             Û   ",0dh,0ah
        db"               Û     2.- Volver a Men£ Principal                Û   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ   ",0dh,0ah
        db"               Û         Nota: Para volver a este Men£          Û   ",0dh,0ah
        db"               Û            presione cualquier TECLA            Û   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß   ",0dh,0ah
        db"                                                                   $"
menu3:  db 0ah,0ah,0ah,0ah,0ah,0dh,       
        db"               ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ   ",0dh,0ah,
        db"               Û                                                Û   ",0dh,0ah,
        db"               Û                    CREDITOS                    Û   ",0ah,0dh,
        db"               Û                    ßßßßßßßß                    Û   ",0dh,0ah,
        db"               Û    UNIVERSIDAD TECNICA FEDERICO SANTA MARIA    Û   ",0dh,0ah,
        db"               Û            SEDE JOSE MIGUEL CARRERA            Û   ",0dh,0ah,
        db"               Û                                                Û   ",0dh,0ah,
        db"               Û              Carrera: Electronica              Û   ",0dh,0ah,
        db"               Û                Curso: 221-A                    Û   ",0dh,0ah,
        db"               Û        Programadores: Rodrigo Augosto          Û   ",0dh,0ah,
        db"               Û                       Felipe Olivares          Û   ",0dh,0ah,
        db"               Û                                                Û   ",0dh,0ah,
        db"               Û      Fecha Finalizacion:  28 de Nov. 2000      Û   ",0dh,0ah,
        db"               Û                                                Û   ",0dh,0ah,
        db"               ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß$"
menu4:  db 0ah,0ah,0ah,0ah,0ah,0dh,
        db"                                       ÛÛ                           ",0dh,0ah
        db"                                       ÛÛ                           ",0dh,0ah
        db 0ah,0ah,0dh,
        db"                                       ÛÛ                           ",0dh,0ah
        db"                                       ÛÛ                           ",0dh,0ah
        db 0ah,0ah,0ah,0ah,0ah,0dh
        db"               ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               Û     1.- Desplegar Hora del Sistema             Û   ",0dh,0ah
        db"               Û     2.- Cambiar Hora                           Û   ",0dh,0ah
        db"               Û     3.- Volver a Men£ Principal                Û   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß   ",0dh,0ah
        db"                                                                   $"
menu5:  db"               ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               Û           CAMBIO DE HORA DEL SISTEMA           Û   ",0ah,0dh
        db"               ÛÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÛ   ",0dh,0ah
        db"               Û                             ÉÍÍÍÍÍÍÍ»          Û   ",0dh,0ah
        db"               Û        Ingrese nueva hora:  º   :   º          Û   ",0dh,0ah
        db"               Û                             ÈÍÍÍÍÍÍÍ¼          Û   ",0dh,0ah
        db"               Û               y presione Enter.                Û   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               Û       Nota: (Horas:00-23 Minutos:00-59)        Û   ",0dh,0ah
        db"               Û                                                Û   ",0dh,0ah
        db"               ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß  $"
menu6:   db"ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ$"
menu61:  db"Û                              Û$"
menu62:  db"Û      ERROR EN LOS DATOS      Û$"
menu63:  db"Û   Presione cualquier tecla   Û$"
menu64:  db"Û para ingresarlos nuevamente. Û$"
menu65:  db"Û                              Û$"
menu66:  db"ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß$"
usm1:    db"UNIVERSIDAD TECNICA FEDERICO SANTA MARIA-JMC-VI¥A DEL MAR$"
usm0:    db"ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ$"
usm2:    db"Û    Gracias   Û$"                      
usm3:    db"Û por utilizar Û$"
usm4:    db"Û    nuestro   Û$"
usm5:    db"Û   Programa   Û$"
usm6:    db"ßßßßßßßßßßßßßßßß$"
buffer          db(?)



                                
