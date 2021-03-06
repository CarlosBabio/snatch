Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bikes do
    resources :bookmarks, only: %w[new create]
    resources :bookings, only: %w[new create]
  end

  resources :bookmarks, only: %w[index destroy]

  resources :bookings, only: %w[show edit update] do
    resources :reviews, only: %w[new create]
  end

  resources :users, only: %w[index show]

  patch "/bookings/:id/accept", to: "bookings#accept", as: "accept_booking"
  patch "/bookings/:id/reject", to: "bookings#reject", as: "reject_booking"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
