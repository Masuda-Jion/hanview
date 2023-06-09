Rails.application.routes.draw do

  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    #registrationsコントローラー
    registrations: "public/registrations",
    #sessionsコントローラー
    sessions: "public/sessions"
  }


  # 管理者用
  devise_for :admin, controllers: {
    #sessionsコントローラー
    sessions: "admin/sessions"
  }

  #searchコントローラー
  get "search" => "searches#search_result"

  # ゲストログインの記述
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    #homeコントローラー
    root to: 'homes#top'
    get 'homes/about'
    #menusコントローラー
    get "menus/genre_search" => "menus#genre_search", as: "genre_search"
    resources:menus, only: [:index, :show, :create]
    #customersコントローラー
    get 'customers/mypage' => 'customers#show'
    get 'customers/mypage/edit' => 'customers#edit'
    patch 'customers/mypage' => 'customers#update'
    get 'customers/check'
    patch 'customers/withdraw'
    get 'customers/follows'
    get 'customers/followers'
    resources :customers do
      member do
        get :follows, :followers
      end

      resource :relationships, only: [:create, :destroy]
    end
    #cart_itemsコントローラー
    delete 'cart_items/destroy_all'
    resources:cart_items, only: [:index, :update, :destroy, :create]
    #ordersコントローラー
    get 'orders/done'
    resources:orders, only: [:new, :create, :index, :show]
    post 'orders/check'
    #deliveriesコントローラー
    resources:deliveries, only: [:index, :edit, :create, :update, :destroy]
    #reviewsコントローラー
    resources:reviews, only: [:new, :index, :edit, :show, :create, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
    end
    post 'reviews/comment'
    #relationshipsコントローラー
    resources:relationships, only: [:create, :destroy]
  end

  namespace :admin do
    #homesコントローラー
    get '/' => 'homes#top'
    #menusコントローラー
    resources:menus, only:[:new, :index, :create, :show, :edit, :update]
    #genresコントローラー
    resources:genres, only: [:index, :create, :edit, :update]
    #customersコントローラー
    resources:customers, only:[:index, :show, :edit, :update]
    #ordersコントローラー
    resources:orders, only:[:show, :update]
    #order_detailsコントローラー
    resources:order_details, only:[:update]
    #reviewsコントローラー
    resources:reviews, only:[:index, :show, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
