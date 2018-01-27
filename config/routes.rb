Rails.application.routes.draw do
  devise_for :users
  root 'ideas#index'

  resources :ideas
  resources :users, only: :show

  get 'about' => 'static_pages#about'
  get 'random' => 'static_pages#random'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
