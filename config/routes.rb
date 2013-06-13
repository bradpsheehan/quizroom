Quizroom::Application.routes.draw do
  root to: "application#index"

  resources :users
  resources :sessions

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'classrooms/new' => 'classroom#new', as: "new_classroom"
end
