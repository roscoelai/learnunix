#!/bin/bash
#
# guessinggame.sh
# 2022-05-14

echo_color() { echo -e '\033['"$*"'\033[0m'; }
lred() { echo_color '91m'"$*"; }
lgreen() { echo_color '92m'"$*"; }
lyellow() { echo_color '93m'"$*"; }
lmagenta() { echo_color '95m'"$*"; }
lcyan() { echo_color '96m'"$*"; }

guess_n_files() {
    (( n_files = 0 ))
    for x in .* *; do
        [ -f "$x" ] && (( n_files++ ))
    done

    local guess
    while true; do
        echo "Guess how many files are in the current directory?"
        read -p "Please enter a non-negative integer: " guess

        # Guard against non-integer input
        local non_nums="${guess//[0-9]/}"
        if [ -n "$non_nums" ]; then
            lred "Invalid characters: '${non_nums}'"
            continue
        fi

        # Remove leading zeroes
        guess="$(( 10#$guess ))"

        # First check prevents negative input, so negative -> overflow
        if (( guess < 0 )); then
            local i64_max=9223372036854775808
            lyellow "Overflow! Try a number less than 2^63 (${i64_max})"
            continue
        fi

        printf "Current guess = %s: " "$guess"

        (( guess > n_files )) && lcyan 'Too many! Try lower!' && continue
        (( guess < n_files )) && lmagenta 'Too few! Try higher!' && continue

        if ((guess == n_files)); then
            lgreen "Congratulations! It is indeed ${n_files} files!"
            ls -ALpq | grep -v '/' | nl
            break
        fi
    done
}

guess_n_files

