Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'sessions/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :books do
    get "change_form"
    get "show_by_category"
    resources :likes, only: [:create, :destroy]
    get "generate_comment_form"
  end
  resources :users
  resources :account_activations, only: [:edit]
  resources :comments, only: [:create]
end
