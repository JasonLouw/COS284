#include <inttypes.h>
#include <stdio.h>
#include <string.h>

extern int matrixDeterminant(int a, int b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l, int m, int n, int o, int p);

int main(int argc, char ** argv){
	#define SIZE 2
	long arr[2];

    //example 

	arr[0]=matrixDeterminant(1,2,2,1,1,2,4,2,2,7,5,2,-1,4,-6,3); 
	printf("%ld\n",arr[0]);
	return 0;
	
}

//output should be:
// 0 //for the first function call
// 1 //for the second function call
/*
assembly pass order
    %rdi
    %rsi
    %rdx
    %rcx
    %r8
    %r9
*/

//return in rax register
