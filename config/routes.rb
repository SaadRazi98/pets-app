Rails.application.routes.draw do
  get "/pets" => "pets#index"
  post "/pets" => "pets#create"
  get "/pets/:id" => "pets#show"
end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
