require 'pry'

class CashRegister 
    
    attr_accessor :discount, :total, :title_list, :last_transaction

    def initialize(discount = nil)
    @total = 0
    if discount
    @discount = discount
    end 
    @title_list = []
    end 

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        #create a title list for the following items method
         quantity.times do 
            title_list << title 
         end 
         self.last_transaction = price * quantity 

    end 

    def apply_discount
        if discount
            discounted_total = (@total -= @total * @discount/100).round(2)
            return "After the discount, the total comes to $#{discounted_total}."
        else 
            return "There is no discount to apply."
        end
    end 

    def items
        #return the title list from the items method
        title_list 
    end 

    def void_last_transaction
        self.total -= self.last_transaction
    end 

end 

