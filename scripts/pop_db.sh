dropdb cash_money;
createdb cash_money;
psql -d cash_money -f ./db/cash_money_db_setup.sql;
ruby ./db/seeds.rb