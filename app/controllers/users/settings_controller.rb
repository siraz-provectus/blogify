class Users::SettingsController < Users::ProfileController

  expose :user, attributes: :user_params

  before_action :require_to_be_owner!

  def edit
  end

  def availability_and_notifications
  end

  def update
    if user.save
      redirect_to redirect_path, notice: 'Settings updated' 
    else
      render action: "edit" 
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :terms_of_service
    )
  end
end