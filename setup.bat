cls
@echo off

rem - variables
set steam_u=nnoocha
set steam_p=2JuWH3iVbO5p

set srvr=C:\_server
set srvr_a2=C:\_server\@arma2
set srvr_a2_oa=C:\_server\@arma2oa
set srvr_cfg=C:\_server\_cfgdayz
set srvr_scr=C:\_server\_scripts
set srvr_scmd=C:\_server\_steamcmd
set srvr_tool=C:\_server\_tools
set srvr_dnld=C:\_server\.download

mkdir C:\_server\.download

set a2_id=33910
set a2_oa_id=33930

set mdb_root_u=root
set mdb_root_p=changeme

set dzm_db_n=hivemind
set dzm_db_u=dayzhivemind
set dzm_db_p=changeme

rem - install chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

rem - set paths
set "PATH=%PATH%;C:\_server\_steamcmd"

cls
@echo on
cls

@echo
rem - chocolatey: install prerequisite packages and refresh the environment
@echo -- Downloading and install 7zip
choco install 7zip -y
@echo -- Downloading and install 7zip ... DONE!
cls
@echo -- Downloading and install wget
choco install wget -y
@echo -- Downloading and install wget ... DONE!
cls
@echo -- Downloading and install git
choco install git.install git -y
@echo -- Downloading and install git ... DONE!
cls
@echo -- Downloading and install vcredist2008
choco install vcredist2008 -y
@echo -- Downloading and install vcredist2008 ... DONE!
cls
@echo -- Downloading and install vcredist2010
choco install vcredist2010 -y
@echo -- Downloading and install vcredist2010 ... DONE!
cls
@echo -- Downloading and install vcredist2013
choco install vcredist2013 -y
@echo -- Downloading and install vcredist2013 ... DONE!
cls
@echo -- Downloading and install vcredist2015
choco install vcredist2015 -y
@echo -- Downloading and install vcredist2015 ... DONE!
cls
@echo -- Downloading and install mariadb
choco install mariadb -y
@echo -- Downloading and install mariadb ... DONE!
cls
@echo -- Downloading and install heidisql ... DONE!
choco install heidisql -y
@echo -- Downloading and install heidisql ... DONE!

rem - download and extract the server folder structure and files
cd C:\ && wget "https://github.com/topiaryx/dayzmod/raw/master/files/_server.7z" && 7z x "_server.7z" && del "_server.7z"
cls

rem - download standalone servers for arma 2 and arma 2 operation arrowhead
::steamcmd +login "%steam_u%" "%steam_p%" +force_install_dir "%srvr_a2%" +app_update "%a2_id%" validate +quit
::cls
::steamcmd +login "%steam_u%" "%steam_p%" +force_install_dir "%srvr_a2_oa%" +app_update "%a2_oa_id%" validate +quit
::cls

rem - create a symbolic link between addon folders (removes requirement for files to reside in the same folder)
::@echo -- Creating a symbolic link between ArmA 2 Operation Arrowhead and ArmA 2
::mklink /d %srvr_a2%\AddOns %srvr_a2_oa%\AddOns
::@echo -- Creating a symbolic link between ArmA 2 Operation Arrowhead and ArmA 2 ... DONE!
::cls

rem - change the arma 2 oa steam appid enabling it to show up in the steam dayzmod server browser
@echo Setting proper Steam AppID (224580)
@echo 224580> %srvr_a2_oa%\steam_appid.txt
@echo Setting proper Steam AppID (224580) ... DONE!

