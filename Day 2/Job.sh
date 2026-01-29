# ! wap in shell to find a person is eligible for job or not.

read -r -p "Enter your age: " age
if [[ -z "$age" ]]; then    
    echo "Please enter your age."
    exit 1
fi
if ! [[ $age =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid age."
    exit 1
fi
if [ "$age" -ge 21 ]; then
    if [ "$age" -le 60 ]; then
        echo "You are eligible for the job."
    else
        echo "You are not eligible for the job."
    fi
else
    echo "You are not eligible for the job."
fi

#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Job.sh file is located.
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x "Day 2/Job.sh"
#*    4. Run the script using the command:
#*       "Day 2/Job.sh"
#*    5. Follow the on-screen prompt to enter your age and see whether you
#*       are eligible for the job or not.
#?    Example Output
#*    Enter your age: 25
#*    You are eligible for the job.
#*    Enter your age: 18
#*    You are not eligible for the job.