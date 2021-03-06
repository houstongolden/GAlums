Galums::Application.routes.draw do


  post 'profiles/:id/post' => 'profiles#post'
  get 'profiles/:id/posts' => 'profiles#show_micro'
  get 'projects/index.json' => 'projects#index'

  resources :profiles

  resources :projects

  resources :authentications
  devise_for :users
  root 'welcome#index'
  get '/auth/:provider/callback' => 'authentications#create'


  resources :users


  devise_scope :user do
  get "logout" => "devise/sessions#destroy", as: :logout
end

  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'pages/about' => 'pages#about'
  get 'pages/alums' => 'pages#alums'
  get 'pages/projects' => 'pages#projects'
  get 'pages/locations' => 'pages#locations'
end
