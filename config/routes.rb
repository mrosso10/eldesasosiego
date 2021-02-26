Rails.application.routes.draw do

  mount Sidekiq::Web => "/sidekiq" # monitoring console
  mount PgRails::Engine => '/pg_rails'
  mount PgMantenimiento::Engine => "/pg_mantenimiento"

  root to: "frontend/static_pages#home"

  namespace :frontend, path: '' do
    scope controller: :static_pages do
      get :home
    end

    resources :contactos
    resources :posts, path: 'noticias', only: [:index, :show]
  end

  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", sign_up: "register"},
                     controllers: { registrations: "users/registrations" }

  namespace :admin do
    resources :audits, only: :index
    resources :users
    resources :post_categories
    resources :posts
    root to: 'users#index'

    get 'login_as', to: 'asd#login_as'
  end

  post '/tinymce_assets' => 'tinymce_assets#create'

end
