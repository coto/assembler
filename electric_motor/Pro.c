#include <graphics.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <dos.h>

void inicio();
void alarma();
void Zonas();
void ZonaA();
void ZonaB();
void ZonaC();
void ZonaD();
void fin();

int i, stop, opcion, pto_in=0x379, pto_out=0x378;

main ()
{
int gdriver=DETECT, gmode, errorcode;
initgraph(&gdriver, &gmode, "..\\bgi");
errorcode=graphresult();
if (errorcode!=grOk)
	{
	printf("Error grafico: %s\n", grapherrormsg(errorcode));
	printf("Presione cualquier tecla: ");
	getch();
	exit(1);
	}
inicio();
Zonas();
while (!kbhit())
{
alarma();
opcion=inportb(pto_in);
opcion=(opcion)&(224);
switch(opcion)
{
case 0x40: ZonaA();
	   break;
case 0x50: ZonaB();
	   break;
case 0x60: ZonaC();
	   break;
case 0x70: ZonaD();
	   break;
default:   break;
}
}
fin();
closegraph();
return(0);
}

void inicio()
{
for (i=0; i<=30; i++)
{
setcolor(9);
rectangle(i,i,getmaxx()-i,getmaxy()-i);
}
for (i=30; i<=240; i++)
{
setcolor(1);
rectangle(i,i,getmaxx()-i,getmaxy()-i);
}
setcolor(3);
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 7);
settextjustify(CENTER_TEXT, CENTER_TEXT);
outtextxy(320, 240, "Proyecto final");
delay(100000);
delay(100000);

for (i=100; i<=240; i++)
{
setcolor(3);
rectangle(i,i,getmaxx()-i,getmaxy()-i);
}
setcolor(1);
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 3);
outtextxy(320, 130, "Sistema detector de intrusion");
settextjustify(LEFT_TEXT, CENTER_TEXT);
settextstyle(SMALL_FONT, HORIZ_DIR, 6);
outtextxy(130, 190, "Este programa le senalara por medio");
delay(100000);
outtextxy(130, 210, "de un beep intermitente, una luz y en");
delay(100000);
outtextxy(130, 230, "pantalla, cuando se detecta intrusion");
delay(100000);
outtextxy(130, 250, "en alguna zona. Para desactivar la alarma");
delay(100000);
outtextxy(130, 270, "o para salir del programa solo presione");
delay(100000);
outtextxy(130, 290, "una tecla.");
delay(100000);
delay(100000);
}


void Zonas()
{
setcolor(1);
for (i=0; i<=240; i++)rectangle(i,i,getmaxx()-i,getmaxy()-i);

setcolor(9);
for(i=0; i<=133; i++)rectangle(30+i,30+i,295-i,215-i);
for(i=0; i<=133; i++)rectangle(345+i,30+i,610-i,215-i);
for(i=0; i<=133; i++)rectangle(30+i,265+i,295-i,450-i);
for(i=0; i<=133; i++)rectangle(345+i,265+i,610-i,450-i);
setcolor(11);
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 6);
settextjustify(CENTER_TEXT, CENTER_TEXT);
outtextxy(160, 120, "Zona A");
outtextxy(480, 120, "Zona B");
outtextxy(160, 360, "Zona C");
outtextxy(480, 360, "Zona D");
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 2);
outtextxy(320, 460, "para salir presione cualquier tecla");
}


void alarma()
{
opcion=inportb(pto_in);
opcion=(opcion)&(0x80);
setcolor(11);
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 2);
settextjustify(CENTER_TEXT, CENTER_TEXT);
if (opcion==00)outtextxy(320, 240,"Alarma activada");
if (opcion==0x80)outtextxy(320, 240,"Alarma desactivada");
}

/*zona a*/
void ZonaA()
{
outportb(pto_out, 0x08);
setcolor(3);
for(i=1; i<=120; i++)
{
rectangle(30+i,30+i,295-i, 215-i);
delay(100);
}
setcolor(1);
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 2);
settextjustify(CENTER_TEXT, CENTER_TEXT);
outtextxy(160, 120, "Intrusion en Zona A");
for(stop=0;(!kbhit());stop++)
{
sound(2500);
delay(100000);
nosound();
delay(1000000);
}
getch();
Zonas();
}


/*zona b*/
void ZonaB()
{
outportb(pto_out, 0x04);
setcolor(3);
for(i=1; i<=120; i++)
{
rectangle(345+i,30+i,610-i, 215-i);
delay(100);
}
setcolor(1);
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 2);
settextjustify(CENTER_TEXT, CENTER_TEXT);
outtextxy(480, 120, "Intrusion en Zona B");
for(stop=0;(!kbhit());stop++)
{
sound(2500);
delay(100000);
nosound();
delay(1000000);
}
getch();
Zonas();
}

/*zona c*/
void ZonaC()
{
outportb(pto_out, 0x02);
setcolor(3);
for(i=1; i<=120; i++)
{
rectangle(30+i,265+i,295-i, 450-i);
delay(100);
}
setcolor(1);
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 2);
settextjustify(CENTER_TEXT, CENTER_TEXT);
outtextxy(160, 360, "Intrusion en Zona C");
for(stop=0;(!kbhit());stop++)
{
sound(2500);
delay(100000);
nosound();
delay(1000000);
}
getch();
Zonas();
}


/*zona d*/
void ZonaD()
{
outportb(pto_out, 0x01);
setcolor(3);
for(i=1; i<=120; i++)
{
rectangle(345+i,265+i,610-i, 450-i);
delay(100);
}
setcolor(1);
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 2);
settextjustify(CENTER_TEXT, CENTER_TEXT);
outtextxy(480, 360, "Intrusion en Zona D");
for(stop=0;(!kbhit());stop++)
{
sound(2500);
delay(100000);
nosound();
delay(1000000);
}
getch();
Zonas();
}


void fin()
{
setcolor(9);
for (i=0; i<=30; i++)rectangle(i,i,getmaxx()-i,getmaxy()-i);

setcolor(1);
for (i=30; i<=240; i++)rectangle(i,i,getmaxx()-i,getmaxy()-i);

setcolor(3);
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 3);
settextjustify(CENTER_TEXT, CENTER_TEXT);
outtextxy(320, 240, "Usted ha finalizado el programa");
delay(100000);
delay(100000);

setcolor(3);
for (i=100; i<=240; i++)rectangle(i,i,getmaxx()-i,getmaxy()-i);

setcolor(1);
settextstyle(TRIPLEX_FONT, HORIZ_DIR, 3);
outtextxy(320, 130, "proyect version 1.0");

settextjustify(LEFT_TEXT, CENTER_TEXT);
settextstyle(SMALL_FONT, HORIZ_DIR, 6);
outtextxy(130, 190, "Este programa ha sido desarrollado en");
delay(100000);
outtextxy(130, 210, "en los laboratorios de Electronica de la");
delay(100000);
outtextxy(130, 230, "Universidad Tecnica Federico Santa Maria");
delay(100000);
outtextxy(130, 250, "sede Jose Miguel Carrera, Vina del Mar");
delay(100000);
outtextxy(130, 270, "por Jose Luis Jacob Giacaman.");
delay(100000);
outtextxy(130, 290, "Finalizado en Junio del 2001.");
delay(100000);
outtextxy(130, 320, "       jjacob@alumnos.utfsm.cl");
delay(100000);
getch();
getch();
}