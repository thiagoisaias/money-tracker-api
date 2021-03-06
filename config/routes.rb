Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      mount_devise_token_auth_for 'User', at: 'auth'
      
      resources :users, only: %i[show] do
        get 'overall_balance', to: 'users#overall_balance', on: :member
        get 'fetch_transactions_by_date', to: 'users#fetch_transactions_by_date', on: :member
        resources :accounts, except: %i[edit new] do
          resources :transactions, except: %i[edit new]
        end
        resources :categories, except: %i[edit new]
      end
    
    end
  end
end
