Rails.application.routes.draw do

  resources :libraries do
    resources :books, except: [:show, :index] do
      post '/request' => 'requests#make_request'
    end
  end

  root "libraries#index"

end
