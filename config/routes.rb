Rails.application.routes.draw do
  devise_for :users do
  	get '/users/sign_out' => 'devise/sessions#destroy'
  end
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  resources :posts

  
end
