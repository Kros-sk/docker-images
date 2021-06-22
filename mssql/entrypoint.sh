# start the script to create the DBs
/opt/create-databases.sh $1 $2 &
# start the sql server
/opt/mssql/bin/sqlservr