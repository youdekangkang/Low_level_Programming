#include <inttypes.h>
#include <stdio.h>
#define print(type, x) type##_print(x)



void int64_t_print(int64_t i) { printf("%" PRId64, i); }
void double_print(double d) { printf("%lf", d); }
void print_newline() { puts(" "); }



int main() {
int64_t x = 42;
double d = 99.99;
print(int64_t, x);
print_newline();
print(double, d);

printf("%d",dbl(3+3));
return 0;
}

