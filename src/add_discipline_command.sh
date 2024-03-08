discipline=${args[discipline]}

sqlite3 labman.db "insert into disciplines values('$discipline');"