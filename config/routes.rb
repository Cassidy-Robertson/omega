Rails.application.routes.draw do

  resources :courses

  resources :enrollments, only: [:create]

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}, controllers: { registrations: "users/registrations" }

  root 'home#index'

  get 'profiles/:id' => 'profiles#show', as: :profile

  get 'search' => 'search#search'

  get 'zipcodesearch' => 'search#zipcodesearch'

  get 'datesearch' => 'search#datesearch'

  get 'tag_search' => 'search#tag_search', as: :tag_search

end
