parse_allowedtime() {
    local allowedtime="$1"

    if [ "$allowedtime" = "always" ]; then
        allowedtime="Al0000-2400"
    elif [ "$allowedtime" = "never" ]; then
        allowedtime="!Al0000-2400"
    elif [[ "$allowedtime" =~ ^[0-9]{4}-[0-9]{4}$ ]]; then
        allowedtime="Al$allowedtime"
    else
        allowedtime="ERROR"
    fi

    echo $allowedtime
}

discipline=${args[discipline]}
allowedtime=${args[allowedtime]}
parsed_allowedtime=$(parse_allowedtime $allowedtime)

if [ "$parsed_allowedtime" != "ERROR" ]; then
    sqlite3 labman.db "insert or replace into discipline_allowedtime values('$discipline','$parsed_allowedtime');"

    echo "Successfully set discipline $discipline allowed time to $allowedtime"
else
    echo "Wrong allowedtime format: $allowedtime"
    echo "Try these instead: always, never, 0800-1600(START-END)"
fi