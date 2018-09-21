#include <stdio.h>
#include <math.h>

extern float st_gamma(float a);

int main() {
	printf("%.4f\n", st_gamma(7.4)); // 11278.2451
	printf("%.4f\n", st_gamma(6.5)); // 1847.4362
	printf("%.4f\n", st_gamma(5.6)); // 339.6157
	printf("%.4f\n", st_gamma(4.7)); // 71.2549
}
