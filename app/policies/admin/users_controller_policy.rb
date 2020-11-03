# frozen_string_literal: true

module Admin
  class UsersControllerPolicy < ApplicationPolicy
    def index?
      user_allowed?
    end

    def new?
      user_allowed?
    end

    def create?
      user_allowed?
    end

    def edit?
      user_allowed?
    end

    def update?
      user_allowed?
    end

    def destroy?
      user_allowed?
    end

    def user_allowed?
      user.admin?
    end
  end
end
