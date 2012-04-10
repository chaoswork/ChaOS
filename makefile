AS = as
LD = ld

#.s.o:
#	${AS} -a $< -o $*.o >$*.map

all:kern.img

kern.img:bootsect
	mv bootsect kern.img

bootsect:bootsect.o
	${LD} --oformat binary -N -e start -Ttext 0x7c00\
		-o bootsect $<
bootsect.o:boot.s
	$(AS) -a boot.s -o bootsect.o
qemu:
	qemu -fda kern.img
clean:
	rm *.o *~
