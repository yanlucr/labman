discipline=${args[discipline]}
allowedtime=${args[allowedtime]}
parsed_allowedtime=$(parse_allowedtime $allowedtime)

if [ "$parsed_allowedtime" != "ERROR" ]; then
    set_discipline_allowedtime $discipline $parsed_allowedtime

    echo "Successfully set discipline $discipline allowed time to $allowedtime"
else
    echo "Wrong allowedtime format: $allowedtime"
    echo "Try these instead: always, never, 0800-1600(START-END)"
fi