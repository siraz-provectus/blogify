class UserPolicy
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def can_manage?
    @user.admin?
  end
end