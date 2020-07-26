#include <stdio.h>
#include <stdlib.h>

int kill_process();

int main(int argc,  char * argv[]) {
    if (argc == 2) {
        printf("Proccess %d killed\n", kill_process(atoi(argv[1])));
    }
    return 0;
}