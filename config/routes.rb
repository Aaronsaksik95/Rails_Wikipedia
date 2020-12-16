Rails.application.routes.draw do
  resources :historicals
  resources :articles
  resources :users
  get    '/ranking',                 to: 'users#ranking', as: 'ranking'
  get    '/historicals/article/:id', to: 'historicals#index', as: 'historical_article'
  get    '/sign_in',                 to: 'sessions#sign_in_form'
  post   '/sign_in',                 to: 'sessions#sign_in'
  delete '/sign_out',                to: 'sessions#sign_out'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
