//************************************************************************
//*	cpudefs.h
//*	
//*	Arduino core files for PIC32
//*		Copyright (c) 2011 by Mark Sproul
//*	
//*		This file is designed to provide some of the cpu specific definitions
//*		that are available for avr chips and not for pic32 chips
//************************************************************************
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
//*	Boston, MA	02111-1307	USA
//*	
//*	
//************************************************************************
//*	Edit History
//************************************************************************
//*	Apr 16, 2011	<MLS> started on cpudefs.h
//*	Apr 24,	2011	<MLS> copied to bootloader, important to keep them in sync
//*	Jun 16,	2011	<MLS> Added 32MX360F256L
//*	Jun 21,	2011	<MLS> Added 32MX440F512H
//* Nov 19, 2011	<GeneApperson> corrected errors in some parts, added
//*						definitions for all 1XX/2XX/3XX/4XX/5XX/6XX/7XX devices
//************************************************************************

//************************************************************************
//*	Microchip pic32 chip names
#if defined(__PIC32MX__)	

	#define	E2END		0x0fff	//*	4 k of simulated EEPROM
	
	//************************************************************************
	//*	100 series

	#if defined(__32MX110F016B__)
		#define _CPU_NAME_	"32MX110F016B"
		#define	FLASHEND	(((16 - 4) * 1024L) - 1)
		#define	RAMEND		((4 * 1024L) - 1)

	#elif defined(__32MX110F016C__)
		#define _CPU_NAME_	"32MX110F016C"
		#define	FLASHEND	(((16 - 4) * 1024L) - 1)
		#define	RAMEND		((4 * 1024L) - 1)

	#elif defined(__32MX110F016D__)
		#define _CPU_NAME_	"32MX110F016D"
		#define	FLASHEND	(((16 - 4) * 1024L) - 1)
		#define	RAMEND		((4 * 1024L) - 1)

	#elif defined(__32MX120F032B__)
		#define _CPU_NAME_	"32MX120F032B"
		#define	FLASHEND	(((32 - 4) * 1024L) - 1)
		#define	RAMEND		((8 * 1024L) - 1)

	#elif defined(__32MX120F032C__)
		#define _CPU_NAME_	"32MX120F032C"
		#define	FLASHEND	(((32 - 4) * 1024L) - 1)
		#define	RAMEND		((8 * 1024L) - 1)

	#elif defined(__32MX120F032D__)
		#define _CPU_NAME_	"32MX120F032D"
		#define	FLASHEND	(((32 - 4) * 1024L) - 1)
		#define	RAMEND		((8 * 1024L) - 1)

	#elif defined(__32MX130F064B__)
		#define _CPU_NAME_	"32MX130F064B"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX130F064C__)
		#define _CPU_NAME_	"32MX130F064C"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX130F064D__)
		#define _CPU_NAME_	"32MX130F064D"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX150F128B__)
		#define _CPU_NAME_	"32MX150F128B"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX150F128C__)
		#define _CPU_NAME_	"32MX150F128C"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX150F128D__)
		#define _CPU_NAME_	"32MX150F128D"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	//************************************************************************
	//*	200 series

	#elif defined(__32MX210F016B__)
		#define _CPU_NAME_	"32MX210F016B"
		#define	FLASHEND	(((16 - 4) * 1024L) - 1)
		#define	RAMEND		((4 * 1024L) - 1)

	#elif defined(__32MX210F016C__)
		#define _CPU_NAME_	"32MX210F016C"
		#define	FLASHEND	(((16 - 4) * 1024L) - 1)
		#define	RAMEND		((4 * 1024L) - 1)

	#elif defined(__32MX210F016D__)
		#define _CPU_NAME_	"32MX210F016D"
		#define	FLASHEND	(((16 - 4) * 1024L) - 1)
		#define	RAMEND		((4 * 1024L) - 1)

	#elif defined(__32MX220F032B__)
		#define _CPU_NAME_	"32MX220F032B"
		#define	FLASHEND	(((32 - 4) * 1024L) - 1)
		#define	RAMEND		((8 * 1024L) - 1)

	#elif defined(__32MX220F032C__)
		#define _CPU_NAME_	"32MX220F032C"
		#define	FLASHEND	(((32 - 4) * 1024L) - 1)
		#define	RAMEND		((8 * 1024L) - 1)

	#elif defined(__32MX220F032D__)
		#define _CPU_NAME_	"32MX220F032D"
		#define	FLASHEND	(((32 - 4) * 1024L) - 1)
		#define	RAMEND		((8 * 1024L) - 1)

	#elif defined(__32MX230F064B__)
		#define _CPU_NAME_	"32MX230F064B"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX230F064C__)
		#define _CPU_NAME_	"32MX230F064C"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX230F064D__)
		#define _CPU_NAME_	"32MX230F064D"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX250F128B__)
		#define _CPU_NAME_	"32MX250F128B"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX250F128C__)
		#define _CPU_NAME_	"32MX250F128C"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX250F128D__)
		#define _CPU_NAME_	"32MX250F128D"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	//************************************************************************
	//*	300 series

	#elif defined(__32MX320F032H__)
		#define _CPU_NAME_	"32MX320F032H"
		#define	FLASHEND	(((32 - 4) * 1024L) - 1)
		#define	RAMEND		((8 * 1024L) - 1)

	#elif defined(__32MX320F064H__)
		#define	_CPU_NAME_	"32MX320F064H"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX320F128H__)
		#define	_CPU_NAME_	"32MX320F128H"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX340F128H__)
		#define	_CPU_NAME_	"32MX340F128H"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX340F256H__)
		#define	_CPU_NAME_	"32MX340F256H"
		#define	FLASHEND	(((256 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX340F512H__)
		#define	_CPU_NAME_	"32MX340F512H"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX320F128L__)
		#define	_CPU_NAME_	"32MX320F128L"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX340F128L__)
		#define	_CPU_NAME_	"32MX340F128L"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX360F256L__)
		#define	_CPU_NAME_	"32MX360F256L"
		#define	FLASHEND	(((256 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX360F512L__)
		#define	_CPU_NAME_	"32MX360F512L"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	//************************************************************************
	//*	400 series

	#elif defined(__32MX420F032H__)
		#define	_CPU_NAME_	"32MX420F032H"
		#define	FLASHEND	(((32 - 4) * 1024L) - 1)
		#define	RAMEND		((8 * 1024L) - 1)

	#elif defined(__32MX440F128H__)
		#define	_CPU_NAME_	"32MX440F128H"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX440F256H__)
		#define	_CPU_NAME_	"32MX440F256H"
		#define	FLASHEND	(((256 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX440F512H__)
		#define	_CPU_NAME_	"32MX440F512H"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX440F128L__)
		#define	_CPU_NAME_	"32MX440F128L"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX460F256L__)
		#define	_CPU_NAME_	"32MX460F256L"
		#define	FLASHEND	(((256 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX460F512L__)
		#define	_CPU_NAME_	"32MX460F512L"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	//************************************************************************
	//*	500 series

	#elif defined(__32MX534F064H__)
		#define	_CPU_NAME_	"32MX534F064H"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX564F064H__)
		#define	_CPU_NAME_	"32MX564F064H"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX564F128H__)
		#define	_CPU_NAME_	"32MX564F128H"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX575F256H__)
		#define	_CPU_NAME_	"32MX575F256H"
		#define	FLASHEND	(((256 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX575F512H__)
		#define	_CPU_NAME_	"32MX575F512H"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX534F064L__)
		#define	_CPU_NAME_	"32MX534F064L"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((16 * 1024L) - 1)

	#elif defined(__32MX564F064L__)
		#define	_CPU_NAME_	"32MX564F064L"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX564F128L__)
		#define	_CPU_NAME_	"32MX564F128L"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX575F256L__)
		#define	_CPU_NAME_	"32MX575F256L"
		#define	FLASHEND	(((256 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX575F512L__)
		#define	_CPU_NAME_	"32MX575F512L"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	//************************************************************************
	//*	600 series

	#elif defined(__32MX664F064H__)
		#define	_CPU_NAME_	"32MX664F064H"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX664F128H__)
		#define	_CPU_NAME_	"32MX664F128H"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX675F256H__)
		#define	_CPU_NAME_	"32MX675F256H"
		#define	FLASHEND	(((256 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX675F512H__)
		#define	_CPU_NAME_	"32MX675F512H"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX695F512H__)
		#define	_CPU_NAME_	"32MX695F512H"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((128 * 1024L) - 1)

	#elif defined(__32MX664F064L__)
		#define	_CPU_NAME_	"32MX664F064L"
		#define	FLASHEND	(((64 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX664F128L__)
		#define	_CPU_NAME_	"32MX664F128L"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX675F256L__)
		#define	_CPU_NAME_	"32MX675F256L"
		#define	FLASHEND	(((256 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX675F512L__)
		#define	_CPU_NAME_	"32MX675F512L"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX695F512L__)
		#define	_CPU_NAME_	"32MX695F512L"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((128 * 1024L) - 1)

	//************************************************************************
	//*	700 series

	#elif defined(__32MX764F128H__)
		#define	_CPU_NAME_	"32MX764F128H"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX775F256H__)
		#define	_CPU_NAME_	"32MX775F256H"
		#define	FLASHEND	(((256 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX775F512H__)
		#define	_CPU_NAME_	"32MX775F512H"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX795F512H__)
		#define	_CPU_NAME_	"32MX795F512H"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((128 * 1024L) - 1)

	#elif defined(__32MX764F128L__)
		#define	_CPU_NAME_	"32MX764F128L"
		#define	FLASHEND	(((128 - 4) * 1024L) - 1)
		#define	RAMEND		((32 * 1024L) - 1)

	#elif defined(__32MX775F256L__)
		#define	_CPU_NAME_	"32MX775F256L"
		#define	FLASHEND	(((256 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX775F512L__)
		#define	_CPU_NAME_	"32MX775F512L"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((64 * 1024L) - 1)

	#elif defined(__32MX795F512L__)
		#define	_CPU_NAME_	"32MX795F512L"
		#define	FLASHEND	(((512 - 4) * 1024L) - 1)
		#define	RAMEND		((128 * 1024L) - 1)

	//************************************************************************
	#else
		#error CPU type is unknown, cpudefs.h needs to have additions
	#endif

#else
	#error unknown cpu architecture
#endif

//************************************************************************
#ifndef _CPU_NAME_
	#define	_CPU_NAME_	"Unknown"
#endif
