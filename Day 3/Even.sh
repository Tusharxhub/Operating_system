# !   wap in shell to print all even number divisible by 5 from 50 to 100.

for (( i=50; i<=100; i++ )); do
    (( i%2==0 && i%5==0 )) && echo "$i"
done


#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Divisible.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions
#*       using the command:
#*       chmod +x "Day 3/Divisible.sh"
#*    4. Run the script using the command:
#*       "Day 3/Divisible.sh"
#*    5. The script will print all even numbers divisible by 5 from 50 to 100.
#?    Example Output
#*    50
#*    60
#*    70
#*    80
#*    90
#*    100  

