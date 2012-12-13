# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $(".pics").after("<div id=\"banner\">").cycle
    fx: "fade",
    timeout: 5000,
    speed:   3000,
    pager:  "#banner",
    after: ->
      $("#caption").html @alt
  $('.home-special').cycle('scrollLeft');
