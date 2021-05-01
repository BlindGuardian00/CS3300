Rails.application.routes.draw do
  devise_for :views
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "projects#index"
  get "/about", to: "projects#about"
  resources :projects
  resources :students
end
