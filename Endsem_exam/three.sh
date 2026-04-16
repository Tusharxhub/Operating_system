# ! Wap in shell to find largest among three numbers.

read -r -p "Enter three numbers: " a b c
[[ -z $a || -z $b || -z $c ]] && { echo "Please enter three numbers."; exit 1; }
largest=$a
(( b > largest )) && largest=$b
(( c > largest )) && largest=$c
echo "The largest number among $a, $b and $c is $largest"


