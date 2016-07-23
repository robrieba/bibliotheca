Rails.application.routes.draw do
  resources :libraries

  root "libraries#index"

end
