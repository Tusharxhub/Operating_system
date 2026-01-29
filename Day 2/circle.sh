# ! wap in shell to find area of circle.

read -r -p "Enter the radius of the circle: " radius
if [[ -z "$radius" ]]; then
    echo "Please enter a valid radius."
    exit 1
fi
if ! [[ $radius =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Invalid input. Please enter a valid number for radius."
    exit 1
fi
area=$(printf '%s
' "scale=4; 3.1416 * $radius * $radius" | bc)
echo "Area of the circle with radius $radius is $area"



#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the circle.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x "Day 2/circle.sh"
#*    4. Run the script using the command:
#*       "Day 2/circle.sh"
#*    5. Follow the on-screen prompt to enter the radius and see the area of the circle.
#?    Example Output
#*    Enter the radius of the circle: 5 
#*    Area of the circle with radius 5 is 78.5400