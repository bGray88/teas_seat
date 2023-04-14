Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cust_subs, only: [:index, :create]
      get '/cust_sub', to: 'cust_subs#show'
      patch '/cust_sub', to: 'cust_subs#update'
    end
  end
end
