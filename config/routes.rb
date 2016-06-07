Rails.application.routes.draw do
  root 'landing_page#index'
  post 'copy/:id', to: "lists#copy", as: 'copy'


  mount Commontator::Engine => '/commontator'

  resources :lists do 
    resources :items
  end

  devise_for :users
end
