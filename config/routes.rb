Rails.application.routes.draw do

  authenticate :user, lambda { |u| u.desarrollador? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  mount PgRails::Engine => '/pg_rails'
  mount PgMantenimiento::Engine => "/pg_mantenimiento"

  root to: 'paginas#index'

  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", sign_up: "register"},
                     controllers: { registrations: "users/registrations" }

  namespace :admin do
    resources :audits, only: :index
    resources :users
    root to: 'users#index'
  end

  resources :paginas

  get 'login_as', to: 'admin#login_as'

  post '/tinymce_assets' => 'tinymce_assets#create'
end
