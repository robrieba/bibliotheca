Rails.application.routes.draw do

  resources :libraries do
    resources :books, except: [:show, :index]
  end

  root "libraries#index"

end
