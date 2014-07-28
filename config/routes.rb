Rails.application.routes.draw do
  resources :herbs
  root to: 'herbs#index'
  get 'tags/:tag', to: 'herbs#index', as: :tag

  get '/ajirginthesky', to: 'herbs#new'
end
