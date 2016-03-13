require("minitest/autorun")
require("minitest/rg")
require_relative("../models/details.rb") 

class DetailTest < MiniTest::Test

  def setup
    params = {
      "id" => 1,
      "description" => "i bought this thing",
      "amount" => 10.00,
    }
    @details = Detail.new(params)
  end

  def test_details_can_read_id
    assert_equal(1, @details.id)
  end

  def test_details_can_read_description
    assert_equal("i bought this thing", @details.description)
  end

  def test_details_can_read_amount
    assert_equal(10.00, @details.amount)
  end

end