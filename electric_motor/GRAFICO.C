/* PROGRAMA PARA CONTROLAR EL SENTIDO */
/*  DE GIRO DE UN MOTOR PASO A PASO */

/* PROGRAMA REALIZADO POR LOS ALUMNOS */
/*   - RODRIGO AUGOSTO CANCINO   */
/*   - IVAN MOYANO VARAS */

#include<graphics.h>
#include<stdlib.h>
#include<stdio.h>
#include<conio.h>

void recuadro();

main()

{
int i,ar,in,inp;

/*modo grafico*/
int gdriver=DETECT,gmode,errorcode;
initgraph(&gdriver,&gmode,"..\\bgi");
errorcode=graphresult();
if (errorcode!= grOk)
	{
	printf("Error grafico: %s/n",grapherrormsg(errorcode));
	printf("Presione cualquier tecla:");
	getch();
	exit(1);
}


getch();




/* >>>>>>>>>>>>> INTRODUCCION <<<<<<<<<<<<<<<<*/

/* Background */
setcolor(1);
for (i=240; i>=0; i--)
	{
	/*delay(50);*/
	rectangle(i,i,getmaxx()-i,getmaxy()-i);
	}

setcolor(14);
rectangle(0,0,getmaxx(),getmaxy());
rectangle(1,1,getmaxx()-1,getmaxy()-1);
rectangle(2,2,getmaxx()-2,getmaxy()-2);
rectangle(3,3,getmaxx()-3,getmaxy()-3);
rectangle(4,4,getmaxx()-4,getmaxy()-4);
rectangle(5,5,getmaxx()-5,getmaxy()-5);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,420,"UNIVERSIDAD");
outtextxy(20,270,"SANTA");
outtextxy(20,115,"VINA");
outtextxy(614,420,"UNIVERSIDAD");
outtextxy(614,270,"SANTA");
outtextxy(614,115,"VINA");
setcolor(9);
rectangle(6,6,getmaxx()-6,getmaxy()-6);
rectangle(7,7,getmaxx()-7,getmaxy()-7);
rectangle(8,8,getmaxx()-8,getmaxy()-8);
rectangle(9,9,getmaxx()-9,getmaxy()-9);
rectangle(10,10,getmaxx()-10,getmaxy()-10);
rectangle(11,11,getmaxx()-11,getmaxy()-11);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,365,"TECNICA");
outtextxy(20,237,"MARIA");
outtextxy(20,91,"DEL");
outtextxy(614,365,"TECNICA");
outtextxy(614,237,"MARIA");
outtextxy(614,91,"DEL");
setcolor(4);
rectangle(12,12,getmaxx()-12,getmaxy()-12);
rectangle(13,13,getmaxx()-13,getmaxy()-13);
rectangle(14,14,getmaxx()-14,getmaxy()-14);
rectangle(15,15,getmaxx()-15,getmaxy()-15);
rectangle(16,16,getmaxx()-16,getmaxy()-16);
rectangle(17,17,getmaxx()-17,getmaxy()-17);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,315,"FEDERICO");	
outtextxy(20,140,"SEDE");	
outtextxy(20,71,"MAR");	
outtextxy(614,315,"FEDERICO");	
outtextxy(614,140,"SEDE");	
outtextxy(614,71,"MAR");	
/*fin background */



setcolor(4);
for(i=0; i<=133; i++)rectangle(50+i,50+i,580-i,190-i);

/*line (col1,fila1,col2,fila2) */

setcolor(14);
line(50,50,50,190);
line(51,50,51,190);
line(52,50,52,190);

line(580,50,580,190);
line(581,50,581,190);
line(582,50,582,190);

line(50,50,580,50);
line(50,51,580,51);
line(50,52,580,52);

line(50,190,582,190);
line(50,191,582,191);
line(50,192,582,192);

