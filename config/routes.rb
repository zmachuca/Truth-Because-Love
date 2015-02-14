Rails.application.routes.draw do
  root to: 'pages#home', via: :get
  resources :users, :path => "charges#create"
  resources :charges

	match 'charges', to: 'charges#create', via: :all

end
