class ShippingAddress < ApplicationRecord

  belongs_to :customer
  
  validates :post_code,presence:true,length:{minimum: 7, maximum: 7}
  validates :address ,presence:true
  validates :name,presence:true

  def ship_address
  '〒' + post_code + ' ' + address + ' ' + name
  end

end
