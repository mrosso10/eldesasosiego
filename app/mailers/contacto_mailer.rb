# frozen_string_literal: true

class ContactoMailer < ApplicationMailer
  def contacto(contacto)
    @contacto = contacto
    mail to: ENV['MAIL_TO'], cc: ENV['MAIL_TO_CC'],
         subject: 'Mensaje recibido a través de eldesasosiego'
  end
end
