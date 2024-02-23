user=${args[user]}

sqlite3 labman.db "delete from user_allowedtime where username='$user';"
ldapdeletegroup $user
ldapdeleteuser $user