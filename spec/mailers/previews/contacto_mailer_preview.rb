# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/contacto_mailer

class ContactoMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/contacto_mailer/contacto
  def contacto
    contacto = FactoryBot.create(:contacto)
    ContactoMailer.contacto(contacto)
  end
end
