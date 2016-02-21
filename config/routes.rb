Rails.application.routes.draw do
  get 'statistics/index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :messages, only: [:index, :create] do
        member do
          put :mark_as_liked
        end
      end
    end
  end
end
