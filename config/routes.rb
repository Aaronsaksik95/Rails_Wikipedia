Rails.application.routes.draw do
  resources :articles
  resources :users
  get    '/sign_in',    to: 'sessions#sign_in_form'
  post   '/sign_in',    to: 'sessions#sign_in'
  delete '/sign_out',   to: 'sessions#sign_out'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
