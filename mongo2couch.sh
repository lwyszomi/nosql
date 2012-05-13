#! /bin/bash
clear

mongoexport -d $1 -c $2 -o $3 --host localhost:$4
echo 'dane wyeksportowane przez monogoexport'
ruby export.rb $3 $1 $5
exit 0
