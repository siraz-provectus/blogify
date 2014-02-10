class CommentDecorator < Draper::Decorator
  delegate_all

  def published_at
    "Commented at #{object.created_at.strftime("%H:%M %b %d, %Y")}"
  end

  def user_full_name
  	if object.user
  		if object.user.admin?
      	'Admin'
      else
      	[ object.user.first_name, object.user.last_name ].join(' ')
      end
    else
      'Guest'
  	end
  end
end