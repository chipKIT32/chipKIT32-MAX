
	.section	.text.pic32softwarereset,code
	.align	2
	.globl	__pic32_software_reset
	.globl	SoftReset
	.set	nomips16
	.set	nomicromips
	.ent	__pic32_software_reset
	.type	__pic32_software_reset, @function
	
SoftReset:
__pic32_software_reset:

	.frame	$sp,24,$31
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro

	di
	ehb

0:
	li	$3,0xaa990000
	lui	$2,%hi(SYSKEY)
	addiu	$3,$3,26197
	sw	$0,%lo(SYSKEY)($2)
	sw	$3,%lo(SYSKEY)($2)
	li	$3,0x55660000
	ori	$3,$3,0x99aa
	sw	$3,%lo(SYSKEY)($2)
	lui	$2,%hi(RSWRSTSET)
	li	$3,0x1
	sw	$3,%lo(RSWRSTSET)($2)
	lui	$2,%hi(RSWRST)
	lw	$2,%lo(RSWRST)($2)

	j	0b
	nop

	.set	macro
	.set	reorder

	.end	__pic32_software_reset
	.size	__pic32_software_reset, .-__pic32_software_reset
