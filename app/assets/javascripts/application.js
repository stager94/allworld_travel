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
//= require select2
//= require search-autocomplete
//= require moment

$(function() {
  moment.locale('ru');
  $('.marquee').marquee({
    startPosition: $.cookie('marquee-position')
  });

  $(".country-select").select2({
    width: "300px",
    maximumSelectionLength: 3
  });

  $(".news-country-select").select2({
    width: "300px",
    maximumSelectionLength: 3
  });

  $(".news-country-select").val($(".news-country-select").attr("data-selected")).trigger("change");

  $(".country-select").change(function(){
    $(this).parent().submit();
  });

  if ($(".select2.select2-container").height() > 40)
  {
    $(".select2.select2-container").addClass("arrow-hidden");
  }

  $(".country-select").on("select2:open",function(){
    if ($(".select2.select2-container").height() < 40)
    {
      $(".select2.select2-container").addClass("opened");
    }
  });

  $(".country-select").on("select2:close",function(){
    $(".select2.select2-container").removeClass("opened");
    $(".select2.select2-container").removeClass("arrow-hidden");

    if ($(".select2.select2-container").height() > 40)
    {
      $(".select2.select2-container").addClass("arrow-hidden");
    }
  });

  $(".tabmenu:not(.constant) .tabmenu-header .tab-link").click(function(){
    $(".tabmenu:not(.constant) .tab-panel").removeClass("active");
    $(".tabmenu:not(.constant) .tab-panel[id='"+$(this).children("span").attr("tab-id")+"']").addClass("active");

    $(".tabmenu:not(.constant) .tabmenu-header .tab-link").removeClass("active");
    $(this).addClass("active");
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
      linesCount = $(bloks_total[i]).data('lines-count') || 8
      maxheight = linesCount * 20.5 + 10;
      // console.log(blok_height, $(bloks_total[i]).data('lines-count') || 3);
      if(blok_height > maxheight){
        $(bloks_total[i]).css('max-height', maxheight + 'px');
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
      linesCount = $(blok).data('lines-count') || 8
      maxheight = linesCount * 20.5 + 10;

       blok.css('max-height',maxheight+'px');
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

window.getTransform = function(el) {
  css = $(el).css('-webkit-transform');
  return css.match(/ma/) && css.match(/-?\d+(?!d)/g)[css.match(/3d/) ? 12 : 4];
}
window.constructTransform = function(pos) {
  return 'translate3d(' + (pos/* + (_001 ? 0.001 : 0)*/) + 'px,0,0)'; // 0.001 to remove Retina artifacts
}

$(document).ready(function(){
    $(document).delegate(".fotorama__stage", "doubletap dblclick", function(){
            var fotorama = $('.fotorama')
                    .fotorama({allowfullscreen: true})
                    .data('fotorama');
            fotorama.requestFullScreen();
    });


    $('#country-globe').bind('contextmenu', function(e) {
      return false;
    });

  Share = {
    vkontakte: function(purl, ptitle, pimg, text, redirect_url) {
      url  = 'http://vkontakte.ru/share.php?';
      url += 'url='          + encodeURIComponent(purl);
      url += '&title='       + encodeURIComponent(ptitle);
      url += '&description=' + encodeURIComponent(text);
      url += '&image='       + encodeURIComponent(pimg);
      url += '&noparse=true';
      Share.popup(url, redirect_url);
    },
    odnoklassniki: function(purl, text, redirect_url) {
      url  = 'http://www.odnoklassniki.ru/dk?st.cmd=addShare&st.s=1';
      url += '&st.comments=' + encodeURIComponent(text);
      url += '&st._surl='    + encodeURIComponent(purl);
      Share.popup(url, redirect_url);
    },
    facebook: function(purl, ptitle, pimg, text) {
      url  = 'http://www.facebook.com/sharer.php?s=100';
      url += '&p[title]='     + encodeURIComponent(ptitle);
      url += '&p[summary]='   + encodeURIComponent(text);
      url += '&p[url]='       + encodeURIComponent(purl);
      url += '&p[images][0]=' + encodeURIComponent(pimg);
      Share.popup(url);
    },
    twitter: function(purl, ptitle, redirect_url) {
      url  = 'http://twitter.com/share?';
      url += 'text='      + encodeURIComponent(ptitle);
      url += '&url='      + encodeURIComponent(purl);
      url += '&counturl=' + encodeURIComponent(purl);
      Share.popup(url, redirect_url);
    },
    mailru: function(purl, ptitle, pimg, text) {
      url  = 'http://connect.mail.ru/share?';
      url += 'url='          + encodeURIComponent(purl);
      url += '&title='       + encodeURIComponent(ptitle);
      url += '&description=' + encodeURIComponent(text);
      url += '&imageurl='    + encodeURIComponent(pimg);
      Share.popup(url)
    },
    gplus: function(purl) {
      url  = 'https://plus.google.com/share?';
      url += '&url=' + encodeURIComponent(purl);
      Share.popup(url);
    },

    popup: function(url, redirect_url) {
      var win = window.open(url,'importwindow','toolbar=0,status=0,width=626,height=436');
      if (redirect_url) {
        var pollTimer = window.setInterval(function() {
            if (win.closed !== false) {
                window.clearInterval(pollTimer);
                window.location = redirect_url;
            }
        }, 200);
      }

    }
  };

  $(".gplus-button").click(function(){
    Share.gplus(window.location);
  });

  $(".facebook-button").click(function(){
    Share.facebook(window.location, "Allworld", "", "Visit us");
  });

  $(".twitter-button").click(function(){
    Share.twitter(window.location, "Visit us");
  });

  $(".vk-button").click(function(){
    Share.vkontakte(window.location, "Allworld", "", "Visit us");
  });

  $(".od-button").click(function(){
    Share.odnoklassniki(window.location, "Visit us");
  });

  $(".mailru-button").click(function(){
    Share.mailru(window.location, "Allworld", "", "Visit us");
  });

});


