Rails.application.routes.draw do
  get 'answers/create'
  root 'questions#index'
  resources :questions do
    resources :answers, only: [:create]    
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
