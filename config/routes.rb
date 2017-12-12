Rails.application.routes.draw do
  #scope "(:locale)", locale: /en|pt\-BR/  do
    resources :rooms
    resources :users

    resource :confirmation, only: [:show]
    resource :user_sessions, only: [:create, :new, :destroy]

    root "home#index"
  #end

  get '/:locale' => 'home#index', locale: /en|pt/

end
