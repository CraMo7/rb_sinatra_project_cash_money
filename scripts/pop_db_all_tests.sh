# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# dirname $(readlink -f $0)
# don't know how to make either of the above work to allow me to run scripts from anywhere and have them find the right folders.

dropdb cash_money;
createdb cash_money;
psql -d cash_money -f ./db/cash_money_db_setup.sql;
ruby ./db/seeds.rb
for file in ./specs/*.rb; do echo "#########################"; echo $file; ruby $file; echo $file; echo "#########################"; done