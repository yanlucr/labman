timegroup=${args[timegroup]}
allowedtime=${args[allowedtime]}
alloweddays=${args[alloweddays]}

if [ "$(parse_alloweddays $alloweddays)" == "ERROR" ]; then
    echo "Wrong alloweddays format: $alloweddays"
    echo "Try combinations of these instead: Mo Tu We Th Fr Sa Su Wk Wd Al"
    echo "Read more in the 'time.conf' man page"
    exit 1
fi

parsed_allowedtime=$(parse_allowedtime $allowedtime $alloweddays)

if [ "$parsed_allowedtime" != "ERROR" ]; then
    add_timegroup $timegroup $parsed_allowedtime

    echo "Successfully added timegroup $timegroup to database"

    if [[ $alloweddays ]]; then
        echo "Successfully set timegroup $timegroup allowed time to $allowedtime on $alloweddays"
    else
        echo "Successfully set timegroup $timegroup allowed time to $allowedtime everyday"
    fi
else
    echo "Wrong allowedtime format: $allowedtime"
    echo "Try these instead: always, never, 0800-1600(START-END)"
    exit 1
fi