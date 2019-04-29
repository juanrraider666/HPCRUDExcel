;
(function ($) {

    function EditableMenu() {
        this.$root = $(".inline-edit-menu-root");

        this.buildSortable();
        this.addEventListeners();
    }

    EditableMenu.prototype.createEditUrl = function ($item, $parent) {
        return Routing.generate('admin_menu_inline_edit', {
            id: $item.data('id'),
            parent: $parent.data('id'),
            _locale: this.$root.data('locale')
        });
    };

    EditableMenu.prototype.createEditConfigUrl = function ($item) {
        return Routing.generate('admin_menu_inline_show_config', {
            id: $item.data('id'),
            _locale: this.$root.data('locale')
        });
    };

    EditableMenu.prototype.createPostData = function ($item) {
        var siblingsPositions = {};

        $item.siblings().each(function () {
            var $this = $(this);
            siblingsPositions[$this.data('id')] = $this.index() + 1;
        });

        return {
            position: $item.index() + 1,
            siblings_positions: siblingsPositions
        };
    };

    EditableMenu.prototype._editMenuSuccess = function (html) {
        this.$root.replaceWith(html);
        this.$root = $(".inline-edit-menu-root");
        $.buildLoyaltyMenu();
        this.buildSortable();
        this.addEventListeners();
    };

    EditableMenu.prototype.updateMenuItem = function ($item, $parent, $originalParent) {
        // Verificamos que solo se ejecute si el item movido se encuentra en el ul del evento actual.
        if (!this.isItemInParent($item, $parent)) {
            return;
        }

        $.ajax({
            url: this.createEditUrl($item, $parent),
            data: this.createPostData($item),
            async: false,
            method: 'POST'
        }).done($.proxy(function (html) {
            // Solo si un item cambia de padre, recargamos el menu
            if ($parent[0] != $originalParent[0]) {
                this._editMenuSuccess(html);
                console.log('Menu Refresh');
            }
        }, this));
    };

    EditableMenu.prototype.isItemInParent = function ($item, $parent) {
        return $parent.find($item).length > 0 && $item.closest('.inline-edit-menu')[0] == $parent[0];
    };

    EditableMenu.prototype.openPossibleDropdown = function ($ul, position) {
        if (position == 0) {
            return;
        }

        $ul.children('li[is-dropdown]').each(function () {
            var $dropdown = $(this);
            if ($dropdown.index() < position) {
                $dropdown.children('ul.dropdown-menu').addClass('force-visible');
            } else {
                $dropdown.children('ul.dropdown-menu').removeClass('force-visible');
            }
        });
    };

    EditableMenu.prototype._onClickConfig = function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();

        var $li = $(event.delegateTarget);
        var self = this;

        $.get(this.createEditConfigUrl($li)).done(function (html) {
            $('#modal-inline-config').remove();
            $('body').append(html);
            $('#modal-inline-config').modal();

            $('form', '#modal-inline-config').on('submit', function (e) {
                e.preventDefault();
                $.post(this.action, $(this).serializeArray(), function (html) {
                    $('#modal-inline-config').modal('hide');
                    self._editMenuSuccess(html);
                });
            });
        });
    };

    EditableMenu.prototype.buildSortable = function () {
        var $sortable = $('.inline-edit-menu').sortable({
            items: 'li[data-id]',
            //connectWith: '.inline-edit-menu',
            forceHelperSize: true,
            forcePlaceholderSize: true,
            helper: 'clone',
            tolerance: 'pointer',
            update: $.proxy(function (event, ui) {
                this.updateMenuItem(ui.item, $(event.target), $(ui.sender || event.target));
            }, this)//,
            //change: $.proxy(function (event, ui) {
            //    this.openPossibleDropdown($(event.target), ui.placeholder.index());
            //}, this),
            //stop: $.proxy(function () {
            //    this.$root.find('ul.dropdown-menu').removeClass('force-visible');
            //}, this)
        });
    };


    EditableMenu.prototype.addEventListeners = function () {
        this.$root.find('.sortable-menu-item')
            .on('click', '.btn-sort-menu', $.proxy(this._onClickConfig, this));
    };

    var editableMenu = new EditableMenu();

})(jQuery);
