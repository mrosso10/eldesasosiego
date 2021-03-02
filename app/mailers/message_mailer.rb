# frozen_string_literal: true

class MessageMailer < ApplicationMailer
  def message_me(contacto)
    @contacto = contacto
    mail to: ENV['MAIL_TO'], cc: ENV['MAIL_TO_CC'],
         subject: 'Mensaje recibido a través de Web Lomas de Zamora'
  end
end
