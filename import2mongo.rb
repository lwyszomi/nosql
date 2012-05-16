require 'csv'
require 'mongo'

filename = ARGV[0]
bazaDanych = ARGV[1]
kolekcja = ARGV[2]
portmongo = ARGV[3]
part = ARGV[4]

puts "Wczytuje dane z pliku"
csvAA = CSV.read(filename)
headersA = csvAA.shift 
csvAH = csvAA.map {|row| Hash[*headersA.zip(row).flatten]}
puts "Wczytano "+csvAH.length.to_s+" lini"

@db = Mongo::Connection.new("localhost", portmongo.to_s).db(bazaDanych.to_s)
@collection = @db.collection(kolekcja.to_s)
@collection.remove

puts "Zaczynam dodawac pliki do bazy"

while csvAH.length != 0 do
@collection.insert(csvAH.slice!(0,part.to_i))
puts "Zostalo "+csvAH.length.to_s+" rekordow"
end

puts "Zaimportowal dane"
puts "Nazwa Bazy "+bazaDanych.to_s
puts "Nazwa kolekcji "+kolekcja.to_s
puts "Port mongo "+portmongo.to_s 
