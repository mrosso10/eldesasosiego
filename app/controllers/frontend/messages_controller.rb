# frozen_string_literal: true

module Frontend
  class MessagesController < FrontendController
    def create
      @message = Message.new(message_params)

      success = verify_recaptcha(model: @message, action: 'contacto')

      unless success
        flash[:error] = 'Debe completar el captcha.'
        redirect_to root_path
        return
      end

      if @message.valid?
        MessageMailer.message_me(@message).deliver_now
        flash[:info] = 'Mensaje Enviado. Gracias por contactarnos.'
      else
        flash[:error] = 'Hubo un error en el envío de mensaje, '\
                        'por favor complete los campos obligatorios.'
      end
      redirect_to root_path
    end

    private

      def message_params
        params.require(:message).permit(:nombre, :email, :mensaje)
      end
  end
end
