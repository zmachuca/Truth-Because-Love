Rails.application.routes.draw do
  root to: 'pages#home', via: :get
  resources :users
  resources :charges

end
