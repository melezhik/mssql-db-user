# SYNOPSIS

Creates mssql user and grants permissions for database.

# Install

    $ sparrow plg install mssql-db-user

# USAGE

    # create user with login and password
    # and grant permissions to databases
    $ sparrow plg run mssql-db-user \
      --param db_server={mssql server host} \
      --param db_admin={database server admin login} \
      --param db_pass={database server admin password} \
      --param db_user={user login} \
      --param db_pass={user password}


    $ only check that your db admin creds are valid


    $ sparrow plg run mssql-db-user \
      --param db_server={mssql server host} \
      --param db_admin={database server admin login} \
      --param check_connection=on
    
# Prerequisites

* pwgen

* sqlcmd client 

# Author

Alexey Melezhik

