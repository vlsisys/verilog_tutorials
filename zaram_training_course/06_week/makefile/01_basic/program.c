
#include	<stdio.h>

int diffofsums(int f, int g, int h, int i);
void main()
{
	int	y;
	y = diffofsums(2, 3, 4, 5);
	printf("Different of Sum: %d", y);
}

int diffofsums(int f, int g, int h, int i)
{
	int	result;
	result	= (f+g) - (h+i);
	return	result;
}
