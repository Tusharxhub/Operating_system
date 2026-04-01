# !   Ensure process synchronisation using the weight function. The parent process must wait for the completion of the child process

echo "Parent process (PID $$) is creating a child..."

( 
	echo "Child process (PID $BASHPID) is running."
	sleep 2
	echo "Child process (PID $BASHPID) completed."
) &

child_pid=$!
wait $child_pid

echo "Parent process (PID $$) detected child completion."





# ?    How to compile and run the code
# *    1. Open your terminal.
# *    2. Navigate to the directory where the synchronisation.sh file is located.
# *    3. Make sure the script has execute permissions. You can set the permissions
# *       using the command:
# *       chmod +x "Day 6/synchronisation.sh"
# *    4. Run the script using the command:
# *       "Day 6/synchronisation.sh"
# *    5. The output will display the parent process ID, child process ID, and messages indicating the creation and completion of the child process, demonstrating process synchronization.
# ?    Example Output
#* Parent process (PID 18408) is creating a child...
#* Child process (PID 18409) is running.
#* Child process (PID 18409) completed.
#* Parent process (PID 18408) detected child completion.


