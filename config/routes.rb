Rails.application.routes.draw do
  root 'categories#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :categories do
    resources :products do
      resources :reviews
    end
  end
  get 'user/profile', to: 'user_profiles#index', as: 'user_profile'
end
