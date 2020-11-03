# frozen_string_literal: true

# generado con pg_rails

module Admin
  class PostCategoriesController < ApplicationController
    before_action { @clase_modelo = Admin::PostCategory }

    before_action(only: :index) { authorize Admin::PostCategory }

    before_action :set_post_category, only: %i[new create show edit update destroy]

    add_breadcrumb Admin::PostCategory.nombre_plural, :admin_post_categories_path

    def index
      @post_categories = filtros_y_policy [:nombre]

      respond_to do |format|
        format.json { render json: @post_categories }
        format.js { render_smart_listing }
        format.html { render_smart_listing }
        format.xlsx do
          render xlsx: 'download',
                 filename: "#{Admin::PostCategory.nombre_plural.gsub(' ', '-').downcase}"\
                           "-#{Date.today}.xlsx"
        end
      end
    end

    def show
      add_breadcrumb @post_category, @post_category

      respond_to do |format|
        format.json { render json: @post_category }
        format.html
      end
    end

    def new
      add_breadcrumb "Crear #{Admin::PostCategory.nombre_singular.downcase}"
    end

    def edit
      add_breadcrumb @post_category
    end

    def create
      respond_to do |format|
        if @post_category.save
          format.html do
            redirect_to @post_category,
                        notice: "#{Admin::PostCategory.nombre_singular} creadx."
          end
          format.json { render json: @post_category.decorate }
        else
          format.html { render :new }
          format.json { render json: @post_category.errors.full_messages }
        end
      end
    end

    def update
      respond_to do |format|
        if @post_category.save
          format.html do
            redirect_to @post_category,
                        notice: "#{Admin::PostCategory.nombre_singular} actualizadx."
          end
          format.json { render json: @post_category.decorate }
        else
          format.html { render :edit }
          format.json { render json: @post_category.errors }
        end
      end
    end

    def destroy
      destroy_and_respond(@post_category, admin_post_categories_url)
    end

    private

      def render_smart_listing
        smart_listing(:post_categories, @post_categories, 'admin/post_categories/listing',
                      sort_attributes: [
                        [:nombre, 'nombre']
                      ])
      end

      def set_post_category
        if action_name.in? %w[new create]
          @post_category = @clase_modelo.new(post_category_params)
        else
          @post_category = @clase_modelo.find(params[:id])

          @post_category.assign_attributes(post_category_params) if action_name.in? %w[update]
        end

        @post_category.current_user = current_user

        authorize @post_category

        @post_category = @post_category.decorate if action_name.in? %w[show new edit]
      end

      def post_category_params
        if action_name == 'new'
          params.permit(atributos_permitidos)
        else
          params.require(:admin_post_category).permit(atributos_permitidos)
        end
      end

      def atributos_permitidos
        [:nombre]
      end
  end
end
