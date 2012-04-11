#include  <fcntl.h>
#include  <stdio.h>

int main(int argc, char *argv[])
{
	int ufd,fd;
	unsigned char buff[512];
	fd=open("./kern.img",O_RDONLY);
	if(fd<0)
	{
		perror("failed to read file kern.img");
		return -1;
	}
	read(fd,buff,512);
	close(fd);
	ufd=open("/dev/sdb",O_RDWR);
	if(ufd<0) 
	{
		perror("failed to open device /dev/sdb");
		return -1;
	}
	write(ufd,buff,512);
	close(ufd);
	puts("done.");
	return 0;
}
