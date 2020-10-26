Rails.application.routes.draw do
  
  mount Sidekiq::Web => "/sidekiq" # monitoring console
  mount PgRails::Engine => '/pg_rails'
  mount PgMantenimiento::Engine => "/pg_mantenimiento"

  scope module: 'frontend' do
    get 'login_as', to: 'home#login_as'
    root to: "static_pages#home"

    scope controller: :static_pages do
      get :home
      get :contacto
    end

  end

  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", sign_up: "register"}

  namespace :admin do
    resources :audits, only: :index
    resources :users
    root to: 'users#index'
  end

  post '/tinymce_assets' => 'tinymce_assets#create'

end
