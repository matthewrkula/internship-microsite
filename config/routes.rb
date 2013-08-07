InternMicrosite::Application.routes.draw do
  get "/" => "thought#index"
  get "index" => "thought#index"
  get "random" => "thought#random"
  post "create" => "thought#create"
  get "new" => "thought#new"

end
