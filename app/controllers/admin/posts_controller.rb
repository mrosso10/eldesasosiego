# frozen_string_literal: true

# generado con pg_rails

module Admin
  class PostsController < ApplicationController
    before_action { @clase_modelo = Admin::Post }

    before_action(only: :index) { authorize Admin::Post }

    before_action :set_post, only: %i[new create show edit update destroy]

    add_breadcrumb Admin::Post.nombre_plural, :admin_posts_path

    def index
      @posts = filtros_y_policy %i[titulo activo slug contenido post_category]

      respond_to do |format|
        format.json { render json: @posts }
        format.js { render_smart_listing }
        format.html { render_smart_listing }
        format.xlsx do
          render xlsx: 'download',
                 filename: "#{Admin::Post.nombre_plural.gsub(' ', '-').downcase}-#{Date.today}.xlsx"
        end
      end
    end

    def show
      add_breadcrumb @post, @post

      respond_to do |format|
        format.json { render json: @post }
        format.html
      end
    end

    def new
      add_breadcrumb "Crear #{Admin::Post.nombre_singular.downcase}"
    end

    def edit
      add_breadcrumb @post
    end

    def create
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: "#{Admin::Post.nombre_singular} creadx." }
          format.json { render json: @post.decorate }
        else
          format.html { render :new }
          format.json { render json: @post.errors.full_messages }
        end
      end
    end

    def update
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: "#{Admin::Post.nombre_singular} actualizadx." }
          format.json { render json: @post.decorate }
        else
          format.html { render :edit }
          format.json { render json: @post.errors }
        end
      end
    end

    def destroy
      destroy_and_respond(@post, admin_posts_url)
    end

    private

      def render_smart_listing
        smart_listing(:posts, @posts, 'admin/posts/listing',
                      sort_attributes: [
                        [:titulo, 'titulo'],
                        [:activo, 'activo'],
                        [:slug, 'slug'],
                        [:contenido, 'contenido'],
                        [:post_category, 'post_category'],
                        [:post_category, 'post_category']
                      ])
      end

      def set_post
        if action_name.in? %w[new create]
          @post = @clase_modelo.new(post_params)
        else
          @post = Admin::Post.friendly.find(params[:id])

          @post.assign_attributes(post_params) if action_name.in? %w[update]
        end

        @post.current_user = current_user

        authorize @post

        @post = @post.decorate if action_name.in? %w[show new edit]
      end

      def post_params
        if action_name == 'new'
          params.permit(atributos_permitidos)
        else
          params.require(:admin_post).permit(atributos_permitidos)
        end
      end

      def atributos_permitidos
        %i[titulo activo slug contenido admin_post_category_id]
      end
  end
end
