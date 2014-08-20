/*--------------------------------------------------------------------------
 * MPLAB XC Compiler -  PIC32MZ2048ECH100 linker script
 *
 * This software is developed by Microchip Technology Inc. and its
 * subsidiaries ("Microchip").
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * 1.      Redistributions of source code must retain the above copyright
 *         notice, this list of conditions and the following disclaimer.
 * 2.      Redistributions in binary form must reproduce the above
 *         copyright notice, this list of conditions and the following
 *         disclaimer in the documentation and/or other materials provided
 *         with the distribution.
 * 3.      Microchip's name may not be used to endorse or promote products
 *         derived from this software without specific prior written
 *         permission.
 *
 * THIS SOFTWARE IS PROVIDED BY MICROCHIP "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL MICROCHIP BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWSOEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *-------------------------------------------------------------------------*/

/* Default linker script, for normal executables */

/*  NOTE: This single-file linker script replaces the two-file system used
 *  for older PIC32 devices.
 */

OUTPUT_FORMAT("elf32-tradlittlemips")
OUTPUT_ARCH(pic32mx)
ENTRY(_reset)
/*
 * Provide for a minimum stack and heap size
 * - _min_stack_size - represents the minimum space that must be made
 *                     available for the stack.  Can be overridden from
 *                     the command line using the linker's --defsym option.
 * - _min_heap_size  - represents the minimum space that must be made
 *                     available for the heap.  Must be specified on
 *                     the command line using the linker's --defsym option.
 */
EXTERN (_min_stack_size _min_heap_size)
PROVIDE(_min_stack_size = 0x800) ;
PROVIDE(_min_heap_size = 0x800) ;

/*************************************************************************
 * Processor-specific object file.  Contains SFR definitions.
 *************************************************************************/
INPUT("processor.o")

/*************************************************************************
 * Processor-specific peripheral libraries are optional
 *************************************************************************/
OPTIONAL("libmchp_peripheral.a")
OPTIONAL("libmchp_peripheral_32MZ2048ECH100.a")

/*************************************************************************
 * Vector-offset initialization
 *************************************************************************/
OPTIONAL("vector_offset_init.o")

