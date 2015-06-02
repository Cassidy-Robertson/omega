Rails.application.routes.draw do
 
  root 'home#index'

  get 'profiles/:id' => 'profiles#show'
  
end
