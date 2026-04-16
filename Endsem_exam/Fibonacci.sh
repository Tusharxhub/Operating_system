# !  wap to display fibonacci series up to n.





echo "Enter n:"
read n

if [ "$n" -lt 0 ]; then
  echo "Please enter a non-negative number."
  exit 1
fi

a=0
b=1

echo "Fibonacci series up to $n:"
while [ "$a" -le "$n" ]; do
  echo -n "$a "
  temp=$((a + b))
  a=$b
  b=$temp
done

echo