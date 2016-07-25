Rails.application.routes.draw do

  resources :libraries do
    resources :books, except: [:show, :index] do
      post '/request' => 'requests#make_request'
    end
  end

  post '/admin' => 'application#admin_toggle'

  root "libraries#index"

end
