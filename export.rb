require 'json'
require	'bson'
require 'mongo'
require 'couchrest'

@dbmongo = Mongo::Connection.new("localhost", 27017).db("dane_z_ufo")
@collection = @dbmongo.collection("duzo_danych")

hash = []

#puts @collection.firstz
@collection.find.each do |jednoUFO|
		jednoUFO = jednoUFO.to_hash
		jednoUFO['_id'] = jednoUFO['_id'].to_s
		hash << jednoUFO 
end
puts "wczytal dane z mongo"
@couch = CouchRest.new("http://127.0.0.1:5984")
@dbcouch = @couch.database!("duzo_danych")
hash.each { |ufolek| @dbcouch.save_doc(ufolek)}
puts "zaimportowal dane"


