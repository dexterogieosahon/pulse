Rails.application.routes.draw do
  match '/signup', to: 'users#new', via: :get  
  match '/signin', to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :users
  resources :messages,    only: [:show, :create, :destroy] do
    resources :comments, only: [:show, :create]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :friends, only: [:create]
  match '/unfriend/:friend_id', to: "friends#breakup", as: :breakup, via: :delete
  match '/block/:id', to: "users#block", as: :block, via: :post
  match '/unblock', to: "users#unblock", as: :unblock, via: :post
  match '/release_all', to: "users#unblock_all_users", as: :release_all, via: :post

  root 'home#index'
end
