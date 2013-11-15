Galums::Application.routes.draw do


  devise_for :users
  root 'welcome#index'

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
