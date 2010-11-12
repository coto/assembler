//programa para girar un motor paso a paso
#include<stdio.h>
#include<math.h>
#include<conio.h>
main()
{

int ar,in,inp;


clrscr();
printf("                 UNIVERSIDAD TECNICA FEDERICO SANTA MARIA   \n");
printf("                           Sede Viña del Mar\n\n\n\n");
printf("\n                    \" GIRO DE UN MOTOR PASO A PASO \"");
printf("\n                      ****************************\n\n\n");
printf("\n           Proyecto Final\n");
printf("\n           Programación de Sistemas\n");
printf("\n                             Profesor : Jose Estay A.\n");
printf("\n                             Alumnos  : Augosto C. Rodrigo\n");
printf("\n                                        Moyano V. Ivan\n");
printf("\n                             Curso    : 321-A\n");

getch();
while(1)
{
clrscr();
printf("\n                    \" GIRO DE UN MOTOR PASO A PASO \"");
printf("\n                      ****************************\n\n\n");
printf("\n           ff gira en sentido reloj\n");
printf("\n           77 gira en sentido anti-reloj\n");
printf("\n           6f gira en sentido reloj a medios pasos\n");
printf("\n           67 gira en sentido anti-reloj en medios pasos\n");
printf("\n           Presione escape para detener el motor\n\n");



in=inport(0x379);
/*swith(in)
case*/
inp=in&0xff;
printf("\n puerto de entrada: %x ",inp);

outportb(0x378,0x8);
getch();
outportb(0x378,0x4);
getch();
outportb(0x378,0x2);
getch();
outportb(0x378,0x1);






   printf("\n\nOtro Giro (S/N)");
   getch();
/*if (ar==110|ar==27)*/
  if (inp==0xff|inp==0xf7|inp==0xef|inp==0xe7)
   {
   clrscr();
   outportb(0x378,0x00);
   gotoxy(3,12);
   printf("  PROGRAMA DISEÑADO POR LOS ALUMNOS :\n\n\n");
   printf("              *    Rodrigo Augosto Cancino \n\n");
   printf("              *    Ivan Moyano Varas ");
   break;             
   }
    }
return(0);
}