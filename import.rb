require 'csv'
require 'mongo'
filename = 'ufo.us.csv'

csvAA = CSV.read(filename)
headersA = csvAA.shift 
csvAH = csvAA.map {|row| Hash[*headersA.zip(row).flatten] }

@db = Mongo::Connection.new("localhost", 27017).db("dane_z_ufo")
@collection = @db.collection("duzo_danych")

csvAH.each do |pojedunczeUFO|
	@collection.insert(pojedunczeUFO);
end

puts "zaimportowal dane"
