#!/usr/bin/env bash
# File: guessinggame.sh

guessnfiles() {
    # Strategy to get number of files:
    # 1. List all contents in directory
    # 2. Filter out names with "/"
    # 3. Count the number of lines
    local n=$(ls -ALpq | grep -v / | wc -l)

    # Infinite loop, exit condition will be guessing the correct number
    # read would provide a break to manually kill the process in a calm manner
    while true
    do
        echo "How many files are in the current directory?"
        read -p "Please enter a non-negative integer: " guess

        # OMG, checking octals is beyond me at the moment, just disallow it
        # Check for non-negative integers
        # Limitation: integers >= 2**63 will be considered negative
        if ([[ $guess =~ ^[1-9][0-9]*$ ]] && [[ $guess -gt 0 ]]) || 
            ([[ $guess =~ ^0+$ ]] && [[ $guess -eq 0 ]])
        then
            if [[ $guess -gt $n ]]
            then
                printf "Too many! \e[96mTry lower!\e[0m\n\n"
            elif [[ $guess -lt $n ]]
            then
                printf "Too few! \e[91mTry higher!\e[0m\n\n"
            else
                printf "\e[92mCongratulations!\e[0m It is indeed $n files!\n"
                ls -ALpq | grep -v / | nl
                break
            fi
        fi
    done
}

guessnfiles
