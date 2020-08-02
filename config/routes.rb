Rails.application.routes.draw do
  get 'country_stats/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'country_stats#index'
end
