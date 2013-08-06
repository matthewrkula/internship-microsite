# define([
#   'jquery'
# ], ($) ->

#   fuckTheActiveDiv = ->
#     $(".active").animate Animations.fadeToNothing, 300
#     $(".active").removeClass "active"
#   becomeNewActiveDiv = (obj) ->
#     obj.addClass "active"
#     obj.animate Animations.moveToCenter
#   fade = ->
#     obj = $($(".thought")[i])
#     i = (i + 1) % size
#     unless obj.hasClass("active")
      
#       obj.css
#         "left": Math.random() * (width - 200)
#         "top": Math.random() * (height - 200)

#       console.log obj

#       obj.animate Animations.growSmallToNormal, 3000, "linear", ->
#         $(this).animate Animations.growNomralToLarge, 1000, "linear", ->
#           $(this).css
#             width: 0
#             height: 0



#   $(".thought").click (e) ->
#     obj = $(this)
#     return  if obj.hasClass("active")
#     obj.stop()
#     fuckTheActiveDiv()
#     becomeNewActiveDiv obj

#   width = $(window).width()
#   height = $(window).height()
#   size = $(".thought").size()
#   console.log "size:" + size
#   Animations =
#     growSmallToNormal:
#       height: 200
#       width: 200
#       opacity: 1
#       left: "-=50px"
#       top: "-=50px"

#     growNomralToLarge:
#       height: 300
#       width: 300
#       opacity: 0
#       left: "-=25px"
#       top: "-=25px"

#     fadeToNothing:
#       opacity: 0
#       height: 0
#       width: 0

#     moveToCenter:
#       height: 200
#       width: 200
#       opacity: 1
#       left: (width / 2 - 100) + "px"
#       top: "200px"

#   i = 0
#   fade()
#   setInterval fade, 500

# )