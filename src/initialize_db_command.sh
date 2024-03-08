sqlite3 labman.db "create table user_allowedtime(username text unique, allowedtime text);"

sqlite3 labman.db "create table disciplines(discipline text unique);"
sqlite3 labman.db "create table discipline_user(discipline text, username text, unique(discipline, username));"
sqlite3 labman.db "create table discipline_allowedtime(discipline text unique, allowedtime text);"