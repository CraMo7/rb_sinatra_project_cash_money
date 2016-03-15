require("minitest/autorun")
require("minitest/rg")
require_relative("../models/merchant.rb")
require_relative("../models/category.rb")
require_relative("../models/transaction.rb")
require_relative("../models/cash_money_entry.rb")

class CashMoneyEntryTest < MiniTest::Test

  def setup
    merchant_params = {
      "id" => 1,
      "name" => "teSCO"
    }
    @merchant = Merchant.new(merchant_params)

    category_params = {
      "id" => 1,
      "name" => "foOD",
    }
    @category = Category.new(category_params)

    transaction_params = {
      "id" => 1,
      "description" => "i bought this thing",
      "amount" => 10.00,
    }
    @transaction = Transaction.new(transaction_params)

    params = {
      "merchant" => @merchant,
      "category" => @category,
      "transaction" => @transaction
    }
    @cash_money_entry = CashMoneyEntry.new(params)
  end

end