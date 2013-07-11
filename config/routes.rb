Comissoes::Application.routes.draw do
  resources :products
  resources :clients
  resources :symptoms
  resources :users
  root :to => "home#index"
end
