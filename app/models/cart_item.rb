class CartItem < ApplicationRecord
  has_one_attached :image
  belongs_to :item

def tax_include_price
  (item.tax_free_price*1.1).round(0)
end

def subtotal
  tax_include_price*amount
end

def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end