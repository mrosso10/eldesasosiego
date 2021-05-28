# frozen_string_literal: true

module ApplicationHelper
  def navbar_toggled?
    cookies['sidebar_toggled'] == 'true' || mobile_device?
  end

  def active_controller?(controller_name, class_name = nil)
    return unless params[:controller] == controller_name

    class_name.nil? ? 'active' : class_name
  end

  def active_controller_and_action?(controller_name, action_name, class_name = nil)
    return unless params[:controller] == controller_name
    return unless params[:action] == action_name

    class_name.nil? ? 'active' : class_name
  end

  def active_controller_and_not_action?(controller_name, action_name, class_name = nil)
    return unless params[:controller] == controller_name
    return unless params[:action] != action_name

    class_name.nil? ? 'active' : class_name
  end

  def active_action?(action_name)
    params[:action] == action_name ? 'active' : nil
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == '1'
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def page_title
    if @title.present?
      "#{@title} - eldesasosiego"
    else
      'eldesasosiego'
    end
  end

  def production?
    Rails.env.production?
  end

  def collection_from_enum(enum_hash)
    enum_hash.keys.map { |value| [value.titleize, value] }
  end

  def ajax_redirect_to(url)
    head 302, x_ajax_redirect_url: url
  end

  def return_to_field(url)
    hidden_field_tag :return_to, url
  end

  def link_to_audit(audit)
    link_to '+', audit.auditable, class: 'btn btn-sm btn-primary', target: '_blank'
  rescue StandardError # rubocop:disable Lint/SuppressedException
  end
end
