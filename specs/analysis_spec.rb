require("minitest/autorun")
require("minitest/rg")
require_relative("../models/merchant.rb")
require_relative("../models/category.rb")
require_relative("../models/transaction.rb")
require_relative("../models/analysis_model.rb")



class AnalysisModelTest < MiniTest::Test

  def setup
    category1 = Category.new({"name" => "food"})
    category2 = Category.new({"name" => "drink"})
    category3 = Category.new({"name" => "entertainment"})

    merchant1 = Merchant.new({"name" => "tesco"})
    merchant5 = Merchant.new({"name" => "cineworld"})
    merchant6 = Merchant.new({"name" => "apple inc"})

    transaction1 = Transaction.new({"description" => "i bought some food at tesco for a tenner, but that should be obvious", "amount" => 10.00, "merchant_id" => 1, "category_id" => 1})
    transaction2 = Transaction.new({"description" => "i bought a round at wetherspoons, it cost twenty quid, but that should be obvious", "amount" => 20.00, "merchant_id" => 1, "category_id" => 2})
    transaction3 = Transaction.new({"description" => "i bought two tickets to a 3D movie, popcorn and drinks. 30 quid? I bet that shit costs them 30p! But that should be obvious", "amount" => 30.00, "merchant_id" => 5, "category_id" => 3})
    transaction4 = Transaction.new({"description" => "i bought an ipod charger at an apple store, 40 fuckin quid!? Bloody chancers. But that should be obvious", "amount" => 40.00, "merchant_id" => 6, "category_id" => 3})

    array = [transaction1, transaction2, transaction3, transaction4]
    @analysis_model = AnalysisModel.new(array)
  end

  def test_transaction_count
    assert_equal(4, @analysis_model.transactions.count)
  end

  def test_transaction_total
    assert_equal(100.00, @analysis_model.total)
  end

  def test_transaction_total_by_tag
    assert_equal(70.00, @analysis_model.total_tagged(3))
  end

end