// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

require([
  'jquery'
], function($){

  $('.thought').click(function(e){
      var obj = $(this);
      if(obj.hasClass("active"))
          return;
      obj.stop();
      fuckTheActiveDiv();
      becomeNewActiveDiv(obj);
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

  $(window).resize(function(e){
      width = $(window).width();
      height = $(window).height();
  });
  var width = $(window).width();
  var height = $(window).height();
  var size = $('.thought').size();
  console.log("size:" + size);

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
      }
  };

  var i  = 0;
  fade();
  setInterval(fade, 500);

});