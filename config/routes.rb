ServerApi::Application.routes.draw do
  resources :cors
  match '/', :to => proc {|env| [200, {'Content-Type' => 'text/plain'}, ["Hello world"]] },
             :via => [:get, :post, :put, :delete, :options, :head, :patch]

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
    resources :payments
  end
end