setcolor(14);
settextstyle(SANS_SERIF_FONT,HORIZ_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(312,100,"PROGRAMACION DE SISTEMAS");
settextstyle(SANS_SERIF_FONT,HORIZ_DIR,3);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(312,160,"Proyecto Final");

setcolor(14);
settextstyle(SANS_SERIF_FONT,HORIZ_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(320,230,"Control de un Motor Paso a Paso");

settextstyle(SANS_SERIF_FONT,HORIZ_DIR,2);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(320,370,"ALUMNOS:");
outtextxy(320,390,"Rodrigo Augosto Cancino");
outtextxy(320,410,"Ivan Moyano Varas");

/* >>>>>>>>>>>>>> FIN INTRODUCCION <<<<<<<<<<<<<<<<<*/







/*delay(9999);	delay(9999);	delay(9999);	delay(9999);*/
/*delay(9999);	delay(9999);	delay(9999);	delay(9999);*/
/*delay(9999);	delay(9999);*/
	delay(9000);








/* >>>>>> FUNCIONAMIENTO  <<<<<<<<<< */

/* Background*/
setcolor(1);
for (i=0; i<=240; i++)rectangle(i,i,getmaxx()-i,getmaxy()-i);
setcolor(14);
rectangle(0,0,getmaxx(),getmaxy());
rectangle(1,1,getmaxx()-1,getmaxy()-1);
rectangle(2,2,getmaxx()-2,getmaxy()-2);
rectangle(3,3,getmaxx()-3,getmaxy()-3);
rectangle(4,4,getmaxx()-4,getmaxy()-4);
rectangle(5,5,getmaxx()-5,getmaxy()-5);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,420,"UNIVERSIDAD");
outtextxy(20,270,"SANTA");
outtextxy(20,115,"VINA");
outtextxy(614,420,"UNIVERSIDAD");
outtextxy(614,270,"SANTA");
outtextxy(614,115,"VINA");
setcolor(9);
rectangle(6,6,getmaxx()-6,getmaxy()-6);
rectangle(7,7,getmaxx()-7,getmaxy()-7);
rectangle(8,8,getmaxx()-8,getmaxy()-8);
rectangle(9,9,getmaxx()-9,getmaxy()-9);
rectangle(10,10,getmaxx()-10,getmaxy()-10);
rectangle(11,11,getmaxx()-11,getmaxy()-11);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,365,"TECNICA");
outtextxy(20,237,"MARIA");
outtextxy(20,91,"DEL");
outtextxy(614,365,"TECNICA");
outtextxy(614,237,"MARIA");
outtextxy(614,91,"DEL");
setcolor(4);
rectangle(12,12,getmaxx()-12,getmaxy()-12);
rectangle(13,13,getmaxx()-13,getmaxy()-13);
rectangle(14,14,getmaxx()-14,getmaxy()-14);
rectangle(15,15,getmaxx()-15,getmaxy()-15);
rectangle(16,16,getmaxx()-16,getmaxy()-16);
rectangle(17,17,getmaxx()-17,getmaxy()-17);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,315,"FEDERICO");	
outtextxy(20,140,"SEDE");
outtextxy(20,71,"MAR");	
outtextxy(614,315,"FEDERICO");
outtextxy(614,140,"SEDE");	
outtextxy(614,71,"MAR");	
/*fin background */

setcolor(14);
for(i=0; i<=100; i++)rectangle(50+i,80+i,580-i,182-i);

setcolor(1);

/*line (col1,fila1,col2,fila2) */

line(55,85,55,175);
line(56,85,56,175);
line(57,85,57,175);

line(573,85,573,175);
line(574,85,574,175);
line(575,85,575,175);

line(55,85,575,85);
line(55,86,575,86);
line(55,87,575,87);

line(55,175,575,175);
line(55,176,575,176);
line(55,177,575,177);


setcolor(1);
settextjustify(CENTER_TEXT,CENTER_TEXT);
settextstyle(SANS_SERIF_FONT, HORIZ_DIR,2);
outtextxy(300, 122, "DESCRIPCION DE FUNCIONAMIENTO");
outtextxy(300, 142, "DEL PROGRAMA");

setcolor(14);
settextjustify(CENTER_TEXT, CENTER_TEXT);
settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 2);
outtextxy(300, 220, "Programa disenado para controlar");
outtextxy(300, 245, "el movimiento de un motor paso a paso");
outtextxy(300, 270, "por intermedio de un Dip - Switch");
outtextxy(300, 295, "A continuacion se daran a conocer");
outtextxy(300, 320, "las posiciones del switch para");
outtextxy(300, 345, "distintos movimientos del motor.");

/*  >>>>>>>>>> FIN FUNCIONAMIENTO <<<<<<<<<<<<<<<<<*/






/*delay(9999);	delay(9999);	delay(9999);	delay(9999);*/
/*delay(9999);	delay(9999);	delay(9999);	delay(9999);*/
/*delay(9999);	delay(9999);	delay(9999);*/
delay(9000);









/* >>>>>>>>>>>> PROGRAMA <<<<<<<<<<<<<<<<<<<<<<*/


