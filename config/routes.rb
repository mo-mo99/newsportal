Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'profile', to: 'home#profile'
  get 'setting', to: 'setting#show'
  post 'fetchnews', to: 'home#fetch_news'
  post 'setting/update', to: 'setting#update'
end
