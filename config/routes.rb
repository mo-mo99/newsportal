Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'profile', to: 'home#profile'
  get 'setting', to: 'home#setting'
  post 'fetchnews', to: 'home#fetch_news'
end
