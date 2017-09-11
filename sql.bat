cls
cls
cls
for %i in (C:\_server\.download\sql\*.sql) do (mysql hivemind -u%mdb_root_u% -p%mdb_root_p% <%i)

@echo DONE WITH EVERYTHING!
