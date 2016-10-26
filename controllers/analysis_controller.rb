require_relative("../models/analysis.rb")
require_relative("../models/transaction.rb")
require_relative("../models/merchant.rb")
require_relative("../models/category.rb")


require("json")
require("pry")

get("/analyses.json") do
  content_type(:json)
  @analysis = Analysis.new({transactions_array: Transaction.all(), merchants_array: Merchant.all(), categories_array: Category.all()})
  json_hash = @analysis.json_hash
  return json_hash.to_json
end

get("/analyses/?") do
  #REST action "INDEX"
  @analysis = Analysis.new({transactions_array: Transaction.all(), merchants_array: Merchant.all(), categories_array: Category.all()})

  @sort_order = "asc" #if params["order"] == nil || params["order"] == "desc"
  @sort_order = "desc" if params["order"] == "asc"

  @analysis.sort(params)
  # @analysis.sort_amount(@sort_order) if params["sort"] == "amount"
  # @analysis.sort_merchant(@sort_order) if params["sort"] == "merchant"
  # @analysis.sort_category(@sort_order) if params["sort"] == "category"

  erb(:"analysis/index")
end

# get("/analyses/:id/?") do
#   # REST action "SHOW"

# end

# get("analyses/:id/edit") do
#   # REST action "EDIT"
#   erb(:"analysis/edit")
# end

# put("/analyses/:id") do
#   # REST action "UPDATE"
# end

# delete("analyses/:id") do
#   # REST action DESTROY
# end