function LoyaltyUsersAdmin(pageUrl, selectors) {
    this.pageUrl = pageUrl;

    this.selectors = $.extend({
        table: 'table.user-list',
        table_container: '.user-table-container',
        modal_show: '#modal-user-show',
        modal_show_content: '.user-show-content',
        modal_form: '#modal-user-form',
        modal_form_content: '.user-form-content',
        modal_confirm: '#modal-confirm',
        modal_confirm_content: '.confirm-content',
        modal_confirm_header: '.confirm-header',
        modal_submits: '.modal-footer :button',
        form_submits: 'form :submit',
        form_errors: '.form-errors',
        btn_confirm: '.modal-confirm',
        btn_show: '.show-user',
        btn_edit: '.edit-user',
        btn_create: '#create_user_btn'
    }, selectors);
}
LoyaltyUsersAdmin.prototype.refreshUserList = function () {
    $.get(this.pageUrl).done($.proxy(function (html) {
        $(this.selectors.table).html($(html).find(this.selectors.table).html());
    }, this));
};

LoyaltyUsersAdmin.prototype.showUserInfo = function (url) {
    $(this.selectors.modal_show_content, this.selectors.modal_show).load(url, $.proxy(function () {
        $(this.selectors.modal_show).modal('show');
    }, this));
};

LoyaltyUsersAdmin.prototype.showUserForm = function (url) {
    $(this.selectors.modal_form_content, this.selectors.modal_form).load(url, $.proxy(function () {
        $(this.selectors.modal_form).modal('show');
    }, this));
};

LoyaltyUsersAdmin.prototype.showConfirm = function (url, header) {
    $(this.selectors.modal_confirm_header, this.selectors.modal_confirm).html(header);
    $(this.selectors.modal_confirm_header, this.selectors.modal_confirm).load(url, $.proxy(function () {
        $(this.selectors.modal_confirm).modal('show');
    }, this));
};

LoyaltyUsersAdmin.prototype.enableSubmits = function () {
    $([this.selectors.modal_submits, this.selectors.form_submits].join(',')).button('reset');
};

LoyaltyUsersAdmin.prototype.disableSubmits = function () {
    $([this.selectors.modal_submits, this.selectors.form_submits].join(',')).button('loading');
};

LoyaltyUsersAdmin.prototype.prepareModalForm = function () {
    var $modal = $(this.selectors.modal_form);
    $modal.find('form :input:first').focus();
    $modal.find(this.selectors.form_errors).html('');
};

LoyaltyUsersAdmin.prototype._onClickBtnToConfirm = function (e) {
    e.preventDefault();
    var $el = $(e.currentTarget);
    this.showConfirm(e.currentTarget.href, $el.data('header'));
};

LoyaltyUsersAdmin.prototype._onSubmitModalConfirm = function (e) {
    e.preventDefault();
    var $form = $(e.currentTarget);
    $.post($form.attr('action'), $form.serialize()).done(function () {
        $(document).trigger('refresh-user-list').trigger('ajax.close_modal');
    });
};

LoyaltyUsersAdmin.prototype._onCloseModalConfirm = function (e) {
    e.preventDefault();
    $(this.selectors.modal_confirm).modal('hide');
};

LoyaltyUsersAdmin.prototype._onCloseModalForm = function (e) {
    e.preventDefault();
    $(this.selectors.modal_form).modal('hide');
};

LoyaltyUsersAdmin.prototype._onClickShowInfo = function (e) {
    e.preventDefault();
    this.showUserForm(e.currentTarget.href);
};

LoyaltyUsersAdmin.prototype._onClickShowForm = function (e) {
    e.preventDefault();
    this.showUserForm(e.currentTarget.href);
};

LoyaltyUsersAdmin.prototype._onShownModalForm = function () {
    this.prepareModalForm();
};

LoyaltyUsersAdmin.prototype._onSubmitForm = function (e) {
    e.preventDefault();
    var $form = $(e.currentTarget);
    $.post(e.currentTarget.action, $form.serialize())
        .done(function (html) {
            $(document).trigger('user-edited').trigger('ajax.close_modal');
        }).fail(function (xhr) {
            if (xhr.status == 400) {
                $form.replaceWith($(xhr.responseText).find('form'));
            }
        });
};

LoyaltyUsersAdmin.prototype.handleEvents = function () {

    $(document)
        .on('user-edited users-imported refresh-user-list', $.proxy(this.refreshUserList, this))
        .ajaxStart($.proxy(this.disableSubmits, this))
        .ajaxStop($.proxy(this.enableSubmits, this))
    ;

    $(this.selectors.table_container)
        .on('click', this.selectors.btn_confirm, $.proxy(this._onClickBtnToConfirm, this))
        .on('click', this.selectors.btn_show, $.proxy(this._onClickShowInfo, this))
        .on('click', this.selectors.btn_edit, $.proxy(this._onClickShowForm, this))
    ;

    $(this.selectors.btn_create).on('click', $.proxy(this._onClickShowForm, this));

    $(this.selectors.modal_confirm)
        .on('submit', 'form', $.proxy(this._onSubmitModalConfirm, this))
        .on('click', '.link-no, .btn-no', $.proxy(this._onCloseModalConfirm, this));

    $(this.selectors.modal_form)
        .on('click', '.btn-back', $.proxy(this._onCloseModalForm, this))
        .on('shown.bs.modal', $.proxy(this._onShownModalForm, this))
        .on('submit', 'form', $.proxy(this._onSubmitForm, this))
        .attr('novalidate', 'novalidate')
    ;
};