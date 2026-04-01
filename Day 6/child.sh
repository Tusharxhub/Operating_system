# !  Create a multiple-child process


echo "Parent PID: $$"
pids=()

for i in 1 2 3; do
	(
		echo "Child $i PID: $BASHPID"
		sleep "$i"
	) &
	pids+=("$!")
done

for pid in "${pids[@]}"; do
	wait "$pid"
done

echo "All child processes completed."


# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the child.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 6/child.sh"
# *    4. Run the script using the command: 
# *       "Day 6/child.sh"  
# *    5. The output will display the parent process ID and the process IDs of the three child processes, along with messages indicating their creation and completion.
# ?    Example Output
#* Parent PID: 18408
#* Child 1 PID: 18409
#* Child 2 PID: 18410
#* Child 3 PID: 18411
#* All child processes completed.