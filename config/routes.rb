Rails.application.routes.draw do
  root to: "boards#index" 
  resources :boards, only: [:index, :edit, :create, :update, :destroy]
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
  resources :adminrooms, only: [:new, :create] do
    resources :adminmessages, only: [:index, :create]
  end

  resources :schedules do
    resources :checks, only: [:create,:update]
    member do
      get 'preview'
      post '/users/:user_id', to: 'confirms#switch'
      delete '/users/:user_id', to: 'confirms#switch'
      get 'next_preview'
      post '/next_users/:user_id', to: 'confirms#next_switch'
      delete '/next_users/:user_id', to: 'confirms#next_switch'
    end
  end

  resources :nextschedules
  resources :confirmedschedules
 
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  get 'registrations/users'

end
