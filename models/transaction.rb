require("pry")

class Transaction

  attr_reader(:id, :merchant, :category, :details)

  def initialize(params)
    @id = params["id"]
    @merchant = params["merchant_object"]
    @category = params["category_object"]
    @detail = params["detail_object"]
  end

  
  
end