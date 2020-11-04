# frozen_string_literal: true

class ApplicationController < PgRails::ApplicationController
  include Navbar

  helper_method :desarrollador?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::ReadOnlyRecord, with: :readonly_record
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected

    def default_url_options(options = {})
      if Rails.env.production?
        options.merge(protocol: 'https')
      else
        options
      end
    end

    def desarrollador?
      current_user.present? && current_user.desarrollador?
    end

    def usuarios
      if desarrollador?
        User.order(:name)
      else
        User.where(desarrollador: false).order(:name)
      end
    end

  private

    def user_not_authorized
      flash[:alert] = 'No está autorizado para realizar esa acción'
      if request.referrer.present? && request.referrer != request.url
        redirect_to(request.referrer)
      else
        redirect_to(root_path)
      end
    end

    def readonly_record
      flash[:alert] = 'El elemento es de sólo lectura'
      redirect_to(request.referrer || root_path)
    end

    def record_not_found
      render file: 'public/404.html', layout: false
    end
end
