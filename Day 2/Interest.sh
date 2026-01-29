# ! Wap in shell to find Simple interest.

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the rate of interest: " rate
read -r -p "Enter the time period: " time

if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
    echo "Please enter principal amount, rate of interest and time period."
    exit 1
fi
if ! [[ $principal =~ ^-?[0-9]+(\.[0-9]+)?$ && $rate =~ ^-?[0-9]+(\.[0-9]+)?$ && $time =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Invalid input. Please enter valid numbers for principal, rate and time."
    exit 1
fi
simple_interest=$(printf '%s
' "scale=4; ($principal * $rate * $time) / 100" | bc)
echo "Simple Interest for principal amount $principal, rate of interest $rate% and time period $time years is $simple_interest"


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Interest.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x "Day 2/Interest.sh"
#*    4. Run the script using the command:
#*       "Day 2/Interest.sh"
#*    5. Follow the on-screen prompt to enter principal amount, rate of interest and time period to see the simple interest.
#?    Example Output
#*    Enter the principal amount: 1000
#*    Enter the rate of interest: 5
#*    Enter the time period: 3
#*    Simple Interest for principal amount 1000, rate of interest 5% and time period 3 years is 150.0000
