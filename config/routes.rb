Rails.application.routes.draw do

  authenticate :user, lambda { |u| u.desarrollador? } do
    mount Sidekiq::Web => '/sidekiq'
  end
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
  end

  get 'login_as', to: 'admin#login_as'

  post '/tinymce_assets' => 'tinymce_assets#create'
end
