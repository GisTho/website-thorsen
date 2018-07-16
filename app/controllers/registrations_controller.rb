class RegistrationsController < Devise::RegistrationsController
  def sign_up(resource_name, resource)
    # Overridden to avoid auto sign-in after sign-up.
  end
end
