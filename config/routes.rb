Rails.application.routes.draw do

  root to: 'home#top'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :users, only: %i[show update]

  resources :maps, only: [:index]
  get '/map_request', to: 'maps#map', as: 'map_request'

  resources :travels, only: %i[index show create update destroy], shallow: true do
    resources :scrap_folders, only: %i[index create update destroy] do
      resources :scraps, only: %i[index create destroy]
    end
  end

end
