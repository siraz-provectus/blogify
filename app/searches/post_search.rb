class PostSearch < Searchlight::Search

  search_on Post.order('created_at DESC')

  searches :category_id, :tag_list, :full_text, :date

  def search_category_id
    search.by_category_id(category_id)
  end

  def search_tag_list
    search.by_tag_list(tag_list)
  end

  def search_full_text
    search.by_full_text(full_text)
  end

  def search_date
    search.by_date(start_date, end_date)
  end
end