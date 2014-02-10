class CommentDecorator < Draper::Decorator
  delegate_all

  def published_at
    "Commented at #{object.created_at.strftime("%H:%M %b %d, %Y")}"
  end
end