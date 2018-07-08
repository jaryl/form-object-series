Rails.application.routes.draw do

  root to: 'enquiries#new'

  resources :enquiries, only: [:new, :create]
  resources :invitations, only: [:new, :create]
  resources :users, only: [:new, :create]

  resources :orders, only: [:new, :create]

  namespace :admin do
    resources :users, only: [:index]
  end

end
