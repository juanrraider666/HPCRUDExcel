function LoyaltyCompanyUsersAdmin(pageUrl, companyId, locale, selectors, importSelectors) {

    selectors = $.extend({
        modal_import: '#modal-user-import',
        modal_import_content: '.user-import-content',
        btn_import: '#import-users-btn'
    }, selectors);

    LoyaltyUsersAdmin.call(this, pageUrl, selectors);

    this.companyId = companyId;
    this.locale = locale;

    this.userImportAdmin = new LoyaltyCompanyUserImport(companyId, locale, importSelectors);
}

// Heredamos del admin de usuarios, para tener la funcionalidades comunes.

LoyaltyCompanyUsersAdmin.prototype = new LoyaltyUsersAdmin;
LoyaltyCompanyUsersAdmin.prototype.constructor = LoyaltyCompanyUsersAdmin;

LoyaltyCompanyUsersAdmin.prototype.showImportUsers = function (url) {
    $(this.selectors.modal_import_content, this.selectors.modal_import).load(url, $.proxy(function () {
        $(this.selectors.modal_import).modal('show');
    }, this));
};

LoyaltyCompanyUsersAdmin.prototype._onClickImportUsers = function (e) {
    e.preventDefault();
    this.showImportUsers(e.currentTarget.href);
};

LoyaltyCompanyUsersAdmin.prototype.handleEvents = function () {
    LoyaltyUsersAdmin.prototype.handleEvents.call(this);

    $(this.selectors.btn_import).on('click', $.proxy(this._onClickImportUsers, this));

    this.userImportAdmin.handleModalEvents();
};
