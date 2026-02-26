

# ! wap in shell to check a number is prime or not.

read -r -p "Enter a number: " num
[[ $num =~ ^[0-9]+$ ]] || { echo "Invalid input."; exit 1; }
(( num < 2 )) && { echo "$num is not a prime number."; exit 0; }
for (( i=2; i*i<=num; i++ )); do
    (( num%i == 0 )) && { echo "$num is not a prime number."; exit 0; }
done
echo "$num is a prime number."