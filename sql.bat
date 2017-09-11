rem - actually execute the SQL files
for %i in (%srvr_dnld%\sql\*.sql) do (mysql hivemind -u%mdb_root_u% -p%mdb_root_p% < %i)

@echo DONE WITH EVERYTHING!
