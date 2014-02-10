PostsManagement = window.PostsManagement =
  init: ->
    PostsManagement.load_sub_categories()

  load_sub_categories: ->
    $(document).on "change", "#parent_category_id", ->
      $.get("/categories/" + $(this).val() + "/load_subcategories", {})
