# frozen_string_literal: true

module Frontend
  class ContactosController < FrontendController
    layout 'frontend'

    def new
      @contacto = Contacto.new
    end

    def create
      @mensaje_error = 'Hubo un error en el envío de mensaje. Intente nuevamente, por favor.'
      @contacto = Contacto.new(contacto_params)

      verify_recaptcha(model: @contacto, action: 'create')

      @contacto.ip = request.remote_ip
      @contacto.user = current_user

      MessageMailer.message_me(@message).deliver_later if @contacto.errors.empty? && @contacto.save
    rescue StandardError => e
      Rollbar.error(e)
      render js: "PgRails.error_toast('#{@mensaje_error}');"
    end

    private

      def contacto_params
        params.require(:contacto).permit(:nombre, :email, :mensaje, :ip, :user_id)
      end
  end
end
