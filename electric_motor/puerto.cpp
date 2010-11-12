/***********************************************************
Programa simple que controla, a través de un interfaz, el giro
hacia un lado y el otro de un motor paso a paso.
**************************************************************/

#include <stdio.h>
#include <dos.h>
#include <math.h>
#include <conio.h>

#define pdir 0x378

void main(void)
{
	int i,j,m;
	char direccion;
	unsigned char corta;
	clrscr();
	printf("¨Giro derecho o izquierdo? (d/i)\n");
volver:	scanf("%c",&direccion);
	switch(direccion)
	{
	   case 'd':
	   {
	      printf("\n Girando hacia la derecha. Esc para cancelar");
	      for (;;)   /* forever */
	      {
		 corta=inportb(0x379);
		 if(corta==1)break;
		 for(i=0;i<=3;i++)
		 {
		    j=pow(2,i);
		    outportb(pdir,j);
		    for(m=0;m<=100;m++)
		 	{
		        }
		 }
	      }
	   break;
	   }
	   case 'i':
	   {
	      printf("\n Girando hacia la izquierda. Esc para cancelar");
	      for(;;)   /* forever */
	      {
		corta=inportb(0x379);
		if(corta==1)break;
		for(i=3;i>=0;--i)
		{
		  j=pow(2,i);
		  outportb(pdir,j);
		  for(m=0;m<=100;m++)
		  {
                  }
		}
	      }
	   break;
	   }
	   default: goto volver;
	}

clrscr();
}