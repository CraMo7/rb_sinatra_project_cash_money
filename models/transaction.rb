require_relative("../db/sql.rb")
require("pry")

class Transaction

  attr_reader(:id, :description, :amount, :merchant_id, :category_id)

  def initialize(params)
    @id = nil || params["id"]
    @description = params["description"]
    @amount = params["amount"].to_f
    @merchant_id = params["merchant_id"]
    @category_id =  params["category_id"]
  end

  #adds object to db - adds db id to object
  #if transaction exists in db, simply sets @id to the id returned from db
  def self.create(params)
    # query_check_exists = "SELECT * FROM transactions WHERE 'id'=#{@id};"
    # check_exists_sql_return = Sql.run(query_check_exists)
    # # not_preexisting = check_exists_sql_return.ntuples.zero?
    # # if not_preexisting
    # exists = !check_exists_sql_return.ntuples.zero?
    # unless exists
      query_add_transaction = "INSERT INTO transactions (description, amount, merchant_id, category_id) VALUES ('#{params["description"]}', #{params["amount"]}, '#{params["merchant_id"]}', '#{params["category_id"]}') RETURNING *;"
      sql_return = Sql.run(query_add_transaction)
      return Transaction.new(sql_return[0])
    # else
    #   return Merchant.new(check_exists_sql_return[0])
    #end
  end

  def self.total
    #will this work as is? add @total = 0 before and return @total after?
    @total = 0
    Transaction.all().each {|transaction| @total += transaction.amount}
    return @total
  end

  def self.total_tagged(category_id)
    @total_tagged = 0
    Transaction.all_tagged(category_id).each {|transaction| @total_tagged += transaction.amount}
    return @total_tagged
  end


  def self.all
    query = "SELECT * FROM transactions;"
    sql_return = Sql.run(query)
    return sql_return.map {|transaction_params| Transaction.new(transaction_params)}
  end

  def self.all_tagged(category_id)
    query = "SELECT * FROM transactions WHERE category_id=#{category_id};"
    sql_return = Sql.run(query)
    return sql_return.map {|transaction_params| Transaction.new(transaction_params)}    
  end


  def create_json
    @tranaction_full_hash = {
      "merchant_id" => @merchant.id.to_s,
      "merchant_name" => @merchant.name.to_s,
      "category_id" => @category.id.to_s,
      "category_name" => @category.name.to_s,
      "detail_id" => @detail.id.to_s,
      "detail_description" => @detail.description.to_s,
      "detail_amount" => @detail.amount.to_s
    }
    
  end

  def save
    
  end
  
end