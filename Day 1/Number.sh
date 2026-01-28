# !  wap in shell to display the largest number between two numbers using if else.


read -r -p "Enter two numbers: " num1 num2

if [[ -z "$num1" || -z "$num2" ]]; then
    echo "Please enter two numbers."
    exit 1
fi

if [[ "$num1" -gt "$num2" ]]; then
    echo "$num1 is the largest number."
elif [[ "$num2" -gt "$num1" ]]; then
    echo "$num2 is the largest number."
else
    echo "Both numbers are equal."
fi



#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Number.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x Number.sh
#*    4. Run the script using the command:
#*       bash "Day 1/Number.sh"
#*    5. Follow the on-screen prompt to enter two numbers and see which one is larger.
#?    Example Output
#*    Enter two numbers: 15 25
#*    25 is the largest number.
#*    Enter two numbers: 30 10
#*    30 is the largest number.
#*    Enter two numbers: 20 20
#*    Both numbers are equal.  
