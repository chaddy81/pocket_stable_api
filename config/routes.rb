ServerApi::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }

  namespace :api, defaults: {format: :json} do
    resources :horses
  end
  devise_scope :user do
    match '/api/users', to: 'registrations#create', via: [:post]
  end
end
