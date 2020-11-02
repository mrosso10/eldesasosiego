# frozen_string_literal: true

class ApplicationPolicy < PgRails::ApplicationPolicy
  def export?
    acceso_total?
  end
end
