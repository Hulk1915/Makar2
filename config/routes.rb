Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/catalog', to: 'home#catalog'
  get '/authors', to: 'home#authors'
  get '/books/new', to: 'home#new_book'
  post '/books/add_book', to: 'home#add_book'
  
  get '/authors/new', to: 'authors#new'
  post '/authors/add', to: 'authors#add_author'
  
  get '/genres/new', to: 'genres#new'
  post '/genres/add', to: 'genres#add_genre'
  
  get '/books/:id', to: 'home#book_index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
