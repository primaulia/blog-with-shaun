Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home' # root is equal to get '/' => controller#action
  get '/about', to: 'pages#about'

  # crud for parks
  # get '/parks/:name', to: 'parks#show_by_name'
  resources :parks
  resources :posts, only: [:new, :create]

  # devise routes
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      registration: 'register',
      sign_up: ''
    }
end
