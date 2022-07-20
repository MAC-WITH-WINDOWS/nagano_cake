class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: {
     not_startable: 0, wait_product: 1, in_product: 2, finish_product: 3
  }
  
  def tax_included_price
    (purchace_price*1.1).round(0)
  end
  
  def subtotal
    tax_included_price*amount
  end

  def tax_include_price
    (purchace_price*1.1).round(0)
  end

  def s_total
    tax_include_price*amount
  end

end
