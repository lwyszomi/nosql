require 'json'
require 'mongo'
require 'couchrest'

iloscPakietow = ARGV[0].to_f
bazaDanych = ARGV[1]
portCouchDb = ARGV[2]

kolekcja = ARGV[3]
portMongo = ARGV[4]

@dbmongo = Mongo::Connection.new("localhost", portMongo).db(bazaDanych)
@collection = @dbmongo.collection(kolekcja)

hash = []
poczatek = 1
licznik = @collection.count

@couch = CouchRest.new("http://127.0.0.1:"+portCouchDb.to_s)
@dbcouch = @couch.database!(bazaDanych)
@dbcouch.recreate!
while poczatek * iloscPakietow - iloscPakietow < licznik do
	hash = @collection.find(nil, {:limit => iloscPakietow, :skip => (poczatek * iloscPakietow - iloscPakietow )}).to_a	
	hash.collect do |idRemove|
		idRemove.delete("_id")
	end
	@dbcouch.bulk_save(hash)
	puts "skopiowano "+(poczatek*iloscPakietow).to_s
	poczatek+=1	
end
