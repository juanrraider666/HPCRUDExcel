;
(function ($) {
    $('.wishlist-add').on('click', function (e) {
        e.preventDefault();
        $.post(this.href);
    });

    $('.show-wishlist').on('click', function (e) {
        e.preventDefault();
        showWishlist(this.href);
    });

    function showWishlist(path) {
        $('#modal-wishlist .wishlist-content').load(path, function () {
            $('#modal-wishlist').modal('show');
        });
    }

    $('#modal-wishlist .wishlist-content').on('click', '.btn-delete', function (e) {
        e.preventDefault();
        var $this = $(this);
        var $tr = $this.closest('tr').hide();
        $.get(this.href).done(function (html) {
            /*
             Como la acción que remueve items redirige al listado de wishlist
             Vamos a usar ese contenido para actualizar el modal
             */
            $('#modal-wishlist .wishlist-table').replaceWith($(html).find('.wishlist-table'));
            if ($('#modal-wishlist .wishlist-table tbody tr').size() === 0) {
                $('#modal-wishlist').modal('hide');
            }
        }).error(function () {
            $tr.show();
        });
    });

    // La página de checkout define esta variable
    if (typeof LOYALTY_CHECKOUT_COMPANY_ADDRESS != 'undefined') {
        $('.checkout-company-address').on('change', function (e) {
            e.preventDefault();
            var $this = $(this);
            if ($this.val()) {
                var address = LOYALTY_CHECKOUT_COMPANY_ADDRESS[$this.val()];

                $('#checkout-shipping-country').html(address.country);
                $('#checkout-shipping-state').html(address.state);
                $('#checkout-shipping-city').html(address.city);
                $('#checkout-shipping-postal-code').html(address.postal_code);
            }
        });
    }
})(jQuery);