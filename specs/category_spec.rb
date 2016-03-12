require("minitest/autorun")
require("minitest/rg")
require_relative("../models/category.rb") 

class CategoryTest < MiniTest::Test

  def setup
    params = {
      "id" => nil,
      "name" => "foOD",
    }
    @category = Category.new(params)
  end

  def test_category_can_read_name
    assert_equal("foOD", @category.name)
  end

  def test_category_can_read_id
    assert_equal(nil, @category.id)
  end

  def test_category_can_format_name
    @category.format()
    assert_equal("Food", @category.name)
  end

end