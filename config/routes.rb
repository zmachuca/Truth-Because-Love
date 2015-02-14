Rails.application.routes.draw do
  root to: 'pages#home', via: :get
  resources :users, :path => "charges#new"
  resources :charges

end
