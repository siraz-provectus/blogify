ObjectLoad = window.ObjectLoad = pagination: ->
  $container = $("#b-feeds__container")
  $container.infinitescroll
    navSelector: "#page-nav"
    nextSelector: "#page-nav a"
    itemSelector: ".b-post"
    loading:
      finishedMsg: ""
      msgText: "<em class='glows_loading_spinner'>Loading ...</em>"
      img: "http://glowcon.s3.amazonaws.com/images/spinner.gif"
  , (newElements) ->
    $("#b-feeds__container").append $(newElements)
    return

  return