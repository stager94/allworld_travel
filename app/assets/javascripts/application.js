// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap
//= require signup
//= require turbolinks
//= require jquery.cookie
//= require jquery.marquee
//= require jquery.doubletap

$(function() {

  $('.marquee').marquee({
    startPosition: $.cookie('marquee-position')
  });


  $( "#hidemarquee" ).click(function() {
    $( "#marqueeblock" ).toggle();
        
    $.ajax({ 
      url: '/ajax/showhide',
      data: { "showed": $(this).attr('class')},
      type: 'post',
      success: function(result) {
           $("#hidemarquee").removeClass();
           $("#hidemarquee").addClass(result);
      }
    });
  });

  $('[data-toggle="tooltip"]').tooltip();
});

$(function() {
  $('.closeopen').click(function() {
    $(this).toggleClass( "fa-angle-up" ).toggleClass( "fa-angle-down" )
    $(this).parent().toggleClass( "opened" ).toggleClass( "closed" );
    
});

});


$(function() {
  bloks_total = $('body').find('.samtext');
  if(bloks_total.length){
    for(i=0; i < bloks_total.length;i++){
      blok_height = Number($(bloks_total[i]).css('height').replace('px',''));
      if(blok_height > 195){
        $(bloks_total[i]).css('max-height','180px');
        $(bloks_total[i]).parent().find('.next').show();
      }
    }
  }
});

$(function() {
$('.next').click(function() {
  is_parent = $(this).parent();
  blok = is_parent.find('.samtext');
  if(blok.css('max-height') != 'none'){
     blok.css('max-height','');
     $(this).find('span').removeClass( "fa-chevron-circle-down" ).addClass( "fa-chevron-circle-up" );
  } else {
     blok.css('max-height','180px');   
     $(this).find('span').removeClass( "fa-chevron-circle-up" ).addClass( "fa-chevron-circle-down" );
  }
  return false;
});
});


$(function() {
  bloks_total = $('body').find('.samtextbig');
  if(bloks_total.length){
    for(i=0; i < bloks_total.length;i++){
      blok_height = Number($(bloks_total[i]).css('height').replace('px',''));
      if(blok_height > 325){
        $(bloks_total[i]).css('max-height','320px');
        $(bloks_total[i]).parent().find('.next').show();
      }
    }
  }
});

$(function() {
$('.next').click(function() {
  is_parent = $(this).parent();
  blok = is_parent.find('.samtextbig');
  if(blok.css('max-height') != 'none'){
     blok.css('max-height','');
     $(this).find('span').removeClass( "fa-chevron-circle-down" ).addClass( "fa-chevron-circle-up" );
  } else {
     blok.css('max-height','320px');   
     $(this).find('span').removeClass( "fa-chevron-circle-up" ).addClass( "fa-chevron-circle-down" );
  }
  return false;
});
});



$(document).ready(function(){
    $(document).delegate(".fotorama__stage", "doubletap dblclick", function(){
            var fotorama = $('.fotorama')
                    .fotorama({allowfullscreen: true})
                    .data('fotorama');
            fotorama.requestFullScreen();
    });

});
