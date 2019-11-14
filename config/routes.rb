Rails.application.routes.draw do
  # get 'topics/index'
  # get 'topics/show'
  # get 'topics/new'
  # get 'topics/create'
  # get 'topics/edit'
  # get 'topics/update'
  # get 'topics/destroy'
  # get 'departments/index'
  # get 'departments/show'
  # get 'departments/new'
  # get 'departments/create'
  # get 'departments/edit'
  # get 'departments/update'
  # get 'departments/destroy'
  root "departments#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :departments do
    resources :topics 
end

resources :topics do
  resources :comments, only: [:new, :create] 
  end
end