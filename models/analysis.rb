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

  def json_hash
    json_hash = { transactions: {}, merchants: {}, categories: {} }
    count = 1
    @transactions.each do |t|
      json_hash[:transactions]["#{count}"] = {merchant: t.merchant.name, category: t.category.name, description: t.description, amount: t.amount}
      count += 1
    end
    return json_hash
  end



  def filter_tagged(category_id)
    # @transactions_tagged = @transactions.select {|t| t.}   
  end

  def sort(params) # => needs refactoring even more
    case params["sort_by"]
    when "amount"
      @transactions.sort! { |t1, t2| t1.amount <=> t2.amount} if params["order"] == "asc"
      @transactions.sort! { |t1, t2| t2.amount <=> t1.amount} if params["order"] == "desc"
    when "merchant"
      @transactions.sort! { |t1, t2| t1.merchant.name <=> t2.merchant.name} if params["order"] == "asc"
      @transactions.sort! { |t1, t2| t2.merchant.name <=> t1.merchant.name} if params["order"] == "desc"
    when "category"
      @transactions.sort! { |t1, t2| t1.category.name <=> t2.category.name} if params["order"] == "asc"
      @transactions.sort! { |t1, t2| t2.category.name <=> t1.category.name} if params["order"] == "desc"
    end

    # @transactions.sort! { |t1, t2| t1.sort_by <=> t2.sort_by} if order == "asc"
    # @transactions.sort! { |t1, t2| t2.sort_by <=> t1.sort_by} if order == "desc"
    
  end

  # => old sorting with 3 methods

  # def sort_amount(order)
  #   @transactions.sort! { |t1, t2| t1.amount <=> t2.amount} if order == "asc"
  #   @transactions.sort! { |t1, t2| t2.amount <=> t1.amount} if order == "desc"
  # end

  # def sort_merchant(order)
  #   @transactions.sort! { |t1, t2| t1.merchant.name <=> t2.merchant.name} if order == "asc"
  #   @transactions.sort! { |t1, t2| t2.merchant.name <=> t1.merchant.name} if order == "desc"
  # end

  # def sort_category(order)
  #   @transactions.sort! { |t1, t2| t1.category.name <=> t2.category.name} if order == "asc"
  #   @transactions.sort! { |t1, t2| t2.category.name <=> t1.category.name} if order == "desc"
  # end

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