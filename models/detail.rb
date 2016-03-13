require("pg")

class Detail

  attr_reader(:id, :description, :amount)

  def initialize(params)
    @id = params["id"]
    @description = params["description"]
    @amount = params["amount"]
  end
  
  
end