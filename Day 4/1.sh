# ! wap in shell to solve the problem.

# !     Process                   B.Time 
# !      A                          5
# !      B                          4
# !      C                          2
# !      D                          6

# ! calculate the Avg W.T
# ! calculate the Avg T.A.T


# Burst times
bt=(5 4 2 6)
process=("A" "B" "C" "D")

n=4

wt=0
tat=0
total_wt=0
total_tat=0

echo "Process   BT   WT   TAT"

for ((i=0;i<n;i++))
do
    if [ $i -eq 0 ]
    then
        wt=0
    else
        wt=$tat
    fi

    tat=$((wt + bt[i]))

    total_wt=$((total_wt + wt))
    total_tat=$((total_tat + tat))

    echo "${process[i]}        ${bt[i]}    $wt    $tat"
done

avg_wt=$(echo "scale=2; $total_wt / $n" | bc)
avg_tat=$(echo "scale=2; $total_tat / $n" | bc)

echo "Average Waiting Time = $avg_wt"
echo "Average Turnaround Time = $avg_tat"


# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the 1.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 4/1.sh"
# *    4. Run the script using the command:
# *       "Day 4/1.sh"
# *    5. The output will display the scheduling results for both FCFS and SJF algorithms, including the average waiting time and average turnaround time for each scheduling method.
# ?    Example Output
# *    FCFS Scheduling:
# *    Process   BT   WT   TAT
# *    A        5    0    5
# *    B        4    5    9
# *    C        2    9    11
# *    D        6    11   17
# *    Average Waiting Time = 6.25
# *    Average Turnaround Time = 10.50
