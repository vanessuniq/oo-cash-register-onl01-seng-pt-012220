require 'pry'
class CashRegister
  
  attr_accessor :discount, :items, :total, :total_price, 
  
  def initialize discount = nil
    @total = 0
    @discount = discount
  end
  
  
  def add_item (title, price, quantity = 1)
    @total_price = price * quantity 
    @total += @total_price
    
    quantity.times do
      @@items_on_cart << title
    end
  end

  def apply_discount
    if !discount or discount == 0
      "There is no discount to apply."
    else
       savings = total * discount/100
      @total -= savings
       "After the discount, the total comes to $#{total.to_i}."
    end 
  end
  
  def items
   @@items_on_cart
  end
  
  def void_last_transaction
    @total -= @total_price
  end
end