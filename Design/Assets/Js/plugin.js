$(document).ready(function() {

    /*=====================================
    /*============= Preloader ============
    /*===================================== */

    $(window).on('load', function() {

        $('#preloader').fadeOut(300);

    });

    /*=====================================
    /*================ Wow ===============
    /*===================================== */

    if ($(window).width() > 767) {
        var wow = new WOW({
            boxClass: 'wow',
            animateClass: 'animated',
            offset: 0,
            mobile: false,
            live: true
        });
        new WOW().init();
    }


    /*=====================================
    /*============= Owl Carousel ==========
    /*===================================== */


    /*======= Teachers =========== */
    function teachers() {

        $("#owl-teachers").owlCarousel({
            pagination: false,
            slideSpeed: 800,
            paginationSpeed: 800,
            smartSpeed: 500,
            autoplay: true,
            singleItem: true,
            loop: true,
            nav: true,
            dots: false,
            responsive: {
                0: {
                    items: 1
                },
                580: {
                    items: 1
                },
                900: {
                    items: 1
                }
            }
        });
    };


    /*======= Popular Teachers =========== */
    function popularTeachers() {

        $("#popular-teachers").owlCarousel({
            pagination: false,
            slideSpeed: 800,
            paginationSpeed: 800,
            smartSpeed: 500,
            autoplay: true,
            singleItem: true,
            loop: true,
            nav: true,
            dots: false,
            responsive: {
                0: {
                    items: 1
                },
                580: {
                    items: 2
                },
                900: {
                    items: 4
                }
            }
        });
    };

    /*=====================================
    /*============= FancyBox ==============
    /*===================================== */

    $('[data-fancybox]').fancybox({
        youtube: {
            controls: 0,
            showinfo: 0
        },

        protect: true,

        vimeo: {
            color: 'f00'
        },

        spinnerTpl: '<div class="fancybox-loading"></div>',
    });

});