MEMORY
{
  kseg0_vector_mem            : ORIGIN = 0x9D000000, LENGTH = 0x1000
  kseg1_vector_mem            : ORIGIN = 0xBD000000, LENGTH = 0x1000
  kseg0_program_mem    (rx)   : ORIGIN = 0x9D001000, LENGTH = 0x1FB000
  kseg0_eeprom_mem            : ORIGIN = 0x9D1FC000, LENGTH = 0x4000
  kseg0_boot_mem              : ORIGIN = 0x9FC004B0, LENGTH = 0x0
  kseg1_boot_mem              : ORIGIN = 0xBFC00000, LENGTH = 0x0
  kseg1_boot_mem_4B0          : ORIGIN = 0xBFC004B0, LENGTH = 0x0
  configsfrs                  : ORIGIN = 0xBFC0FFC0, LENGTH = 0x10
  config_BFC0FF40             : ORIGIN = 0xBFC0FF40, LENGTH = 0x4
  config_BFC0FF44             : ORIGIN = 0xBFC0FF44, LENGTH = 0x4
  config_BFC0FF48             : ORIGIN = 0xBFC0FF48, LENGTH = 0x4
  config_BFC0FF4C             : ORIGIN = 0xBFC0FF4C, LENGTH = 0x4
  config_BFC0FF50             : ORIGIN = 0xBFC0FF50, LENGTH = 0x4
  config_BFC0FF54             : ORIGIN = 0xBFC0FF54, LENGTH = 0x4
  config_BFC0FF58             : ORIGIN = 0xBFC0FF58, LENGTH = 0x4
  config_BFC0FF5C             : ORIGIN = 0xBFC0FF5C, LENGTH = 0x4
  config_BFC0FF60             : ORIGIN = 0xBFC0FF60, LENGTH = 0x4
  config_BFC0FF64             : ORIGIN = 0xBFC0FF64, LENGTH = 0x4
  config_BFC0FF68             : ORIGIN = 0xBFC0FF68, LENGTH = 0x4
  config_BFC0FF6C             : ORIGIN = 0xBFC0FF6C, LENGTH = 0x4
  config_BFC0FF70             : ORIGIN = 0xBFC0FF70, LENGTH = 0x4
  config_BFC0FF74             : ORIGIN = 0xBFC0FF74, LENGTH = 0x4
  config_BFC0FF78             : ORIGIN = 0xBFC0FF78, LENGTH = 0x4
  config_BFC0FF7C             : ORIGIN = 0xBFC0FF7C, LENGTH = 0x4
  config_BFC0FFC0             : ORIGIN = 0xBFC0FFC0, LENGTH = 0x4
  config_BFC0FFC4             : ORIGIN = 0xBFC0FFC4, LENGTH = 0x4
  config_BFC0FFC8             : ORIGIN = 0xBFC0FFC8, LENGTH = 0x4
  config_BFC0FFCC             : ORIGIN = 0xBFC0FFCC, LENGTH = 0x4
  config_BFC0FFD0             : ORIGIN = 0xBFC0FFD0, LENGTH = 0x4
  config_BFC0FFD4             : ORIGIN = 0xBFC0FFD4, LENGTH = 0x4
  config_BFC0FFD8             : ORIGIN = 0xBFC0FFD8, LENGTH = 0x4
  config_BFC0FFDC             : ORIGIN = 0xBFC0FFDC, LENGTH = 0x4
  config_BFC0FFE0             : ORIGIN = 0xBFC0FFE0, LENGTH = 0x4
  config_BFC0FFE4             : ORIGIN = 0xBFC0FFE4, LENGTH = 0x4
  config_BFC0FFE8             : ORIGIN = 0xBFC0FFE8, LENGTH = 0x4
  config_BFC0FFEC             : ORIGIN = 0xBFC0FFEC, LENGTH = 0x4
  config_BFC0FFF0             : ORIGIN = 0xBFC0FFF0, LENGTH = 0x4
  config_BFC0FFF4             : ORIGIN = 0xBFC0FFF4, LENGTH = 0x4
  config_BFC0FFF8             : ORIGIN = 0xBFC0FFF8, LENGTH = 0x4
  config_BFC0FFFC             : ORIGIN = 0xBFC0FFFC, LENGTH = 0x4
  lowerbootaliaslastpage      : ORIGIN = 0xBFC10000, LENGTH = 0x4000
  upperbootalias              : ORIGIN = 0xBFC20000, LENGTH = 0x14000
  boot1                       : ORIGIN = 0xBFC40000, LENGTH = 0xFF00
  config_BFC4FF40             : ORIGIN = 0xBFC4FF40, LENGTH = 0x4
  config_BFC4FF44             : ORIGIN = 0xBFC4FF44, LENGTH = 0x4
  config_BFC4FF48             : ORIGIN = 0xBFC4FF48, LENGTH = 0x4
  config_BFC4FF4C             : ORIGIN = 0xBFC4FF4C, LENGTH = 0x4
  config_BFC4FF50             : ORIGIN = 0xBFC4FF50, LENGTH = 0x4
  config_BFC4FF54             : ORIGIN = 0xBFC4FF54, LENGTH = 0x4
  config_BFC4FF58             : ORIGIN = 0xBFC4FF58, LENGTH = 0x4
  config_BFC4FF5C             : ORIGIN = 0xBFC4FF5C, LENGTH = 0x4
  config_BFC4FF60             : ORIGIN = 0xBFC4FF60, LENGTH = 0x4
  config_BFC4FF64             : ORIGIN = 0xBFC4FF64, LENGTH = 0x4
  config_BFC4FF68             : ORIGIN = 0xBFC4FF68, LENGTH = 0x4
  config_BFC4FF6C             : ORIGIN = 0xBFC4FF6C, LENGTH = 0x4
  config_BFC4FF70             : ORIGIN = 0xBFC4FF70, LENGTH = 0x4
  config_BFC4FF74             : ORIGIN = 0xBFC4FF74, LENGTH = 0x4
  config_BFC4FF78             : ORIGIN = 0xBFC4FF78, LENGTH = 0x4
  config_BFC4FF7C             : ORIGIN = 0xBFC4FF7C, LENGTH = 0x4
  config_BFC4FFC0             : ORIGIN = 0xBFC4FFC0, LENGTH = 0x4
  config_BFC4FFC4             : ORIGIN = 0xBFC4FFC4, LENGTH = 0x4
  config_BFC4FFC8             : ORIGIN = 0xBFC4FFC8, LENGTH = 0x4
  config_BFC4FFCC             : ORIGIN = 0xBFC4FFCC, LENGTH = 0x4
  config_BFC4FFD0             : ORIGIN = 0xBFC4FFD0, LENGTH = 0x4
  config_BFC4FFD4             : ORIGIN = 0xBFC4FFD4, LENGTH = 0x4
  config_BFC4FFD8             : ORIGIN = 0xBFC4FFD8, LENGTH = 0x4
  config_BFC4FFDC             : ORIGIN = 0xBFC4FFDC, LENGTH = 0x4
  config_BFC4FFE0             : ORIGIN = 0xBFC4FFE0, LENGTH = 0x4
  config_BFC4FFE4             : ORIGIN = 0xBFC4FFE4, LENGTH = 0x4
  config_BFC4FFE8             : ORIGIN = 0xBFC4FFE8, LENGTH = 0x4
  config_BFC4FFEC             : ORIGIN = 0xBFC4FFEC, LENGTH = 0x4
  config_BFC4FFF0             : ORIGIN = 0xBFC4FFF0, LENGTH = 0x4
  config_BFC4FFF4             : ORIGIN = 0xBFC4FFF4, LENGTH = 0x4
  config_BFC4FFF8             : ORIGIN = 0xBFC4FFF8, LENGTH = 0x4
  config_BFC4FFFC             : ORIGIN = 0xBFC4FFFC, LENGTH = 0x4
  boot1lastpage               : ORIGIN = 0xBFC50000, LENGTH = 0x4000
  config_BFC54000             : ORIGIN = 0xBFC54000, LENGTH = 0x4
  config_BFC54004             : ORIGIN = 0xBFC54004, LENGTH = 0x4
  config_BFC54008             : ORIGIN = 0xBFC54008, LENGTH = 0x4
  config_BFC5400C             : ORIGIN = 0xBFC5400C, LENGTH = 0x4
  config_BFC54010             : ORIGIN = 0xBFC54010, LENGTH = 0x4
  config_BFC54020             : ORIGIN = 0xBFC54020, LENGTH = 0x4
  config_BFC54024             : ORIGIN = 0xBFC54024, LENGTH = 0x4
  boot2                       : ORIGIN = 0xBFC60000, LENGTH = 0xFF00
  config_BFC6FF40             : ORIGIN = 0xBFC6FF40, LENGTH = 0x4
  config_BFC6FF44             : ORIGIN = 0xBFC6FF44, LENGTH = 0x4
  config_BFC6FF48             : ORIGIN = 0xBFC6FF48, LENGTH = 0x4
  config_BFC6FF4C             : ORIGIN = 0xBFC6FF4C, LENGTH = 0x4
  config_BFC6FF50             : ORIGIN = 0xBFC6FF50, LENGTH = 0x4
  config_BFC6FF54             : ORIGIN = 0xBFC6FF54, LENGTH = 0x4
  config_BFC6FF58             : ORIGIN = 0xBFC6FF58, LENGTH = 0x4
  config_BFC6FF5C             : ORIGIN = 0xBFC6FF5C, LENGTH = 0x4
  config_BFC6FF60             : ORIGIN = 0xBFC6FF60, LENGTH = 0x4
  config_BFC6FF64             : ORIGIN = 0xBFC6FF64, LENGTH = 0x4
  config_BFC6FF68             : ORIGIN = 0xBFC6FF68, LENGTH = 0x4
  config_BFC6FF6C             : ORIGIN = 0xBFC6FF6C, LENGTH = 0x4
  config_BFC6FF70             : ORIGIN = 0xBFC6FF70, LENGTH = 0x4
  config_BFC6FF74             : ORIGIN = 0xBFC6FF74, LENGTH = 0x4
  config_BFC6FF78             : ORIGIN = 0xBFC6FF78, LENGTH = 0x4
  config_BFC6FF7C             : ORIGIN = 0xBFC6FF7C, LENGTH = 0x4
  config_BFC6FFC0             : ORIGIN = 0xBFC6FFC0, LENGTH = 0x4
  config_BFC6FFC4             : ORIGIN = 0xBFC6FFC4, LENGTH = 0x4
  config_BFC6FFC8             : ORIGIN = 0xBFC6FFC8, LENGTH = 0x4
  config_BFC6FFCC             : ORIGIN = 0xBFC6FFCC, LENGTH = 0x4
  config_BFC6FFD0             : ORIGIN = 0xBFC6FFD0, LENGTH = 0x4
  config_BFC6FFD4             : ORIGIN = 0xBFC6FFD4, LENGTH = 0x4
  config_BFC6FFD8             : ORIGIN = 0xBFC6FFD8, LENGTH = 0x4
  config_BFC6FFDC             : ORIGIN = 0xBFC6FFDC, LENGTH = 0x4
  config_BFC6FFE0             : ORIGIN = 0xBFC6FFE0, LENGTH = 0x4
  config_BFC6FFE4             : ORIGIN = 0xBFC6FFE4, LENGTH = 0x4
  config_BFC6FFE8             : ORIGIN = 0xBFC6FFE8, LENGTH = 0x4
  config_BFC6FFEC             : ORIGIN = 0xBFC6FFEC, LENGTH = 0x4
  config_BFC6FFF0             : ORIGIN = 0xBFC6FFF0, LENGTH = 0x4
  config_BFC6FFF4             : ORIGIN = 0xBFC6FFF4, LENGTH = 0x4
  config_BFC6FFF8             : ORIGIN = 0xBFC6FFF8, LENGTH = 0x4
  config_BFC6FFFC             : ORIGIN = 0xBFC6FFFC, LENGTH = 0x4
  boot2lastpage               : ORIGIN = 0xBFC70000, LENGTH = 0x4000
  kseg0_data_mem       (w!x)  : ORIGIN = 0x80000000, LENGTH = 0x80000
  sfrs                        : ORIGIN = 0xBF800000, LENGTH = 0x100000
  configsfrs_BFC0FF40         : ORIGIN = 0xBFC0FF40, LENGTH = 0x40
  configsfrs_BFC0FFC0         : ORIGIN = 0xBFC0FFC0, LENGTH = 0x40
  configsfrs_BFC4FF40         : ORIGIN = 0xBFC4FF40, LENGTH = 0x40
  configsfrs_BFC4FFC0         : ORIGIN = 0xBFC4FFC0, LENGTH = 0x40
  configsfrs_BFC54000         : ORIGIN = 0xBFC54000, LENGTH = 0x14
  configsfrs_BFC54020         : ORIGIN = 0xBFC54020, LENGTH = 0x8
  configsfrs_BFC6FF40         : ORIGIN = 0xBFC6FF40, LENGTH = 0x40
  configsfrs_BFC6FFC0         : ORIGIN = 0xBFC6FFC0, LENGTH = 0x40
  kseg2_ebi_data_mem          : ORIGIN = 0xC0000000, LENGTH = 0x4000000
  kseg2_sqi_data_mem          : ORIGIN = 0xD0000000, LENGTH = 0x4000000
  kseg3_ebi_data_mem          : ORIGIN = 0xE0000000, LENGTH = 0x4000000
  kseg3_sqi_data_mem          : ORIGIN = 0xF0000000, LENGTH = 0x4000000
}

