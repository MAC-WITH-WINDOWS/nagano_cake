class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items,dependent: :destroy
  
  def sum_of_price
    order_item.purchace_price * order_item.amount
  end
  
  def ship_address
  '〒' + post_code + ' ' + address + ' ' + to_name
  end
  
  def ordered_day
    created_at.strftime("%Y-%m-%d")
  end
  
  enum order_status: {
     "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済":4
  }
  
end
