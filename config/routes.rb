Rails.application.routes.draw do

  get 'customers/show'
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
  
 #root to:'homes#top'
  
  scope module: :public do
    root to:'homes#top'
    get '/about'=>"homes#about"
    resources:items,only:[:index,:show]
    #resources:customers,only:[:show,:edit,:update]
    get 'customers/my_page'=>"customers#show"
    get 'customers/infomation/edit'=>"customers#edit"
    patch 'customers/infomation'=>"customers#update"
    get 'customers/unsubscribe'=>"customers#unsubscribe"
    patch 'customers/withdraw'=>"customers#withdraw"
    # resources:cart_items,only:[:index,:update,:destroy,:create]
    resources :cart_items,only:[:index,:update,:destroy,:create] do
     collection do
      delete 'destroy_all'=>"cart_items#destroy_all"
     end
    end
    # delete 'cart_items/destory_all'=>"cart_items#destory_all"
    resources:orders,only:[:new,:create,:index,:show] do
    collection do
     post '/confirm'=>"orders#confirm"
     get '/complete'=>"orders#complete"
     get '/thanksletter'=>"orders#thanksletter"
    end
   end
    resources:adresses,only:[:index,:edit,:create,:update,:destroy]
  end
  
  namespace :admin do
    get '/'=>"homes#top"
    resources:items,only:[:index,:new,:create,:show,:edit,:update]
    resources:genres,only:[:index,:create,:edit,:update]
    resources:customers,only:[:index,:show,:edit,:update]
    resources:orders,only:[:show,:update]
    resources:order_details,only:[:update]   
  end
  
 get 'customers/show' => 'current#show'
 resources :customers, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
