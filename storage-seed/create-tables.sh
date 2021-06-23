IFS=',' read -r -a tables <<< "$1"
connectionstring="DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://$2:10000/devstoreaccount1;QueueEndpoint=http://$2:10001/devstoreaccount1;TableEndpoint=http://$2:10002/devstoreaccount1;"
echo "==== Start creating tables"

for table in "${tables[@]}"; do
    echo "===== Creating table: $table"
    az storage table create --name $table --connection-string "$connectionstring"
done

echo "==== Creating tables is done"