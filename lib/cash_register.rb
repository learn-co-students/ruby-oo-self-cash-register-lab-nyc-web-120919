require 'pry'
class CashRegister
    attr_reader :discount 
    attr_accessor :total, :all_items, :last_item_price
    
    def initialize(discount = 0) 
        @total = 0
        @discount = discount
        @all_items =[]
    end
    def add_item(title, price, quantity=1)
        self.total += price * quantity
        self.last_item_price = price * quantity
        while quantity != 0 do
          self.all_items << title 
          quantity -= 1
        end
    end
    def apply_discount
        #binding.pry       
        
        if discount == 0
            return "There is no discount to apply."
        else
            self.total -= @total * discount / 100.00
            return "After the discount, the total comes to $#{@total.to_i}."
        end
          #binding.pry  
    end

    def items       
        return @all_items
    end

    def void_last_transaction
        #binding.pry
        self.total -= @last_item_price
        #binding.pry
        return @total
    end

    #binding.pry
end

