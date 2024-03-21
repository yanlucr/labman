timegroup_exists() {
  timegroup_exists=$(sqlite3 labman.db "select 1 from timegroups where timegroup='$1'")

  if [[ ! $timegroup_exists ]]; then
    echo "No timegroup named $timegroup found in database"
    exit 1
  fi
}

add_timegroup() {
  sqlite3 labman.db "insert into timegroups values('$1', '$2');"
}

add_user_to_timegroup() {
  sqlite3 labman.db "insert into timegroup_user values('$2','$1')"
}

remove_timegroup() {
  sqlite3 labman.db "delete from timegroup_user where timegroup='$1';"
  sqlite3 labman.db "delete from timegroups where timegroup='$1';"
}

delete_user_from_timegroup() {
  sqlite3 labman.db "delete from timegroup_user where username='$1' and timegroup='$2'"
}

set_timegroup_allowedtime() {
  sqlite3 labman.db "insert or replace into timegroups values('$1','$2');"
}