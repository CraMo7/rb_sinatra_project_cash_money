require("pry")

class Analysis

  attr_reader(:transactions, :merchants, :categories)

  def initialize(params)
    @transactions = params[:transactions_array]
    @merchants = params[:merchants_array]
    @categories = params[:categories_array]
  end

  # def sort(column_to_sort_by)
  #   if column_to_sort_by == amount
  #     @transactions.sort! { |t1, t2| t1.amount <=> t2.amount}
  #   elsif column_to_sort_by == merchant
  #     @transactions.sort! { |t1, t2| t1.merchant.name <=> t2.merchant.name}

  # end

  def sort_amount(order)
    @transactions.sort! { |t1, t2| t1.amount <=> t2.amount} if order == "asc"
    @transactions.sort! { |t1, t2| t2.amount <=> t1.amount} if order == "desc"
  end

  def sort_merchant(order)
    @transactions.sort! { |t1, t2| t1.merchant.name <=> t2.merchant.name} if order == "asc"
    @transactions.sort! { |t1, t2| t2.merchant.name <=> t1.merchant.name} if order == "desc"
  end

  def sort_category(order)
    @transactions.sort! { |t1, t2| t1.category.name <=> t2.category.name} if order == "asc"
    @transactions.sort! { |t1, t2| t2.category.name <=> t1.category.name} if order == "desc"
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