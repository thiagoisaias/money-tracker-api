Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      mount_devise_token_auth_for 'User', at: 'auth'
      
      resources :users, only: %i[show] do
        resources :accounts, except: %i[edit new] do
          get 'current_balance', to: 'accounts#current_balance', on: :member
          resources :transactions, except: %i[edit new], on: :member
        end
        resources :categories, except: %i[edit new]
      end
    
    end
  end
end
