require("minitest/autorun")
require("minitest/rg")
require_relative("../models/transaction.rb")
require_relative("../models/merchant.rb")
require_relative("../models/category.rb")
require_relative("../models/detail.rb")

class TransactionTest < MiniTest::Test

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

    detail_params = {
      "id" => 1,
      "description" => "i bought this thing",
      "amount" => 10.00,
    }
    @detail = Detail.new(detail_params)

    params = {
      "merchant" => @merchant,
      "category" => @category,
      "detail" => @detail
    }
    @transaction = Transaction.new(params)
  end

  def test_transaction_contains_merchant_object
    assert_equal(Merchant, @merchant.class)
  end

  def test_transaction_contains_category_object
    assert_equal(Category, @category.class)
  end

  def test_transaction_contains_detail_object
    assert_equal(Detail, @detail.class)
  end

end