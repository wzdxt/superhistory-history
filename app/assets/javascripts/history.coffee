# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('div.content-list div.content-item').each (idx, elem) ->
    current_content_id = undefined
    content_id = $(elem).attr('data-content-id')
    $(elem).delegate 'div.brief-content', 'click', ->
      if content_id != current_content_id
        $('.cache-view').empty().load("/contents/#{content_id}/cache.html")
      current_content_id = content_id