/*************************************************************************
 * Memory Address Equates
 * _RESET_ADDR                    -- Reset Vector
 * _BEV_EXCPT_ADDR                -- Boot exception Vector
 * _DBG_EXCPT_ADDR                -- In-circuit Debugging Exception Vector
 * _SIMPLE_TLB_REFILL_EXCPT_ADDR  -- Simple TLB-Refill Exception Vector
 * _CACHE_ERR_EXCPT_ADDR          -- Cache-error Exception Vector
 * _GEN_EXCPT_ADDR                -- General Exception Vector
 *************************************************************************/

/*************************************************************************
 * Memory Address Equates
 *************************************************************************/
_BEV_EXCPT_ADDR                 = 0xBFC00380;
_DBG_EXCPT_ADDR                 = 0xBFC00480;

_SIMPLE_TLB_REFILL_EXCPT_OFFSET = 0x0;
_TLB_TABLE_OFFSET               = 0x0A0;
_IMAGE_PTR_TABLE_OFFSET         = 0x0F8;
_IMAGE_HEADER_OFFSET            = 0x0FC;
_CACHE_ERR_EXCPT_OFFSET         = 0x100;
_GEN_EXCPT_OFFSET               = 0x180;

_ebase_address = ORIGIN(kseg0_vector_mem);

