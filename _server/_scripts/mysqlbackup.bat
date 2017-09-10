:: Declare how date / time should be handled.
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set backuptime=%YYYY%-%MM%-%DD%_%HH%-%Min%
echo %backuptime%



:: SETTINGS AND PATHS 
:: Note: Do not put spaces before the equal signs or variables will fail

:: Name of the database user with rights to all tables
set dbuser=dayz

:: Password for the database user
set dbpass=dayz

:: Error log path - Important in debugging your issues
set errorLogPath="c:\ServerTools\dumperrors.txt"


:: MySQL Paths
set mysqldumpexe="C:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump.exe"

:: Backup Folder path
set backupfldr="c:\ServerTools\mysqlbackups\"

:: Path to data folder which may differ from install dir
set datafldr="C:\ProgramData\MySQL\MySQL Server 5.7\Data"

:: Path to zip executable
set zipper="c:\Program Files\7-Zip\7z.exe"

:: Number of days to retain .zip backup files 
set retaindays=30

:: DONE WITH SETTINGS


:: GO FORTH AND BACKUP EVERYTHING!
pushd %datafldr%

echo "Pass each name to mysqldump.exe and output an individual .sql file for each"

:: turn on if you are debugging
@echo off

FOR /D %%F IN (*) DO (

IF NOT [%%F]==[performance_schema] IF NOT [%%F]==[mysql] IF NOT [%%F]==[sys]  (
SET %%F=!%%F:@002d=-!
%mysqldumpexe% --user=%dbuser% --password=%dbpass% --databases --routines --log-error=%errorLogPath% %%F > "%backupfldr%%%F_%backuptime%.sql"
) ELSE (
echo Skipping DB backup for performance_schema and mysql
)
)

echo "Zipping all files ending in .sql in the folder"


:: .zip option clean but not as compressed
%zipper% a -tzip %backupfldr%mySQL_Backup_%backuptime%.zip %backupfldr%*.sql

echo "Deleting all the files ending in .sql only"
 
del "%backupfldr%*.sql"

echo "Deleting zip files older than 30 days now"
Forfiles -p %backupfldr% -s -m *.* -d -%retaindays% -c "cmd /c del /q @path"


echo "done"

popd