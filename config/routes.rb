Comissoes::Application.routes.draw do
  LOCALES = /en|pt\-BR/
  scope "(:locale)", :locale => LOCALES do
    resources :products
    resources :clients
    resources :symptoms
    resources :users
    resource  :profile
    resource  :confirmation, :only => [:show]
    resource  :user_sessions, :only => [:create, :new, :destroy]
  end

  match '/:locale' => 'home#index', :locale => LOCALES
  root :to => "home#index"
end
