Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get  "/search", to:"searchs#search"
  get  "/search/:id", to:"searchs#show", as: :song
  post  "/search", to:"searchs#create", as: :create

  resources :users, only: [:show, :edit, :index, :update] do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :microposts,        only: [:index, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end
  
end
