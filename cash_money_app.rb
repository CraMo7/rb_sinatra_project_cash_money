require("sinatra")
require("sinatra/contrib/all") if development?
require("./controllers/analysis_controller.rb")
require("./controllers/transaction_controller.rb")
require("./controllers/merchant_controller.rb")
require("./controllers/category_controller.rb")


get("/") {erb(:home)}