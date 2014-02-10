class CategoryDecorator < Draper::Decorator
  delegate_all

  def title
    "#{object.parent.title} > #{object.title}"
  end
end