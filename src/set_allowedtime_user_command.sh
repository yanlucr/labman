user=${args[user]}
allowedtime=${args[allowedtime]}
parsed_allowedtime=$(parse_allowedtime $allowedtime)

if [ "$parsed_allowedtime" != "ERROR" ]; then
    set_user_allowedtime $user $parsed_allowedtime

    echo "Successfully set user $user allowed time to $allowedtime"
else
    echo "Wrong allowedtime format: $allowedtime"
    echo "Try these instead: always, never, 0800-1600(START-END)"
fi