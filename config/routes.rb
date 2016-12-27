Rails.application.routes.draw do
  devise_for :logins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :answers do 
  	resources :answers
  end
  namespace :user_answers do
  	resources :part_one 
  end
  resources :questions

  root to: "questions#index"
end
