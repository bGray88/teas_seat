Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cust_subs, only: [:index, :create]
      patch '/cust_sub', to: 'cust_subs#update'
    end
  end
end
