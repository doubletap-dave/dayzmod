

set MYSQLPath=C:\Program Files\MySQL\MySQL Server 5.7\bin\"
set MYSQLExe="C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqladmin.exe"

:: // MySQL Settings.
:: Fields: [ IP(mysqlhost), Port(mysqlport), Username(mysqlusr), Password(mysqlpwd), Database name(mysqldb), Game instance-ID(instanceid) ]
set mysqlhost=127.0.0.1
set mysqlport=3306
set mysqlusr=dayz
set mysqlpwd=dayz
set mysqldb=hivemind

%MYSQLExe% shutdown --user=%mysqlusr% --password=%mysqlpwd% --host=%mysqlhost% --port=%mysqlport% 

pause