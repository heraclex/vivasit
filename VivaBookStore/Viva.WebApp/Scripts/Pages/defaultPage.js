;
(function ($, Viva, undefined) {

    // Create page object with public methods
    var page = function () {
        // pulic methods
        return {
            Init: init
        };

        // this method is used for init page at client side
        function init() {
            // Ref: https://bootsnipp.com/snippets/featured/link-to-top-page

            $(window).scroll(function () {
                if ($(this).scrollTop() > 50) {
                    $('#back-to-top').fadeIn();
                } else {
                    $('#back-to-top').fadeOut();
                }
            });
            // scroll body to 0px on click
            $('#back-to-top').click(function () {
                $('#back-to-top').tooltip('hide');
                $('body,html').animate({
                    scrollTop: 0
                }, 800);
                return false;
            });

            $('#back-to-top').tooltip('show');
        }

    }();

    Viva.HomePage = page;

})(jQuery, window.Viva = window.Viva || {});