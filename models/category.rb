require_relative("../db/sql.rb")

class Category

  attr_reader(:id, :name)

  def initialize(params)
    @id = params["id"].to_i if params["id"]
    @name = params["name"].capitalize!
  end

  def self.find(id)
    query = "SELECT * FROM categories WHERE id=#{id};"
    sql_return = Sql.run(query)
    return Category.new(sql_return[0])
  end
  
  #adds object to db - adds db id to object
  #if category exists in db, simply sets @id to the id returned from db
  def self.create(params)
    query_check_exists = "SELECT * FROM categories WHERE 'name'='#{params["name"]}';"
    check_exists_sql_return = Sql.run(query_check_exists)
    # not_preexisting = check_exists_sql_return.ntuples.zero?
    # if not_preexisting
    exists = !check_exists_sql_return.ntuples.zero?
    unless exists
      query_add_category = "INSERT INTO categories (name) VALUES ('#{params["name"]}') RETURNING *;"
      sql_return = Sql.run(query_add_category)
      return Category.new(sql_return[0])
    else
      return Category.new(check_exists_sql_return[0])
    end
    
  end

  def self.all
    query = "SELECT * FROM categories;"
    sql_return = Sql.run(query)
    sql_return.map {|category_params| Category.new(category_params)}
  end


  
end