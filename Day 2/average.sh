# !  wap i shell to find The average of three float number .

read -r -p "Enter three float numbers: " a b c
if [[ -z "$a" || -z "$b" || -z "$c" ]]; then
    echo "Please enter three float numbers."
    exit 1
fi

if ! [[ $a =~ ^-?[0-9]+(\.[0-9]+)?$ && $b =~ ^-?[0-9]+(\.[0-9]+)?$ && $c =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Invalid input. Please enter valid float numbers."
    exit 1
fi

average=$(printf '%s
' "scale=4; ($a + $b + $c) / 3" | bc)
echo "Average of $a, $b and $c is $average"



#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the average.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x "Day 2/average.sh"
#*    4. Run the script using the command:
#*       "Day 2/average.sh"
#*    5. Follow the on-screen prompt to enter three float numbers and see their average.
#?    Example Output
#*    Enter three float numbers: 10.5 20.3 30.2
#*    Average of 10.5, 20.3 and 30.2 is 20.3333

