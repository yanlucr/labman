user=${args[user]}
timegroup=${args[timegroup]}

timegroup_exists $timegroup

add_user_to_timegroup $user $timegroup
echo "Successfully added user $user added to timegroup $timegroup"
