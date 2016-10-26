require("sinatra")
# require("sinatra/contrib/all") if development?
require("./controllers/analysis_controller.rb")
require("./controllers/transaction_controller.rb")
require("./controllers/merchant_controller.rb")
require("./controllers/category_controller.rb")

require("pry")


get("/") {erb(:home)}

# not_found do
#   erb(:notfound)
# end