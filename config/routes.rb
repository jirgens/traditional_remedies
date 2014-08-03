Rails.application.routes.draw do
  get 'herbs/tags', to: 'herbs#tags'
  resources :herbs
  root to: 'herbs#index'
  get 'tags/:tag', to: 'herbs#index', as: :tag
  get '/about', to: 'herbs#about'

  get '/ajirginthesky', to: 'herbs#new'
end
