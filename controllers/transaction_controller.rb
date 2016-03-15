require_relative("../models/transaction.rb")



# get("/transactions/new") do
#   # REST action "NEW"
# end

# post("/transactions") do
#  # REST action "CREATE"
# end

get("/transactions/?") do
  #REST action "INDEX"
  @transactions = Transaction.all
  erb(:"transaction/index")
end

get("/transactions/:id") do
  # REST action "SHOW"
end

# get("transactions/:id/edit") do
#   # REST action "EDIT"
# end

# put("/transactions/:id") do
#   # REST action "UPDATE"
# end

# delete("transactions/:id") do
#   # REST action DESTROY
# end