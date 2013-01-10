# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#home-slideshow").cycle
    fx: "fade",
    timeout: 5000,
    speed:   3000,
    pager: '#banner',
    pagerAnchorBuilder: (idx, slide) ->

      # return sel string for existing anchor
      "#banner a(" + (idx) + ")"
    after: ->
      title = $('img', this).attr("alt")
      $(".caption p").html title
  $('.home-special').cycle('scrollLeft');
  $(".sug-slideshow").cycle
    fx:     'scrollHorz',
    prev:   '#prev1',
    next:   '#next1',
    nowrap:  1,
    timeout: 0
