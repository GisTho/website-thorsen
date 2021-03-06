class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :isEditable

  protected

  def handle_unverified_request
    refresh_page
  end

  def refresh_page
    referrer_url = URI.parse(request.referrer) rescue URI.parse(root_path)
    redirect_to referrer_url.to_s
  end

  def isEditable
    return current_user ? current_user.try(:isAdmin) : false
  end

  def authenticate_admin!
    return current_user ? current_user.try(:isAdmin) : false
  end
end
