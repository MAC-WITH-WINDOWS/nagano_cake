class CartItem < ApplicationRecord
  belongs_to :item








  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end