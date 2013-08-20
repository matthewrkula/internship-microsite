define ["jquery", "jquery.flex.min"], ($) ->

  infoDiv = $('.info')            # The div that shows the thought text
  aboutDiv = $('.about')          # The div that shows the about text
  appDiv = $('.get-the-app')      # The div that contains the links to the app stores
  thoughtDivs = $('.thought')     # The array of the thought divs
  size = $('.thought').size()     # Number of thoughts on the page
  unusedThoughts = []             # Array containing thoughts that we can still use


  # Removes the first unused thought and puts it in the specified div
  changeThoughtData = (thought) ->
    newThought = unusedThoughts.splice(0, 1)[0]
    thought.data('text', newThought.text)
    thought.data('image', newThought.link)
    unusedThoughts.push(newThought)

  openInfoBox = (thought) ->
    infoDiv.css(
      'opacity': '1'
      'top': thought.position().top + thought.height() + 100
      'left': thought.position().left - (infoDiv.width() / 5)
    )
    infoDiv.find('span').text thought.data('text')
    infoDiv.find('.info-img').attr('src', thought.data('image'))

  closeInfoBox = ->
    infoDiv.css('opacity': '0')

  # Ask the server for some more random thoughts
  getMoreThoughts = ->
    $.get "/random.json", (data)->
      for i in [0...data.length]
        unusedThoughts.push(
          text: data[i].text 
          link: data[i].link
          color: data[i].color
        )

  openPopUp = (link, popup) ->
    closePopUp()
    closeInfoBox()
    link.closest('span').addClass('active')
    popup.fadeIn()

  closePopUp = ->
    $('.active').removeClass('active')
    $('.popup').fadeOut()

  # Fade in on mouseover thoughts
  thoughtDivs.hover(->
    $(this).addClass "visible"
    $(this).find('.thought-img').addClass "visible"
  , ->
    $(this).removeClass "visible"
    $(this).find('.thought-img').removeClass "visible"
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

  startBlowing = (t)->
    thought = t || $(thoughtDivs[Math.floor(Math.random() * size)])
    thought.addClass("blowing")
    setTimeout(->
      thought.removeClass("blowing")
    , Math.floor(Math.random()*999+400)
    )

  blowWind = ->
    a = []
    setTimeout startBlowing, 100, $(".thought:eq(0)")
    setTimeout startBlowing, 200, $(".thought:eq(1)")
    setTimeout startBlowing, 300, $(".thought:eq(2)")
    setTimeout startBlowing, 400, $(".thought:eq(3)")
    setTimeout startBlowing, 500, $(".thought:eq(4)")

  blowWind()
  setInterval blowWind, 3000
  startBlowing()
  setInterval startBlowing, 800

  # bg = ["cherry_blossom", "cliffs", "forest", "harbor"][Math.floor(Math.random()*4)]
  # $('.thoughts').css('background', "url(/assets/backgrounds/#{bg}.jpg)")

  # getMoreThoughts()
  # setInterval startAnimation, 200         # Begins the constant looping