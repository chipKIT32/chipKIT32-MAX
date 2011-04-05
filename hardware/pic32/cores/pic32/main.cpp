//************************************************************************
//*	main.c
//*	
//*	Arduino core files for PIC32
//*		Copyright (c) 2010 by Mark Sproul
//*	
//*	
//************************************************************************
//*	this code is based on code Copyright (c) 2005-2006 David A. Mellis
//*	
//*	This library is free software; you can redistribute it and/or
//*	modify it under the terms of the GNU Lesser General Public
//*	License as published by the Free Software Foundation; either
//*	version 2.1 of the License, or (at your option) any later version.
//*	
//*	This library is distributed in the hope that it will be useful,
//*	but WITHOUT ANY WARRANTY; without even the implied warranty of
//*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.//*	See the GNU
//*	Lesser General Public License for more details.
//*	
//*	You should have received a copy of the GNU Lesser General
//*	Public License along with this library; if not, write to the
//*	Free Software Foundation, Inc., 59 Temple Place, Suite 330,
//*	Boston, MA  02111-1307  USA
//*	
//*	
//************************************************************************
//*	Edit History
//************************************************************************
//*	Oct 12,	2010	Got MPLAB X working on MacOSX 1.6 for the first time
//************************************************************************


#include "WProgram.h"


//************************************************************************
int main(void)
{
	init();

	setup();

	while (1)
	{
		loop();
	}
	return 0;
}

