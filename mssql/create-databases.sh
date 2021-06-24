# wait for connection
for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $1 -d master -U "SELECT 1" 2>/dev/null
    if [ $? -eq 0 ]
    then
        echo "connected!"
        break
    else
        echo "waiting for mssql server to start..."
        sleep 3
    fi
done

# create databases
IFS=',' read -r -a databases <<< "$2"
createsql=$(<./opt/scripts/createdb.sql)
dbnamewildcard="{dbname}"

for database in "${databases[@]}"; do
    sql=${createsql//$dbnamewildcard/$database}
    echo $sql;
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $1 -d master -Q "$sql";
    if [ $? -eq 0 ]
    then
        echo "Database $database created!"
    else
        echo "Failed to create $database database";
    fi
done
