Rails.application.routes.draw do
  get 'auth/:provider/callback/', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'password_resets/new'
  get 'password_resets/edit'
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
    get "generate_edit_form"
  end
  resources :users
  resources :account_activations, only: [:edit]
  resources :comments, only: [:create, :update, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
  post '/search', to: 'search#search'

  namespace :admin do
    resources :books, only: [:index, :destroy]
    resources :users, only: [:index, :destroy]
  end
end
