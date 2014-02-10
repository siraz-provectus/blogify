module TagsAutocomplete

  def autocomplete(q)
    where("lower(tags.name) LIKE ?", "#{q.downcase}%").
    order('name ASC').limit(5)
  end
  
  def autocomplete_data(q)
    autocomplete(q).map(&:name)
  end

end