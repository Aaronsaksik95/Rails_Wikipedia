Rails.application.routes.draw do
  resources :articles
  # resources :users


  # get    '/sign_in',    to: 'sessions#sign_in_form'
  # post   '/sign_in',    to: 'sessions#sign_in'
  # delete '/sign_out',   to: 'sessions#sign_out'

  get    '/articles',     to: 'articles#index'
  get    '/articles/new', to: 'articles#new', as: 'new_tweet'
  post   '/articles',     to: 'articles#create'
  get    '/articles/:id', to: 'articles#show', as: 'tweet'
  get    '/articles/:id/edit', to: 'articles#edit', as: 'edit_tweet'
  patch  '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#delete', as: 'delete_tweet'
end
