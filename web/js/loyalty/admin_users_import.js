/*function LoyaltyCompanyUserImport(containerSelector, inputSearchSelector, companySelectSelector, companyId, locale) {
 this.containerSelector = containerSelector;
 this.inputSearchSelector = inputSearchSelector;
 this.companySelectSelector = companySelectSelector;
 this.companyId = companyId;
 this.locale = locale;
 }*/

function LoyaltyCompanyUserImport(companyId, locale, selectors) {
    this.companyId = companyId;
    this.locale = locale;
    /**
     * Compañia seleccionada en el select de compañias
     * @type int
     */
    this.selectedCompany = null;

    this.selectors = $.extend({
        companies: '#company_import',
        input_search: '#import-users-search',
        search_form: '#import-users-search-form',
        container: '#import-users-list-container',
        form: '#import-users-form',
        import_errors: '.import-errors',
        actions: '.form-actions',
        modal: '#modal-user-import',
        submit: '#user-import-save'
    }, selectors);
}

LoyaltyCompanyUserImport.prototype._onChangeCompany = function (e) {
    //buscamos los usuarios de la compañia seleccionada esta compañia
    $(this.selectors.input_search).val('');
    this.selectedCompany = $(e.currentTarget).val();
    $(this.selectors.container).load(
        Routing.generate('admin_company_users_import_show_users', {
            company: this.selectedCompany,
            companyId: this.companyId,
            _locale: this.locale
        })
    );
};

LoyaltyCompanyUserImport.prototype._onSearchUsers = function (e) {
    e.preventDefault();
    if (this.selectedCompany) {
        $(this.selectors.container).load(
            Routing.generate('admin_company_users_import_show_users', {
                _locale: this.locale,
                companyId: this.companyId,
                company: this.selectedCompany,
                search: $(this.selectors.input_search).val()
            })
        );
    }
};

LoyaltyCompanyUserImport.prototype._onSubmitImportUsers = function (e) {
    e.preventDefault();
    var $form = $(this.selectors.form);
    $.post($form.attr('action'), $form.serialize())
        .done(function () {
            $(document).trigger('users-imported').trigger('ajax.close_modal');
        }).fail($.proxy(function (xhr) {
            if (xhr.status == 400) {
                $(this.selectors.import_errors, this.selectors.modal).addError(xhr.responseText);
            }
        }, this));
};

LoyaltyCompanyUserImport.prototype._onShownModalImportUsers = function (e) {
    var $modal = $(e.currentTarget);
    $modal.find(this.selectors.import_errors).html('');
    $modal.find(this.selectors.actions).remove();
};

LoyaltyCompanyUserImport.prototype.handleEvents = function () {
    $(this.selectors.companies).on('change', $.proxy(this._onChangeCompany, this));
    $(this.selectors.search_form).on('submit', $.proxy(this._onSearchUsers, this));
    $(this.selectors.input_search).on('change', $.proxy(this._onSearchUsers, this));
};

/**
 * La idea de este método es para que cuando se muestre el import desde un modal, los llamados sean ajax.
 */
LoyaltyCompanyUserImport.prototype.handleModalEvents = function () {
    $(this.selectors.modal)
        .on('submit', this.selectors.form, $.proxy(this._onSubmitImportUsers, this))
        .on('show.bs.modal', $.proxy(this._onShownModalImportUsers, this))
        .on('submit', this.selectors.search_form, function (e) {
            e.preventDefault();
        })
        .on('change', this.selectors.input_search, $.proxy(this._onSearchUsers, this))
        .on('change', this.selectors.companies, $.proxy(this._onChangeCompany, this))
    ;

    $(this.selectors.submit).on('click', $.proxy(this._onSubmitImportUsers, this));
};