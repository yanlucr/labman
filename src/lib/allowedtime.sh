get_users_allowedtime() {
  sqlite3 labman.db "select * from user_allowedtime;"
}

get_users_with_no_explicit_allowedtime() {
  sqlite3 labman.db "select username from discipline_user where discipline='$1' and username not in (select username from user_allowedtime)";
}

get_user_allowedtime_from_disciplines() {
  sqlite3 labman.db "select allowedtime from discipline_allowedtime da join discipline_user du on da.discipline=du.discipline where username='$1';"
}

get_disciplines_allowedtime() {
  sqlite3 labman.db "select * from discipline_allowedtime;"
}