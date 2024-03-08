discipline=${args[discipline]}

sqlite3 labman.db "delete from discipline_allowedtime where discipline='$discipline';"
sqlite3 labman.db "delete from discipline_user where discipline='$discipline';"
sqlite3 labman.db "delete from disciplines where discipline='$discipline';"
