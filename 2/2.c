#include <stdio.h>
#include <stdlib.h>

void usage()
{
	printf("Usage: <program> .iso");
	exit(0);
}

unsigned char buff[512];
char fname[512];

int main(int argc, char ** args)
{
	if (argc != 2)
		usage();
	FILE *f = fopen(args[1],"rb");
	if (!f)
	{
		printf("Can't open file \"%s\"\n", args[1]);
		usage();
	}
	
	fseek(f, 510, SEEK_SET);
	int s = 0;
	for (;;)
	{
		int c = fgetc(f);
		if (ferror(f))
		{
			printf("Error while reading file \"%s\"\n",args[1]);
			break;
		}
		if (c == -1)
			break;
		if (s == 0)
		{
			if (c == 0x55)
				++s;
		}
		else if (s == 1)
		{
			if (c == 0xAA)
				++s;
			else if (c != 0x55)
				s = 0;
		}
		if (s == 2)
		{
			s = 0;
			fseek(f, -512, SEEK_CUR);
			int readed = fread(buff, 1, 512, f);
			if (readed != 512)
				printf("Readed not all\n");
			if ((buff[0] - (buff[0]&0x7) != 0xE8) && (buff[0] != 0xFA))
				continue;
			
			sprintf(fname,"%X.dump", ftell(f)-512);
			FILE *out = fopen(fname, "wb");
			if (!out)
				printf("Can't create file \"%s\"\n", buff);
			else
			{
				printf("Writing dump in file \"%s\"\n", fname);
				if (fwrite(buff, 1, readed, out) != readed)
					printf("Writed not all\n");
				if (fclose(out))
					printf("Can't close file\"%s\"\n", fname);
			}
		}
	}
	
	if(fclose(f))
		printf("Can't close file \"%s\"\n", args[1]);
	return 0;
}
