generate_time_conf() {
    cp time.conf.sample time.conf

    for user in $(get_users_with_allowedtime); do
        timegroup_rules=$(get_user_allowedtime_from_timegroups $user)
        user_rules=$(get_user_allowedtime $user)

        rules=""
        if [[ $timegroup_rules && $user_rules ]]; then
            rules="$timegroup_rules|$user_rules"
        elif [[ $timegroup_rules ]]; then
            rules="$timegroup_rules"
        else
            rules="$user_rules"
        fi

        echo -e "*;*;$user;$rules" >> time.conf
    done

    echo -ne "# End of generated time.conf" >> time.conf

    echo "Updated time.conf file created"
}

synchronize_time_conf() {
    ansible-playbook playbooks/sync_time_conf.yml
}