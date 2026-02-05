# ! wap in shell to print number 1 to n.


read -r -p "Enter a number: " n
[[ $n =~ ^[0-9]+$ ]] || { echo "Invalid input."; exit 1; }
for (( i=1; i<=n; i++ )); do
    echo "$i"
done   


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Number.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions
#*       using the command:
#*       chmod +x "Day 3/Number.sh"
#*    4. Run the script using the command:
#*       "Day 3/Number.sh"
#*    5. Follow the on-screen prompt to enter a number and see the numbers
#*       from 1 to n printed on the screen.
#?    Example Output
#*    Enter a number: 5
#*    1
#*    2
#*    3
#*    4
#*    5

#*    Enter a number: -2
#*    Invalid input.