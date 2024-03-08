user=${args[user]}
discipline=${args[discipline]}

discipline_exists=$(sqlite3 labman.db "select 1 from disciplines where discipline='$discipline'")

if [[ $discipline_exists ]]; then
    sqlite3 labman.db "insert into discipline_user values('$discipline','$user')"
    echo "User $user added to discipline $discipline"
else
    echo "No discipline named $discipline found in database"
    exit 1
fi
