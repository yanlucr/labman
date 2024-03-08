user=${args[user]}
discipline=${args[discipline]}

discipline_exists=$(discipline_exists $discipline)

if [[ $discipline_exists ]]; then
    add_user_to_discipline $user $discipline
    echo "User $user added to discipline $discipline"
else
    echo "No discipline named $discipline found in database"
    exit 1
fi
