require_relative("../models/analysis.rb")



# get("/analyses/new") do
#   # REST action "NEW"
# end

# post("/analyses") do
#  # REST action "CREATE"
# end

get("/analyses/?") do
  #REST action "INDEX"
  @analysis = Analysis.new(transactions_array: Transaction.all(), merchants_array: Merchant.all(), categories: Category.all())
  erb(:"analysis/index")
end

# get("/analyses/:id") do
#   # REST action "SHOW"
# end

# get("analyses/:id/edit") do
#   # REST action "EDIT"
# end

# put("/analyses/:id") do
#   # REST action "UPDATE"
# end

# delete("analyses/:id") do
#   # REST action DESTROY
# end