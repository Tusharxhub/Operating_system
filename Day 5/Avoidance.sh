#! Deadlock Avoidance Algorithm Implementation

#! process      Allocation       Max           Avg
#!               A    B       A    B         A   B
#! P0            1    0       2    1         1   1
#! P1            0    1       1    2         
#! P2            1    1       2    2 

alloc=(
	"1 0"
	"0 1"
	"1 1"
)
max=(
	"2 1"
	"1 2"
	"2 2"
)
avail=(1 1)

n=3
m=2

declare -a need
for ((i=0; i<$n; i++)); do
	alloc_row=(${alloc[$i]})
	max_row=(${max[$i]})
	need_row=()
	for ((j=0; j<$m; j++)); do
		need_row+=( $(( ${max_row[$j]} - ${alloc_row[$j]} )) )
	done
	need[$i]="${need_row[@]}"
done

# Banker's Algorithm
finish=(0 0 0)
safe_seq=()
work=(${avail[@]})
count=0
while [ $count -lt $n ]; do
	found=0
	for ((i=0; i<$n; i++)); do
		if [ ${finish[$i]} -eq 0 ]; then
			need_row=(${need[$i]})
			alloc_row=(${alloc[$i]})
			can_allocate=1
			for ((j=0; j<$m; j++)); do
				if [ ${need_row[$j]} -gt ${work[$j]} ]; then
					can_allocate=0
					break
				fi
			done
			if [ $can_allocate -eq 1 ]; then
				for ((j=0; j<$m; j++)); do
					work[$j]=$(( ${work[$j]} + ${alloc_row[$j]} ))
				done
				safe_seq+=("P$i")
				finish[$i]=1
				found=1
				((count++))
			fi
		fi
	done
	if [ $found -eq 0 ]; then
		break
	fi
done

# Output
if [ $count -eq $n ]; then
	echo "System is in a safe state."
	echo -n "Safe sequence: "
	for p in "${safe_seq[@]}"; do
		echo -n "$p "
	done
	echo
else
	echo "System is NOT in a safe state."
fi

# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the Avoidance.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 5/Avoidance.sh"
# *    4. Run the script using the command:
# *       "Day 5/Avoidance.sh"
# *    5. The output will display the scheduling results, including the average waiting time and average turnaround time for the given processes based on their burst times and arrival times.
# ?    Example Output
# *    System is in a safe state.
# *    Safe sequence: P0 P1 P2