cd %srvr_dnld% && wget "https://github.com/topiaryx/dayzmod/raw/master/files/sql.7z"
7z x "sql.7z" && del "sql.7z"
for %i in (%srvr_dnld%\sql\*.sql) do (mysql hivemind -u%mdb_root_u% -p%mdb_root_p% < %i)
