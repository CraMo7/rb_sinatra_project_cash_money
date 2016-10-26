require_relative("../models/merchant.rb")


get "/merchants/new/?" do
  # REST action "NEW"
  # needs analysis model for default category dropdown - default category for merchant feature not implemented yet
  #@analysis = Analysis.new(transactions_array: Transaction.all(), merchants_array: Merchant.all(), categories_array: Category.all())
  erb(:"merchant/new")
end

post("/merchants/?") do
 # REST action "CREATE"
 @merchant = Merchant.create(params)
 redirect to("/transactions/new")
end

# get("/merchants") do
#   #REST action "INDEX"
# end

get("/merchants/:id/?") do
  # REST action "SHOW"
  @merchant = Merchant.find(params["id"])
  erb(:"merchant/show")
end

# get("merchants/:id/edit") do
#   # REST action "EDIT"
# end

# put("/merchants/:id") do
#   # REST action "UPDATE"
# end

# delete("merchants/:id") do
#   # REST action DESTROY
# end