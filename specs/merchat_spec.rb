require("minitest/autorun")
require("minitest/rg")
require_relative("../models/merchant.rb") 
require("pry")

class MerchantTest < MiniTest::Test

  def setup
    params = {
      "id" => nil,
      "name" => "tesco"
    }
    @merchant = Merchant.new(params)
  end

  def test_merchant_can_read_name
    assert_equal("tesco", @merchant.name)
  binding.pry
  nil
  end


end