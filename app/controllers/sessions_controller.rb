class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    user = User.find_by email: params[:user][:email]
    return if user.nil?
    return if user.activated.downcase != "true"
    super
  end
end
