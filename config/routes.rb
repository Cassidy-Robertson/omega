Rails.application.routes.draw do

  get 'courses/new'

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}

  root 'home#index'

  get 'profiles/:id' => 'profiles#show'

  resources :courses 

end
