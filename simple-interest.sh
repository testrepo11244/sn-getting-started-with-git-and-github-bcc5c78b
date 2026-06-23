#!/usr/bin/env bash

# simple-interest.sh
# A Bash script that calculates simple interest based on user input.
# Formula: Simple Interest = (Principal * Rate * Time) / 100

# Function to read a numeric value with validation
read_number() {
    local prompt="$1"
    local var
    while true; do
        read -rp "$prompt" var
        # Allow integer or floating point numbers, optionally negative
        if [[ "$var" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
            echo "$var"
            return
        else
            echo "Invalid input. Please enter a numeric value."
        fi
    done
}

echo "=== Simple Interest Calculator ==="

principal=$(read_number "Enter the principal amount (e.g., 1000): ")
rate=$(read_number "Enter the annual rate of interest (in %, e.g., 5): ")
time=$(read_number "Enter the time period in years (e.g., 3): ")

# Calculate simple interest
interest=$(awk "BEGIN { printf \"%.2f\", ($principal * $rate * $time) / 100 }")

echo ""
echo "Principal: $principal"
echo "Rate (%):   $rate"
echo "Time (yr):  $time"
echo "---------------------------"
echo "Simple Interest: $interest"
echo "==========================="

exit 0