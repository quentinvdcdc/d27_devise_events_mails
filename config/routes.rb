Rails.application.routes.draw do
  #resources :home, only: [:index, :secret]
  root 'home#index'
  get 'home/secret'
  devise_for :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
