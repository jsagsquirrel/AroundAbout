Rails.application.routes.draw do
  put "post/:id/vote", to: "posts#vote", as: "vote"

  devise_for :users
  root to: "pages#home"

  get "posts/new", to: "posts#new"

  resources :posts, only: [:show] do
    # resources :votes
    patch :vote, on: :member
  end

  resources :posts, only: [:show] do
    patch :bookmark, on: :member
  end

  resources :bookmarks, only: [:index, :destroy]
  resources :users, only: [:show]
  resources :posts, only: [:index, :show, :new, :create, :destroy] do

    resources :comments, only: [:create]
    resources :comments, only: [:create]
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # root "articles#index"
  # post "posts", to: "devs#create"
