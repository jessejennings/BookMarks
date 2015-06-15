Rails.application.routes.draw do
  devise_for :users

  resources :topics, only: [:index, :show, :create, :update]

  resources :bookmarks, only: [:index, :show, :create, :update]
  get 'welcome/index'

  get 'welcome/about'

root to: 'welcome#index'
end
