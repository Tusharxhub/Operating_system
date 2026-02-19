# !     Process                   B.Time          FCFS/SJF
# !      A                          5
# !      B                          4
# !      C                          2
# !      D                          6

# ! calculate the Avg W.T
# ! calculate the Avg T.A.T

proc=(A B C D); bt=(5 4 2 6); n=${#proc[@]}

calc() {
  local -n b=$2 p=$3
  echo "=== $1 ==="; echo "Proc  BT  WT  TAT"
  local w=0 tw=0 tt=0
  for ((i=0;i<n;i++)); do
    t=$((w+b[i]))
    printf " %s    %d   %d   %d\n" "${p[i]}" "${b[i]}" $w $t
    tw=$((tw+w)); tt=$((tt+t)); w=$((w+b[i]))
  done
  echo "Avg WT = $(echo "scale=2;$tw/$n"|bc) | Avg TAT = $(echo "scale=2;$tt/$n"|bc)"
}

# FCFS
calc "FCFS" bt proc

# SJF - sort by burst time
sp=("${proc[@]}"); sb=("${bt[@]}")
for ((i=0;i<n-1;i++)); do
  m=$i
  for ((j=i+1;j<n;j++)); do ((sb[j]<sb[m]))&&m=$j; done
  t=${sb[i]};sb[i]=${sb[m]};sb[m]=$t
  t=${sp[i]};sp[i]=${sp[m]};sp[m]=$t
done
echo ""
calc "SJF" sb sp
