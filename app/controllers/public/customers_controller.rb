class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(configure_account_update_params)
    redirect_to public_customers_path
  end

  def check
  end
  
  
  private
  
    def configure_account_update_params
        params.require(:customer).permit(:attribute, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :is_deleted)
    end
end
