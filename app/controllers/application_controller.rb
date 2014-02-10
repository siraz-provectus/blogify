class ApplicationController < ActionController::Base
	include Pundit
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

   private

  def require_to_be_admin!
    unless current_user.admin?
      redirect_to root, notice: 'Unauthorized access'
    end
  end
end
