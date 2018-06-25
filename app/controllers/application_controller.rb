class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def handle_unverified_request
    refresh_page
  end

  def refresh_page
    referrer_url = URI.parse(request.referrer) rescue URI.parse(root_path)
    redirect_to referrer_url.to_s
  end
end
