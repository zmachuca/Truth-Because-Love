Rails.application.routes.draw do
  resources :users
  resources :charges

  root "pages#home"

end
