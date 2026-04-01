# !  Create a child process and show the process ID of the parent and the child both.





echo "Parent process ID: $$"

( 
	echo "Child process ID: $$"
	sleep 1
) &

wait


# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the process.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 6/process.sh"
# *    4. Run the script using the command:
# *       "Day 6/process.sh"
# *    5. The output will display the scheduling results, including the average waiting time and average turnaround time for the given processes based on their burst times and arrival times.
# ?    Example Output
#* Parent process ID: 18408
#* Child process ID: 18408

