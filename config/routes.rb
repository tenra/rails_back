Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users
      resources :promotions

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: "api/v1/auth/registrations",
        confirmations: "api/v1/auth/confirmations",
      }
      devise_scope :api_v1_user do
        get 'auth/base', to: 'auth/registrations#base'
      end

    end
  end

end
