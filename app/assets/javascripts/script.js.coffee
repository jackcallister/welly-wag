$ ->

  # Setup voting submission
  $("[data-action='submit']").on 'click', ->
    $(this).parent('form').submit()

  $("[data-click]").on 'click', ->
    location = $(this).data('click')
    window.location = location
