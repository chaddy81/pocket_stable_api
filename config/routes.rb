ServerApi::Application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :horses 
  end
end
