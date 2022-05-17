//HDU id:19321133
//NAME: Zhu Haibin

#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

//each array stores the vecotr
const int Array1[] = {1,2,3};
const int Array2[] = {4,5,6};

//multiply the vectors
int scalar(const int* first,const int* second,size_t size){
    int sum = 0;
    for(size_t index = 0;index < size ; index ++)
        sum += (first[index] * second[index]);
    return sum;
}


int main(int args,char *argv[]){
    int64_t result;
    
    //in case the vectors have different dimiansions
    size_t Size1 = sizeof(Array1) / sizeof(int);
    size_t Size2 = sizeof(Array2) / sizeof(int);
    size_t size = (Size1 < Size2) ? Size1 : Size2;
    
    int sum = scalar(Array1,Array2,size);
    printf("The result is :\n %d \n",sum);
    return 0;
}
