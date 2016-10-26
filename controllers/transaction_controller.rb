require_relative("../models/transaction.rb")
require_relative("../models/analysis.rb")
require_relative("../models/merchant.rb")
require_relative("../models/category.rb")


# why does this work without requiring the analysis model?


get("/transactions/new/?") do
  # REST action "NEW"
  @analysis = Analysis.new(transactions_array: Transaction.all(), merchants_array: Merchant.all(), categories_array: Category.all())
  erb(:"transaction/new")
end

post("/transactions") do
 # REST action "CREATE"
 Transaction.create(params)
 @analysis = Analysis.new(transactions_array: Transaction.all(), merchants_array: Merchant.all(), categories_array: Category.all())
 erb(:"analysis/index")
end

get("/transactions/?") do
  #REST action "INDEX"
  @transactions = Transaction.all
  erb(:"transaction/index")
end

get("/transactions/:id/?") do
  # REST action "SHOW"
  @transaction = Transaction.find(params["id"])
  erb(:"transaction/show")
end

get("/transactions/:id/edit/?") do
  # REST action "EDIT"
  @analysis = Analysis.new(transactions_array: Transaction.all(), merchants_array: Merchant.all(), categories_array: Category.all())
  @transaction = Transaction.find(params["id"])
  erb(:"transaction/edit")
end

put("/transactions/:id") do
  # REST action "UPDATE"
end

delete("transactions/:id") do
  # REST action DESTROY
end