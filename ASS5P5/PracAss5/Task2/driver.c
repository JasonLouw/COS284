#include <stdio.h>

extern float stdev(float a[], int size);

int main() {

	float inps[3] = {2, 4, 6};
	printf("%.4f\n",stdev(inps, 3)); // 2.0000

		
	float inps2[4] = {100, 20, 300, 40};
	printf("%.4f\n",stdev(inps2, 4)); // 127.9323
}
