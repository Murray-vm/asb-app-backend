Rails.application.routes.draw do
  resources :asb_sittings
  # resources :asb_classes
  resources :asb_results
  resources :answers
  resources :students
  resources :users

  get '/students/user/:user_id', to: 'students#by_user', as: 'students_by_user'

  post 'login', to: "authentication#login"
  post '/register', to: 'authentication#register'
  get '/user_details', to: 'authentication#user_details'

  get '/asb_sittings/:session_id/active_students', to: 'asb_sittings#active_students'
  get 'answers/:student_id/:asb_sitting_id', to: 'answers#fetch_by_student_and_sitting', as: 'fetch_answers'
  get 'asb_results/by_sitting/:asb_sitting_id', to: 'asb_results#by_sitting', as: 'asb_results_by_sitting'


  get "up" => "rails/health#show", as: :rails_health_check
  resources :messages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # post "/signup", to: "user#create"
  # get "/me", to: "user#show"
  # post "/login", to: "sessions#create"
  # delete "/logout", to: "sessions#destroy"

  # get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html?}

  # Defines the root path route ("/")
  # root "posts#index"
end
