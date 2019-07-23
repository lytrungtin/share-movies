Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/share',    to: 'static_pages#share'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :shares,          only: [:create]
end
