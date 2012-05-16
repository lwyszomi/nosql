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

Uruchomienie ruby import.rb "nazwapliku.csv" "bazadanych" "nazwa kolekcji" "port do MongoDb" "Wielkosc partow"

<pre>
ruby import.rb daneBiblioteczne.csv biblioteka ksiazki 5984 10000
</pre>

Export Danych
-------------

Uruchomienie mongo2couch.sh "Wielkosc pakietow" "bazadanych" "nazwa kolekcji" "nazwapliku.json" "port do mongoDb" "port do CouchDb"

<pre>
mongo2couch.sh 10000 biblioteka ksiazki biblioteczne.json 5984 27017
</pre>
