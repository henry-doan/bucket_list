Rails.application.routes.draw do
  root 'landing_page#index'
  post 'copy/:id', to: "lists#copy", as: 'copy'


  resources :lists do

  	mount Commontator::Engine => '/commontator'
    resources :items
  end

  devise_for :users
end
