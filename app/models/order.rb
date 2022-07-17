class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items,dependent: :destroy
  
  def sum_of_price
    order_item.purchace_price * order_item.amount
  end 
  
end
