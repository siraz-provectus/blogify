PostsSearch = window.PostsSearch =
  init: ->
    PostsSearch.tags()
    PostsSearch.date_range()

  date_range: ->
    $("#from").datepicker
      defaultDate: "+1w"
      format: "dd/mm/yyyy"
      language: "ru"
      changeMonth: true
      numberOfMonths: 3
      onClose: (selectedDate) ->
        $("#to").datepicker "option", "minDate", selectedDate
        return

    $("#to").datepicker
      defaultDate: "+1w"
      format: "dd/mm/yyyy"
      language: "ru"
      changeMonth: true
      numberOfMonths: 3
      onClose: (selectedDate) ->
        $("#from").datepicker "option", "maxDate", selectedDate
        return

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