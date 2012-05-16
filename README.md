NoSQL
=====

Repozytorium na potrzeby przedmiotu nosql

RUBY
----

Projekt został tworzony na wersji 1.9.3

Potrzebne gemy
--------------

	- mongo
	- restcouch
	- csv
	- json

Import Danych
--------------

Uruchomienie ruby import2mongo.rb "nazwapliku.csv" "bazadanych" "nazwa kolekcji" "port do MongoDb" "Wielkosc partow"

<pre>
ruby import2mongo.rb daneBiblioteczne.csv biblioteka ksiazki 27017 10000
</pre>

Export Danych
-------------

Uruchomienie ruby mongo2couch.rb "Wielkosc pakietow" "bazadanych" "nazwa kolekcji" "port do mongoDb" "port do CouchDb"

<pre>
ruby mongo2couch.rb 10000 biblioteka ksiazki 27017 5984
</pre>
