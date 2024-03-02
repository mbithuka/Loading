#!/bin/bash

hide_cursor() {
    printf "\e[?25l"  # Hide the cursor
}

show_cursor() {
    printf "\e[?25h"  # Show the cursor
}

loading() {
    hide_cursor
    dots=1
    while true; do
        printf "\r%*s\r" "$(tput cols)" ""  # Clear the entire line
        printf "%s" "$(printf '.%.0s' $(seq 1 $dots))"
        sleep 1  # Adjust the sleep duration as needed
        if [ $dots -eq 3 ]; then
            dots=0
        fi
        dots=$((dots + 1))  # Increment dots and reset after reaching 3
    done
}

# Start the loading animation in the background
loading &

# Simulate some work
sleep 10  # Adjust the duration of the work

# Stop the loading animation by killing the background process
kill $!
show_cursor  # Make sure to show the cursor again after stopping the animation
