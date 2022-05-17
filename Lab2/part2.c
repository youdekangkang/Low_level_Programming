//HDU id:19321133
//NAME: Zhu Haibin

#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

//stop at half is a good method to save memory 
int isPrime(unsigned long n){
    for (unsigned long i = 2; i <= n/2; i++){
        if((n % i) == 0){
            return 0;
        }
    }
    return 1;
}

int main(){
    unsigned long n;
    while(1){
        printf("Input a number:\n");
        scanf("%lu",&n);
        if (isPrime(n))
        {
            printf("yes\n");
        }else{
            printf("no\n");
        }
        printf("\n");
    }
    return 0;
}
