
#include <stdio.h>

void GetName(name_holder)
char *name_holder;
{
	int count=0;
	int i;

	printf("Enter Name: ");
	fgets(name_holder, NAME_LENGTH + 1, stdin);

	for(i = 0; name_holder[i] != '\0'; i++)
	{
		if(name_holder[i] == '\n')
		name_holder[i]='\0';
	}
	return;
}

void main()
{
	char name[100] = "sss";
	
	printf("before name = [%s]\n",name);
	
	GetName(name);
	
	printf("after name = [%s]\n",name);

}
