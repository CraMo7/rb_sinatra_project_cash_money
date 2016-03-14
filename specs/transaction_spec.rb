require("minitest/autorun")
require("minitest/rg")
require_relative("../models/transaction.rb") 

class TransactionTest < MiniTest::Test

  def setup
    params = {
      "id" => 1,
      "description" => "i bought this food at tesco for a tenner, but that should be obvious",
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
    assert_equal("i bought this food at tesco for a tenner, but that should be obvious", @transaction.description)
  end

  def test_transaction_can_read_amount
    assert_equal(10.00, @transaction.amount)
  end

  def test_transaction_can_calc_total
    assert_equal(360.00, Transaction.total)
  end

  def test_transaction_can_calc_total_by_category
    assert_equal(100.00, Transaction.total_tagged(2))
  end


end