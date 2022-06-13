class CashRegister
    attr_accessor :total, :discount, :items, :last_item_price, :last_item
    
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_item = ""
      @last_item_price = 0
    end
  
    def add_item(title, price, quantity = 1)
      quantity.times { self.items.push(title) }
      self.last_item = title
      self.last_item_price = price * quantity
      self.total += price * quantity
    end
  
    def apply_discount
      floated_discount = self.discount.to_f
      floated_total = self.total.to_f
  
      self.total = (floated_total * ((100 - floated_discount) / 100)).to_i
  
      self.discount > 0 ? "After the discount, the total comes to $#{self.total}." : "There is no discount to apply."
  
    end 
  
    def void_last_transaction
      self.total = self.total - self.last_item_price
    end 
  
  end
