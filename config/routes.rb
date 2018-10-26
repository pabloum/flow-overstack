Rails.application.routes.draw do
  root 'questions#index'

  resources :users , only: [:new, :create]

  get 'login', to: 'sessions#new', as: "login_new"
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :questions do
    resources :comments, only: [:create]
    resource :votes, only: [:create, :destroy]
    resources :answers, only: [:create] do
      resources :comments, only: [:create]
      resource :votes, only: [:create, :destroy]
    end
  end

  get 'answers/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
