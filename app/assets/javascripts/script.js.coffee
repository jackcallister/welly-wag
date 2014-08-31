$ ->

  # Setup voting submission
  $("[data-action='submit']").on 'click', ->
    $(this).parent('form').submit()

  $("[data-click]").on 'click', ->
    location = $(this).data('click')
    window.location = location

  $(".slide-out").on 'focus', ->
    $(this).animate({height: '320px'}, "fast")
