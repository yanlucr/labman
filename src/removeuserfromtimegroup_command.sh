user=${args[user]}
timegroup=${args[timegroup]}

delete_user_from_timegroup $user $timegroup

echo "Successfully deleted user $user from timegroup $timegroup"
