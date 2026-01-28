#!  wap a shell program  to display Sum of two numbers.
#!/usr/bin/env bash

read -r -p "Enter two numbers: " a b

if [[ -z "$a" || -z "$b" ]]; then
    echo "Please enter two numbers."
    exit 1
fi

sum=$((a + b))
echo "Sum of $a and $b is $sum"


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Sum.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x Sum.sh
#*    4. Run the script using the command:
#*       bash "Day 1/Sum.sh"
#*    5. Follow the on-screen prompt to enter two numbers and see their sum.
#?    Example Output
#*    Enter two numbers: 10 20
#*    Sum of 10 and 20 is 30  