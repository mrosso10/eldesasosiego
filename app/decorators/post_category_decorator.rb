# frozen_string_literal: true

# generado con pg_rails

class PostCategoryDecorator < PgRails::BaseDecorator
  delegate_all

  def default_module
    :admin
  end
end
