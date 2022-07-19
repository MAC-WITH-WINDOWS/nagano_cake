class ShippingAddress < ApplicationRecord

  belongs_to :customer

  def ship_address
  '〒' + post_code + ' ' + address + ' ' + name
  end

end
