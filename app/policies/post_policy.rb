class PostPolicy
  attr_reader :user, :post

  def initialize(user, post=nil)
    @user = user
    @post = post
  end

  def can_manage?
    @user && @user.admin?
  end
end