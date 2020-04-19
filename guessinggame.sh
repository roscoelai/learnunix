#!/usr/bin/env bash
# File: guessinggame.sh

guessnfiles() {
    # Strategy to get number of files: list contents of directory in long form, 
    # filter out lines that start with a "-" as opposed to a "d", then count 
    # the number of lines
    local count=$(ls -l | grep ^- | wc -l)

    while true
    do
        echo "How many files are in the current directory?"
        read -p "Please enter a non-negative integer: " guess

        # Check that input is a non-negative integer
        if [[ $guess =~ ^[0-9]+$ ]]
        then
            # Create a positive exit condition
            if [[ $guess -eq $count ]]
            then
                printf "\e[92mCongratulations!\e[0m It is indeed $count files!\n"
                exit 0
            elif [[ $guess -gt $count ]]
            then
                printf "Too many! \e[96mTry lower!\e[0m\n\n"
            elif [[ $guess -lt $count ]]
            then
                printf "Too few! \e[91mTry higher!\e[0m\n\n"
            else
                echo "Something has gone horribly wrong!\n"
                exit 1
            fi
        fi
    done
}

guessnfiles
