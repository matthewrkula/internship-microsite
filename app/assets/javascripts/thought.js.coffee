define ["jquery"], ($) ->

  size = $('.thought').size()
  unusedThoughts = []
  infoDiv = $(".info")

  startAnimation = ->
    thought = $($(".thought")[Math.floor(Math.random() * size)])
    if !thought.hasClass("active") && thought.css('opacity') < 0.2
      fadeIn thought
      setTimeout fadeOut, 1700, thought

  fadeIn = (thought) ->
    if unusedThoughts.length > 0
      changeThoughtText thought

    if unusedThoughts.length <= 5
      getMoreThoughts()

    thought.addClass "active"

  fadeOut = (thought) ->
    thought.removeClass "active"

  changeThoughtText = (thought) ->
    thought.text(unusedThoughts.splice(0, 1))
    

  fadeInInfoBox = (thought) ->
    infoDiv.fadeIn()
    infoDiv.css "border", "3px solid " + thought.css("background-color")
    infoDiv.text thought.text()

  fadeOutInfoBox = ->
    infoDiv.css('display', 'none')

  getMoreThoughts = ->
    $.get "/random.json", (data)->
      for i in [0...data.length]
        unusedThoughts.push data[i].text

      console.log 'unused ' + unusedThoughts.length


  $(".thought").click (e) ->
    if $(this).css('opacity') > 0
      fadeInInfoBox $(this)

  infoDiv.click (e) ->
    fadeOutInfoBox()

  getMoreThoughts()
  setInterval startAnimation, 400
