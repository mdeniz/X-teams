@taskAchieved = (id, achieved) ->
  new_value = parseFloat(achieved)
  new_value = 100.0 if new_value > 100.0
  new_value = 0.0 if new_value < 0.0
  task_bar = $('#task_item_id_'+id+' div[role=progressbar]')
  task_bar.html(new_value + '%')
  task_bar.css('width', new_value + '%')
  task_bar.attr('aria-valuenow', new_value)

@isMobile = () ->
  try
    document.createEvent("TouchEvent")
    true
  catch e
    false

ready = ->
  #List, show buttons always if is mobile
  $('div.thumbnail[profile="true"] div.btn-group').addClass('hidden') unless isMobile()
  $('div.thumbnail[profile="true"]').hover(
    () ->
      $( this ).toggleClass("hovering")
      $( this ).find("div.btn-group").toggleClass("hidden") unless isMobile()
  );

  # Unlink mutant from team
  $("div.thumbnail[profile=true] a[data-remote][data_action=remove_from_team]").on("ajax:success", (e, data, status, xhr) ->
    $(this).parents('div[profile=true]').fadeOut()
  ).on "ajax:error", (e, data, status, xhr) ->
    alert ("Error")

  #Alerts
  $('.alert').delay( 5000 ).fadeOut()

$(document).ready(ready)
$(document).on('page:load', ready)