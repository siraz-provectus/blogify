class PostDecorator < Draper::Decorator

	include Rails.application.routes.url_helpers
	
  delegate_all

  def published_at
    "Published at #{object.created_at.strftime("%H:%M %b %d, %Y")}"
  end
 
  def comments_count
    h.link_to " | #{h.pluralize(object.comments_count, 'comment', 'comments')}",
    "#{post_path(post)}#comments"
  end
end