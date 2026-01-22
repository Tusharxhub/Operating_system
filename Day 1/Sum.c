//! wap a c program  to display Sum of two numbers.

#include <stdio.h>
int main()
{
    int a, b, sum;
    printf("Enter two numbers: ");
    scanf("%d %d", &a, &b);
    sum = a + b;
    printf("Sum of %d and %d is %d\n", a, b, sum);
    return 0;
}