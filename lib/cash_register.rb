require 'pry'

class CashRegister

  attr_reader :discount
  attr_accessor :total, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times do
      @items << title
    end
    # while quantity > 0
    # @items << title
    # quantity -= 1
    # end
    @last_transaction = price * quantity
  end

  def apply_discount
    if @discount > 0
      @total -= (@total * (@discount/100.to_f))
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end