Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show] do
    resources :subs, only: [:new, :create, :edit, :update]
    resources :posts, only: [:new, :create, :edit, :update] do
      resources :comments, only: :new
    end
  end
    
  resource :session, only:[:new, :create, :destroy]
  resources :subs, only: [:show, :index]
  resources :posts, only: [:show, :destroy]
  resources :comments, only: :create
end
