require("pry")

class Analysis

  attr_reader(:transactions, :merchants, :categories)

  def initialize(params)
    @transactions = params[:transactions_array]
    @merchants = params[:merchants_array]
    @categories = params[:categories_array]
  end

  def total
    return @transactions.inject(0) { |sum, t| sum + t.amount()}
  end

  def total_tagged(category_id)
    return @transactions.inject(0) do |sum, t|
      t.category_id == category_id ? sum + t.amount() : sum
    end
  end



  private# => # => # => # => # => # => # => # => # => # => # =>

  # def 
    
  # end



end