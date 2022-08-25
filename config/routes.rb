Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords] ,controllers:{
    sessions:"admin/sessions"
  }
# 顧客用
# URL /customers/sign_in ...
 devise_for :customers,skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }
  
  namespace :public do
    get '/'=>"homes#top"
    get '/about'=>"homes#about"
    resources:items
    resources:customers
    resources:cart_items
    resources:orders
    resources:order_details
  end
  namespace :admin do
    root to: "homes#top"
    resources:items
    resources:genres
    resources:customers
    resources:cart_items
    resources:orders
    resources:order_details
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
