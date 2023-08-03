Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :todos
      end
    end
  end
end
