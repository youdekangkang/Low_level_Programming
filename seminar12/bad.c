#include <inttypes.h>
#include <malloc.h>
#include <stdio.h>

int main() {
  int64_t *array = malloc(sizeof(int64_t) * 5);
  // capacity - how much memory is allocated
  size_t capacity = 5;
  // amount - how much memory is actually used from the allocated one
  size_t count = 0;
  // fill the array with squares of numbers from 0 to 100
  // if there is not enough space, we expand it twice
  for (size_t i = 0; i <= 100; i++) {
	if (count == capacity) {
	  array = realloc(array, sizeof(int64_t) * capacity * 2);
	  capacity = capacity * 2;
	}
    array[count++] = i * i;
  }

  for (size_t i = 0; i < 100; i++) {
    printf("%" PRId64 " ", array[i]);
  }
  return 0;
}
