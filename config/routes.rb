Rails.application.routes.draw do
  root 'landing_page#index'

  resources :lists do 
    resources :items
  end

  devise_for :users
end
