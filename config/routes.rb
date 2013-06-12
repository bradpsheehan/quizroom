Quizroom::Application.routes.draw do
  root to: "application#index"

  resources :users

  get 'signup' => 'users#new'
  get 'classrooms/new' => 'classroom#new', as: "new_classroom"
end
