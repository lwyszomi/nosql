require 'csv'
require 'mongo'

filename = ARGV[0]
bazaDanych = ARGV[1]
kolekcja = ARGV[2]
portmongo = ARGV[3]

csvAA = CSV.read(filename)
headersA = csvAA.shift 
csvAH = csvAA.map {|row| Hash[*headersA.zip(row).flatten] }

@db = Mongo::Connection.new("localhost", portmongo.to_s).db(bazaDanych.to_s)
@collection = @db.collection(kolekcja.to_s)

csvAH.each do |pojedunczeUFO|
	@collection.insert(pojedunczeUFO);
end

puts "zaimportowal dane"
