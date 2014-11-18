ServerApi::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }

  devise_scope :user do
    match '/api/users', to: 'registrations#create', via: [:post]
  end

  namespace :api, defaults: {format: :json} do
    resources :horses
    resources :users do
      post 'forgot_password', on: :collection, to: 'users#forgot_password'
      post 'reset_password', on: :collection, to: 'users#reset_password'
    end
    resources :veterinarians
    resources :notes
    resources :documents
    resources :weights
    resources :stable_information
    resources :health_information
    resources :search
    resources :photos
  end

  get 'api/stableInformation/:id', to: 'api/stable_information#show', defaults: {format: :json}
  put 'api/stableInformation/:id', to: 'api/stable_information#update', defaults: {format: :json}

  get 'api/healthInformation/:id', to: 'api/health_information#show', defaults: {format: :json}
  put 'api/healthInformation/:id', to: 'api/health_information#update', defaults: {format: :json}

end
