require("minitest/autorun")
require("minitest/rg")
require_relative("../models/category.rb") 

class CategoryTest < MiniTest::Test

  def setup
    params = {
      "id" => 1,
      "name" => "foOD",
    }
    @category = Category.new(params)
  end

  def test_category_can_read_name
    assert_equal("Food", @category.name)
  end

  def test_category_can_read_id
    assert_equal(1, @category.id)
  end

end