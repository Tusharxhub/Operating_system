# !  Create a zombie process child exit, but the parent doesn't wait


(
	exit 0
) &

child_pid=$!
echo "Parent: $$  Child: $child_pid"
sleep 1
ps -o pid,ppid,state,cmd -p "$child_pid" -p "$$"
sleep 4


# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the zombie.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 6/zombie.sh"
# *    4. Run the script using the command:
# *       "Day 6/zombie.sh"
# *    5. The output will display the parent process ID, child process ID, and messages indicating the creation of the child process, its zombie state, and the parent process exiting after a delay.
# ?    Example Output
#* Parent process started. PID: 18408
#* Child process started. PID: 18409, Parent PID: 18408
#* Child process created with PID: 18409
#* Parent is sleeping for 10 seconds without wait; child should become zombie briefly.
#*   PID  PPID S CMD
#* 18409 18408 Z [bash] <defunct>
#* Parent exiting now.


