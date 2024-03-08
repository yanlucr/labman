user=${args[user]}
discipline=${args[discipline]}

sqlite3 labman.db "delete from discipline_user where username='$user' and discipline='$discipline'"
