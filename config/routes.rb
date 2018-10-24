Rails.application.routes.draw do
  root 'questions#index'

  resources :users , only: [:new, :create]

  get 'login', to: 'sessions#new', as: "login_new"
  post 'login', to: 'sessions#create'

  resources :questions do
    resources :answers, only: [:create]
  end

  get 'answers/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
