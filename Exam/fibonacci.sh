

# ! wap in shell to generate fibonacci series up to n number.

read -r -p "Enter a number: " num
[[ $num =~ ^[0-9]+$ ]] || { echo "Invalid input."; exit 1; }
a=0
b=1
echo "Fibonacci series up to $num:"
while (( a <= num )); do
    echo -n "$a "
    fn=$((a + b))
    a=$b
    b=$fn
done
echo
