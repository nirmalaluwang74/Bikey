Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bikes, only: [ :index, :show, :new, :create, :destroy] do
    resources :bookings, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# routes from Trello
# Get / bikes to bikes#index
# get bike/:id bikes#show
# get bike/new to: bikes#new
# post bikes to: bikes#create
# get bikes/:id/booking/new to bookings#new
# post bikes/:id/bookings to bookings#create

