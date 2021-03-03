# frozen_string_literal: true

module Frontend
  class PostsController < FrontendController
    before_action :set_post, only: %i[show]

    def index
      @noticias = Post.activos

      smart_listing(:noticias, @noticias, 'listing', { page_sizes: [10] })
    end

    def show
      add_breadcrumb @post, @post

      respond_to do |format|
        format.json { render json: @post }
        format.html
      end
    end

    private

      def set_post
        @post = Post.friendly.find(params[:id])
      end
  end
end
