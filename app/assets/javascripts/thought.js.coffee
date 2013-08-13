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
    if !thought.hasClass("visible") && thought.find('.thought-img').css('opacity') < 0.2
      fadeIn thought
      setTimeout fadeOut, 3000, thought

  # Fades the thought and gives it new text if new text is available
  fadeIn = (thought) ->
    if unusedThoughts.length > 0
      changeThoughtData thought

    if unusedThoughts.length <= 5
      getMoreThoughts()

    thought.addClass "visible"
    thought.find('.thought-img').addClass "visible"

  fadeOut = (thought) ->
    thought.removeClass "visible"
    thought.find('.thought-img').removeClass "visible"

  # Removes the first unused thought and puts it in the specified div
  changeThoughtData = (thought) ->
    newThought = unusedThoughts.splice(0, 1)[0]
    thought.find('.thought-text').text(newThought.text)
    thought.find('.thought-img').attr('src', newThought.link)
    unusedThoughts.push(newThought)

  openInfoBox = (thought) ->
    # infoDiv.css "border", "3px solid " + thought.css("background-color")
    infoDiv.css('opacity': '1')
    infoDiv.find('span').text thought.find('.thought-text').text()
    infoDiv.find('.info-img').attr('src', thought.find('.thought-img').attr('src'))
    infoDiv.find('.overlay').css('pointer-events', 'auto')
    $('.thoughts').css('opacity': '0.6')

  closeInfoBox = ->
    infoDiv.css('opacity': '0')
    infoDiv.find('.overlay').css('pointer-events', 'none')
    $('.thoughts').css('opacity': '1')

  # Ask the server for some more random thoughts
  getMoreThoughts = ->
    $.get "/random.json", (data)->
      for i in [0...data.length]
        unusedThoughts.push(
          text: data[i].text 
          link: data[i].link
        )

      console.log 'unused ' + unusedThoughts[0].link

  openPopUp = (link, popup) ->
    closePopUp()
    closeInfoBox()
    link.closest('span').addClass('active')
    popup.fadeIn()

  closePopUp = ->
    $('.active').removeClass('active')
    $('.popup').fadeOut()

  infoDiv.hover(->
    $(this).find('.overlay').css('opacity', '0.8')
  , ->
    $(this).find('.overlay').css('opacity', '0')
  )

  $('.close-btn').click (e)->
    closePopUp()
    closeInfoBox()

  $('#about-link').click (e)->
    if $(this).closest("span").hasClass('active')
      closePopUp()
    else
      openPopUp($(this), aboutDiv)

  $('#app-link').click (e)->
    if $(this).closest("span").hasClass('active')
      closePopUp()
    else
      openPopUp($(this), appDiv)

  thoughtDivs.click (e) ->
    if $(this).find('.thought-img').css('opacity') > 0
      closePopUp()
      openInfoBox $(this)

  getMoreThoughts()
  setInterval startAnimation, 200         # Begins the constant looping