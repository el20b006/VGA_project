// VGA Controller Program for mc8051 IP Core
// Author: Froeler Sarah

#include "8052.h"
#include "stdio.h"

void main(void)
{
  volatile unsigned int i1, i2;
  volatile unsigned int start_var = 0;

  P0 = 0b00000000; // s_line_beg 7-0  
  P1 = 0b00000000; // s_line_beg 9-8
  P2 = 0b00000000; // s_pixel_beg 7-0 
  P3 = 0b00000000; // s_pixel_beg 9-8

  // blink slow, for execution on real hardware
  while(1)
  {
    if(start_var == 0)
	{
	  P0 = 0b11100000;
	  P1 = 0b00000000;
	  P2 = 0b10011101;
	  P3 = 0b00000001;
	}
	
       
    // soft delay
    for(i1=0; i1<500; i1++)
      for(i2=0; i2<1000; i2++);
	
    P0 = 0b11100000;
	P1 = 0b00000000;
	P2 = 0b10011101;
	P3 = 0b00000001;
       
    // soft delay
    for(i1=0; i1<500; i1++)
      for(i2=0; i2<1000; i2++);
    
	P0 = 0b11111110;
	P1 = 0b00000000;
	P2 = 0b10111011;
	P3 = 0b00000001;

    start_var = 1;
  }
}

