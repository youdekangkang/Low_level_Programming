#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
void* create_shared_memory(size_t size) {
	 return mmap(NULL,
	 size,
	 PROT_READ | PROT_WRITE,
 	MAP_SHARED | MAP_ANONYMOUS,
	-1, 0);
}
void* print_array(int* array, size_t size){
for (size_t i = 0; i<size; i++){
	printf("shmem[%zd]: %d\n", i, array[i]);
 } }


int main() {
       	int* shmem = create_shared_memory(10*sizeof(int)); 
	printf("Shared memory at: %p\n" , shmem);
 
	 for (size_t i = 0; i<10; i++){
		shmem[i]= (int)i;
 	}
 
	printf("Shared memory at: %p\n" , shmem);
 
	int pid = fork();
	if (pid == 0) {
               
		printf("Child's pid is: %d\n", pid);
                print_array(shmem,10);
                int index,num;
                printf("Choose the array index:\n");
                scanf("%d",&index);
                printf("Enter new value:\n");
                scanf("%d",&num);
                shmem[index] = num;
		
		printf("Press any key to cointine\n\n");

 	} else {
                wait(NULL);
                printf("Parent's pid is: %d\n",pid);
                print_array(shmem,10);
 	}
}
