Rails.application.routes.draw do
  post 'login', to: "authentication#login"
  get 'products', to: "products#index"
end

