# ksqlDB

This is a repository for assignment in session 9: ksqlDB and kafka processing from Data Engineer Fellowship 7 held by IYKRA. In this case, we are going to make a stream table and create a new table in ksqlDB using the created stream table.

Pre-requisite:
1. Docker
2. Dbeaver
3. Faust. Install with command `pip install -U faust`.

How to run:
1. Save `docker-compose.yml` file to a directory and navigate through your `command prompt` or `terminal` to your directory and run `docker-compose up` command.
2. After successfully running docker, you can access ksqlDB CLI using command `docker exec -it ksqldb-cli ksql http://ksqldb-server:8088`.
3. Open your Dbeaver and connect with your postgres using the `username` and `password` based in your `docker-compose` file. Don't forget to change the port name if it's different from your initial settings.
4. Navigate to `schema` and `table` in your Dbeaver to create a new table and fill in the values.
5. Create stream table based on your created table from postgres in ksqlDB.
6. Filter the data and create a new table in ksqlDB to save the new table.

If you have problem in using ksqlDB, you can see the documentation [here](https://ksqldb.io/examples.html)
