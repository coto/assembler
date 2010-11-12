;experiencia 9

                call limpiar
                mov si,0
                mov di,0
seguir:         call cuadros
                call detectar
ultima:         call cursor
                call membrete
;-----------------------------------------------------------------
limpiar:        mov ax,0600h
                mov bh,07h      ;0=fondo negro 7=caracter blanco
                mov cx,0        ;comienzo
                mov dx,184fh    ;final
                int 10h         ;FIN de limpiar la pantalla
                ret
;------------------------------------------------------------------
cursor:         mov ah,2
                mov bh,0
                mov dh,11
                mov dl,3
                int 10h
                ret
;------------------------------------------------------------------
detectar:       call inicializa
detectar2:      mov ax,03
                int 33h
                cmp bl,1
                je izquierdo
                cmp bl,2
                je derecho
                cmp bl,3
                je centro
                
                mov ah,06
                mov dl,0ffh
                int 21h
                
                cmp al,63h
                je cuenta
                cmp al,43h
                je cuenta
                jmp detectar2
;------------------------------------------------------------------
izquierdo:      mov ax,7        ;limites horizontales
                mov cx,0
                mov dx,632
                int 33h
                mov ax,8        ;limites verticales
                mov cx,0
                mov dx,56
                int 33h
                call mostrar
                jmp detectar2
;------------------------------------------------------------------
derecho:        mov ax,7        ;limites horizontales
                mov cx,0        ;col ini
                mov dx,632      ;col fin
                int 33h
                mov ax,8        ;limites verticales
                mov cx,64
                mov dx,128
                int 33h
                call mostrar
                jmp detectar2
;------------------------------------------------------------------
centro:         mov ax,7        ;limites horizontales
                mov cx,0
                mov dx,632
                int 33h
                mov ax,8        ;limites verticales
                mov cx,136
                mov dx,192
                int 33h
                call mostrar
                jmp detectar2
;------------------------------------------------------------------
cuenta:         mov ax,2
                int 33h

                mov ax,0600h
                mov bh,71h
                mov cx,0
                mov dx,184fh
                int 10h
                
                mov ax,5
                mov bx,0
                int 33h
                mov cx,bx
                
                call botoniz

                mov ax,5
                mov bx,1
                int 33h
                call botonde
                
                mov ax,5
                mov bx,2
                int 33h
                mov cx,bx
                call botonce

vuelta:         mov ah,6
                mov dl,0ffh
                int 21h

                cmp al,53h
                je seguir1
                cmp al,73h
                je seguir1

                cmp al,74h
                je ultima1
                cmp al,54h
                je ultima1

                jmp vuelta

seguir1:        jmp seguir
ultima1:        jmp ultima
;------------------------------------------------------------------
tecla:          mov ah,7
                int 21h
                ret
;------------------------------------------------------------------
membrete:       call modo
                call limpiarm
                call pintar
                call posicion
                call mensaje
                call posicion2
                call fin
;-----------------------------------------------------------------
limpiarm:       mov ax,0600h
                mov bh,07h
                mov cx,0
                mov dx,184fh
                int 10h
                ret
;-----------------------------------------------------------------
cuadros:        mov ax,0600h    
                mov bh,11h      ;cuadro azul
                mov ch,0        ;fila ini
                mov cl,0        ;columna ini
                mov dh,7        ;fila fin
                mov dl,79       ;columna fin
                int 10h
                
                mov ax,0600h
                mov bh,44h      ;cuadro rojo
                mov ch,8        ;fila ini
                mov cl,0       ;columna ini
                mov dh,16       ;fila fin
                mov dl,79       ;columna fin
                int 10h
                
                mov ax,0600h
                mov bh,22h      ;cuadro verde
                mov ch,17       ;fila ini
                mov cl,0        ;columna ini
                mov dh,24       ;fila fin
                mov dl,79       ;columna fin
                int 10h
                ret
;------------------------------------------------------------------
inicializa:     mov ax,00
                int 33h
                ret
;-----------------------------------------------------------------
fin:            int 20h
;-----------------------------------------------------------------
modo:           mov ah,0
                mov al,3
                int 10h
                ret
;-----------------------------------------------------------------
pintar:         mov es,0b800h
                mov si,1780
                mov ax,4720h
                mov cx,59
rojo:           mov [es:si],ax
                add si,2
                loop rojo
                mov ax,6720h
                add si,42
                mov cx,59
amarillo:       mov [es:si],ax
                add si,2
                loop amarillo
                add si,42
                mov ax,1720h
                mov cx,59
azul:           mov [es:si],ax
                add si,2
                loop azul
                ret
;-----------------------------------------------------------------
posicion:       mov ah,2
                mov bh,0
                mov dh,11
                mov dl,10
                int 10h
                ret
;-----------------------------------------------------------------------------
mensaje:        mov ah,9
                mov dx,utfsm
                int 21h
                ret
utfsm:          db"         UNIVERSIDAD TECNICA FEDERICO SANTA MARIA            ",0A,0D,
                db"                          JOSE   MIGUEL   CARRERA            ",0A,0D,
                db"                             SEDE  VI¥A DEL MAR $"
;-----------------------------------------------------------------
posicion2:      mov ah,2
                mov bh,0
                mov dh,22
                mov dl,0
                int 10h
                ret
;-----------------------------------------------------------------------------
mostrar:        mov ax,01
                int 33h
                ret
;------------------------------------------------------------------
msgposic:       mov ah,2
                mov bh,0
                mov dh,11
                mov dl,10
                int 10h
                ret
;------------------------------------------------------------------
botoniz:        call msgposic
                
                mov ah,9
                mov dx,pulsa1
                int 21h

                add cx,si
                mov si,cx

                mov ax,cx
                mov bl,0ah
                div bl

                mov cx,ax
                
                add cl,30h
                add ch,30h

                mov ah,2
                mov dl,cl
                int 21h
                mov ah,2
                mov dl,ch
                int 21h
                ret

pulsa1:         db"N§ de Veces Pulsado el boton izquierdo:  $"

;------------------------------------------------------------------
botonde:        mov ah,9
                mov dx,pulsa2
                int 21h


                add bx,di
                mov di,bx

                mov ax,bx
                mov bl,0ah
                div bl

                mov cx,ax
                
                add cl,30h
                add ch,30h
                         
                mov ah,2
                mov dl,cl
                int 21h
                mov ah,2
                mov dl,ch
                int 21h
                ret

pulsa2:         db,0ah,0dh,0ah,0dh,"          N§ de Veces Pulsado el boton derecho:    $"
;------------------------------------------------------------------
botonce:        mov ah,9
                mov dx,pulsa3
                int 21h

                add cl,30h
                add ch,30h

                mov ah,2
                mov dl,ch
                int 21h
                mov ah,2
                mov dl,cl
                int 21h
                ret

pulsa3:         db,0ah,0dh,0ah,0dh,"          N§ de Veces Pulsado el boton central:    $"


