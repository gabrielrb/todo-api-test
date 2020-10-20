Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :projects, only: [:index, :show, :update, :create, :destroy] do
        resources :tasks, only: [:index, :create]
      end
      resources :tasks, only: [:show, :update, :destroy]
    end
  end
end
