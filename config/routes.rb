Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }

  root "public/homes#top"

  namespace :admin do
    resources :orders,only:[:show, :update]
    resources :customers,only:[:show, :index, :edit, :update]
    resources :genres,only:[:index, :create, :edit, :update]
    resources :items,only:[:new, :index, :show, :create, :edit, :update]
    resources :order_items,only:[:update]
    root "homes#top"
  end

  namespace :public do
    resources :shipping_addresses,only:[:index, :create, :edit, :update,:destroy]
    resources :orders,only:[:new, :index, :create, :show]
    post 'orders/check'
    get 'orders/finish'
    delete 'cart_items/destroy_all'
    resources :cart_items,only:[:index, :create, :update, :destroy]
    resource :customers,only:[:show, :edit]
    patch "customers" => "customers#update", as: "customer"
    get 'customers/check'
    patch 'customers/out'
    get 'items/search'
    resources :items,only:[:show, :index]
    get 'homes/about'
  end

end
