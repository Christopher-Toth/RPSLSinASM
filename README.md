# Rock, Paper, Scissors, Lizard, Spock Game in x86 Assembly

This is a simple implementation of the Rock, Paper, Scissors, Lizard, Spock game in x86 assembly language. The game allows you to play against the computer and keeps track of your score.

## Getting Started

These instructions will help you assemble and run the game on a Linux system.

### Prerequisites

You need to have NASM (Netwide Assembler) and LD (GNU linker) installed on your Linux system to assemble and run the code.

### Assembly and Execution

1. Clone the repository or download the `rpsls.asm` file.

2. Open your terminal and navigate to the directory where the `rpsls.asm` file is located.

3. Assemble the code using NASM:

  bash nasm -f elf32 rpsls.asm -o rpsls.o

4. Link the object file to create an executable:

   ld -m elf_i386 -s -o rpsls rpsls.o

5. Run the game:

   ./rpsls

6. Follow the on-screen instructions to play the game. You can choose Rock, Paper, Scissors, Lizard, Spock, or Quit.

7. When you're done playing, the game will display your final score and exit.

## Gameplay

* The game displays your score and asks you to choose an option (0-Rock, 1-Paper, 2-Scissors, 3-Lizard, 4-Spock, 5-Quit).

* The computer randomly selects its choice.

* The game compares your choice to the computer's choice and displays the result (Win, Lose, or Tie).

* Your score is updated based on the result.

* You can choose to quit the game at any time.
