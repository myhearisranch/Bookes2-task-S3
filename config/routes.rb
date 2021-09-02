Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'

  devise_for :users
  resources :books, only: [ :create, :index, :show, :destroy, :edit]
  patch 'books/:id' => 'books#create'
  resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
