;
(function ($) {
    $(document).on('ready', function () {

        $('.panel-filter .toggle-filter').on('click', function () {
            $(this).closest('.panel-filter')
                .find('.toggle-filter, .panel-body, .panel-footer').toggleClass('hide');
        });

        $(document).on('ajax.close_modal', function () {
            $('.modal.in').modal('hide');
        }).ajaxStart(function () {
            $.loading();
        }).ajaxComplete(function () {
            $.loading('close');
        });

        //  MENU
        $.buildLoyaltyMenu();
        // END-MENU

        //Dropdown Table-Responsive FIX
        $.fixDropdownTableResponsive();
        //END Dropdown Table-Responsive FIX

    });

    $.fixDropdownTableResponsive = function () {
        var $containers = $('.table-responsive');

        function handleResize() {
            $containers.each(function () {
                var $div = $(this);
                if ($div.width() < $div.get(0).scrollWidth) {
                    $div.css('overflow-x', 'auto');
                } else {
                    $div.css('overflow-x', 'visible');
                }
            });
        }

        if ($containers.length > 0) {
            $(window).on('resize', handleResize);
            handleResize();

            $('.dropdown-menu', $containers).parent().on('shown.bs.dropdown', function () {
                var $dropdown = $(this);
                var $container = $dropdown.closest('.table-responsive');

                if($container.width() >= $container.get(0).scrollWidth){
                    return;
                }

                var containerHeight = $container.height();
                var scrollHeight = $container.get(0).scrollHeight;
                var height = scrollHeight - containerHeight;

                if (height > - 10) {
                    var $divFix = $('<div/>', {
                        height: height + 40,
                    });
                    $container.append($divFix);
                    $dropdown.off('hide.bs.dropdown.fixDiv').on('hide.bs.dropdown.fixDiv', function () {
                        $divFix.remove();
                    });
                }
            });
        }
    };

    $.buildLoyaltyMenu = function () {
        $('header .nav.navbar-nav').loyaltyMenu();
    }

    $.fn.loyaltyMenu = function () {
        $('.dropdown-submenu').unbind('mouseenter mouseleave').hover(function (e) {
            e.preventDefault();
            var $this = $(this);
            var $dropdown = $this.children('.dropdown-menu').hide();
            $this.parent().find('.dropdown-menu').hide();
            $dropdown.show();
            var $parentMenu = $this.parent().find("ul");
            var offset = $parentMenu.offset();
            if ((offset.left + $parentMenu.width()) + 30 > $(window).width()) {
                var newpos = -$parentMenu.width();
            } else {
                var newpos = $this.parent().width();
            }
            $parentMenu.css({left: newpos});
        }, function () {
            var $this = $(this);
            var $dropdown = $this.children('.dropdown-menu').hide();
        });
    };

    $.fn.addError = function (error) {
        return this.each(function () {
            var $error = $("<div class='alert alert-danger alert-dismissible' />").append(
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
            ).append(error);

            $(this).append($error);
        });
    };
})
(jQuery);