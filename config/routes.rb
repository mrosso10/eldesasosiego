Rails.application.routes.draw do
  
  mount Sidekiq::Web => "/sidekiq" # monitoring console
  mount PgRails::Engine => '/pg_rails'
  mount PgMantenimiento::Engine => "/pg_mantenimiento"

  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", sign_up: "register"}

  namespace :admin do
    resources :audits, only: :index
    resources :users
  end

  post '/tinymce_assets' => 'tinymce_assets#create'

  root to: "home#index"
end
