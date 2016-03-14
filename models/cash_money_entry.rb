require("pry")

class CashMoneyEntry

  attr_reader(:id, :merchant, :category, :details)

  def initialize(params)
    @id = params["id"]
    @merchant = params["merchant"]
    @category = params["category"]
    @detail = params["detail"]
  end



  
  
end