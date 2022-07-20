class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items,dependent: :destroy

  def sum_of_price
    order_item.purchace_price * order_item.amount
  end

  def total_price
    total_payment + 800
  end

  def ship_address
    "〒 #{post_code} #{address} #{to_name}"
  end

  enum order_status: {
    wait_deposit: 0, payment_confirm: 1, production: 2, ship_preparation: 3, ship_completion: 4
  }

  enum payment_method: {
    credit_card: 0, transfer: 1
  }


end
