require 'json'
require	'bson'
require 'mongo'
require 'couchrest'

nazwaPliku = ARGV[0]
bazaDanych = ARGV[1]
portCouchDb = ARGV[2]

file = File.open(nazwaPliku, "r")

hash = []

file.each_line do |jednoUFO|
	jednoUFO.slice!(1..49)	
	hash << JSON.parse(jednoUFO) 
end
couch = CouchRest.new("http://127.0.0.1:"+portCouchDb.to_s)
dbcouch = couch.database!(bazaDanych)
hash.to_a.each { |ufolek| dbcouch.save_doc(ufolek)}


