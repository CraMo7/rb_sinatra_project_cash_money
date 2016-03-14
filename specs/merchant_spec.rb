require("minitest/autorun")
require("minitest/rg")
require_relative("../models/merchant.rb") 
require("pry")

class MerchantTest < MiniTest::Test

  def setup
    params = {
      "id" => 1,
      "name" => "teSCO"
    }
    @merchant = Merchant.new(params)
  end

  def test_merchant_can_read_name
    assert_equal("Tesco", @merchant.name)
  end

  def test_merchant_can_read_id
    assert_equal(1, @merchant.id)
  end

end