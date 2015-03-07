ready = ->
  isMobile = () ->
    try
      document.createEvent("TouchEvent")
      true
    catch e
      false
  #List
  $('div.thumbnail[profile="true"] > div > div.btn-group').addClass('hidden') unless isMobile()
  $('div.thumbnail[profile="true"]').hover(
    () ->
      $( this ).toggleClass("hovering")
      $( this ).find("div.btn-group").toggleClass("hidden") unless isMobile()
  );
  #Alerts
  $('.alert').delay( 5000 ).fadeOut()
$(document).ready(ready)
$(document).on('page:load', ready)