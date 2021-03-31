Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get  "/search", to:"searchs#search"

  resources :musics, as: :music, only: [:show, :create] do
    resources :reviews, only: [:show, :create] do
      resource :review_likes, only: [:create, :destroy]
    end
    resources :wishes, only: [:create, :destroy]
    resources :practicings, only: [:create, :destroy]
    resources :practiceds, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
      get :wish, to:"wishes#index"
      get :practicing, to:"practicings#index"
      get :practiced, to:"practiceds#index"
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :records, only: [:show, :create, :destroy] do
    resource :record_likes, only: [:create, :destroy]
  end
  resources :comments, only: [:create]

  resources :microposts,        only: [:index, :show, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end
  
end