/*************************************************************************
 * Setting the _RESET_ADDR defines where the sketch start address will be
 * But make sure the MAP set the appropriate kseg0 placement and sizes
 * that is, you will need to place the kseg0_vecotr_memory too.
 *************************************************************************/
_RESET_ADDR                     = ORIGIN(kseg0_program_mem);
_SIMPLE_TLB_REFILL_EXCPT_ADDR   = _ebase_address + _SIMPLE_TLB_REFILL_EXCPT_OFFSET;
_TLB_TABLE                      = ORIGIN(kseg1_vector_mem) + _TLB_TABLE_OFFSET;
_CACHE_ERR_EXCPT_ADDR           = _ebase_address + _CACHE_ERR_EXCPT_OFFSET;
_GEN_EXCPT_ADDR                 = _ebase_address + _GEN_EXCPT_OFFSET;
_IMAGE_PTR_TABLE                = _ebase_address + _IMAGE_PTR_TABLE_OFFSET;
_IMAGE_HEADER_ADDR              = _ebase_address + _IMAGE_HEADER_OFFSET;
_EEPROM_ADDR                    = ORIGIN(kseg0_eeprom_mem);

/*************************************************************************
 *  Bootloader program directives.
 *  
 * _IMAGE_TYPE
 *
 *  image type:
 */
     
