generate_time_conf() {
    cp time.conf.sample time.conf

    for line in $(sqlite3 /home/administrator/labman/labman.db "select * from user_allowedtime;"); do
        IFS='|'
        read -ra userarr <<< "$line"
        user=${userarr[0]}
        allowedtime=${userarr[1]}
        echo -e "\n*;*;$user;$allowedtime" >> time.conf
    done

    echo -ne "\n# End of generated time.conf" >> time.conf
}

print=${args[--print]}
sync=${args[--sync]}

generate_time_conf

echo "Updated time.conf file created"

if [[ $print ]]; then
    cat time.conf
    echo
fi

if [[ $sync ]]; then
    ansible-playbook --ask-become-pass sync_time_conf.yml
fi