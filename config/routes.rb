Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#index'

  # get '/', to: 'main#index'
  scope '/' do
    resources :main
  end

  scope '/api' do
    post '/users/signup', to: 'users#signup'
    post '/users/login', to: 'users#login'
    get '/users', to: 'users#index'
    get '/users/:id', to: 'users#show'
    put '/users/change-password/:id', to: 'users#change_password'

    # post '/shops', to: 'shops#create'
    # get '/shops', to: 'shops#index'
    # get '/shops/:id', to: 'shops#show'
    # put '/shops/:id', to: 'shops#update'
    # delete '/shops/:id', to: 'shops#destroy'

    # post '/books', to: 'books#create'
    # get '/books', to: 'books#index'
    # get '/books/:id', to: 'books#show'
    # put '/books/:id', to: 'books#update'
    # delete '/books/:id', to: 'books#destroy'

    # post '/orders', to: 'orders#create'
    # get '/orders', to: 'orders#index'
    # get '/usordersers/:id', to: 'orders#show'

    resources :shops, :books, :orders
  end
end
