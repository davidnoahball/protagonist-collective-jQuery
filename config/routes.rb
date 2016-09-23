Rails.application.routes.draw do
  resources :adventures, only: [:show, :index] do
    resources :pages, only: [:show, :edit, :new, :create]
  end
  resources :users
  #resources :pages
  root 'site#index'
  get '/howitworks', to: 'site#howitworks'
  get '/signup', to: 'users#new'
  get '/login', to: 'users#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'signout'
  post '/adventures/:adventure_id/pages/new', to: 'pages#create'

  resources :sessions, only: [:create, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
