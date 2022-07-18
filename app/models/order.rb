class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items,dependent: :destroy
  
  def sum_of_price
    order_item.purchace_price * order_item.amount
  end
  
  # 配送先セレクトに合わせてorderテーブルに格納する配送先情報を更新
  def self.address_update(select_address)
    # 自分の住所の場合、自分の住所を格納する
    if select_address == 0
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.to_name = current_customer.first_name + current_customer.last_name
    # 登録済みの住所の場合、配送先を呼び出してその情報を格納する
    elsif select_address == 1
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.to_name = @address.to_name
    end
    # 新しい住所は入力した値がそのまま格納される
  end
  
  
  enum order_status: {
     "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済":4
  }
  
end
