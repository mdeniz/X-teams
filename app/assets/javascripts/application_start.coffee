ready = ->
  $('div.thumbnail[profile="true"]').hover(
    () ->
      $( this ).toggleClass("hovering");
  );
$(document).ready(ready)
$(document).on('page:load', ready)