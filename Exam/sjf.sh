

#! Process            B.Time
#! A                    6
#! B                    4
#! C                    8
#! Find the average waiting time and average turnaround time using SJF scheduling algorithm.

processes=("A" "B" "C")
burst_times=(6 4 8)
n=${#processes[@]}

declare -a sorted
for ((i = 0; i < n; i++)); do
    sorted+=("${burst_times[i]} ${processes[i]}")
done

mapfile -t sorted < <(printf '%s\n' "${sorted[@]}" | sort -n)

echo "SJF Scheduling Algorithm"
echo "======================="
echo ""
echo "Process | Burst Time | Waiting Time | Turnaround Time"
echo "--------|------------|--------------|----------------"

waiting_time=0
total_waiting=0
total_turnaround=0

for item in "${sorted[@]}"; do
    burst=$(echo "$item" | awk '{print $1}')
    process=$(echo "$item" | awk '{print $2}')
    turnaround=$((waiting_time + burst))
    
    printf "   %s   |     %d      |      %d       |       %d\n" "$process" "$burst" "$waiting_time" "$turnaround"
    
    total_waiting=$((total_waiting + waiting_time))
    total_turnaround=$((total_turnaround + turnaround))
    waiting_time=$((waiting_time + burst))
done

echo "--------|------------|--------------|----------------"
avg_waiting=$((total_waiting / n))
avg_turnaround=$((total_turnaround / n))

echo ""
echo "Average Waiting Time: $avg_waiting"
echo "Average Turnaround Time: $avg_turnaround"
