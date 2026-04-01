#! Create an orphan process, which means parents complete the process before the child .





echo "Parent process started. PID: $$"

(
	echo "Child process started. PID: $BASHPID, Parent PID: $PPID"
	sleep 3
	echo "Child process still running. PID: $BASHPID, New Parent PID: $PPID"
) &

child_pid=$!
echo "Parent process (PID $$) created child process (PID $child_pid) and exits now."
exit 0


# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the orphan.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 6/orphan.sh"
# *    4. Run the script using the command:
# *       "Day 6/orphan.sh"
# *    5. The output will display the parent process ID, child process ID, and messages indicating the creation of the child process and its orphaned state after the parent process exits.
# ?    Example Output
#* Parent process started. PID: 18408
#* Parent process (PID 18408) created child process (PID 18409) and exits now.
#* Child process started. PID: 18409, Parent PID: 1
#* Child process still running. PID: 18409, New Parent PID: 1
