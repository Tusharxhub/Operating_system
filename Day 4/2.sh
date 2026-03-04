# ! wap in shell to solve the problem .


#!      Process                   B.Time       A.T   
#!        A                        5           0
#!        B                        4           2
#!        C                        2           4
#!        D                        6           6

#! Calculate  the  Avg W.T
#! Calculate the Avg T.A


bt=(5 4 2 6)
at=(0 2 4 6)
wt=(0 0 0 0)
tat=(0 0 0 0)

n=4

for ((i=1;i<n;i++))
do
  finish=$((at[i-1] + bt[i-1]))
  if [ $finish -gt ${at[i]} ]
  then
    wt[$i]=$((finish - at[i]))
  else
    wt[$i]=0
  fi
done

for ((i=0;i<n;i++))
do
  tat[$i]=$((wt[$i] + bt[$i]))
done

total_wt=0
total_tat=0

for ((i=0;i<n;i++))
do
  total_wt=$((total_wt + wt[i]))
  total_tat=$((total_tat + tat[i]))
done

echo "Avg WT = $(echo "$total_wt / $n" | bc -l)"
echo "Avg TAT = $(echo "$total_tat / $n" | bc -l)"


# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the 2.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 4/2.sh"
# *    4. Run the script using the command:
# *       "Day 4/2.sh"
# *    5. The output will display the scheduling results, including the average waiting time and average turnaround time for the given processes based on their burst times and arrival times.
# ?    Example Output
# *    Average Waiting Time = 2.00
# *    Average Turnaround Time = 7.00
