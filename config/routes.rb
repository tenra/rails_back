Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'users', controllers: {
        registrations: "api/v1/users/registrations"
      }
      devise_scope :api_v1_user do
        get 'users/base', to: 'users/registrations#base'
        get 'users/profile', to: 'users/registrations#profile'
      end

    end
  end

end
