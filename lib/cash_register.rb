require 'pry'
class CashRegister
  def initialize(discount=nil)
    @total = 0.0
    if discount
      @discount = discount
    end
    @prev_total = nil
    @items = []
  end

  attr_accessor :total, :discount

#   def add_item(title, price, quantity=nil)
#     @prev_total = @total
#     if quantity
#         price *= quantity
#     end
#     @total += price
#     if quantity
#         quantity.times do |i|
#             @items << title
#         end
#     end
#     @items << title
#   end
  def add_item(title, price, quantity=nil)
    @prev_total = @total
    if quantity
        price *= quantity
    end
    @total += price
    if quantity
        quantity.times do |i|
            @items << title
        end
    else
        @items << title
    end
  end

  def apply_discount
    if !@discount
        return "There is no discount to apply."
    else
        @total *= (( 100.0 - @discount ) / 100.0)
        return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total = @prev_total
  end

  def items
    return @items
  end

end
