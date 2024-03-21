print=${args[--print]}
sync=${args[--sync]}

generate_time_conf

if [[ $print ]]; then
    cat time.conf
    echo
fi

if [[ $sync ]]; then
    synchronize_time_conf
fi