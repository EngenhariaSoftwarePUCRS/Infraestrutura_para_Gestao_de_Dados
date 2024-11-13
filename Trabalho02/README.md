## Using Cassandra Locally

```sh
# Inicialmente crie um volume de armazenamento para os dados do Cassandra:
docker volume create cassandra-data

# Para criar o container do Cassandra pela primeira vez, mapeando portas e volumes
docker run --name Cassandra -d -p 9042:9042 -v cassandra-data:/var/lib/cassandra cassandra:latest

# Para iniciar o container do Cassandra
docker start Cassandra

# Para acessar o container do Cassandra
docker exec -it Cassandra cqlsh
```
