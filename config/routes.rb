Rails.application.routes.draw do
  get 'users/:id', to: 'users#show'
  get 'users/new'
  get 'users/create'
  get 'news/index'
  get 'news/:id', to: 'news#show'
  get 'news/new'
  get 'news/create'
  get 'search/:search', to: 'news#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
