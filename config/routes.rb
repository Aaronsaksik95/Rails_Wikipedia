Rails.application.routes.draw do
  resources :articles
  get    '/my_article',              to: 'articles#my_article',           as: 'my_article'
  get    '/my_article_deleted',      to: 'articles#my_article_deleted',   as: 'my_article_deleted'
  get    '/recover_my_article/:id',  to: 'articles#recover_my_article'
  patch  '/recover_my_article/:id',  to: 'articles#recover_my_article',   as: 'recover_my_article'
  get    '/users',                   to: redirect("/")
  resources :users
  get    '/',                        to: 'articles#index'
  get    '/ranking',                 to: 'users#ranking',           as: 'ranking'
  get    '/historicals/article/:id', to: 'historicals#index',       as: 'historical_article'
  get    '/historicals/:id',         to: 'historicals#show',        as: 'historical'
  post   '/historicals/:id',         to: 'historicals#retrieve_history'
  get    '/sign_in',                 to: 'sessions#sign_in_form'
  post   '/sign_in',                 to: 'sessions#sign_in'
  delete '/sign_out',                to: 'sessions#sign_out'
  get    '*path',                    to: redirect("/")
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
