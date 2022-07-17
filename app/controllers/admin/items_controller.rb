class Admin::ItemsController < ApplicationController
    def index
      @items = Item.all
      @items = Item.page(params[:page])
    end
    
    def new
    end
    
    def show
    end
    
    def create

    end
    
    def edit
    end

end
