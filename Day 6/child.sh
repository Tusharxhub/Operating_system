# !  Create a multiple-child process


parent_pid=$$
echo "Parent process PID: $parent_pid"

child_pids=()

for i in 1 2 3
do
	(
		echo "Child $i started. PID: $BASHPID, Parent PID: $parent_pid"
		sleep "$i"
		echo "Child $i finished. PID: $BASHPID"
	) &

	child_pids+=("$!")
done

echo "Parent created child PIDs: ${child_pids[*]}"

for pid in "${child_pids[@]}"
do
	wait "$pid"
	echo "Parent confirmed completion of child PID: $pid"
done

echo "All child processes have completed."



# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the child.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 6/child.sh"
# *    4. Run the script using the command:
# *       "Day 6/child.sh"  
# *    5. The output will display the parent process ID, child process IDs, and messages indicating the creation and completion of each child process, demonstrating the creation of multiple child processes and their synchronization with the parent process.
# ?    Example Output
#* Parent process PID: 18408
#* Child 1 started. PID: 18409, Parent PID: 18408
#* Child 2 started. PID: 18410, Parent PID: 18408
#* Child 3 started. PID: 18411, Parent PID: 18408
#* Parent created child PIDs: 18409 18410 18411
#* Child 1 finished. PID: 18409
#* Parent confirmed completion of child PID: 18409