require("minitest/autorun")
require("minitest/rg")
require_relative("../models/transaction.rb") 

class TransactionTest < MiniTest::Test

  def setup
    params = {
      "id" => 1,
      "description" => "i bought this thing",
      "amount" => 10.00,
      "merchant_id" => 1,
      "category_id" => 1,
    }
    @transaction = Transaction.new(params)
  end

  def test_transaction_can_read_id
    assert_equal(1, @transaction.id)
  end

  def test_transaction_can_read_description
    assert_equal("i bought this thing", @transaction.description)
  end

  def test_transaction_can_read_amount
    assert_equal(10.00, @transaction.amount)
  end

end