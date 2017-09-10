echo on
@echo -- Downloading ArmA 2 Standalone Server...
@echo --
@echo --
steamcmd +login %steam_uname% %steam_passwd% +force_install_dir "%arma_two%" +app_update %arma_two_app% validate +quit
@echo -- DONE!
cls
@echo -- Downloading ArmA 2 Operation Arrowhead Standalone Server...
@echo --
@echo --
steamcmd +login %steam_uname% %steam_passwd% +force_install_dir "%arma_twooa%" +app_update %arma_twooa_app% validate +quit
@echo -- DONE!

:: create a symbolic link between the "addon" folder so they don't have to reside in the same directory... saves time
@echo
@echo -- Creating a symbolic link between ArmA 2 Operation Arrowhead and ArmA 2
mklink /d %arma_twooa%\AddOns %arma_two%\AddOns

:: changing the ArmA 2 OA steam appid, this allows it to show up in the Steam\DayZMod server browser
@echo
@echo Setting proper Steam AppID (224580)
@echo 224580> %arma_twooa%\steam_appid.txt

cls
@echo -- Thanks for playing Who Wants to be a Millionaire!
@echo -- (Installer is done...)

pause
