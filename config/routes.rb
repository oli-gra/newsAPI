Rails.application.routes.draw do
  get 'users/:id', to: 'users#show'
  post 'users', to: 'users#login'

  get 'news', to: 'news#index'
  get 'news/meta', to: 'news#meta'
  patch 'news/:id', to: 'news#update'
  post 'news/:id', to: 'comments#create'
  post 'news/create'

  get 'search/:search', to: 'news#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
