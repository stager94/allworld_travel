(function($) {
    $.fn.marquee = function(options) {
        return this.each(function() {
            console.log(this);
            var o = $.extend({}, $.fn.marquee.defaults, options);
            var $this = $(this);
            var $container = $('.marquee-container', $this);
            var containerWidth = $container.width();
            var currentPosition;
            var cookiePosition = $.cookie('marquee-position');

            var init = function() {
                if (o.startPosition == false) {
                    $container.css({ 'margin-left': -containerWidth + 'px' })
                } else {
                    $container.css({ 'margin-left': cookiePosition + 'px' })
                }

                $container.show();

                currentPosition = getCurrentPosition();

                setTimeout(animate, 1000);
            }

            var animate = function() {
                currentPosition -= o.speed;

                if (currentPosition < -(containerWidth + o.speed)) {
                    currentPosition = $this.width();
                }

                $.cookie('marquee-position', currentPosition);

                $container.css({ 'margin-left': currentPosition + 'px' })
                setTimeout(animate, 10);
            }

            var getCurrentPosition = function() {
                t = $container.css("margin-left");
                return parseInt(t);
            }

            init();
        });
    };

    // Public: plugin defaults options
    $.fn.marquee.defaults = {
        speed: 0.5,
        startPosition: false
    };
})(jQuery);
