# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  current_content_id = undefined
  $('div.content-list div.content-item').each (idx, elem) ->
    content_url = $(elem).attr('data-content-url')
    content_id = $(elem).attr('data-content-id')
    $(elem).delegate 'div.brief-content', 'click', ->
      if content_id != current_content_id
        $('.cache-view').empty().load "/contents/#{content_id}/cache.html", ->
            fetch_img_by_iframe(content_url)
      current_content_id = content_id

  fetch_img_by_iframe = (url) ->
    $('<iframe>').attr('src', url).appendTo($('#iframe_img').empty())
    setTimeout(->
      $('#iframe_img').contents().document
    , 200)

