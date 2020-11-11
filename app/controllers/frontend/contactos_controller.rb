class Frontend::ContactosController < ApplicationController

layout "frontend"

	def new
		@contacto = Contacto.new
	end

	def create
		@contacto = Contacto.new(contacto_params)

		unless success
	        flash[:error] = 'Debe completar el captcha.'
	        redirect_to root_path
	        return
	    end

	    if @contacto.save?
	        MessageMailer.message_me(@message).deliver_now
	        flash[:info] = 'Mensaje Enviado. Gracias por contactarnos.'
	    else
	        flash[:error] = 'Hubo un error en el envío de mensaje, '\
	                        'por favor complete los campos obligatorios.'
	    end
	      redirect_to root_path
	end

	private
	
		def contacto_params
			params.require(:contacto).permit(:nombre, :email, :mensaje, :ip, :user_id)
		end
end
