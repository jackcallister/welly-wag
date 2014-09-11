module ApplicationHelper

  def display_url(resource)
    "(" + URI(resource.url).host + ")" if resource.url
  end
end
