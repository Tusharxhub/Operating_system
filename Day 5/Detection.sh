# !  Deadlock Detection Algorithm Implementation

#! process       Allocation          Request         Avg 
#             A     B               A     B        A   B
#! P0          1     0              0     1        1   0
#! P1          2     1              1     0
#! P2          0     1              1     0
#! P3          1     0              0     1






alloc=(
    "1 0"
    "2 1"
    "0 1"
    "1 0"
)
# Request Matrix
request=(
    "0 1"
    "1 0"
    "1 0"
    "0 1"
)
# Available Resources
avail=(1 0)

n=4
m=2

# Deadlock Detection Algorithm
finish=(0 0 0 0)
work=(${avail[@]})
changed=1
while [ $changed -eq 1 ]; do
    changed=0
    for ((i=0; i<$n; i++)); do
        if [ ${finish[$i]} -eq 0 ]; then
            req_row=(${request[$i]})
            alloc_row=(${alloc[$i]})
            can_allocate=1
            for ((j=0; j<$m; j++)); do
                if [ ${req_row[$j]} -gt ${work[$j]} ]; then
                    can_allocate=0
                    break
                fi
            done
            if [ $can_allocate -eq 1 ]; then
                for ((j=0; j<$m; j++)); do
                    work[$j]=$(( ${work[$j]} + ${alloc_row[$j]} ))
                done
                finish[$i]=1
                changed=1
            fi
        fi
    done
done

# Output
deadlocked=()
for ((i=0; i<$n; i++)); do
    if [ ${finish[$i]} -eq 0 ]; then
        deadlocked+=("P$i")
    fi
done

if [ ${#deadlocked[@]} -eq 0 ]; then
    echo "No deadlock detected."
else
    echo -n "Deadlocked processes: "
    for p in "${deadlocked[@]}"; do
        echo -n "$p "
    done
    echo
fi



