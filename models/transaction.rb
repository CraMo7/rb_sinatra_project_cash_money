require("pry")

class Transaction

  attr_reader(:id, :merchant, :category, :details)

  def initialize(params)
    @id = params["id"]
    @merchant = params["merchant"]
    @category = params["category"]
    @detail = params["detail"]
  end

  def self.all_tagged(category)
    
    
  end

  def self.all

    
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