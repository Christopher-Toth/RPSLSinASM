section .data
    prompt db "Enter your choice (0-Rock, 1-Paper, 2-Scissors, 3-Lizard, 4-Spock, 5-Quit): ", 0
    winMsg db "You win!", 0
    loseMsg db "You lose!", 0
    tieMsg db "It's a tie!", 0
    scoreMsg db "Your score: ", 0
    compChoiceMsg db "Computer's choice: ", 0

section .bss
    userChoice resb 1
    compChoice resb 1
    result resb 20
    userScore resd 1
    compScore resd 1

section .text
    global _start

_start:
    ; Initialize scores
    mov dword [userScore], 0
    mov dword [compScore], 0

game_loop:
    ; Display user's score
    mov eax, 4
    mov ebx, 1
    mov ecx, scoreMsg
    mov edx, 15
    int 0x80

    ; Display the user's score
    mov eax, 4
    mov ebx, 1
    mov ecx, [userScore]
    mov edx, 1
    add ecx, '0'
    int 0x80

    ; Display a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Display the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 44  ; Length of the prompt message
    int 0x80

    ; Read user's choice
    mov eax, 3
    mov ebx, 0
    mov ecx, userChoice
    mov edx, 1
    int 0x80

    ; Check for quit option
    cmp byte [userChoice], '5'
    je quit

    ; Generate a random computer choice (0 to 4)
    mov eax, 0x6B8B4567
    imul eax, eax, 0x41C64E6D
    add eax, 0x3039
    mov ebx, 5
    xor edx, edx
    div ebx
    mov [compChoice], dl

    ; Display computer's choice
    mov eax, 4
    mov ebx, 1
    mov ecx, compChoiceMsg
    mov edx, 20
    int 0x80

    ; Compare user and computer choices
    mov al, [userChoice]
    mov bl, [compChoice]
    cmp al, bl
    je tie
    sub al, bl
    add al, 5
    cmp al, 2
    jae win
    jmp lose

tie:
    mov ecx, tieMsg
    inc dword [userScore]
    inc dword [compScore]
    jmp continue

win:
    mov ecx, winMsg
    inc dword [userScore]
    jmp continue

lose:
    mov ecx, loseMsg
    inc dword [compScore]

continue:
    ; Display the result
    mov eax, 4
    mov ebx, 1
    mov edx, 20  ; Length of result message
    int 0x80

    ; Loop back to the game
    jmp game_loop

quit:
    ; Display final scores
    mov eax, 4
    mov ebx, 1
    mov ecx, scoreMsg
    mov edx, 15
    int 0x80

    ; Display user's score
    mov eax, 4
    mov ebx, 1
    mov ecx, [userScore]
    mov edx, 1
    add ecx, '0'
    int 0x80

    ; Display a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Display computer's score
    mov eax, 4
    mov ebx, 1
    mov ecx, compScoreMsg
    mov edx, 15
    int 0x80

    ; Display computer's score
    mov eax, 4
    mov ebx, 1
    mov ecx, [compScore]
    mov edx, 1
    add ecx, '0'
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    newline db 10, 0
    compScoreMsg db "Computer's score: ", 0
