Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :recipes, only: :index
      resources :learning_resources, only: :index
      resources :users, only: %i[create index]
      resources :favorites, only: %i[create index]
      resources :sessions, only: %i[create destroy]

      delete '/favorites', to: 'favorites#destroy'
    end
  end
end
