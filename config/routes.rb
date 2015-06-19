Rails.application.routes.draw do
  devise_for :users

  resources :topics

  resources :bookmarks
  
  get 'welcome/index'
  get 'welcome/about'

root to: 'welcome#index'
end
