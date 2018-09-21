#include <inttypes.h>
#include <stdio.h>
#include <string.h>

extern int palindromeCheck(char x1,char x2, char x3, char x4, char x5, char x6);

int main(int argc, char ** argv){
	#define SIZE 2
	int arr[2];

    //example 
	arr[0]=palindromeCheck('a','b','c','c','b','a'); 
	printf("%d\n",arr[0]);

	arr[1]=palindromeCheck('c','h','e','e','s','e'); 
	printf("%d\n",arr[1]);

	return 0;
	
}

//output should be:
// 27 //for the first function call
// 11778 //for the second function call
