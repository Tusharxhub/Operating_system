# !  Create a zombie process child exit, but the parent doesn't wait




echo "Parent process started. PID: $$"

(
	echo "Child process started. PID: $BASHPID, Parent PID: $PPID"
	exit 0
) &

child_pid=$!
echo "Child process created with PID: $child_pid"
echo "Parent is sleeping for 10 seconds without wait; child should become zombie briefly."

sleep 2
ps -o pid,ppid,state,cmd -p "$child_pid" -p "$$"

sleep 8
echo "Parent exiting now."


