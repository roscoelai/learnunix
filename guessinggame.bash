#!/usr/bin/bash
# guessinggame.bash

lred() { echo -e '\033[0;91m'"$*"'\033[0m'; }
lgreen() { echo -e '\033[0;92m'"$*"'\033[0m'; }
lmagenta() { echo -e '\033[0;95m'"$*"'\033[0m'; }
lcyan() { echo -e '\033[0;96m'"$*"'\033[0m'; }

guessnfiles() {
    local nfiles=0
    for x in ./*; do [ -f "$x" ] && ((++nfiles)); done
    for x in ./.*; do [ -f "$x" ] && ((++nfiles)); done

    local guess=-1
    while true; do
        echo "How many files are in the current directory?"
        read -p "Please enter a non-negative integer (< 2**63): " guess

        # Guard against non-numeric input
        local guard="${guess//[[:digit:]]/}" 
        ! [ -z "$guard" ] && lred "Invalid input: $guard" && continue

        # Currently no guard against non-decimal input
        # ...

        ((guess < 1)) && lred "Invalid guess: $guess" && continue

        printf "Current guess = %s: " "$guess"

        ((guess > nfiles)) && lcyan 'Too many! Try lower!' && continue
        ((guess < nfiles)) && lmagenta 'Too few! Try higher!' && continue

        if ((guess == nfiles)); then
            lgreen "Congratulations! It is indeed $nfiles files!"
            ls -ALpq | grep -v '/' | nl
            break
        fi
    done
}

guessnfiles

