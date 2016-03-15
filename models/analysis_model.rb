require("pry")

class AnalysisModel

  attr_reader(:transactions)

  def initialize(array_of_transactions)
    @transactions = array_of_transactions
  end

  def total
    return @transactions.inject(0) { |sum, t| sum + t.amount()}
  end

  def total_tagged(category_id)
    return @transactions.inject(0) do |sum, t|
      t.category_id == category_id ? sum + t.amount() : sum
    end

  end



end