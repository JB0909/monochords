Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  resources :users, only: [:show, :edit, :index, :update] do
  end

  resources :microposts,        only: [:index, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end
  
end
