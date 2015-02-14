Rails.application.routes.draw do
  root to: 'pages#home', via: :get
  resources :users, :path => "pages#home"
  resources :charges

end
