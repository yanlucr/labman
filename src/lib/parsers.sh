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