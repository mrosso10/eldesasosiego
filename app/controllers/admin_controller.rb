# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  before_action do
    add_breadcrumb 'Inicio', admin_root_path
    @title = 'Panel de control'
  end

  def login_as
    if Rails.env.development? || desarrollador?
      usuario = User.find(params[:id])
      sign_in(:user, usuario)
    end
    redirect_to '/'
  end

  protected

    def updatear_y_responder(object)
      respond_to do |format|
        if object.save
          format.html do
            redirect_to [:admin, object],
                        notice: "#{@clase_modelo.nombre_singular} actualizadx."
          end
          format.json { render json: object.decorate }
        else
          format.html { render :edit }
          format.json { render json: object.errors }
        end
      end
    end

    def insertar_y_responder(object)
      respond_to do |format|
        if object.save
          format.html do
            redirect_to [:admin, object],
                        notice: "#{@clase_modelo.nombre_singular} creadx."
          end
          format.json { render json: object.decorate }
        else
          format.html { render :new }
          format.json { render json: object.errors.full_messages }
        end
      end
    end

    def render_collection(collection)
      respond_to do |format|
        format.json { render json: collection }
        format.js { render_smart_listing }
        format.html { render_smart_listing }
        format.xlsx do
          render xlsx: 'download',
                 filename: "#{@clase_modelo.nombre_plural.gsub(' ', '-').downcase}" \
                           "-#{Date.today}.xlsx"
        end
      end
    end

  private

    def check_admin
      redirect_to admin_root_path && return if current_user.admin?
      redirect_to root_path && return
    end
end
