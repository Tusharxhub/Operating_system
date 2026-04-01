# !  Deadlock Detection Algorithm Implementation

#! process       Allocation          Request         Avg 
#             A     B               A     B        A   B
#! P0          1     0              0     1        1   0
#! P1          2     1              1     0
#! P2          0     1              1     0
#! P3          1     0              0     1






alloc=("1 0" "2 1" "0 1" "1 0")
request=("0 1" "1 0" "1 0" "0 1")
avail=(1 0)
n=4 m=2
finish=(0 0 0 0)
work=(${avail[@]})
sequence=()

while true; do
    found=0
    for ((i=0; i<n; i++)); do
        [ ${finish[$i]} -eq 0 ] || continue
        req=(${request[$i]})
        alloc=(${alloc[$i]})
        can=1
        for ((j=0; j<m; j++)); do
            [ ${req[$j]} -le ${work[$j]} ] || can=0
        done
        if [ $can -eq 1 ]; then
            for ((j=0; j<m; j++)); do
                work[$j]=$((work[$j] + alloc[$j]))
            done
            finish[$i]=1
            sequence+=("P$i")
            found=1
        fi
    done
    [ $found -eq 1 ] || break
done

deadlocked=($(for ((i=0; i<n; i++)); do [ ${finish[$i]} -eq 0 ] && echo "P$i"; done))

if [ ${#deadlocked[@]} -eq 0 ]; then
    echo "No deadlock detected."
    echo "Safe sequence: ${sequence[@]}"
else
    echo "Deadlocked processes: ${deadlocked[@]}"
fi




# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the Detection.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 5/Detection.sh"
# *    4. Run the script using the command:
# *       "Day 5/Detection.sh"
# *    5. The output will display the scheduling results, including the average waiting time and average turnaround time for the given processes based on their burst times and arrival times.
# ?    Example Output
# *    No deadlock detected.
# *    Safe sequence: P0 P1 P2 P3