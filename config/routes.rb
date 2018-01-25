Rails.application.routes.draw do
  get 'comments/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home' # root is equal to get '/' => controller#action
  get '/about', to: 'pages#about'
  get '/notifications', to: 'comments#notifications' # get all comments for all of the user's posts


  # crud for parks
  # get '/parks/:name', to: 'parks#show_by_name'
  resources :parks
  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:create]

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
