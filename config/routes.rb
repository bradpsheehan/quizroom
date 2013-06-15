Quizroom::Application.routes.draw do
  root to: "application#index"

  resources :users
  resources :sessions
  resources :classrooms
  resources :messages, only: [:create]

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
end
