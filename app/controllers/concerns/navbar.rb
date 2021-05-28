# frozen_string_literal: true

module Navbar
  extend ActiveSupport::Concern

  included do
    helper_method :navbar_content
    helper_method :active_entry?
    helper_method :hide_entry?
    helper_method :all_children_hidden?
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Layout/LineLength
  def navbar_content
    [
      { title: 'Blog', icon: 'fa fa-blog', label_id: 'label-1', children: [
        { title: 'Categorías', path: main_app.admin_post_categories_path,
          show: policy(PostCategory).index? },
        { title: 'Posteos', path: main_app.admin_posts_path, show: policy(Post).index? }
      ] },
      { title: 'Admin', icon: 'fa fa-cogs', label_id: 'label-2', children: [
        { title: 'Usuarios', path: main_app.admin_users_path,
          show: policy(Admin::UsersController).index? },
        { title: 'Audits', path: main_app.admin_audits_path, show: desarrollador? },
        { title: 'Backups y Server', path: pg_mantenimiento.root_path, show: desarrollador? }
      ] },
      { title: 'Ir al sitio web', path: '/', icon: 'fa fa-globe', label_id: 'label_2' }
    ]
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Layout/LineLength

  def all_children_hidden?(entry)
    entry[:children].all? { |child| child[:show] == false }
  end

  def any_children_active?(entry)
    entry[:children].any? { |child| active_entry?(child) }
  end

  def hide_entry?(entry)
    if entry[:children].present?
      all_children_hidden?(entry)
    else
      entry[:show] == false
    end
  end

  def custom_current_page?(path)
    current_route = Rails.application.routes.recognize_path(request.env['PATH_INFO'])
    test_route = Rails.application.routes.recognize_path(path)
    current_route[:controller] == test_route[:controller] &&
      current_route[:action] == test_route[:action]
  rescue ActionController::RoutingError
    false
  end

  def active_entry?(entry)
    if entry[:children].present?
      any_children_active?(entry)
    elsif entry[:path].present?
      custom_current_page?(entry[:path])
    end
  end
end