rem - setup MariaDB (MySQL drop-in replacement)
@echo off
mysql -u%mdb_root_u% -e"SET PASSWORD FOR '%mdb_root_u%'@'localhost' = PASSWORD('%mdb_root_p%');"
mysql -u%mdb_root_u% -p%mdb_root_p% -e"SET character_set_server = 'utf8';"
mysql -u%mdb_root_u% -p%mdb_root_p% -e"SET collation_server = 'utf8_general_ci';"
mysql -u%mdb_root_u% -p%mdb_root_p% -e"CREATE DATABASE `hivemind` /*!40100 COLLATE 'utf8_general_ci' */;"
mysql -u%mdb_root_u% -p%mdb_root_p% -e"CREATE USER '%dzm_db_u%'@'localhost' IDENTIFIED BY '%dzm_db_p%';"
mysql -u%mdb_root_u% -p%mdb_root_p% -e"GRANT SUPER  ON *.* TO %dzm_db_u%@'localhost';"
mysql -u%mdb_root_u% -p%mdb_root_p% -e"GRANT SELECT, EXECUTE, SHOW VIEW, ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, CREATE VIEW, DELETE, DROP, EVENT, INDEX, INSERT, REFERENCES, TRIGGER, UPDATE, LOCK TABLES  ON `%dzm_db_n%`.* TO '%dzm_db_u%'@'localhost' WITH GRANT OPTION;"
@echo on
cls

rem - download the DayZMod files and put the files in their place
cd %srvr_dnld% && wget "http://se1.dayz.nu/latest/1.8.9/Stable/28/@DayZMod_Server-1.8.9-Full.rar" && 7z x "@DayZMod_Server-1.8.9-Full.rar"
xcopy @DayZ "%srvr_a2_oa%\@DayZ" /s /i
xcopy @Hive "%srvr_a2_oa%\@Hive" /s /i
xcopy Keys "%srvr_a2_oa%\Keys" /s /i
xcopy DatabaseMySql.dll "%srvr_a2_oa%" /s /i
xcopy tbb.dll "%srvr_a2_oa%" /s /i
xcopy tbbmalloc.dll "%srvr_a2_oa%" /s /i

rem - download the DayZMod chernarus mission files
cd %srvr_dnld% && wget "http://se1.dayz.nu/latest/1.8.9/Stable/dayz_1337.chernarus.rar" && 7z x "dayz_1337.chernarus.rar"
xcopy dayz_1337.chernarus "%srvr_a2_oa%\MPMissions\dayz_1337.chernarus" /s /i

rem - download the battleye filters and put them in their home
cd %srvr_dnld% && cmd /c git clone https://github.com/DayZMod/Battleye-Filters.git
xcopy Battleye-Filters "%srvr_cfg%\battleye" /s /i

rem - download BEC and DaRT and put them in their home too...
cd %srvr_dnld% && wget "https://github.com/topiaryx/dayzmod/raw/master/files/bec.7z" && 7z x "bec.zip" -o%srvr_tool% -r
cd %srvr_dnld% && wget "https://github.com/topiaryx/dayzmod/raw/master/files/dart.7z" && 7z x "dart.zip" -o%srvr_tool% -r

rem - nuke the download directory after all operations have been completed
@rd /s /q %srvr_dnld%

rem - open up the required ports in the firewall
netsh advfirewall firewall add rule name="ArmA 2 DayZ Server-IN-UDP:2302" dir=in action=allow protocol=UDP localport=2302
netsh advfirewall firewall add rule name="ArmA 2 DayZ Server-IN-UDP:2303" dir=in action=allow protocol=UDP localport=2303
netsh advfirewall firewall add rule name="ArmA 2 DayZ Server-OUT-arma2oa" dir=out action=allow protocol=UDP program="%srvr_a2_oa%\arma2oaserver.exe"

rem - file unblocker
cd %srvr_a2_oa%
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Unblock-File DatabaseMySql.dll"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Unblock-File tbb.dll"
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Unblock-File tbbmalloc.dll"

rem - finish up database stuff
rem - download the SQL files create the db and create the tables
cd %srvr_dnld% && wget "https://github.com/topiaryx/dayzmod/raw/master/sql.bat"
cd %srvr_dnld% && wget "https://github.com/topiaryx/dayzmod/raw/master/files/sql.7z"
7z x "sql.7z"
del "sql.7z"
sql.bat
cls
