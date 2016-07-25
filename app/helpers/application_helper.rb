module ApplicationHelper

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def admin_mode?
    session[:admin]
  end

  def admin_mode_tag
    "(Admin Mode Active)" if admin_mode?
  end

end
