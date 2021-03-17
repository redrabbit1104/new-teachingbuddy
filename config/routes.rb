Rails.application.routes.draw do
  root to: "boards#index" 
  resources :sdates
  resources :boards
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
  end
  resources :adminrooms, only: [:new, :create, :destroy] do
    resources :adminmessages, only: [:index, :create, :destroy]
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
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  get 'registrations/admins'
  get 'registrations/users'

end
