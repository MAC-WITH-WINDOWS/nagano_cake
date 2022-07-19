class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  enum maiking_status: {
     "着手不可":0, "製作待ち":1, "製作中":2, "製作完了":3
  }
  
  def self.subtotal
    array = []
    all.each do |order_item|
    array << order_item.purchace_price * order_item.amount
    end
    array.sum
  end
  
end
