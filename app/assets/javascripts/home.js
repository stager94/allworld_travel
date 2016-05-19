$(function() {
$.ajax({
  url: '/w',
  data: {
    w: window.innerWidth
  }
})
.done(function( size ) {

  if (window.innerWidth > 1600 && size != 5 ) {
    location.reload();
  }

  if (window.innerWidth < 1600 && window.innerWidth > 1200 && size != 4 ) {
    location.reload();
  }

  if (window.innerWidth < 1200 && window.innerWidth > 992 && size != 3 ) {
    location.reload();
  }

  if (window.innerWidth < 992 && size != 2 ) {
    location.reload();
  }
  });
});
