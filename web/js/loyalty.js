;
(function ($) {

    function prepareLibraries(){
        $('[data-toggle="popover"]').popover();
        $('[data-toggle="tooltip"]').tooltip();
    }



    $(document).on('ready', function () {

        prepareLibraries();

        $('.panel-filter .toggle-filter').on('click', function () {
            $(this).closest('.panel-filter')
                .find('.toggle-filter, .panel-body, .panel-footer').toggleClass('hide');
        });

        $(document).on('ajax.close_modal', function () {
            $('.modal.in').modal('hide');
        }).ajaxStart(function () {
            //$.loading();
        }).ajaxComplete(function () {
            //$.loading('close');
            prepareLibraries();
        });

        //  MENU
        $.buildLoyaltyMenu();
        // END-MENU

        //Dropdown Table-Responsive FIX
        $.fixDropdownTableResponsive();
        //END Dropdown Table-Responsive FIX

        //$('input.datepicker').bsDatepicker({
        //});
    });

    $.fixDropdownTableResponsive = function () {
        var $containers = $('.table-responsive');

        function handleResize() {
            $containers.each(function () {
                var $div = $(this);
                if ($div.width() < $div.get(0).scrollWidth) {
                    $div.css('overflow-x', 'auto').find('.table-responsive-pulldown-fixer').show();
                } else {
                    $div.css('overflow-x', 'visible').find('.table-responsive-pulldown-fixer').hide();
                }
            });
        }

        if ($containers.length > 0) {
            $(window).on('resize', handleResize);
            handleResize();

            $('.dropdown-menu', $containers).parent().on('shown.bs.dropdown', function () {
                var $dropdown = $(this);
                var $container = $dropdown.closest('.table-responsive');

                var containerHeight = $container.height();
                var scrollHeight = $container.get(0).scrollHeight;
                var height = scrollHeight - containerHeight;

                if (height > -5) {
                    var $divFix = $('<div/>', {
                        class: 'table-responsive-pulldown-fixer',
                    }).css({
                        height: height + 20,
                        display: (($container.width() >= $container.get(0).scrollWidth) ? 'none' : 'block'),
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

    $.fn.bsAlert = function (type, message, uniqueId) {
        return this.each(function () {
            var $this = $(this);

            if ($this.find('.alert[data-id="' + uniqueId + '"]').length) {
                return;
            }

            var $error = $("<div />", {
                class: 'alert alert-' + type,
                role: 'alert',
                'data-id': uniqueId
            }).append(message);

            $this.append($error);
        });
    };

    $.fn.bsAlertClear = function (uniqueIds) {
        return this.each(function () {
            var $this = $(this);

            if (typeof uniqueIds != 'undefined') {
                $.each(uniqueIds, function (index, uniqueId) {
                    var $alert = $this.find('.alert[data-id="' + uniqueId + '"]').remove();
                });
            } else {
                $this.html('');
            }
        });
    };

    $.fn.addError = function (error, uniqueId) {
        return this.each(function () {
            $(this).bsAlert('danger', error, uniqueId);
        });
    };

    $.fn.datepicker.defaults.language = LOYALTY_GLOBALS.locale;
    $.fn.datepicker.defaults.autoclose = true;
    $.fn.bsDatepicker = $.fn.datepicker.noConflict();
})
(jQuery);