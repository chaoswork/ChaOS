.text				#code segment
.global start		#
.code16				#real model
start:
jmp code
msg:
.string "hello world \x0"
code:
movw $0xb800,%ax	# CGA address
movw %ax,%es		# es point to cga address

xorw %ax,%ax
movw %ax,%ds		# ds=0

movw $msg,%si
xorw %di,%di
cld					# CLear Direction flag,foward now
movb $0x02,%al		# set color green

beg:
cmp $0,(%si)
je end
movsb				# MOVe String Byte,ds:si->es:di	
stosb				# every char need 2 bytes,followed by the color
jmp beg
end: jmp end		# forever loop

.org 0x1fe,0x90		# 0x90 for nop
.word 0xaa55		# Bootable end flag
