Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bikes do
    resources :bookmarks, only: %w[new create]
    resources :bookings, only: %w[new create]
  end

  resources :bookmars, only: %w[index destroy]

  resources :bookings, only: %w[show edit update] do
    resources :reviews, only: %w[new create]
  end

  resources :users, only: %w[show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
