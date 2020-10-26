class Frontend::MessagesController < FrontendController
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)

    success = verify_recaptcha(model: @message, action: 'contacto')

    if !success
      flash[:error] = "Debe completar el captcha."
      redirect_to root_path
      return
    end

    if @message.valid?
      MessageMailer.message_me(@message).deliver_now
      flash[:info] = "Mensaje Enviado. Gracias por contactarnos."
      redirect_to root_path
    else
      flash[:error] = "Hubo un error en el envío de mensaje, por favor complete los campos obligatorios."
      redirect_to root_path
    end
  end


  private

  def message_params
    params.require(:message).permit(:nombre, :email, :mensaje)
  end

end
