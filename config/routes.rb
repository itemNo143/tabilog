Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show update]
  # TODO ネスト
  resources :travels do
    resources :scrap_folders
  end
  resources :scraps
  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
