function DealsAdmin(pageUrl, selectors) {
    this.pageUrl = decodeURIComponent(pageUrl);

    this.selectors = $.extend({
        table: 'table.table-deals-list',
        table_container: '.deals-table-container',
        table_summary: '.table-summary',
        modal_show: '#modal-deal-show',
        modal_show_content: '.deal-show-content',
        modal_form: '#modal-status-form',
        modal_form_content: '.status-form-content',
        modal_confirm: '#modal-confirm',
        modal_confirm_content: '.confirm-content',
        modal_confirm_header: '.confirm-header',
        modal_submits: '#submit',
        form_submits: 'form :submit',
        form_errors: '.form-errors',
        btn_show: '.show-deal',
        btn_status: '.change-status',
        btn_confirm: '.modal-confirm',
        btn_show_comments: '.show-comments'
    }, selectors);
}

DealsAdmin.prototype.refreshList = function () {
    $.get(this.pageUrl).done($.proxy(function (html) {
        $(this.selectors.table).html($(html).find(this.selectors.table).html());
        $(this.selectors.table_summary).html($(html).find(this.selectors.table_summary).html());
    }, this));
};

DealsAdmin.prototype.showDealInfo = function (url) {
    $(this.selectors.modal_show_content, this.selectors.modal_show).load(url, $.proxy(function () {
        $(this.selectors.modal_show).modal('show');
    }, this));
};

DealsAdmin.prototype.showConfirm = function (url, header) {
    $(this.selectors.modal_confirm_header, this.selectors.modal_confirm).html(header);
    $(this.selectors.modal_confirm_content, this.selectors.modal_confirm).load(url, $.proxy(function () {
        $(this.selectors.modal_confirm).modal('show');
    }, this));
};

DealsAdmin.prototype.showStatusForm = function (url) {
    $(this.selectors.modal_form_content, this.selectors.modal_form).load(url, $.proxy(function () {
        $(this.selectors.modal_form).modal('show');
    }, this));
};

DealsAdmin.prototype._onClickShowInfo = function (e) {
    e.preventDefault();
    this.showDealInfo(e.currentTarget.href);
};

DealsAdmin.prototype._onClickBtnToConfirm = function (e) {
    e.preventDefault();
    var $el = $(e.currentTarget);
    this.showConfirm(e.currentTarget.href, $el.data('header'));
};

DealsAdmin.prototype._onClickShowForm = function (e) {
    e.preventDefault();
    this.showStatusForm(e.currentTarget.href);
};

DealsAdmin.prototype._onCloseModalForm = function (e) {
    e.preventDefault();
    $(this.selectors.modal_form).modal('hide');
};

DealsAdmin.prototype._onShownModalForm = function () {
    this.prepareModalForm();
};

DealsAdmin.prototype._onSubmitModalConfirm = function (e) {
    e.preventDefault();
    var $form = $(e.currentTarget);
    // console.debug(new FormData($form[0]), $form[0]);
    $.ajax({
        method: $form.attr('method'),
        url: $form.attr('action'),
        data: new FormData($form[0]),
        processData: false,
        contentType: false
    }).done(function () {
        $(document).trigger('refresh-list').trigger('ajax.close_modal');
    }).fail(function (xhr) {
        if (xhr.status == 400) {
            $form.replaceWith($(xhr.responseText).find('form'));
        }
    });
};

DealsAdmin.prototype._onCloseModalConfirm = function (e) {
    e.preventDefault();
    $(this.selectors.modal_confirm).modal('hide');
};

DealsAdmin.prototype.prepareModalForm = function () {
    var $modal = $(this.selectors.modal_form);
    $modal.find('form :input:first').focus();
    $modal.find(this.selectors.form_errors).html('');
};

DealsAdmin.prototype.enableSubmits = function () {
    $([this.selectors.modal_submits, this.selectors.form_submits].join(',')).button('reset');
};

DealsAdmin.prototype.disableSubmits = function () {
    $([this.selectors.modal_submits, this.selectors.form_submits].join(',')).button('loading');
};

DealsAdmin.prototype._onSubmitForm = function (e) {
    e.preventDefault();
    var $form = $(e.currentTarget);
    $.post(e.currentTarget.action, $form.serialize())
        .done(function (html) {
            $(document).trigger('status-edited').trigger('ajax.close_modal');
        }).fail(function (xhr) {
        if (xhr.status == 400) {
            $form.replaceWith($(xhr.responseText).find('form'));
        }
    });
};

DealsAdmin.prototype._onClickBtnShowComments = function (e) {
    e.preventDefault();
    $.get(e.currentTarget.href).done(function (html) {
        var $modal = $('#modal-deal-comments');

        if ($modal.length) {
            $modal.remove();
        }

        $(html).appendTo('body');
        $('#modal-deal-comments').modal();
    });
};

DealsAdmin.prototype._onHideModal = function (e) {
    // Eliminamos los contenedores de comentarios anteriores.
    $(e.currentTarget).find('[data-comment-thread-container]').remove();
};

DealsAdmin.prototype.handleEvents = function () {

    var modals = [
        this.selectors.modal_confirm,
        this.selectors.modal_form,
        this.selectors.modal_show,
        '#modal-deal-comments'
    ].join(',');

    $(document)
        .on('status-edited status-change refresh-list', $.proxy(this.refreshList, this))
        .ajaxStart($.proxy(this.disableSubmits, this))
        .ajaxStop($.proxy(this.enableSubmits, this))
        .on('hidden.bs.modal', modals, $.proxy(this._onHideModal, this))
    ;

    $(this.selectors.table_container)
        .on('click', this.selectors.btn_show, $.proxy(this._onClickShowInfo, this))
        .on('click', this.selectors.btn_status, $.proxy(this._onClickShowForm, this))
        .on('click', this.selectors.btn_confirm, $.proxy(this._onClickBtnToConfirm, this))
        .on('click', this.selectors.btn_show_comments, $.proxy(this._onClickBtnShowComments, this))
    ;

    $(this.selectors.modal_form)
        .on('shown.bs.modal', $.proxy(this._onShownModalForm, this))
        .on('submit', 'form', $.proxy(this._onSubmitForm, this))
        .attr('novalidate', 'novalidate')
    ;

    $(this.selectors.modal_confirm)
        .on('submit', 'form', $.proxy(this._onSubmitModalConfirm, this))
        .on('click', '.link-no, .btn-no', $.proxy(this._onCloseModalConfirm, this))
    ;
};