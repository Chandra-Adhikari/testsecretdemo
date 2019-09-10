Rails.application.routes.draw do
  devise_for :users
  root :to => "secret_codes#index"
  resources :secret_codes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
