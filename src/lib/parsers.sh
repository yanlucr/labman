parse_allowedtime() {
    local allowedtime="$1"
    local alloweddays="$2"

    local result="$allowedtime"
    if [[ ! "$allowedtime" =~ ^(always|never|[0-9]{4}-[0-9]{4})$ ]]; then
        result="ERROR"
    else
        if [ "$allowedtime" = "always" ] || [ "$allowedtime" = "never" ]; then
            result="0000-2400"
        fi

        if [[ $alloweddays ]]; then
            result="$alloweddays$result"
        else
            result="Al$result"
        fi

        if [ "$allowedtime" = "never" ]; then
            result="!$result"
        fi
    fi

    echo $result
}

parse_alloweddays() {
    local alloweddays="$1"

    if [[ ! "$alloweddays" =~ ^(Mo|Tu|We|Th|Fr|Sa|Su|Wk|Wd|Al)*$ ]]; then
        alloweddays="ERROR"
    fi

    echo $alloweddays
}