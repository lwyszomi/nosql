nosql
=====

Repozytorium na potrzeby przedmiotu nosql

Plik import.rb importuje dane do bazy mongoDb

uruchomienie ruby import.rb "nazwapliku.csv" "bazadanych" "nazwa kolekcji" "port do MongoDb"

<pre>
ruby import.rb daneBiblioteczne.csv biblioteka ksiazki 5984
</pre>

plik mongo2couch.sh wykorzystuje mongoexport do wygenerowania pliku .json, korzysta z pliku export.rb exportuje dane z mongoDb do couchDb

uruchomienie mongo2couch.sh "bazadanych" "nazwa kolekcji" "nazwapliku.json" "port do mongoDb" "port do CouchDb"

<pre>
mongo2couch.sh biblioteka ksiazki biblioteczne.json 5984 27017
</pre>
