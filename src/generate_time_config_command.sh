generate_time_conf() {
    OLD_IFS="$IFS"
    cp time.conf.sample time.conf

    # for users with explicit rules against them
    for line in $(get_users_allowedtime); do
        IFS='|'
        read -ra arr <<< "$line"
        IFS="$OLD_IFS"
        user=${arr[0]}
        rules=${arr[1]}

        for extra_rule in $(get_user_allowedtime_from_disciplines $user); do
            rules="$rules|$extra_rule"
        done

        echo -e "\n*;*;$user;$rules" >> time.conf
    done

    # for users with no explicit rules
    for line in $(get_disciplines_allowedtime); do
        IFS='|'
        read -ra arr <<< "$line"
        IFS="$OLD_IFS"
        discipline=${arr[0]}
        allowedtime=${arr[1]}

        for user in $(get_users_with_no_explicit_allowedtime $discipline); do
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
    ansible-playbook --ask-become-pass playbooks/sync_time_conf.yml
fi