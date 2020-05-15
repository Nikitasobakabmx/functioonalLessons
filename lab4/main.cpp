#include "stdio.h"
#include <iostream>
int main(void)
{
    setlocale(LC_ALL, "Russian");
    char a = 'а';
    printf("%d %c\n", a, a);
    printf("%d\n", 'a'); //53424????
    char c[] = "абв";
    printf("%d %c\n", c[0], c);
    if(c[0] == 'Q')
        printf("ahahhaha\n");
    printf("%d %s\n", c[0], c);
    return 0;
}