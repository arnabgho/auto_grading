#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <math.h>

using namespace std;

int main(){
	int i,j;
	for(i=0;i<40;i++){
		for(j=1;j<=5;j++){
			if(j!=5)
				printf("%d,",(rand()%10)*10);
			else
				printf("%d\n",(rand()%10)*10);
		}
		// printf("\n");
	}

	return 0;
}