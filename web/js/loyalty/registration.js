/**
 * Created by Manuel Aguirre on 27-07-2015.
 */
function LoyaltyRegistration($form, emailUser, companyId, currentLocale, notListedCompanyId, ownerProfileId, salesProfileId) {

    this.$form = $form;
    this.userExists = '' != emailUser;
    this.companyExists = null != companyId;
    this.currentLocale = currentLocale;
    this.notListedCompanyId = notListedCompanyId;
    this.ownerProfileId = ownerProfileId;
    this.salesProfileId = salesProfileId;
    this.user_profiles_id = [];

    /**
     * Información de la compañia, cuando esta existe en la plataforma
     * @type {{has_owner: boolean, has_admin: boolean, has_marketing_manager: boolean}}
     */
    this.companyData = {
        has_owner: false,
        has_admin: false,
        has_marketing_manager: false
    };

    if (emailUser && companyId) {
        $.when(
            this.getUserData(emailUser),
            this.getCompanyData(companyId)
        ).then($.proxy(this.updateFormView, this));
    }
}

LoyaltyRegistration.prototype.updateFormView = function () {
    if (this.userExists) {
        $('#company-information, .user-exist-company-container, #account-information').show();
        $('.new-user-or-guest-company-container').hide();
    } else {

        $('#company-information, .new-user-or-guest-company-container').show();
        $('.user-exist-company-container').hide();
        if (this.companyExists && this.hasSelectableCompanies()) {

            if (this.isCompanyUserInfoCompleted()) {
                $('#account-information').show();
            }

            $('.user-not-exists-and-company-exists').show();
            $('.user-and-company-not-exists').hide();
        } else {
            $('#account-information, .user-not-exists-and-company-exists').hide();
            $('.user-and-company-not-exists').show();
        }

        if (!this.hasSelectableCompanies()) {
            $("#registration_company").val(this.notListedCompanyId);
        }
    }

    this.updateCompanyUsersFormFormView();
};

LoyaltyRegistration.prototype.updateCompanyUsersFormFormView = function () {

    function hideAll() {
        $('#company-owner-information, #company-admin-information, #company-marketing-manager-information').hide();
    }

    if (this.isCompanyUserInfoCompleted()) {
        if (this.isSelectedProfile(this.ownerProfileId)) {

            console.log('Es un owner');
            console.log('existe el admin', this.companyAdminExists());
            console.log('existe el marketing manager', this.companyMarketingManagerExists());

            $('#company-owner-information').hide();
            $('#company-admin-information, #company-marketing-manager-information').show();

            this.toggleEditableFields($('#company-admin-information'), !this.companyAdminExists());
            this.toggleEditableFields($('#company-marketing-manager-information'), !this.companyMarketingManagerExists());

        } else if (this.isSelectedProfile(this.salesProfileId)) {

            $('#company-admin-information, #company-marketing-manager-information').hide();
            $('#company-owner-information').show();

            console.log('Es un Sales');
            console.log('existe el owner', this.companyOwnerExists());
            this.toggleEditableFields($('#company-owner-information'), !this.companyOwnerExists());
        } else {
            hideAll();
        }
    } else {
        hideAll();
    }
};

LoyaltyRegistration.prototype.showStaticFields = function ($container) {
    $container.find('.editable-container').hide();
    $container.find('.static-container').show();
};

LoyaltyRegistration.prototype.showEditableFields = function ($container) {
    $container.find('.editable-container').show();
    $container.find('.static-container').hide();
};
/**
 * Muestra u oculta los campos editables/estaticos, dependiendo del valor show.
 * @param $container
 * @param show
 */
LoyaltyRegistration.prototype.toggleEditableFields = function ($container, show) {
    if (show) {
        this.showEditableFields($container);
    } else {
        this.showStaticFields($container);
    }
};

LoyaltyRegistration.prototype.emptyUserInformation = function () {
    $("#registration_firstname").val('');
    $("#registration_lastname").val('');
    $("#registration_user_username").val($('#registration_email_first').val());
};

