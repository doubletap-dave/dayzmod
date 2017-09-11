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

cd %srvr_dnld% && wget "https://github.com/topiaryx/dayzmod/raw/master/files/sql.7z"
7z x "sql.7z"
del "sql.7z"
