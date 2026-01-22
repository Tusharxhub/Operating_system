#!  wap in shell to see the number is even or odd.



read -p "Enter an integer: " num
if (( num % 2 == 0 )); then
    echo "$num is even."
else
    echo "$num is odd."
fi