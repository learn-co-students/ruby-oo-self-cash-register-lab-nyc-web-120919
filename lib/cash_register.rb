class CashRegister
  attr_accessor :total, :discount, :title, :price, :quantity
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @title = title 
    @price = price 
    @quantity = quantity
    @items = []
    @transactions = []
  end 
  
  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    i = quantity
    until i == 0 do 
    @items << title
    @transactions << price * quantity
    i -= 1 
  end 
  end 
  
  def apply_discount
    if discount > 0 
    self.total -= (total * discount / 100)
    return "After the discount, the total comes to $#{self.total}."
    end 
    if discount = 0 
      return "There is no discount to apply."
    end 
  end 
  
  def items 
   @items 
  end 
  
  def void_last_transaction
    if @transactions.length > 0
      self.total -= @transactions.pop 
    else
      self.total = 0.0 
    end 
end 
end 
