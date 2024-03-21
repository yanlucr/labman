initialize_database() {
    sqlite3 labman.db "create table user_allowedtime(username text unique, allowedtime text);"
    sqlite3 labman.db "create table timegroups(timegroup text unique);"
    sqlite3 labman.db "create table timegroup_user(timegroup text, username text, unique(timegroup, username));"
    sqlite3 labman.db "create table timegroup_allowedtime(timegroup text unique, allowedtime text);"
}