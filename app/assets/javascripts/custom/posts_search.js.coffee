PostsSearch = window.PostsSearch =
  init: ->
    PostsSearch.tags()

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
      singleFieldNode: $("#search_tag_list")