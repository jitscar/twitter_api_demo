Rails.application.routes.draw do
  get 'statistics/index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :messages, only: [:index, :create] do
        put :favorite, on: :member
      end
    end
  end
end
