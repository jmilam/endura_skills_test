Rails.application.routes.draw do
  devise_for :logins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :answers do 
  	resources :answers
  end
  namespace :user_answers do
  	resources :part_one 
    resources :part_two
    resources :part_three
    resources :part_four
    resources :part_five
    resources :finish
    resources :admin
    resources :user
  end
  namespace :questions do
    resources :test_one
    resources :test_two
  end

  root to: "questions/test_one#index"
end
