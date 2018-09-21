#include <inttypes.h>
#include <stdio.h>
#include <string.h>

extern int addToFindEvenOrOdd(int a, int b);

int main(int argc, char ** argv){
	#define SIZE 2
	int arr[2];

    //example 

	arr[0]=addToFindEvenOrOdd(69,10); 
	printf("%ld\n",arr[0]);

	arr[1]=addToFindEvenOrOdd(-2,88);  
	printf("%ld\n",arr[1]);

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