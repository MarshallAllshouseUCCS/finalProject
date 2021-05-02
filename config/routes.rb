Rails.application.routes.draw do
  devise_for :admins
  root "projects#index"
  resources :projects
end
