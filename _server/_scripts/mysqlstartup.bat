
@set MYSQLPath=C:\Program Files\MySQL\MySQL Server 5.7\bin\"
@set MYSQLExe="C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqld.exe"

:: Path to data folder which may differ from install dir
@set datafldr="C:\ProgramData\MySQL\MySQL Server 5.7\Data"

%MYSQLExe% --console --datadir=%datafldr%


@echo mySQL Started
pause
timeout /T 5


