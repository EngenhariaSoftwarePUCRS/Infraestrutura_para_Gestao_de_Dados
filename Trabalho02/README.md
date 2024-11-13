## Using Cassandra Locally

```sh
# Inicialmente crie um volume de armazenamento para os dados do Cassandra:
docker volume create cassandra-data

# Isso manterá os dados salvos mesmo que o container seja excluído
docker run --name Cassandra -d -p 9042:9042 -v cassandra-data:/var/lib/cassandra cassandra:latest

# Para acessar o container do Cassandra:
docker exec -it Cassandra cqlsh
```
