class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items,dependent: :destroy

  # 配送先セレクトに合わせてorderテーブルに格納する配送先情報を更新
  def address_update(select_address)
    # 自分の住所の場合、自分の住所を格納する
    if select_address == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.to_name = current_customer.first_name + current_customer.last_name
    # 登録済みの住所の場合、配送先を呼び出してその情報を格納する
    elsif select_address == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.to_name = @address.to_name
    end
    # 新しい住所は入力した値がそのまま格納される
  end


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
    "クレジットカード":0, "銀行振込":1
  }


end
