add_user() {
  ldapaddgroup $1
  ldapadduser $1 $1
  ldapaddusertogroup $1 administrators
}

remove_user() {
    sqlite3 labman.db "delete from user_allowedtime where username='$1';"
    ldapdeletegroup $1
    ldapdeleteuser $1
}

remove_user_from_group() {
    ldapdeleteuserfromgroup $1 $2
}

set_user_allowedtime() {
  sqlite3 labman.db "insert or replace into user_allowedtime values('$1','$2');"
}