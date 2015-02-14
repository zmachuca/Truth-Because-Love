Rails.application.routes.draw do
  root to: 'pages#home', via: :get
  resources :users, :path => "charges#create"
  resources :charges, :path => "charges#create"

	match 'charges', to: 'charges#create', via: :all

end
