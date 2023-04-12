Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create, :index]
      resources :cust_subs, only: [:update]
    end
  end
end
