Comissoes::Application.routes.draw do
  LOCALES = /en|pt\-BR/
  scope "(:locale)", :locale => LOCALES do
    resources :products
    resources :clients
    resources :symptoms
    resources :users
    resource  :confirmation, :only => [:show]
  end

  match '/:locale' => 'home#index', :locale => LOCALES
  root :to => "home#index"
end
