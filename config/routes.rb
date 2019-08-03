Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/share',    to: 'static_pages#share'
  get  '/histories',    to: 'static_pages#histories'
  get  '/favorites',    to: 'static_pages#favorites'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :shares, param: :share_id do
    member do
      patch :add_favorite
    end
  end
  post   '/add_comments',   to: 'static_pages#create_comments'
end
