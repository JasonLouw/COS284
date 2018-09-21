#include <inttypes.h>
#include <stdio.h>
#include <string.h>

extern int dotProduct(int x1,int x2, int y1, int y2);

int main(int argc, char ** argv){
	#define SIZE 2
	int arr[2];

    //example 
	arr[0]=dotProduct(1,4,3,6); 
	printf("%d\n",arr[0]);

	arr[1]=dotProduct(36,26,78,345);  
	printf("%d\n",arr[1]);

	return 0;
	
}

//output should be:
// 27 //for the first function call
// 11778 //for the second function call
