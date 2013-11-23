module ApplicationHelper
  # For main navigation, set the active li based on the controller
  def nav_li(controller, description)
    url = url_for :controller => controller, :action => :index

    if params[:controller].to_s == controller.to_s
      content_tag(:li, :class => 'active') do
        link_to(description, url)
      end
    else
      content_tag(:li) do
        link_to(description, url)
      end
    end
  end
end
