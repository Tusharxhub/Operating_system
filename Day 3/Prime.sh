# ! wap in shell to check whether a number is prime or not.

read -r -p "Enter a number: " num
[[ $num =~ ^[0-9]+$ ]] || { echo "Invalid input."; exit 1; }
(( num < 2 )) && { echo "$num is not a prime number."; exit 0; }
for (( i=2; i*i<=num; i++ )); do
    (( num%i == 0 )) && { echo "$num is not a prime number."; exit 0; }
done
echo "$num is a prime number."


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Prime.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions
#*       using the command:
#*       chmod +x "Day 3/Prime.sh"
#*    4. Run the script using the command:
#*       "Day 3/Prime.sh"
#*    5. Follow the on-screen prompt to enter a number and see whether it is a prime number or not.
#?    Example Output
#*    Enter a number: 7
#*    7 is a prime number. 
#*    Enter a number: 10
#*    10 is not a prime number.
#*    Enter a number: -3
#*    Invalid input.
