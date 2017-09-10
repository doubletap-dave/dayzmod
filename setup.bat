@echo off
:: variables
set steam_u=nnoocha           :: change me
set steam_p=2JuWH3iVbO5p      :: change me

set srvr=C:\_server
set srvr_a2=C:\_server\@arma2
set srvr_a2_oa=C:\_server\@arma2oa
set srvr_cfg=C:\_server\_cfgdayz
set srvr_scr=C:\_server\_scripts
set srvr_scmd=C:\_server\_steamcmd

set a2_id=33910
set a2_oa_id=33930

:: install chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

:: set paths
set "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
set "PATH=%PATH%;C:\_server\_steamcmd"
refreshenv

@echo on
cls

@echo
:: chocolatey: install prerequisite packages and refresh the environment
@echo -- Downloading and install 7zip
choco install 7zip -y
@echo -- Downloading and install 7zip ... DONE!
cls
@echo -- Downloading and install wget
choco install wget -y
@echo -- Downloading and install wget ... DONE!
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
refreshenv

:: download and extract the server folder structure and files
cd C:\ && wget https://github.com/topiaryx/dayzmod/raw/master/server.7z && 7z x server.7z && del server.7z

:: download standalone servers for arma 2 and arma 2 operation arrowhead
cls
steamcmd +login "%steam_u% %steam_p%" +force_install_dir "%srvr_a2%" +app_update "%a2_id%" validate +quit
cls
steamcmd +login "%steam_u% %steam_p%" +force_install_dir "%srvr_a2_oa%" +app_update "%a2_oa_id%" validate +quit
cls

:: create a symbolic link between addon folders (removes requirement for files to reside in the same folder)
@echo -- Creating a symbolic link between ArmA 2 Operation Arrowhead and ArmA 2
mklink /d %srvr_a2%\AddOns %srvr_a2_oa%\AddOns
@echo -- Creating a symbolic link between ArmA 2 Operation Arrowhead and ArmA 2 ... DONE!

:: change the arma 2 oa steam appid enabling it to show up in the steam dayzmod server browser
@echo Setting proper Steam AppID (224580)
@echo 224580> %arma_twooa%\steam_appid.txt
@echo Setting proper Steam AppID (224580) ... DONE!
