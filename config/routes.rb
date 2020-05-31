Rails.application.routes.draw do
  get 'main/index'
  resources :posts do
    resources :comments
  end
  root 'main#index'

  # get 'posts/new'
end
