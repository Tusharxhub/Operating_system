# !  Deadlock Detection Algorithm Implementation

#! process       Allocation          Request         Avg 
#             A     B               A     B        A   B
#! P0          1     0              0     1        1   0
#! P1          2     1              1     0
#! P2          0     1              1     0
#! P3          1     0              0     1






alloc=("1 0" "2 1" "0 1" "1 0")
request=("0 1" "1 0" "1 0" "0 1")
work=(1 0) finish=(0 0 0 0) sequence=()

for ((iter=0; iter<4; iter++)); do
    for ((i=0; i<4; i++)); do
        if [ ${finish[$i]} -eq 0 ]; then
            read req_a req_b <<< "${request[$i]}"
            if [ $req_a -le ${work[0]} ] && [ $req_b -le ${work[1]} ]; then
                read a b <<< "${alloc[$i]}"
                work[0]=$((work[0] + a))
                work[1]=$((work[1] + b))
                finish[$i]=1
                sequence+=("P$i")
            fi
        fi
    done
done

deadlock=($(for ((i=0; i<4; i++)); do [ ${finish[$i]} -eq 0 ] && echo "P$i"; done))
[ ${#deadlock[@]} -eq 0 ] && echo "No deadlock detected." && echo "Safe sequence: ${sequence[@]}" || echo "Deadlocked: ${deadlock[@]}"



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