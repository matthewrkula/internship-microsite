require([
  'jquery'
], function($){

  $(window).resize(function(e){
    width = $(window).width();
    height = $(window).height();
  });

  var width = $(window).width();
  var height = $(window).height();
  var size = $('.thought').size();

  var i = 0;
  var aboutDiv = $('.about');
  var aboutIsShowing = false;

  aboutDiv.click(function(e){
    fuckTheActiveDiv();
    if(!aboutIsShowing){
      aboutDiv.animate(Animations.aboutDivShow);
      aboutIsShowing = true;
    }else{
      aboutDiv.animate(Animations.aboutDivHide);
      aboutIsShowing = false;
    }
  });

  $('.thought').click(function(e){
    if(!aboutIsShowing){
      var obj = $(this);
      if(obj.hasClass("active"))
          return;
      obj.stop();
      fuckTheActiveDiv();
      becomeNewActiveDiv(obj);
    }
  });

  function fuckTheActiveDiv(){
    $(".active").animate(Animations.fadeToNothing, 300);
    $(".active").removeClass("active");
  }

  function becomeNewActiveDiv(obj){
    obj.addClass("active");
    obj.animate(Animations.moveToCenter);
  }

  function fade(){
    var obj = $($('.thought')[i]);
    i = (i + 1) % size;
    if(!obj.hasClass("active")){

      obj.css({
        "left": Math.random() * (width - 200),
        "top": Math.random() * (height - 200)
      });
      obj.animate(Animations.growSmallToNormal, 3000, "linear", function(){
        $(this).animate(Animations.growNomralToLarge, 1000, "linear", function(){
          $(this).css({
            "width": 0,
            "height": 0
          });
        });
      });
    }
  }

  var Animations = {
    growSmallToNormal: {
      "height": 200,
      "width": 200,
      "opacity": 1,
      "left": "-=50px",
      "top": "-=50px"
    },

    growNomralToLarge: {
      "height": 300,
      "width": 300,
      "opacity": 0,
      "left": "-=25px",
      "top": "-=25px"
    },

    fadeToNothing: {
      "opacity": 0,
      "height": 0,
      "width": 0
    },

    moveToCenter: {
      "height": 200,
      "width": 200,
      "opacity": 1,
      "left": (width / 2 - 100)  +"px",
      "top": "200px"
    },

    aboutDivShow: {
      "left": width / 2 - aboutDiv.width() / 2
    },

    aboutDivHide: {
      "left": -690
    }
  };

  fade();
  setInterval(fade, 500);

});