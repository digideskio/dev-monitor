$ ->
  $(".boris_table").on "click", "button.start", ->
    boris = $(this).data("boris")
    $.ajax
      url: "/boris/#{boris}/start"
      method: "POST"


  $(".boris_table").on "click", "button.stop", ->
    boris = $(this).data("boris")
    $.ajax
      url: "/boris/#{boris}/stop"
      method: "POST"