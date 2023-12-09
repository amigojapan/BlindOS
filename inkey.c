#include <stdio.h>
#include <termios.h>
#include <unistd.h>

void enableRawMode() {
    struct termios raw;

    // Get the current terminal attributes
    tcgetattr(STDIN_FILENO, &raw);

    // Disable canonical mode (line buffering) and echo
    raw.c_lflag &= ~(ECHO | ICANON);

    // Set a minimal character and time for read()
    raw.c_cc[VMIN] = 1;
    raw.c_cc[VTIME] = 0;

    // Set the new terminal attributes
    tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw);
}

int main() {
    // Enable raw mode
    enableRawMode();

    // Read input in raw mode
    char c;
    while (1) {
        read(STDIN_FILENO, &c, 1);
        if (c == 'q') {
            break;
        }
        printf("Key pressed: %c\n", c);
    }

    return 0;
}
