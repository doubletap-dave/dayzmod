:: variables
set steam_u="nnoocha"
set steam_p="2JuWH3iVbO5p"

set srvr=C:\_server
set srvr_a2=C:\_server\@arma2
set srvr_a2oa=C:\_server\@arma2oa
set srvr_cfg=C:\_server\_cfgdayz
set srvr_scr=C:\_server\_scripts
set srvr_scmd=C:\_server\_steamcmd

set a2_id="33910"
set a2_oa_id="33930"

:: install chocolatey and refresh the environment
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
refreshenv

:: chocolatey >>> install prerequisite packages and refresh the environment
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
cd C:\
wget
