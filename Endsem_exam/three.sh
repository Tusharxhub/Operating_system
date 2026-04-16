# ! Wap in shell to find largest among three numbers.

read -r -p "Enter three numbers: " a b c
[[ -z $a || -z $b || -z $c ]] && { echo "Please enter three numbers."; exit 1; }
largest=$a
(( b > largest )) && largest=$b
(( c > largest )) && largest=$c
echo "The largest number among $a, $b and $c is $largest"


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Largest.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x "Day 2/Largest.sh" 
#*    4. Run the script using the command:
#*       "Day 2/Largest.sh"
#*    5. Follow the on-screen prompt to enter three numbers and see the largest among them.
#?    Example Output
#*    Enter three numbers: 10 20 15
#*    The largest number among 10, 20 and 15 is 20

#*    Enter three numbers: 7 7 7
#*    The largest number among 7, 7 and 7 is 7