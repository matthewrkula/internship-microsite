InternMicrosite::Application.routes.draw do
  get "/" => "thought#index"
  get "index" => "thought#index"
  post "create" => "thought#create"
  get "new" => "thought#new"

end
