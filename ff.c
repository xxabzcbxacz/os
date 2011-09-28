#include <stdio.h>

#define ERR_OVER 1
#define ERR_TRASH 2
#define ERR_FERR 3
#define ERR_NEMEM 4

int *A;
int AC,AS;

int expand()
{
	int *B;
	int BS;
	BS=((AS<5000)?(AS<<1):AS+5000);
	B=(int *)malloc(sizeof(int)*BS);
	if (!B)
		return ERR_NEMEM;
	memcpy(B,A,sizeof(int)*AS);
	free(A);
	A=B;
	AS=BS;
	return 0;
}

int append(int v)
{
	int r;
	if (AC>=AS)
		if (r = expand())
			return r;
	A[AC++]=v;
	return 0;
}

int read(FILE *f)
{
	int c,x=0;
	char w=0,r;
	for(;;)
	{
		c = fgetc(f);
		if (ferror(f))
			return ERR_FERR;
		if (c>='0' && c<='9')
		{
			x=x*10+c-'0';
			if (x<0)
				return ERR_OVER;
			w=1;
			continue;
		}
		if (c!='\r'&&c!='\n'&&c!=EOF)
			return ERR_TRASH;
		if (w)
		{
			if (r = append(x))
				return r;
			w=x=0;
		}
		if (c==EOF)
			return 0;
	}
	return 0;
}

int main(int argc, char **args)
{
	int i,r,m;
	FILE *f;
	AC=0;
	AS=4;
	A=(int*)malloc(sizeof(int)*AS);
	if (!A)
	{
		printf("Not enough memory");
		return 0;
	}
	for (i=1; i<argc; ++i)
	{
		f = fopen(args[i],"r");
		if (f)
		{
			if (r = read(f))
			{
				switch(r)
				{
				case ERR_OVER:
					printf("Overflow value in file \"%s\"\n",args[i]);
				break;
				case ERR_TRASH:
					printf("Trash in file \"%s\"\n",args[i]);
				break;
				case ERR_FERR:
					printf("Error while read file \"%s\"\n",args[i]);
				break;
				case ERR_NEMEM:
					printf("Not enough memory while reading file \"%s\"\n",args[i]);
				break;
				}
				if (fclose(f))
					printf("Can't close file \"%s\"\n",args[i]);
				return 0;
			}
			if (fclose(f))
			{
				printf("Can't close file \"%s\"\n",args[i]);
				return 0;
			}
		}
		else
		{
			printf("Can't open file \"%s\"\n",args[i]);
			return 0;
		}
	}
	for (i=0; i<AC; ++i)
	{
		m=i;
		for (r=i+1; r<AC; ++r)
			if (A[m]>A[r])
				m=r;
		if (m!=i)
		{
			r=A[i];
			A[i]=A[m];
			A[m]=r;
		}
		printf("%d\n",A[i]);
	}
	return 0;
}
