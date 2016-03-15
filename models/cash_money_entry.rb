require("pry")

class CashMoneyEntry

  attr_reader(:transactions)

  def initialize(params)
    @transactions = params["transactions"]
  end

  def total
    @total = 0
    @transactions.each {|transaction| @total += transaction.amount}
    return @total
  end


  
  
end