Rails.application.routes.draw do
  root 'landing_page#index'

  mount Commontator::Engine => '/commontator'


  resources :lists do 
    resources :items
  end

  devise_for :users
end
