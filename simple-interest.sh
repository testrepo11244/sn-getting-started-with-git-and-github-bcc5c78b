#!/usr/bin/env bash

# simple-interest.sh
# Bash script to calculate simple interest.
# Prompts user for principal, rate of interest, and time period.

# Function to read a positive numeric value
read_number() {
    local prompt="$1"
    local value
    while true; do
        read -rp "$prompt" value
        # Validate: must be a positive integer or decimal
        if [[ $value =~ ^[0-9]+([.][0-9]+)?$ ]] && (( $(echo "$value > 0" | bc -l) )); then
            echo "$value"
            return
        else
            echo "Invalid input. Please enter a positive number."
        fi
    done
}

principal=$(read_number "Enter the principal amount: ")
rate=$(read_number "Enter the annual rate of interest (in %): ")
time=$(read_number "Enter the time period (in years): ")

# Calculate simple interest: (P * R * T) / 100
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

echo "--------------------------------------------------"
echo "Principal: $principal"
echo "Rate (%):   $rate"
echo "Time (yr):  $time"
echo "Simple Interest: $interest"
echo "--------------------------------------------------"