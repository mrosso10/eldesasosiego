# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/message_mailer

class MessageMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/message_me
  def message_me
    contacto = FactoryBot.create(:contacto)
    MessageMailer.message_me(contacto)
  end
end
