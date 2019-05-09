Rails.application.routes.draw do
  get 'users/:id', to: 'users#show'
  post 'users/create'
  get 'news/index'
  patch 'news/:id', to: 'news#update'
  post 'news/create'
  get 'search/:search', to: 'news#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
