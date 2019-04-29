;
(function ($) {
    $(document).on('ready', function () {
        $('.loyalty-collection-add').on('click', function (e) {
            e.preventDefault();

            var container = $(this).closest('[data-prototype]');
            if(container.size() === 0){
                container = $(this).closest('.collection-container').find('[data-prototype]:first');
            }
            var proto = container.attr('data-prototype');
            var protoName = container.attr('data-prototype-name') || '__name__';
            // Set field id
            var idRegexp = new RegExp(container.attr('id') + '_' + protoName, 'g');
            proto = proto.replace(idRegexp, container.attr('id') + '_' + (container.children().length ));

            // Set field name
            var parts = container.attr('id').split('_');
            var nameRegexp = new RegExp(parts[parts.length ] + '\\]\\[' + protoName, 'g');
            proto = proto.replace(nameRegexp, parts[parts.length ] + '][' + (container.children().length ));
            $(proto)
                .appendTo(container)
                .trigger('loyalty-admin-append-form-element')
            ;

            $(this).trigger('loyalty-collection-item-added');
        });

        $('[data-prototype]').on('click', '.loyalty-collection-delete', function (e) {
            e.preventDefault();
            $(this).closest('.loyalty-collection-row').remove();
        });
    });
})(jQuery);