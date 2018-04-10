# SYNOPSIS

Creates mssql user and grants to user permissions for database.

# Install

    $ sparrow plg install mssql-db-user

# USAGE

    $ sparrow plg run mssql-db-user \
      --param db_server={mssql server host} \
      --param db_admin={database server admin login} \
      --param db_pass={database server admin password} \
      --param db_user={user login} \
      --param db_pass={user password}


    
# Prerequisites

* pwgen

* sqlcmd client 

# Author

Alexey Melezhik