LoyaltyRegistration.prototype.emptyCompanyInformation = function () {
    this.$form.find('#company-information :input').not(':button, :submit, :reset').val('');
};

LoyaltyRegistration.prototype.emptyAccountInformation = function () {
    this.$form.find('#account-information :input').not(':button, :submit, :reset').val('');
};

LoyaltyRegistration.prototype.updateUserInfo = function (userData) {
    $("#registration_firstname").val(userData.firstname);
    $("#registration_lastname").val(userData.lastname);
    $("#registration_user_username").val(userData.username);
    $("#registration_user_question").val(userData.question);
    $("#registration_user_answer").val(userData.answer);
};

LoyaltyRegistration.prototype.loadUserInfo = function () {
    var email = $('#registration_email_first');
    var email_confirmation = $('#registration_email_second');

    if (email.val() && email_confirmation.val()) {
        if (email.val() == email_confirmation.val()) {
            this.emptyAccountInformation();
            this.emptyCompanyInformation();
            this.$form.find('#company-information :input, #account-information :input').val('');
            this.getUserData(email.val()).done($.proxy(this.loadUserInfoSuccess, this));
        } else {
            $('.alert').hide();
            this.setSubmmitEnabled();
        }
    } else {
        $('.alert').hide();
        this.setSubmmitEnabled();
    }
};

LoyaltyRegistration.prototype.getUserData = function (email) {
    return $.getJSON(Routing.generate('register_get_user_by_email', {
        _locale: this.currentLocale,
        email: email
    })).done($.proxy(function (data) {
        this.user_profiles_id = data.profiles_id;
    }, this));
};

LoyaltyRegistration.prototype.isCompanyNotListedSelected = function () {
    return this.notListedCompanyId == $("#registration_company").val();
};

LoyaltyRegistration.prototype.isCompanyUserInfoCompleted = function () {

    if (this.userExists) {
        return true;
    }

    if ($("#registration_country", this.$form).val() &&
        $("#registration_company", this.$form).val() &&
        $("#registration_profile", this.$form).val()) {

        if (this.isCompanyNotListedSelected()) {
            return $('#registration_guest_companyName', this.$form).val() &&
                $('#registration_guest_companySubtype', this.$form).val();
        } else {
            return true;
        }

    } else {
        return false;
    }
};

LoyaltyRegistration.prototype.hasSelectableCompanies = function () {
    var notListedId = this.notListedCompanyId;
    return $("#registration_company option").filter(function () {
            return this.value !== '' && this.value !== notListedId;
        }).size() > 0;
};

LoyaltyRegistration.prototype.isSelectedProfile = function (profileId) {
    if (this.userExists) {
        return (-1 != $.inArray(parseInt(profileId), this.user_profiles_id));
    } else {
        return $("#registration_profile").val().toString() == profileId.toString();
    }
};

LoyaltyRegistration.prototype.companyAdminExists = function () {
    return this.companyData.has_admin;
};

LoyaltyRegistration.prototype.companyMarketingManagerExists = function () {
    return this.companyData.has_marketing_manager;
};

LoyaltyRegistration.prototype.companyOwnerExists = function () {
    return this.companyData.has_owner;
};

LoyaltyRegistration.prototype.loadUserInfoSuccess = function (user) {

    this.setSubmmitEnabled();

    if ($.isEmptyObject(user)) {
        this.userExists = false;
        this.emptyUserInformation();
    } else {
        this.userExists = this.companyExists = true;
        this.updateUserInfo(user);
        var ajaxGetCompanyForm = $('.user-exist-company-container .company-info').load(
            Routing.generate('register_show_company_static_form', {
                _locale: this.currentLocale,
                email: $('#registration_email_first').val()
            }));

        var ajaxGetCompanyData = this.getCompanyData(user.company_id);

        $.when(ajaxGetCompanyForm, ajaxGetCompanyData).done($.proxy(this.updateFormView, this));
    }
    this.updateFormView();
    $('.names').show();
};

