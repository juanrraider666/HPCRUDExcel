$(document).ready(function () {

    $("select").wrap("<div class='select_generico_tabla'></div>");

    $(document).on('click', ".dropdown .btn-sm", function () {
        $(".action_dropdown_menu").remove();
        $(".dropdown-menu").prepend("<div class='action_dropdown_menu'></div>");
    }).on('click', '.radio label input:radio', function () {
        var $this = $(this);
        $(':radio[name="' + $this.attr('name') + '"]')
            .not($this)
            .parent('label')
            .css('background-position', '0 -225px');

        $this.parent("label").css('background-position', '0 -317px');
    });

    // Marcamos todos los radios que inicialmente están chequeados.
    $('.radio label:has(input:radio:checked)').css('background-position', '0 -317px');
});