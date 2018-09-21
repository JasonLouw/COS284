#include <stdio.h>

extern float* solve_linear_eq(float a[], int size);

int main() {

	//~ float inps[12] = {
				//~ 1, 1, -1, 5,
				//~ 2, 1, 3, 2,
				//~ 4, -1, 2, -1};
				
				float inps[12] = {
				1, 2, 3, 9,
				2, -1, 1, 8,
				3, 0, -1, 3};
				
				//~ float inps[6] = {
				//~ 2, 3, 5, 
				//~ 2, 4, 5};
	//printf("%.4f\n",solve_linear_eq(inps, 3)); // 2.0000
				float *x = solve_linear_eq(inps, 3);
				
			printf("%.4f\n",x[0]);
}
