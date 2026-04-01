# !  Create a child process and show the process ID of the parent and the child both.





echo "Parent process ID: $$"

( 
	echo "Child process ID: $$"
	sleep 1
) &

wait



