Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users
  resources :users, only: %i[show update]
  resources :travels, only: %i[index show create update destroy], shallow: true do
    resources :scrap_folders, only: %i[index create update destroy] do
      resources :scraps, only: %i[index create destroy]
    end
  end
end
