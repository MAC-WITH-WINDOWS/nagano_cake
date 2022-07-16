class Public::ShippingAddressesController < ApplicationController
  def index
    @address = ShippingAddress.new
  end
  
  def create
    @address = ShippingAddress.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to public_shipping_addresses_path
  end

  def edit
  end
  
  private
  
  def address_params
    params.require(:shipping_address).permit(:post_code, :address, :name)
  end
  
end
