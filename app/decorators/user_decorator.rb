class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    if object.admin?
      'Admin'
    else
      [ object.first_name, object.last_name ].join(' ')
    end
  end
end