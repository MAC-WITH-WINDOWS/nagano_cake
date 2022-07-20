class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items,dependent: :destroy

  def sum_of_price
    order_item.purchace_price * order_item.amount
  end

  def ship_address
    "〒 #{post_code} #{address} #{to_name}"
  end

  enum order_status: {
    wait_deposit: 0, payment_confirm: 1, production: 2, ship_preparation: 3, ship_completion: 4
  }

  enum payment_method: {
    "クレジットカード":"0", "銀行振込":"1"
  }


end
