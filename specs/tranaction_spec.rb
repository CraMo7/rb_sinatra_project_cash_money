require("minitest/autorun")
require("minitest/rg")
require_relative("../models/transaction.rb")
require_relative("../models/merchant.rb")
require_relative("../models/category.rb")
require_relative("../models/detail.rb")

class TransactionTest < MiniTest::Test

  def setup
    category_params = {
      "id" => nil,
      "name" => "foOD",
    }
    @category = Category.new(category_params)

    merchant_params = {
      "id" => 1,
      "name" => "teSCO"
    }
    @merchant = Merchant.new(merchant_params)

    detail_params = {
      "id" => 1,
      "description" => "i bought this thing",
      "amount" => 10.00,
    }
    @detail = Detail.new(detail_params)

    params = {
      "merchant_object" => @merchant,
      "category_object" => @category,
      "detail_object" => @detail
    }
    @transaction = Transaction.new(params)
  end




  def test_transaction


    binding.pry
    nil
  end

end