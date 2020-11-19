module Frontend
  class ContactosController < FrontendController
    layout "frontend"

    def new
      @contacto = Contacto.new
    end

    def create
      @contacto = Contacto.new(contacto_params)

      @captcha_success = verify_recaptcha(model: @contacto, action: 'create')

      unless @captcha_success
        respond_to :js
        return
      end

      @contacto.ip = request.remote_ip
      @contacto.user_id = current_user

      if @contacto.save
        MessageMailer.message_me(@message).deliver_later
        respond_to :js
      end
    end

    private

      def contacto_params
        params.require(:contacto).permit(:nombre, :email, :mensaje, :ip, :user_id)
      end
  end
end
