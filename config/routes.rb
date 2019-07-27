Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/share',    to: 'static_pages#share'
  get  '/histories',    to: 'static_pages#histories'
  get  '/favorites',    to: 'static_pages#favorites'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :shares, param: :share_id
  post   '/add_histories',   to: 'static_pages#create_histories'
  post   '/add_favorites',   to: 'static_pages#create_favorites'
  post   '/add_comments',   to: 'static_pages#create_comments'
end
