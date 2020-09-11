Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users
  resources :users, only: %i[show update]
  resources :travels, only: %i[index edit create update destroy], shallow: true do
    resources :scrap_folders do
      resources :scraps
    end
  end
end