while(1)
{

/* Background*/
setcolor(1);
for (i=0; i<=240; i++)rectangle(i,i,getmaxx()-i,getmaxy()-i);
setcolor(14);
rectangle(0,0,getmaxx(),getmaxy());
rectangle(1,1,getmaxx()-1,getmaxy()-1);
rectangle(2,2,getmaxx()-2,getmaxy()-2);
rectangle(3,3,getmaxx()-3,getmaxy()-3);
rectangle(4,4,getmaxx()-4,getmaxy()-4);
rectangle(5,5,getmaxx()-5,getmaxy()-5);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,420,"UNIVERSIDAD");
outtextxy(20,270,"SANTA");
outtextxy(20,115,"VINA");
outtextxy(614,420,"UNIVERSIDAD");
outtextxy(614,270,"SANTA");
outtextxy(614,115,"VINA");
setcolor(9);
rectangle(6,6,getmaxx()-6,getmaxy()-6);
rectangle(7,7,getmaxx()-7,getmaxy()-7);
rectangle(8,8,getmaxx()-8,getmaxy()-8);
rectangle(9,9,getmaxx()-9,getmaxy()-9);
rectangle(10,10,getmaxx()-10,getmaxy()-10);
rectangle(11,11,getmaxx()-11,getmaxy()-11);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,365,"TECNICA");
outtextxy(20,237,"MARIA");
outtextxy(20,91,"DEL");
outtextxy(614,365,"TECNICA");
outtextxy(614,237,"MARIA");
outtextxy(614,91,"DEL");
setcolor(4);
rectangle(12,12,getmaxx()-12,getmaxy()-12);
rectangle(13,13,getmaxx()-13,getmaxy()-13);
rectangle(14,14,getmaxx()-14,getmaxy()-14);
rectangle(15,15,getmaxx()-15,getmaxy()-15);
rectangle(16,16,getmaxx()-16,getmaxy()-16);
rectangle(17,17,getmaxx()-17,getmaxy()-17);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,315,"FEDERICO");	
outtextxy(20,140,"SEDE");	
outtextxy(20,71,"MAR");	
outtextxy(614,315,"FEDERICO");
outtextxy(614,140,"SEDE");
outtextxy(614,71,"MAR");	
/*fin background */

setcolor(4);
for(i=0; i<=100; i++)rectangle(50+i,80+i,580-i,182-i);

setcolor(15);

/*line (col1,fila1,col2,fila2) */

line(55,85,55,175);
line(56,85,56,175);
line(57,85,57,175);

line(573,85,573,175);
line(574,85,574,175);
line(575,85,575,175);

line(55,85,575,85);
line(55,86,575,86);
line(55,87,575,87);

line(55,175,575,175);
line(55,176,575,176);
line(55,177,575,177);

setcolor(14);
settextstyle(SANS_SERIF_FONT, HORIZ_DIR,2);
settextjustify(CENTER_TEXT, CENTER_TEXT);
outtextxy(315,130,"POSICIONES DEL DIP SWITCH");
settextjustify(LEFT_TEXT, CENTER_TEXT);
settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 1);
outtextxy(110, 240, " 0 0  El Motor esta detenido");
outtextxy(110, 260, " 0 1  El Motor avanza 36 grados y se detiene");
outtextxy(110, 280, " 1 0  El Motor avanza 18 grados y se detiene");
outtextxy(110, 300, " 1 1  El Motor retrocede 36 grados y se detiene");



in=inport(0x379);
inp=in&0xff;
printf("\n puerto de entrada: %x ",inp);

switch(inp){
case 0x7f : outportb(0x378,0x88);
	    outportb(0x378,0x44);
	    outportb(0x378,0x22);
	    outportb(0x378,0x11);
	    break;

case 0x6f : outportb(0x378,0x11);
	    outportb(0x378,0x22);
	    outportb(0x378,0x44);
	    outportb(0x378,0x88);
	    break;

case 0x77 : outportb(0x378,0x88);
	    outportb(0x378,0xcc);
	    outportb(0x378,0x44);
	    outportb(0x378,0x66);
	    outportb(0x378,0x22);
	    outportb(0x378,0x33);
	    outportb(0x378,0x11);
	    outportb(0x378,0x99);
	    break;

case 0x67 : outportb(0x378,0x11);
	    outportb(0x378,0x33);
	    outportb(0x378,0x22);
	    outportb(0x378,0x66);
	    outportb(0x378,0x44);
	    outportb(0x378,0xcc);
	    outportb(0x378,0x88);
	    outportb(0x378,0x99);
	    break;

default : break;
}

/* >>>>>>>>>>>> FIN PROGRAMA <<<<<<<<<<<<<<*/




setcolor(15);
settextstyle(SANS_SERIF_FONT,HORIZ_DIR,1);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(500,450,"Otro giro (s/n)");


/*if (inp==0xff|inp==0xe7|inp==0xef|inp==0xf7)*/

ar=getch();
if (ar==110|ar==27)

