# ! wap to check whether a character is a Vowel or Consonant.

read -r -p "Enter a character: " char
if [[ -z "$char" ]]; then
    echo "Please enter a character."
    exit 1
fi
if [[ $char =~ ^[a-zA-Z]$ ]]; then
    case $char in
        [aeiouAEIOU])
            echo "$char is a Vowel."
            ;;
        *)
            echo "$char is a Consonant."
            ;;
    esac
else
    echo "Invalid input. Please enter a single alphabet character."
    exit 1
fi 

#?    How to compile and run the code
#*    1. Open your terminal.
#*    2. Navigate to the directory where the Alphabate.sh file is located
#*    3. Make sure the script has execute permissions. You can set the permissions using the command:
#*       chmod +x "Day 2/Alphabate.sh"
#*    4. Run the script using the command:
#*       "Day 2/Alphabate.sh"
#*    5. Follow the on-screen prompt to enter a character and see whether it
#*       is a Vowel or Consonant.
#?    Example Output
#*    Enter a character: A
#*    A is a Vowel.
#*    Enter a character: b
#*    b is a Consonant.
#*    Enter a character: 1
#*    Invalid input. Please enter a single alphabet character.
#*    Enter a character: @
#*    Invalid input. Please enter a single alphabet character.
