#!bash

db_server=$(config db_server)
db_name=$(config db_name)
db_admin=$(config db_admin)
db_pass=$(config db_pass)

db_user=$(config db_user)

db_user_pass=`pwgen 16`

sqlcmd -Q "CREATE LOGIN [$db_user] WITH PASSWORD = $db_user_pass" -S $db_server,1433  -U $db_admin -I -P $db_pass -d master

sqlcmd -Q "CREATE USER [$db_user] FOR LOGIN [$db_user]" -S $db_server,1433  -U $db_admin -I -P $db_pass -d master

sqlcmd "CREATE USER [$db_user] FOR LOGIN [$db_user]"  -S $db_server,1433  -U $db_admin -I -P $db_pass -d $db_name

sqlcmd -Q "EXEC sp_addrolemember 'db_owner', [$db_user]" -S $db_server,1433  -U $db_admin -I -P $db_pass -d $db_name

sqlcmd -Q "create table test (EmpId int)" -S $db_server,1433  -U $db_server -I -P $db_user_pass -d $db_name 

