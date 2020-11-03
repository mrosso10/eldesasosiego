# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  before_action do
    add_breadcrumb 'Inicio', admin_root_path
    @title = 'Panel de control'
  end

  private

    def check_admin
      redirect_to admin_root_path && return if current_user.admin?
      redirect_to home_path && return
    end
end
