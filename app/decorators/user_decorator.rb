class UserDecorator < PgRails::BaseDecorator
  def object_url
    helpers.admin_user_path(object)
  end

  def edit_object_url
    helpers.edit_admin_user_path(object)
  end
end
