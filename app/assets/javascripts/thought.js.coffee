define ["jquery"], ($) ->

  infoDiv = $('.info')            # The div that shows the thought text
  aboutDiv = $('.about')
  appDiv = $('.get-the-app')
  thoughtDivs = $('.thought')     # The array of the thought divs
  size = $('.thought').size()     # Number of thoughts on the page
  unusedThoughts = []             # Array containing thoughts that we can still use

  # Begins the whole fade in/out process for everything
  startAnimation = ->
    thought = $(thoughtDivs[Math.floor(Math.random() * size)])
    if !thought.hasClass("visible") && thought.css('opacity') < 0.2
      fadeIn thought
      setTimeout fadeOut, 3000, thought

  # Fades the thought and gives it new text if new text is available
  fadeIn = (thought) ->
    if unusedThoughts.length > 0
      changeThoughtText thought

    if unusedThoughts.length <= 5
      getMoreThoughts()

    thought.addClass "visible"

  fadeOut = (thought) ->
    thought.removeClass "visible"

  # Removes the first unused thought and puts it in the specified div
  changeThoughtText = (thought) ->
    thought.text(unusedThoughts.splice(0, 1))

  openInfoBox = (thought) ->
    infoDiv.css "border", "3px solid " + thought.css("background-color")
    infoDiv.css('opacity': '1')
    infoDiv.find('span').text thought.text()
    $('.thoughts').css('opacity': '0.6')

  closeInfoBox = ->
    infoDiv.css('opacity': '0')
    $('.thoughts').css('opacity': '1')

  # Ask the server for some more random thoughts
  getMoreThoughts = ->
    $.get "/random.json", (data)->
      for i in [0...data.length]
        unusedThoughts.push data[i].text

      console.log 'unused ' + unusedThoughts.length

  openPopUp = (link, popup) ->
    closePopUp()
    closeInfoBox()
    link.addClass('active')
    popup.fadeIn()

  closePopUp = ->
    $('.active').removeClass('active')
    $('.popup').fadeOut()


  $('.get-the-app .close-btn').click (e)->
    closePopUp()
  $('.about .close-btn').click (e)->
    closePopUp()
  $('.info .close-btn').click (e)->
    closeInfoBox()

  $('#about-link').click (e)->
    if $(this).hasClass('active')
      closePopUp()
    else
      openPopUp($(this), aboutDiv)

  $('#app-link').click (e)->
    if $(this).hasClass('active')
      closePopUp()
    else
      openPopUp($(this), appDiv)

  thoughtDivs.click (e) ->
    if $(this).css('opacity') > 0
      closePopUp()
      openInfoBox $(this)

  getMoreThoughts()
  setInterval startAnimation, 50         # Begins the constant looping