# frozen_string_literal: true

# Renders the home page.
module Frontend
  class StaticPagesController < FrontendController
    def login_as
      if Rails.env.development? || desarrollador?
        usuario = User.find(params[:id])
        sign_in(:user, usuario)
      end
      redirect_to '/'
    end

    def home
      @title = 'Home'
    end

    def contacto
      @title = 'Contacto'
      @message = Message.new
    end

    def blog
      @post = Admin::Post.activos.last
      @title = @post.titulo
      render_blog
    end

    def show_post
      @post = Admin::Post.friendly.find(params[:id])
      @title = @post.titulo
      render_blog
    end

    private

      def render_blog
        if browser.device.mobile?
          render 'blog_mobile'
        else
          render 'blog'
        end
      end
  end
end
