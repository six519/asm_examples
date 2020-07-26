#include <stdio.h>
#include <stdlib.h>

void kill_process();

int main(int argc,  char * argv[]) {
    int n;
    if (argc == 2) {
        n = atoi(argv[1]);
        kill_process(n);
        printf("Proccess %d killed\n", n);
    }
    return 0;
}