# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def user_allowed?
    user.admin?
  end
end
