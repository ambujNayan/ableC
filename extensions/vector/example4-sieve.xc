
#include <vector.xh>

#include <stdio.h>
#include <stdlib.h>

vector<int> sieve(int n) {
  vector<int> ints = vec<int>(n);
  for (int i = 0; i < n; i++)
    ints[i] = i;

  vector<int> results = vec<int>[];
  int num_results = 0;
  for (int i = 2; i < n; i++) {
    if (ints[i] != -1) {
      for (int j = i * 2; j < n; j += i) {
        ints[j] = -1;
      }
      results[num_results++] = i;
    }
  }

  return results;
}

int main(int argc, char **argv) {
  printf("sieve(100) = %s\n", show(sieve(100)));

  return 0;
}
