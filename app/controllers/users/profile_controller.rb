class Users::ProfileController < ApplicationController

  before_action :authenticate_user!

  private
    
  def require_to_be_owner!
    unless current_user.id == user.id
      redirect_to root_url
    end
  end
end