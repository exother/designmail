Rails.application.routes.draw do
  resources :campaigns
  resources :settings
  resources :mails
  root 'welcome#index'
end