{
	clrscr();
 	outportb(0x378,0x00);

	/* Background*/
setcolor(1);
for (i=0; i<=240; i++)rectangle(i,i,getmaxx()-i,getmaxy()-i);
setcolor(14);
rectangle(0,0,getmaxx(),getmaxy());
rectangle(1,1,getmaxx()-1,getmaxy()-1);
rectangle(2,2,getmaxx()-2,getmaxy()-2);
rectangle(3,3,getmaxx()-3,getmaxy()-3);
rectangle(4,4,getmaxx()-4,getmaxy()-4);
rectangle(5,5,getmaxx()-5,getmaxy()-5);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,420,"UNIVERSIDAD");
outtextxy(20,270,"SANTA");
outtextxy(20,115,"VINA");
outtextxy(614,420,"UNIVERSIDAD");
outtextxy(614,270,"SANTA");
outtextxy(614,115,"VINA");
setcolor(9);
rectangle(6,6,getmaxx()-6,getmaxy()-6);
rectangle(7,7,getmaxx()-7,getmaxy()-7);
rectangle(8,8,getmaxx()-8,getmaxy()-8);
rectangle(9,9,getmaxx()-9,getmaxy()-9);
rectangle(10,10,getmaxx()-10,getmaxy()-10);
rectangle(11,11,getmaxx()-11,getmaxy()-11);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,365,"TECNICA");
outtextxy(20,237,"MARIA");
outtextxy(20,91,"DEL");
outtextxy(614,365,"TECNICA");
outtextxy(614,237,"MARIA");
outtextxy(614,91,"DEL");
setcolor(4);
rectangle(12,12,getmaxx()-12,getmaxy()-12);
rectangle(13,13,getmaxx()-13,getmaxy()-13);
rectangle(14,14,getmaxx()-14,getmaxy()-14);
rectangle(15,15,getmaxx()-15,getmaxy()-15);
rectangle(16,16,getmaxx()-16,getmaxy()-16);
rectangle(17,17,getmaxx()-17,getmaxy()-17);
settextstyle(SMALL_FONT,VERT_DIR,4);
settextjustify(CENTER_TEXT,CENTER_TEXT);
outtextxy(20,315,"FEDERICO");	
outtextxy(20,140,"SEDE");	
outtextxy(20,71,"MAR");	
outtextxy(614,315,"FEDERICO");	
outtextxy(614,140,"SEDE");	
outtextxy(614,71,"MAR");
/*fin background */



	setcolor(15);
	settextstyle(GOTHIC_FONT,HORIZ_DIR,2);
	settextjustify(CENTER_TEXT,CENTER_TEXT);
	outtextxy(300,40,"UNIVERSIDAD TECNICA FEDERICO SANTA MARIA");
	outtextxy(340,60,"Sede Vina del Mar - CHILE");

	settextstyle(TRIPLEX_FONT,HORIZ_DIR,3);
	settextjustify(LEFT_TEXT,CENTER_TEXT);
	outtextxy(180,200,"ALUMNOS:");
	outtextxy(200,220,"* Rodrigo Augosto Cancino");
	outtextxy(200,240,"* Ivan Moyano Varas");

	settextstyle(TRIPLEX_FONT,HORIZ_DIR,3);
	settextjustify(LEFT_TEXT,CENTER_TEXT);
	outtextxy(180,280,"PROFESOR:");
	outtextxy(200,300,"* Jose Estay");

	settextstyle(SMALL_FONT,HORIZ_DIR,4);
	settextjustify(CENTER_TEXT,CENTER_TEXT);
	outtextxy(310,430,"www.ivaninternet.com");
	outtextxy(310,440,"www.alumnos.utfsm.cl/~raugostc");
	outtextxy(310,450,">>>>TODOS LOS DERECHOS RESERVADOS<<<<");

	settextstyle(SANS_SERIF_FONT,VERT_DIR,2);
	settextjustify(CENTER_TEXT,CENTER_TEXT);
	outtextxy(60,270,"CARRERA DE ELECTRONICA");
	outtextxy(40,270,"PROGRAMACION DE SISTEMAS");

	settextstyle(SANS_SERIF_FONT,VERT_DIR,2);
	settextjustify(CENTER_TEXT,CENTER_TEXT);
	outtextxy(580,270,"CARRERA DE ELECTRONICA");
	outtextxy(600,270,"PROGRAMACION DE SISTEMAS");

	/*delay(9999);	delay(9999);	delay(60999);	delay(9999);*/
	/*delay(9999);	delay(9999);	delay(9999);	delay(9999);*/
	/*delay(9999);	delay(9999);	delay(9999);	delay(9999);*/
	/*delay(9999);	delay(9999);*/
	delay(9000);

	break;
  	}
}
closegraph();
return(0);
}