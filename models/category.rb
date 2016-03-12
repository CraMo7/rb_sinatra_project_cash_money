require("pg")

class Category

  attr_reader(:id, :name)

  def initialize(params)
    @id = params["id"]
    @name = params["name"]
  end
  
  def format()
    @name.capitalize!
  end


  
end