generate_time_conf() {
    OLD_IFS="$IFS"
    cp time.conf.sample time.conf

    # for users with explicit rules against them
    for line in $(sqlite3 labman.db "select * from user_allowedtime;"); do
        IFS='|'
        read -ra arr <<< "$line"
        IFS="$OLD_IFS"
        user=${arr[0]}
        rules=${arr[1]}

        for extra_rule in $(sqlite3 labman.db "select allowedtime from discipline_allowedtime da join discipline_user du on da.discipline=du.discipline where username='ronaldo';"); do
            rules="$rules|$extra_rule"
        done

        echo -e "\n*;*;$user;$rules" >> time.conf
    done

    # for users with no explicit rules
    for line in $(sqlite3 labman.db "select * from discipline_allowedtime;"); do
        IFS='|'
        read -ra arr <<< "$line"
        IFS="$OLD_IFS"
        discipline=${arr[0]}
        allowedtime=${arr[1]}

        echo $discipline

        for user in $(sqlite3 labman.db "select username from discipline_user where discipline='$discipline' and username not in (select username from user_allowedtime)";); do
            echo -e "\n*;*;$user;$allowedtime" >> time.conf
        done
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