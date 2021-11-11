class ApplicationController < ActionController::Base
  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # The path used after sign in.
  def after_sign_in_path_for(resource)
    backoffice_dashboard_path
  end
end
