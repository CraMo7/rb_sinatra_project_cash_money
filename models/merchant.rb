require_relative("../db/sql.rb")
require("pry")

class Merchant

  attr_reader(:id, :name)

  def initialize(params)
    @id = nil || params["id"]
    @name = params["name"].capitalize!
  end

  #adds object to db - adds db id to object
  #if merchant exists in db, simply sets @id to the id returned from db
  def self.create(params)
    query_check_exists = "SELECT * FROM merchants WHERE 'name'='#{params["name"]}';"
    check_exists_sql_return = Sql.run(query_check_exists)
    # not_preexisting = check_exists_sql_return.ntuples.zero?
    # if not_preexisting
    exists = !check_exists_sql_return.ntuples.zero?
    unless exists
      query_add_merchant = "INSERT INTO merchants (name) VALUES ('#{params["name"]}') RETURNING *;"
      sql_return = Sql.run(query_add_merchant)
      return Merchant.new(sql_return[0])
    else
      return Merchant.new(check_exists_sql_return[0])
    end
  end

  def self.all
    query = "SELECT * FROM merchants;"
    sql_return = Sql.run(query)
    sql_return.map {|merchant_params| Merchant.new(merchant_params)}
  end
  


end