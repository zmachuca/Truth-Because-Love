Rails.application.routes.draw do
  root to: 'users#index', via: :get
  resources :users
  resources :charges

end
