Rails.application.routes.draw do
  devise_for :users
  #resources :subjects
  #resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "books#index"
  #devise_for :users do
  #  get '/users/sign_out' => 'devise/sessions#destroy'
  #end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

      get '/', to:'books#main'
      get 'books/:id/edit', to:'books#edit'
      put '/books/:id/edit', to:'books#update'
      delete '/books/:id/delete', to:'books#destroy'
      post '/books', to:'books#save'
      get '/books', to:'books#posts'
      get '/books/export-csv', to:'books#csv_data'


  
=begin
  get "books", to: 'books#index'
  get 'books/:id', to: 'books#show'
  get 'books/new', to: 'books#new'
  post 'books/new', to: 'books#create'
  put 'books/:id/edit', to: 'books#update'
  delete 'books/:id', to: 'books#destroy'
=end
  #put "/books/:id"
  #http://127.0.0.1:3000/books/new
  #http://127.0.0.1:3000/books/6
  #http://127.0.0.1:3000/books/6/edit
end
