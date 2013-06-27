Quizroom::Application.routes.draw do
  root to: "application#index"

  resources :users
  resources :sessions
  resources :classrooms do
    resources :students
    resources :chats
  end
  resources :quizzes do
    resources :questions do
      resources :answers
    end
  end

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new', as: 'login'
  get 'complete_signup/:id' => 'users#complete_signup', as: 'complete_signup'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'add_students' => 'students#new'
  post 'start_quiz' => 'chats#create'
  post 'submit_answer' => 'submissions#create'
end
