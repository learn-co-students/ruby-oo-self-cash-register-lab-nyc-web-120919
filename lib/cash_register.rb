class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = {}
  end
  
  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    @last_transaction["price"] = price
    @last_transaction["quantity"] = quantity
    while quantity > 0
      @items.push(title)
      quantity -=1
    end
  end
  
  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total *= (1 - @discount * 0.01)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  
  def void_last_transaction
    if @last_transaction["price"]
      @total -= @last_transaction["price"] * @last_transaction["quantity"]
    end
  end
end