_imageReserved                      = 0x00000000 ;
_imageMPIDE                         = 0x00000001 ;  /* This is a normal MPIDE sketch                                                                                                    */
_imageBootFlashBootloader           = 0x00000002 ;  /* This is a boot flash bootloader                                                                                                  */
_imageProgramFlashBootloader        = 0x00000004 ;  /* This is a program flash bootloader                                                                                               */
_imageSplitFlashBootloader          = 0x00000008 ;  /* This has bootloader code in both boot and program flash                                                                          */

 /*
 *  Instructions for the bootloader
 */
                                                                       
_imageFullFlashEraseLess4KEEProm    = 0x00010000 ;  /* The original bootloader method of erasing all of program flash except the last 4K reserved for eeprom                            */
_imageJustInTimeFlashErase          = 0x00020000 ;  /* Only flash pages written too needed by the sketch is erased                                                                      */
_imageLinkerSpecifiedFlashErase     = 0x00040000 ;  /* The linker defines the flash range to erase                                                                                      */
_imageFullFlashErase                = 0x00080000 ;  /* All of flash is erased                                                                                                           */
_imageExecutionJumpAddress          = 0x01000000 ;  /* the bootloader will jump to the execution jump address immediately after programming                                             */
_imageExecutionJumpToFirstInFlash   = 0x02000000 ;  /* the bootloader will jump to the first sketch loaded in flash ignoring the execution jump address immediately after programming   */
 
/*  
 * _IMAGE_FLASH_SIZE 
 *
 *      Typically _imageJustInTimeFlashErase is selected to just erase the pages
 *      of flash that code is written too; thus leaving all other flash pages untouched.
 *  
 *      If _imageLinkerSpecifiedFlashErase set, then the range
 *      starting from _ebase_address for _IMAGE_FLASH_SIZE bytes are erased.
 *
 *      If _imageFullFlashErase is specified, than the whole flash
 *      as known by the bootloader will be erased. This will erase eeprom as well
 *
 *      if _imageFullFlashEraseLess4KEEProm is set, all of flash less the last 4K is
 *      erased, this is the old default. This bit could be set to make a program flash bootloader
 *      erasing everything but the old flash. If NOTHING is set, this will be the default as this is the old behavior.
 *  
 *  _JUMP_ADDR
 *  
 *      This is the address that the bootloader will jump to start execution
 *      of the sketch. This is almost always _RESET_ADDR.
 *
 *      However, you can specify an alternate entry execution point for example
 *      if you have alternate starup code that, say, shared
 *      the runtime with other sketches or needed some kind of specific handling
 *
 *      Immediately after programming (avrdude upload) the bootloader will typically
 *      jump to the just loaded sketch, no matter where it was loaded in flash.
 *      _imageExecutionJumpToFirstInFlash will tell the bootloader to jump to the first
 *      sketch in flash even if the just loaded one is not at the beginning of flash.
 *      This is useful when programming sketches in slots of flash and then always
 *      jumping to the program-flash loader (vector sketch) as if the board was just reset.
 *      This bit does not effect jumping to a sketch already in flash after reset.
 *      As of today, after reset, the first program in flash will always be jumped to.
 *
 *************************************************************************/
 _IMAGE_TYPE            = _imageMPIDE | _imageJustInTimeFlashErase | _imageExecutionJumpAddress;
 _IMAGE_FLASH_SIZE      = LENGTH(kseg0_vector_mem) + LENGTH(kseg0_program_mem);
 _JUMP_ADDR             = _RESET_ADDR;


/* From here out every linker script is the same, so just include it */
/*INCLUDE "chipKIT-application-COMMON.ld"*/
