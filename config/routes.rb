Rails.application.routes.draw do
  namespace :public do
    get 'reviews/index'
    get 'reviews/edit'
    get 'reviews/show'
  end
  namespace :public do
    get 'deliveries/index'
    get 'deliveries/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/done'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/check'
    get 'customers/follows'
    get 'customers/followers'
  end
  namespace :public do
    get 'menus/index'
    get 'menus/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'menus/new'
    get 'menus/index'
    get 'menus/show'
    get 'menus/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
