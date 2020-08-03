Rails.application.routes.draw do
  get 'world', to: 'world#index'
  resources :countries, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'world#index'
end
