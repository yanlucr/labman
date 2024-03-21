get_users_with_allowedtime() {
  sqlite3 labman.db "select u.username from user_allowedtime u union select t.username from timegroup_user t;"
}

get_user_allowedtime() {
  sqlite3 labman.db "select allowedtime from user_allowedtime where username='$1';"
}

get_user_allowedtime_from_timegroups() {
  sqlite3 labman.db "select group_concat(allowedtime,'|') from timegroup_allowedtime da join timegroup_user du on da.timegroup=du.timegroup where username='$1';"
}

clear_user_allowedtime() {
  sqlite3 labman.db "delete from user_allowedtime where username='$1'"
}

get_timegroups_allowedtime() {
  sqlite3 labman.db "select * from timegroup_allowedtime;"
}

clear_timegroup_allowedtime() {
  sqlite3 labman.db "delete from timegroup_allowedtime where timegroup='$1'"
}