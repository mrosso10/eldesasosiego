class MessageMailer < ApplicationMailer
  # use your own email address here
  default :to => "info@pg_template.com"

  def message_me(msg)
    @msg = msg
    mail from: @msg.email
  end
end
