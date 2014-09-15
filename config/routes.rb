ServerApi::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }

  devise_scope :user do
    match '/api/users', to: 'registrations#create', via: [:post]
  end

  namespace :api, defaults: {format: :json} do
    resources :horses
    resources :users
    resources :veterinarians
    resources :notes
  end

end
