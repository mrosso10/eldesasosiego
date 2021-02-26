# frozen_string_literal: true

# generado con pg_rails

class PostDecorator < PgRails::BaseDecorator
  delegate_all

  def default_module
    :admin
  end
end
