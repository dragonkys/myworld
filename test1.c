#include <stdio.h>

void main()
{
	int i = 0, j = 1;
	
	int *p;
	
	p = &i;
	
	printf("p = [%d]\n",*p);
}