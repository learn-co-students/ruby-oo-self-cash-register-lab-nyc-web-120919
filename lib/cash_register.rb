class CashRegister
    attr_accessor :total, :discount, :title, :price, :quantity

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @item_arr = []
    end

    def add_item(title, price, quantity = 1)
        @title = title
        @price = price
        @quantity = quantity
        quantity.times  {|num| @item_arr << title}
        @total += price * quantity
    end

    def apply_discount
        if !@discount
            "There is no discount to apply."
        else
            @total = @total * ((100 - @discount)*0.01)
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items 
        @item_arr
    end

    def void_last_transaction
        if !@quantity
            @total -= @price 
        else 
            @total -= @price * @quantity
        end
    end
end
