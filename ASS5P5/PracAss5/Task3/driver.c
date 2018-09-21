#include <stdio.h>

extern float taylor_ex(float x, int n);

int main() {
	printf("%.4f\n",taylor_ex(20.0, 0)); // 1.0000
	printf("%.4f\n",taylor_ex(15.0, 5)); // 9128.5000
	printf("%.4f\n",taylor_ex(10.0, 10)); // 12842.3047
	printf("%.4f\n",taylor_ex(5.0, 15)); // 148.4029
}
