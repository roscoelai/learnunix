#!/bin/bash
# guessinggame.bash

echo_color() { echo -e '\033[0;'"$*"'\033[0m'; }
lred() { echo_color '91m'"$*"; }
lgreen() { echo_color '92m'"$*"; }
lmagenta() { echo_color '95m'"$*"; }
lcyan() { echo_color '96m'"$*"; }

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
        [ -n "$guard" ] && lred "Invalid input: $guard" && continue

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

