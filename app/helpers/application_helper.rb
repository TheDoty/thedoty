module ApplicationHelper
  # For main navigation, set the active li based on the controller
  def nav_li(controller, description)
    url = url_for :controller => controller, :action => :index

    content_tag(:li, 'ng-class' => "{active: section == '#{controller}'}".html_safe) do
      link_to(description, url)
    end
  end
end
