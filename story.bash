#!bash

db_server=$(config db_server)
db_name=$(config db_name)
db_admin=$(config db_admin)
db_pass=$(config db_pass)
db_user_pass=$(config db_user_pass)

db_user=$(config db_user)

check_conn=$(config check_connection)

if test $check_conn = "on"; then
  set -e
  echo "checking connection ..."
  set -x
  sqlcmd -Q "SELECT name, database_id from sys.databases" -S $db_server,1433  -U $db_admin -I -P $db_pass
  exit 0
fi


sqlcmd -Q "CREATE LOGIN [$db_user] WITH PASSWORD = '$db_user_pass'" -S $db_server,1433  -U $db_admin -I -P $db_pass -d master

sqlcmd -Q "CREATE USER [$db_user] FOR LOGIN [$db_user]" -S $db_server,1433  -U $db_admin -I -P $db_pass -d master

sqlcmd -Q "CREATE USER [$db_user] FOR LOGIN [$db_user]"  -S $db_server,1433  -U $db_admin -I -P $db_pass -d $db_name

sqlcmd -Q "EXEC sp_addrolemember 'db_owner', [$db_user]" -S $db_server,1433  -U $db_admin -I -P $db_pass -d $db_name

sqlcmd -Q "create table test (EmpId int)" -S $db_server,1433  -U $db_user -I -P $db_user_pass -d $db_name

echo "connection string:"
echo "Server=$db_server;Initial Catalog=$db_name;Persist Security Info=False;User ID=$db_user;Password=$db_user_pass;MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
