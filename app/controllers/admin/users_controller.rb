# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  before_action do
    authorize Admin::UsersController
  end

  add_breadcrumb 'Administración de Usuarios', :admin_users_path

  def index
    @title = 'Usuarios'
    scope = User.order(:name).includes(:empleado, :signs_with_empleado)
    scope = scope.where(desarrollador: false) unless desarrollador?
    smart_listing(:users, scope, 'admin/users/listing')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_with_notice(admin_users_path, 'Usuario creado correctamente')
    else
      render action: 'new'
    end
  end

  def edit
    @user = User.find params[:id]
    @title = @user
    # add_breadcrumb @user.email
  end

  def destroy
    @user = User.find params[:id]
    destroy_and_respond(@user)
  end

  def update
    @user = User.find params[:id]

    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'Usuario actualizado correctamente.'
    else
      render action: 'edit'
    end
  end

  private

  def user_params
    parameters = params.require(:user).permit(:name, :email, :password, :password_confirmation, :active, profiles: [])
    parameters = parameters.except(:password) if parameters[:password].blank?
    parameters
  end
end