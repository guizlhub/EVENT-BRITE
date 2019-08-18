Rails.application.routes.draw do

  devise_for :users

  root 'static_pages#index'
  get 'static_pages/secret'

  resources :attendances
  resources :events do
    resources :eventpictures, only: [:create]
  end
  resources :users
  resources :charges, only: [:new, :create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
