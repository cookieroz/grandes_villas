# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.home-special').cycle('scrollLeft')
  $(".sug-slideshow").cycle
    fx:     'scrollHorz'
    prev:   '#prev1'
    next:   '#next1'
    nowrap:  1,
    timeout: 0

  $("#home-slideshow").cycle
    fx: "fade"
    timeout: 5000
    speed:   3000
    pager: '#banner'
    after: ->
      title = $('img', this).attr("alt")
      $(".caption p").html title

#
#Copyright 2011 : Simone Gianni <simoneg@apache.org>
#
#Released under The Apache License 2.0
#http://www.apache.org/licenses/LICENSE-2.0
#
#
(->
  createPlayer = (jqe, video, options) ->
    ifr = $("iframe", jqe)
    if ifr.length is 0
      ifr = $("<iframe scrolling=\"no\">")
      ifr.addClass "player"
    src = "http://www.youtube.com/embed/" + video.id
    if options.playopts
      src += "?"
      for k of options.playopts
        src += k + "=" + options.playopts[k] + "&"
      src += "_a=b"
    ifr.attr "src", src
    jqe.append ifr
  createCarousel = (jqe, videos, options) ->
    car = $("div.carousel", jqe)
    if car.length is 0
      car = $("<div>")
      car.addClass "carousel"
      jqe.append car
    $.each videos, (i, video) ->
      options.thumbnail car, video, options

  createThumbnail = (jqe, video, options) ->
    imgurl = video.thumbnails[0].url
    img = $("img[src=\"" + imgurl + "\"]")
    return  if img.length isnt 0
    img = $("<img>")
    img.addClass "thumbnail"
    jqe.append img
    img.attr "src", imgurl
    img.attr "title", video.title
    img.click ->
      options.player options.maindiv, video, $.extend(true, {}, options,
        playopts:
          autoplay: 1
      )

  defoptions =
    autoplay: false
    user: null
    carousel: createCarousel
    player: createPlayer
    thumbnail: createThumbnail
    loaded: ->

    playopts:
      autoplay: 0
      egm: 1
      autohide: 1
      fs: 1
      showinfo: 0

  $.fn.extend youTubeChannel: (options) ->
    md = $(this)
    md.addClass "youtube"
    md.addClass "youtube-channel"
    allopts = $.extend(true, {}, defoptions, options)
    allopts.maindiv = md
    $.getJSON "http://gdata.youtube.com/feeds/users/" + allopts.user + "/uploads?alt=json-in-script&format=5&callback=?", null, (data) ->
      feed = data.feed
      videos = []
      $.each feed.entry, (i, entry) ->
        video =
          title: entry.title.$t
          id: entry.id.$t.match("[^/]*$")
          thumbnails: entry.media$group.media$thumbnail

        videos.push video

      allopts.allvideos = videos
      allopts.carousel md, videos, allopts
      allopts.player md, videos[0], allopts
      allopts.loaded videos, allopts


)()
$ ->
  $("#player").youTubeChannel user: "UCUbXEmiKYLD5A3hU8AZLWGw"