LoyaltyRegistration.prototype._onKeyUpEmail = function (e) {
    this.setSubmmitEnabled(false);

    if (e.keyCode == 13) {
        // retornamos como si se fuese presiona la tecla tab, para forzar el change del input
        // y se ejecute el método "_onChangeEmail".
        return e.keyCode = 9;
    }
};

LoyaltyRegistration.prototype._onChangeEmail = function (e) {
    e.preventDefault();

    this.setSubmmitEnabled(false);
    this.loadUserInfo();
};

LoyaltyRegistration.prototype._onChangeCompany = function (e) {

    this.companyData.has_owner = false;
    this.companyData.has_admin = false;
    this.companyData.has_marketing_manager = false;

    if (this.isCompanyNotListedSelected()) {
        this.companyExists = false;

        this.updateFormView();
    } else {
        this.companyExists = true;

        var companyId = $(e.currentTarget).val();

        if (companyId && !this.isCompanyNotListedSelected()) {
            this.getCompanyData($(e.currentTarget).val());
        }
    }
};

LoyaltyRegistration.prototype.getCompanyData = function (companyId) {
    return $.getJSON(Routing.generate('register_get_company_data', {
        id: companyId,
        _locale: this.currentLocale
    }))
        .done($.proxy(this._onGetCompanyDataSuccess, this))
        .done($.proxy(this.updateCompanyUsersStaticInformation, this));
};

LoyaltyRegistration.prototype._onGetCompanyDataSuccess = function (data) {
    this.companyData.has_owner = data.has_owner;
    this.companyData.has_admin = data.has_admin;
    this.companyData.has_marketing_manager = data.has_marketing_manager;

    this.updateFormView();
};

LoyaltyRegistration.prototype.updateCompanyUsersStaticInformation = function (data) {
    this.setCompanyUserStaticData($('#company-owner-information'), data.company_users.owner);
    this.setCompanyUserStaticData($('#company-admin-information'), data.company_users.admin);
    this.setCompanyUserStaticData($('#company-marketing-manager-information'), data.company_users.marketing_manager);
};

LoyaltyRegistration.prototype.setCompanyUserStaticData = function ($container, data) {

    $container.find('.static-email').html(data.email);
    $container.find('.static-firstname').html(data.firstname);
    $container.find('.static-lastname').html(data.lastname);
    $container.find('.static-phone').html(data.phone);
};

LoyaltyRegistration.prototype._onChangeCountry = function (e) {
    var country = $('#registration_country');
    var countrySelected = country.val();
    if (countrySelected != "") {
        $.ajax({
            method: this.$form.attr('method'),
            url: this.$form.attr('action'),
            data: country.serialize(),
            success: $.proxy(this._onChangeCountrySuccess, this)
        });
    }

    this.updateFormView();
};

LoyaltyRegistration.prototype._onChangeCountrySuccess = function (html) {

    $("#registration_company").replaceWith(
        $(html).find('#registration_company')
    );

    if (this.hasSelectableCompanies() && !this.isCompanyNotListedSelected()) {
        this.companyExists = true;
    } else {
        this.companyExists = false;
    }

    this.updateFormView();
};

LoyaltyRegistration.prototype._onChangeCompanyInfo = function (e) {
    this.updateFormView();
};

LoyaltyRegistration.prototype.setSubmmitEnabled = function (enabled) {
    enabled = typeof enabled == 'undefined' ? true : enabled;
    this.$form.find(':submit').attr('disabled', !enabled);
};

LoyaltyRegistration.prototype.addEventListeners = function () {
    $('.e-mail').on('keypress', $.proxy(this._onKeyUpEmail, this));
    $('.e-mail').on('change', $.proxy(this._onChangeEmail, this));
    this.$form
        .on("change", "#registration_company", $.proxy(this._onChangeCompany, this))
        .on('change', '#registration_country', $.proxy(this._onChangeCountry, this))
        .on("change", '.company-fields :input:not(#registration_company)', $.proxy(this._onChangeCompanyInfo, this))
    ;

    this.$form.on("submit", function () {
        $(':password:hidden').val('');
    });
};

