user=${args[user]}

sqlite3 /home/administrator/labman/labman.db "delete from user_allowedtime where username='$user';"
ldapdeletegroup $user
ldapdeleteuser $user