require("minitest/autorun")
require("minitest/rg")
require_relative("../models/transaction.rb") 

class TransactionTest < MiniTest::Test

  def setup
    @transaction = Transaction.all.first
  end

  def test_transaction_can_read_id
    assert_equal(1, @transaction.id)
  end

  def test_transaction_can_read_description
    assert_equal("i bought some food at tesco for a tenner, but that should be obvious", @transaction.description)
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

  def test_transaction_can_find_merchant
    assert_equal(1, @transaction.merchant.id)
  end

  def test_transaction_can_find_category
    assert_equal(1, @transaction.category.id)
    
  end


end