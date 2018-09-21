#include <stdio.h>

extern float solve_linear_eq(float a[], int size);

int main() {

	float inps[12] = {
				2, 4, 6, 2,
				3, 2, 6, 1,
				4, 1, 3, 3};
	printf("%.4f\n",solve_linear_eq(inps, 3)); // 2.0000

}
