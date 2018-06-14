module PagesHelper
  def current_page(path)
    if path == request.env['PATH_INFO']
      return "font__navbar-item-underline"
    else
      return ""
    end
  end
end
