discipline_exists() {
  sqlite3 labman.db "select 1 from disciplines where discipline='$1'"
}

add_discipline() {
  sqlite3 labman.db "insert into disciplines values('$1');"
}

add_user_to_discipline() {
  sqlite3 labman.db "insert into discipline_user values('$2','$1')"
}

remove_discipline() {
  sqlite3 labman.db "delete from discipline_allowedtime where discipline='$1';"
  sqlite3 labman.db "delete from discipline_user where discipline='$1';"
  sqlite3 labman.db "delete from disciplines where discipline='$1';"
}

delete_user_from_discipline() {
  sqlite3 labman.db "delete from discipline_user where username='$1' and discipline='$2'"
}

set_discipline_allowedtime() {
  sqlite3 labman.db "insert or replace into discipline_allowedtime values('$1','$2');"
}