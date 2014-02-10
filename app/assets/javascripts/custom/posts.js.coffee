PostsManagement = window.PostsManagement =
  init: ->
    PostsManagement.load_sub_categories()
    PostsManagement.tags()

  load_sub_categories: ->
    $(document).on "change", "#parent_category_id", ->
      $.get("/categories/" + $(this).val() + "/load_subcategories", {})

  tags: ->
    $("#tags_list").tagit
      tagSource: (search, showChoices) ->
        that = this
        $.ajax
          url: "/tags/autocomplete.json"
          data:
            q: search.term

          success: (choices) ->
            showChoices that._subtractArray(choices, that.assignedTags())
            return

        return

      show_tag_url: "/tags/"
      singleField: true
      singleFieldNode: $("#post_tag_list")
