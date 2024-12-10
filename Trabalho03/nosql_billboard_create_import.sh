use billboard
db.createCollection("artists")
mongoimport --db billboard --collection artists --file artists.json --jsonArray