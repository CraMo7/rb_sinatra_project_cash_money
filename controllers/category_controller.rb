require_relative("../models/category.rb")
require_relative("../models/analysis.rb")

get("/categories/new/?") do
  # REST action "NEW"

  erb(:"category/new")
end

post("/categories") do
 # REST action "CREATE"
 @category = Category.create(params)
 redirect to("transactions/new")
end

# get("/categories") do
#   #REST action "INDEX"
# end

get("/categories/:id/?") do
  # REST action "SHOW"
  @category = Category.find(params["id"])
  erb(:"category/show")
end

# get("categories/:id/edit") do
#   # REST action "EDIT"
# end

# put("/categories/:id") do
#   # REST action "UPDATE"
# end

# delete("categories/:id") do
#   # REST action DESTROY
# end