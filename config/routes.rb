Rails.application.routes.draw do
  resources :campaigns
  resources :settings
  resources :emails
  root 'welcome#index'
end
