Rails.application.routes.draw do
  resources :projects
  root "home#index"
end
