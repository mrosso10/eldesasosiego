# frozen_string_literal: true

# generado con pg_rails

module Admin
  class PostsController < AdminController
    before_action { @clase_modelo = Post }

    before_action(only: :index) { authorize Post }

    before_action :set_post, only: %i[new create show edit update destroy]

    add_breadcrumb Post.nombre_plural, :admin_posts_path

    def index
      @posts = filtros_y_policy %i[titulo contenido post_category]

      render_collection(@posts)
    end

    def show
      add_breadcrumb @post, [:admin, @post]

      respond_to do |format|
        format.json { render json: @post }
        format.html
      end
    end

    def new
      add_breadcrumb "Crear #{Post.nombre_singular.downcase}"
    end

    def edit
      add_breadcrumb @post, [:admin, @post]
    end

    def create
      insertar_y_responder(@post)
    end

    def update
      updatear_y_responder(@post)
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
                        [:post_category, 'post_category_id']
                      ])
      end

      def set_post
        if action_name.in? %w[new create]
          @post = @clase_modelo.new(post_params)
        else
          @post = Post.friendly.find(params[:id])

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
          params.require(:post).permit(atributos_permitidos)
        end
      end

      def atributos_permitidos
        %i[titulo activo slug contenido post_category_id]
      end
  end
end
