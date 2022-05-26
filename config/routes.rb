Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "profile", to: "pages#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :grannies, only: %i[index show new create] do
    resources :bookings, only: [:create]
  end
end
